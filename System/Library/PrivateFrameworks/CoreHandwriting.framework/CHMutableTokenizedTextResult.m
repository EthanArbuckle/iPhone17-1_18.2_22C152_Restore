@interface CHMutableTokenizedTextResult
- (id)copyWithZone:(_NSZone *)a3;
- (void)adjustColumns;
- (void)appendTokenColumns:(id)a3;
- (void)filterCandidatesWithOutOfPattern:(BOOL)a3 duplicateTokenIDs:(BOOL)a4 keepOutOfLexiconAlternatives:(BOOL)a5 keepAlternativeLengths:(BOOL)a6 keepSubstrings:(BOOL)a7 shouldKeepOriginalSpelling:(BOOL)a8;
- (void)offsetAllStrokeIndexesBy:(int64_t)a3;
- (void)prependTokenColumns:(id)a3 prefixTopPath:(id)a4;
- (void)remapAllStrokeIndexesWithArray:(id)a3;
- (void)remapAllStrokeIndexesWithIndexSet:(id)a3;
- (void)setBaseWritingDirection:(int)a3;
- (void)setChangeableTokenColumnCount:(int64_t)a3;
- (void)setPrecedingLineBreaks:(int64_t)a3;
- (void)setRecognizerGenerationIdentifier:(int64_t)a3;
- (void)setTokenColumns:(id)a3;
- (void)setTranscriptionPaths:(id)a3 scores:(id)a4;
- (void)trimTokensToTranscriptionPathCount:(int64_t)a3;
@end

@implementation CHMutableTokenizedTextResult

- (id)copyWithZone:(_NSZone *)a3
{
  v42 = [CHTokenizedTextResult alloc];
  tokenColumns = self->super._tokenColumns;
  transcriptionPaths = self->super._transcriptionPaths;
  transcriptionPathScores = self->super._transcriptionPathScores;
  v12 = objc_msgSend_trailingSeparator(self, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_recognizerGenerationIdentifier(self, v13, v14, v15, v16, v17);
  int64_t changeableCount = self->super._changeableCount;
  char isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v20, v21, v22, v23, v24);
  uint64_t v31 = objc_msgSend_baseWritingDirection(self, v26, v27, v28, v29, v30);
  v37 = objc_msgSend_originalTokens(self, v32, v33, v34, v35, v36);
  char v41 = isMinimalDrawingResult;
  uint64_t isMinimalDrawingResult_baseWritingDirection_originalTokens = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_originalTokens_(v42, v38, (uint64_t)tokenColumns, (uint64_t)transcriptionPaths, (uint64_t)transcriptionPathScores, (uint64_t)v12, v18, changeableCount, v41, v31, v37);

  *(void *)(isMinimalDrawingResult_baseWritingDirection_originalTokens + 64) = self->super._precedingLineBreaks;
  objc_storeStrong((id *)(isMinimalDrawingResult_baseWritingDirection_originalTokens + 80), self->super._inputStrokeIdentifiers);
  objc_storeStrong((id *)(isMinimalDrawingResult_baseWritingDirection_originalTokens + 88), self->super._locale);
  return (id)isMinimalDrawingResult_baseWritingDirection_originalTokens;
}

- (void)setTokenColumns:(id)a3
{
  v4 = (NSArray *)a3;
  if (self->super._tokenColumns != v4)
  {
    v12 = v4;
    uint64_t v10 = (NSArray *)objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    tokenColumns = self->super._tokenColumns;
    self->super._tokenColumns = v10;

    v4 = v12;
  }
}

- (void)setTranscriptionPaths:(id)a3 scores:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSArray *)a3;
  uint64_t v7 = (NSArray *)a4;
  uint64_t v13 = objc_msgSend_count(v6, v8, v9, v10, v11, v12);
  if (v13 != objc_msgSend_count(v7, v14, v15, v16, v17, v18))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v24 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      int v39 = 134218240;
      uint64_t v40 = objc_msgSend_count(v6, v25, v26, v27, v28, v29);
      __int16 v41 = 2048;
      uint64_t v42 = objc_msgSend_count(v7, v30, v31, v32, v33, v34);
      _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_FAULT, "transcriptionPaths count (%ld) != scores count (%ld)", (uint8_t *)&v39, 0x16u);
    }
  }
  if (self->super._transcriptionPaths != v6)
  {
    uint64_t v35 = (NSArray *)objc_msgSend_copy(v6, v19, v20, v21, v22, v23);
    transcriptionPaths = self->super._transcriptionPaths;
    self->super._transcriptionPaths = v35;
  }
  if (self->super._transcriptionPathScores != v7)
  {
    v37 = (NSArray *)objc_msgSend_copy(v7, v19, v20, v21, v22, v23);
    transcriptionPathScores = self->super._transcriptionPathScores;
    self->super._transcriptionPathScores = v37;
  }
}

- (void)appendTokenColumns:(id)a3
{
  id v21 = a3;
  if (objc_msgSend_count(v21, v4, v5, v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_arrayByAddingObjectsFromArray_(self->super._tokenColumns, v9, (uint64_t)v21, v10, v11, v12);
    objc_msgSend_setTokenColumns_(self, v14, (uint64_t)v13, v15, v16, v17);
    objc_msgSend_setTranscriptionPaths_scores_(self, v18, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v19, v20);
  }
}

- (void)adjustColumns
{
  uint64_t v374 = *MEMORY[0x1E4F143B8];
  v345 = self;
  uint64_t v343 = 32;
  uint64_t v346 = objc_msgSend_count(self->super._tokenColumns, a2, v2, v3, v4, v5);
  unint64_t v6 = 0x1E4F1C000uLL;
  v344 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  v354 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
  v370 = 0;
  v371 = 0;
  unint64_t v372 = 0;
  if (!v346)
  {
    char v22 = 0;
    goto LABEL_105;
  }
  char v22 = 0;
  uint64_t v23 = 0;
  v353 = v368;
  do
  {
    v347 = objc_msgSend_objectAtIndex_(*(void **)((char *)&v345->super.super.super.isa + v343), v17, v23, v19, v20, v21);
    objc_msgSend_textTokenRows(v347, v24, v25, v26, v27, v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v29, v30, v31, v32, v33, v34))
    {
      uint64_t v40 = objc_msgSend_firstObject(v29, v35, v36, v37, v38, v39);
      __int16 v41 = sub_1C4A86A34((uint64_t)CHTokenizedTextResult, v40);

      for (unint64_t i = 1;
            i < objc_msgSend_count(v29, v42, v43, v44, v45, v46) && objc_msgSend_count(v41, v48, v49, v50, v51, v52);
            ++i)
      {
        v57 = objc_msgSend_objectAtIndexedSubscript_(v29, v53, i, v54, v55, v56);
        v58 = sub_1C4A86A34((uint64_t)CHTokenizedTextResult, v57);

        v59 = commonIndexSetsFromSets(v41, v58);

        if (!objc_msgSend_count(v59, v60, v61, v62, v63, v64))
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v65 = (id)qword_1EA3C9F98;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v65, OS_LOG_TYPE_ERROR, "Incompatible index sets have no partition of common index sets.", buf, 2u);
          }
        }
        __int16 v41 = v59;
      }
      v66 = v41;
    }
    else
    {
      v66 = (uint64_t *)MEMORY[0x1E4F1CBF0];
    }
    v357 = v66;

    if (!objc_msgSend_count(v357, v67, v68, v69, v70, v71) || objc_msgSend_count(v357, v72, v73, v74, v75, v76) == 1)
    {
      objc_msgSend_addObject_(v344, v72, (uint64_t)v347, v74, v75, v76);
      objc_msgSend_addObject_(v354, v78, (uint64_t)&unk_1F203E670, v79, v80, v81);
      v82 = v371;
      if ((unint64_t)v371 >= v372)
      {
        v83 = v370;
        unint64_t v84 = 0xAAAAAAAAAAAAAAABLL * (v371 - v370) + 1;
        if (v84 > 0xAAAAAAAAAAAAAAALL) {
          sub_1C494A220();
        }
        if (0x5555555555555556 * ((uint64_t)(v372 - (void)v370) >> 3) > v84) {
          unint64_t v84 = 0x5555555555555556 * ((uint64_t)(v372 - (void)v370) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v372 - (void)v370) >> 3) >= 0x555555555555555) {
          unint64_t v85 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v85 = v84;
        }
        if (v85 > 0xAAAAAAAAAAAAAAALL) {
          sub_1C4949AA8();
        }
        v86 = (char *)operator new(24 * v85);
        v87 = &v86[8 * (v82 - v83)];
        v88 = (char **)(v87 + 24);
        *(void *)v87 = 0;
        *((void *)v87 + 1) = 0;
        *((void *)v87 + 2) = 0;
        if (v82 == v83)
        {
          v370 = (char **)&v86[8 * (v82 - v83)];
          v371 = (char **)(v87 + 24);
          unint64_t v372 = (unint64_t)&v86[24 * v85];
        }
        else
        {
          do
          {
            long long v89 = *(_OWORD *)(v82 - 3);
            v82 -= 3;
            *(_OWORD *)(v87 - 24) = v89;
            v87 -= 24;
            *((void *)v87 + 2) = v82[2];
            *v82 = 0;
            v82[1] = 0;
            v82[2] = 0;
          }
          while (v82 != v83);
          v82 = v370;
          v90 = v371;
          v370 = (char **)v87;
          v371 = v88;
          unint64_t v372 = (unint64_t)&v86[24 * v85];
          if (v90 != v82)
          {
            v91 = v90;
            do
            {
              v93 = *(v91 - 3);
              v91 -= 3;
              v92 = v93;
              if (v93)
              {
                *(v90 - 2) = v92;
                operator delete(v92);
              }
              v90 = v91;
            }
            while (v91 != v82);
          }
        }
        if (v82) {
          operator delete(v82);
        }
        v371 = v88;
      }
      else
      {
        *v371 = 0;
        v82[1] = 0;
        v82[2] = 0;
        v371 = v82 + 3;
      }
      goto LABEL_102;
    }
    v351 = objc_msgSend_array(*(void **)(v6 + 2632), v72, v77, v74, v75, v76);
    uint64_t v103 = objc_msgSend_count(v357, v94, v95, v96, v97, v98);
    if (v103)
    {
      v356 = 0;
      v349 = 0;
      unint64_t v104 = 0;
      for (uint64_t j = 0; j != v103; ++j)
      {
        while (1)
        {
          v106 = objc_alloc_init(CHMutableTokenizedResultColumn);
          objc_msgSend_addObject_(v351, v107, (uint64_t)v106, v108, v109, v110);

          v111 = v349;
          if ((unint64_t)v349 >= v104) {
            break;
          }
          *(void *)v349 = 0;
          *((void *)v111 + 1) = 0;
          *((void *)v111 + 2) = 0;
          v349 = v111 + 24;
          if (++j == v103) {
            goto LABEL_61;
          }
        }
        unint64_t v112 = 0xAAAAAAAAAAAAAAABLL * ((v349 - v356) >> 3) + 1;
        if (v112 > 0xAAAAAAAAAAAAAAALL) {
          sub_1C494A220();
        }
        if (0x5555555555555556 * ((uint64_t)(v104 - (void)v356) >> 3) > v112) {
          unint64_t v112 = 0x5555555555555556 * ((uint64_t)(v104 - (void)v356) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v104 - (void)v356) >> 3) >= 0x555555555555555) {
          unint64_t v113 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v113 = v112;
        }
        if (v113 > 0xAAAAAAAAAAAAAAALL) {
          sub_1C4949AA8();
        }
        v114 = (char *)operator new(24 * v113);
        v115 = &v114[8 * ((v349 - v356) >> 3)];
        *(void *)v115 = 0;
        *((void *)v115 + 1) = 0;
        *((void *)v115 + 2) = 0;
        v116 = v115;
        if (v349 != v356)
        {
          v117 = v349;
          v118 = v356;
          do
          {
            long long v119 = *(_OWORD *)(v117 - 24);
            v117 -= 24;
            *(_OWORD *)(v116 - 24) = v119;
            v116 -= 24;
            *((void *)v116 + 2) = *((void *)v117 + 2);
            *(void *)v117 = 0;
            *((void *)v117 + 1) = 0;
            *((void *)v117 + 2) = 0;
          }
          while (v117 != v118);
          v120 = v349;
          do
          {
            v122 = (void *)*((void *)v120 - 3);
            v120 -= 24;
            v121 = v122;
            if (v122)
            {
              *((void *)v349 - 2) = v121;
              operator delete(v121);
            }
            v349 = v120;
          }
          while (v120 != v356);
        }
        unint64_t v104 = (unint64_t)&v114[24 * v113];
        v349 = v115 + 24;
        if (v356) {
          operator delete(v356);
        }
        v356 = v116;
      }
    }
    else
    {
      v356 = 0;
      v349 = 0;
    }
LABEL_61:
    v123 = objc_msgSend_numberWithInteger_(NSNumber, v99, v103, v100, v101, v102);
    objc_msgSend_addObject_(v354, v124, (uint64_t)v123, v125, v126, v127);

    unint64_t v348 = 0;
    uint64_t v350 = v23;
LABEL_62:
    v133 = objc_msgSend_textTokenRows(v347, v128, v129, v130, v131, v132);
    BOOL v139 = v348 < objc_msgSend_count(v133, v134, v135, v136, v137, v138);

    if (v139)
    {
      v145 = objc_msgSend_textTokenRows(v347, v140, v141, v142, v143, v144);
      v150 = objc_msgSend_objectAtIndex_(v145, v146, v348, v147, v148, v149);

      objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v151, v152, v153, v154, v155);
      id v355 = (id)objc_claimAutoreleasedReturnValue();
      v358 = objc_msgSend_objectAtIndex_(v357, v156, 0, v157, v158, v159);
      unint64_t v165 = 0;
      uint64_t v166 = 0;
      uint64_t v167 = 0;
      v352 = v150;
      while (1)
      {
        if (v165 >= objc_msgSend_count(v150, v160, v161, v162, v163, v164))
        {

          ++v348;
          goto LABEL_62;
        }
        v172 = objc_msgSend_objectAtIndex_(v150, v168, v165, v169, v170, v171);
        v178 = objc_msgSend_strokeIndexes(v172, v173, v174, v175, v176, v177);
        v367[0] = MEMORY[0x1E4F143A8];
        v367[1] = 3221225472;
        v368[0] = sub_1C4A97C60;
        v368[1] = &unk_1E64E19F0;
        id v361 = v355;
        id v369 = v361;
        objc_msgSend_enumerateIndexesUsingBlock_(v178, v179, (uint64_t)v367, v180, v181, v182);

        if (v165 != objc_msgSend_count(v150, v183, v184, v185, v186, v187) - 1
          && (objc_msgSend_isEqualToIndexSet_(v361, v188, (uint64_t)v358, v189, v190, v191) & 1) == 0)
        {
          ++v165;
          goto LABEL_92;
        }
        objc_msgSend_objectAtIndex_(v351, v188, v167, v189, v190, v191);
        v363 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v362 = v167;
        v360 = v172;
        uint64_t v359 = v165 + 1;
        v195 = objc_msgSend_subarrayWithRange_(v150, v192, v166, v165 + 1 - v166, v193, v194);
        uint64_t v200 = objc_msgSend_addTokenRowWithTokens_(v363, v196, (uint64_t)v195, v197, v198, v199);

        v206 = &v356[24 * v167];
        v208 = (uint64_t *)(v206 + 8);
        v207 = (uint64_t *)*((void *)v206 + 1);
        v210 = v206 + 16;
        unint64_t v209 = *((void *)v206 + 2);
        if ((unint64_t)v207 >= v209) {
          break;
        }
        uint64_t *v207 = v200;
        uint64_t v211 = (uint64_t)(v207 + 1);
LABEL_89:
        uint64_t *v208 = v211;
        uint64_t v167 = v362 + 1;
        if (v362 + 1 < (unint64_t)objc_msgSend_count(v357, v201, v202, v203, v204, v205))
        {
          v236 = objc_msgSend_objectAtIndex_(v357, v232, v362 + 1, v233, v234, v235);

          v358 = v236;
          objc_msgSend_removeAllIndexes(v361, v237, v238, v239, v240, v241);
        }

        unint64_t v6 = 0x1E4F1C000;
        uint64_t v23 = v350;
        v172 = v360;
        v150 = v352;
        unint64_t v165 = v359;
        uint64_t v166 = v359;
LABEL_92:
      }
      v212 = *(uint64_t **)v206;
      uint64_t v213 = (uint64_t)v207 - *(void *)v206;
      uint64_t v214 = v213 >> 3;
      unint64_t v215 = (v213 >> 3) + 1;
      if (v215 >> 61) {
        sub_1C494A220();
      }
      uint64_t v216 = v209 - (void)v212;
      if (v216 >> 2 > v215) {
        unint64_t v215 = v216 >> 2;
      }
      if ((unint64_t)v216 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v217 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v217 = v215;
      }
      if (v217)
      {
        if (v217 >> 61) {
          sub_1C4949AA8();
        }
        v218 = v206 + 16;
        unint64_t v219 = v217;
        v220 = operator new(8 * v217);
        v210 = v218;
        unint64_t v217 = v219;
        v206 = &v356[24 * v362];
        v221 = (uint64_t *)&v220[8 * v214];
        uint64_t *v221 = v200;
        uint64_t v211 = (uint64_t)(v221 + 1);
        int64_t v222 = (char *)v207 - (char *)v212;
        if (v207 == v212) {
          goto LABEL_87;
        }
      }
      else
      {
        v220 = 0;
        v221 = (uint64_t *)(8 * v214);
        *(void *)(8 * v214) = v200;
        uint64_t v211 = 8 * v214 + 8;
        int64_t v222 = (char *)v207 - (char *)v212;
        if (v207 == v212)
        {
LABEL_87:
          *(void *)v206 = v221;
          uint64_t *v208 = v211;
          *(void *)v210 = &v220[8 * v217];
          if (v212) {
            operator delete(v212);
          }
          goto LABEL_89;
        }
      }
      unint64_t v223 = v222 - 8;
      if (v223 < 0x58) {
        goto LABEL_138;
      }
      if ((unint64_t)((char *)v207 - v220 - v213) < 0x20) {
        goto LABEL_138;
      }
      uint64_t v224 = (v223 >> 3) + 1;
      uint64_t v225 = 8 * (v224 & 0x3FFFFFFFFFFFFFFCLL);
      v226 = &v207[v225 / 0xFFFFFFFFFFFFFFF8];
      v221 = (uint64_t *)((char *)v221 - v225);
      v227 = &v220[8 * v214 - 16];
      v228 = v207 - 2;
      uint64_t v229 = v224 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v230 = *(_OWORD *)v228;
        *(v227 - 1) = *((_OWORD *)v228 - 1);
        _OWORD *v227 = v230;
        v227 -= 2;
        v228 -= 4;
        v229 -= 4;
      }
      while (v229);
      v207 = v226;
      if (v224 != (v224 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_138:
        do
        {
          uint64_t v231 = *--v207;
          *--v221 = v231;
        }
        while (v207 != v212);
      }
      goto LABEL_87;
    }
    v242 = v356;
    v243 = v349;
    sub_1C4A9BA70(&v370, (uint64_t)v371, (char **)v356, (uint64_t)v349, 0xAAAAAAAAAAAAAAABLL * ((v349 - v356) >> 3));
    objc_msgSend_addObjectsFromArray_(v344, v244, (uint64_t)v351, v245, v246, v247);
    if (v356)
    {
      if (v349 != v356)
      {
        v248 = v349;
        do
        {
          v250 = (void *)*((void *)v248 - 3);
          v248 -= 24;
          v249 = v250;
          if (v250)
          {
            *((void *)v243 - 2) = v249;
            operator delete(v249);
          }
          v243 = v248;
        }
        while (v248 != v242);
      }
      operator delete(v242);
    }

    char v22 = 1;
LABEL_102:

    ++v23;
  }
  while (v23 != v346);
LABEL_105:
  v251 = objc_msgSend_transcriptionPaths(v345, v17, v18, v19, v20, v21);
  uint64_t v257 = objc_msgSend_count(v251, v252, v253, v254, v255, v256);

  uint64_t v262 = v346;
  if (v22)
  {
    objc_msgSend_setTokenColumns_(v345, v258, (uint64_t)v344, v259, v260, v261);
    if (v257)
    {
      uint64_t v362 = objc_msgSend_array(*(void **)(v6 + 2632), v263, v264, v265, v266, v267);
      v358 = objc_msgSend_array(*(void **)(v6 + 2632), v268, v269, v270, v271, v272);
      v357 = &v343;
      id v361 = (id)objc_msgSend_count(v344, v273, v274, v275, v276, v277);
      uint64_t v278 = MEMORY[0x1F4188790](v361);
      v280 = (char *)&v343 - ((v279 + 15) & 0xFFFFFFFFFFFFFFF0);
      MEMORY[0x1F4188790](v278);
      v287 = (char *)&v343 - ((v286 + 15) & 0xFFFFFFFFFFFFFFF0);
      v288 = 0;
      uint64_t v289 = 40;
      v360 = v365;
      uint64_t v359 = 40;
      while ((unint64_t)v288 < objc_msgSend_count(*(void **)((char *)&v345->super.super.super.isa + v289), v281, v282, v283, v284, v285))
      {
        v294 = objc_msgSend_objectAtIndex_(*(void **)((char *)&v345->super.super.super.isa + v289), v290, (uint64_t)v288, v291, v292, v293);
        v363 = v288;
        objc_msgSend_getIndexes_range_(v294, v295, (uint64_t)v287, 0, v262, v296);

        if (v262)
        {
          uint64_t v301 = 0;
          uint64_t v302 = 0;
          do
          {
            uint64_t v303 = 0;
            for (uint64_t k = 3 * v302; ; k += 3)
            {
              v305 = objc_msgSend_objectAtIndex_(v354, v297, v301, v298, v299, v300);
              BOOL v311 = v303 < (int)objc_msgSend_intValue(v305, v306, v307, v308, v309, v310);

              if (!v311) {
                break;
              }
              v312 = v370[k];
              v313 = &v287[8 * v301];
              if (v370[k + 1] != v312) {
                v313 = &v312[8 * *(void *)&v287[8 * v301]];
              }
              *(void *)&v280[8 * v302 + 8 * v303++] = *(void *)v313;
            }
            ++v301;
            v302 += v303;
          }
          while (v301 != v346);
        }
        id v314 = objc_alloc(MEMORY[0x1E4F28D58]);
        v318 = objc_msgSend_initWithIndexes_length_(v314, v315, (uint64_t)v280, (uint64_t)v361, v316, v317);
        v364[0] = MEMORY[0x1E4F143A8];
        v364[1] = 3221225472;
        v365[0] = sub_1C4A97C6C;
        v365[1] = &unk_1E64E3560;
        id v319 = v318;
        id v366 = v319;
        if (objc_msgSend_indexOfObjectPassingTest_((void *)v362, v320, (uint64_t)v364, v321, v322, v323) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_addObject_((void *)v362, v324, (uint64_t)v319, v325, v326, v327);
          v332 = objc_msgSend_objectAtIndex_(v345->super._transcriptionPathScores, v328, (uint64_t)v363, v329, v330, v331);
          objc_msgSend_addObject_(v358, v333, (uint64_t)v332, v334, v335, v336);
        }
        v288 = v363 + 1;
        uint64_t v262 = v346;
        uint64_t v289 = v359;
      }
      objc_msgSend_setTranscriptionPaths_scores_(v345, v290, v362, (uint64_t)v358, v292, v293);
    }
  }
  v337 = v370;
  if (v370)
  {
    v338 = v371;
    v339 = v370;
    if (v371 != v370)
    {
      v340 = v371;
      do
      {
        v342 = *(v340 - 3);
        v340 -= 3;
        v341 = v342;
        if (v342)
        {
          *(v338 - 2) = v341;
          operator delete(v341);
        }
        v338 = v340;
      }
      while (v340 != v337);
      v339 = v370;
    }
    v371 = v337;
    operator delete(v339);
  }
}

- (void)prependTokenColumns:(id)a3 prefixTopPath:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  objc_msgSend_arrayByAddingObjectsFromArray_(v44, v7, (uint64_t)self->super._tokenColumns, v8, v9, v10);
  uint64_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (NSArray *)objc_msgSend_mutableCopy(self->super._transcriptionPaths, v12, v13, v14, v15, v16);
  uint64_t v28 = objc_msgSend_count(v44, v18, v19, v20, v21, v22) - 1;
  if (v28 >= 0)
  {
    do
    {
      for (unint64_t i = 0; i < objc_msgSend_count(v17, v23, v24, v25, v26, v27); ++i)
      {
        objc_msgSend_objectAtIndexedSubscript_(v17, v23, i, v25, v26, v27);
        uint64_t v34 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
        uint64_t v39 = objc_msgSend_indexAtPosition_(v6, v35, v28, v36, v37, v38);
        uint64_t v40 = insertToIndexPath(v34, 0, v39);

        objc_msgSend_replaceObjectAtIndex_withObject_(v17, v41, i, (uint64_t)v40, v42, v43);
      }
    }
    while (v28-- >= 1);
  }
  tokenColumns = self->super._tokenColumns;
  self->super._tokenColumns = v11;
  uint64_t v30 = v11;

  transcriptionPaths = self->super._transcriptionPaths;
  self->super._transcriptionPaths = v17;
}

- (void)trimTokensToTranscriptionPathCount:(int64_t)a3
{
  v415 = (char *)a3;
  v418 = self;
  uint64_t v449 = *MEMORY[0x1E4F143B8];
  v413 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, v3, v4, v5);
  uint64_t v11 = 0;
  v446 = 0;
  v447 = 0;
  unint64_t v448 = 0;
  v443 = 0;
  v444 = 0;
  unint64_t v445 = 0;
  v440 = 0;
  v441 = 0;
  unint64_t v442 = 0;
  v437 = 0;
  v438 = 0;
  v439 = 0;
  uint64_t v12 = 40;
  uint64_t v414 = 40;
  while ((unint64_t)v11 < objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v12), v6, v7, v8, v9, v10, v413))
  {
    uint64_t v23 = objc_msgSend_objectAtIndex_(*(void **)((char *)&v418->super.super.super.isa + v12), v13, (uint64_t)v11, v15, v16, v17);
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    v434 = 0;
    v435 = 0;
    v436 = 0;
    uint64_t v416 = (uint64_t)v23;
    v417 = v11;
    while (v27 < objc_msgSend_count(v418->super._tokenColumns, v18, v19, v20, v21, v22))
    {
      uint64_t v33 = objc_msgSend_indexAtPosition_(v23, v29, v27, v30, v31, v32);
      uint64_t v34 = v33;
      if (v25 < v24)
      {
        uint64_t *v25 = v33;
        uint64_t v28 = v25 + 1;
        goto LABEL_5;
      }
      uint64_t v35 = v25 - v26;
      unint64_t v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 61) {
        sub_1C494A220();
      }
      if (((char *)v24 - (char *)v26) >> 2 > v36) {
        unint64_t v36 = ((char *)v24 - (char *)v26) >> 2;
      }
      if ((unint64_t)((char *)v24 - (char *)v26) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v37 = v36;
      }
      if (v37)
      {
        if (v37 >> 61) {
          sub_1C4949AA8();
        }
        uint64_t v38 = operator new(8 * v37);
        uint64_t v39 = (uint64_t *)&v38[8 * v35];
        *uint64_t v39 = v34;
        uint64_t v28 = v39 + 1;
        int64_t v40 = (char *)v25 - (char *)v26;
        if (v25 == v26) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v38 = 0;
        uint64_t v39 = (uint64_t *)(8 * v35);
        *(void *)(8 * v35) = v34;
        uint64_t v28 = (void *)(8 * v35 + 8);
        int64_t v40 = (char *)v25 - (char *)v26;
        if (v25 == v26) {
          goto LABEL_22;
        }
      }
      unint64_t v41 = v40 - 8;
      if (v41 < 0x168)
      {
        uint64_t v42 = v25;
        goto LABEL_21;
      }
      unint64_t v44 = ((char *)(v25 - 1) - (char *)v26) & 0xFFFFFFFFFFFFFFF8;
      if (&v38[(char *)v25 - (char *)v26 - 8 - v44] > &v38[(char *)v25 - (char *)v26 - 8])
      {
        uint64_t v42 = v25;
        do
        {
LABEL_21:
          uint64_t v43 = *--v42;
          *--uint64_t v39 = v43;
        }
        while (v42 != v26);
        goto LABEL_22;
      }
      if ((uint64_t *)((char *)v25 - v44 - 8) > v25 - 1)
      {
        uint64_t v42 = v25;
        goto LABEL_21;
      }
      if ((unint64_t)((char *)v26 - v38) < 0x20)
      {
        uint64_t v42 = v25;
        goto LABEL_21;
      }
      uint64_t v45 = (v41 >> 3) + 1;
      uint64_t v46 = 8 * (v45 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v42 = &v25[v46 / 0xFFFFFFFFFFFFFFF8];
      uint64_t v39 = (uint64_t *)((char *)v39 - v46);
      v47 = &v38[8 * v35 - 16];
      v48 = v25 - 2;
      uint64_t v49 = v45 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v50 = *(_OWORD *)v48;
        *(v47 - 1) = *((_OWORD *)v48 - 1);
        _OWORD *v47 = v50;
        v47 -= 2;
        v48 -= 4;
        v49 -= 4;
      }
      while (v49);
      if (v45 != (v45 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_21;
      }
LABEL_22:
      uint64_t v24 = (uint64_t *)&v38[8 * v37];
      v434 = (void **)v39;
      v435 = v28;
      v436 = v24;
      if (v26) {
        operator delete(v26);
      }
      uint64_t v26 = v39;
      uint64_t v23 = (void *)v416;
LABEL_5:
      v435 = v28;
      ++v27;
      uint64_t v25 = v28;
      uint64_t v11 = v417;
    }
    if ((uint64_t)v11 >= (uint64_t)v415)
    {
      uint64_t v56 = v444;
      if ((unint64_t)v444 >= v445)
      {
        v60 = sub_1C4A9BFB8((char **)&v443, v26, (uint64_t)v25);
      }
      else
      {
        *(void *)v444 = 0;
        *((void *)v56 + 1) = 0;
        *((void *)v56 + 2) = 0;
        int64_t v57 = (char *)v25 - (char *)v26;
        if (v25 != v26)
        {
          if (v57 < 0) {
            sub_1C494A220();
          }
          v58 = (char *)operator new((char *)v25 - (char *)v26);
          *(void *)uint64_t v56 = v58;
          *((void *)v56 + 1) = v58;
          v59 = &v58[8 * (v57 >> 3)];
          *((void *)v56 + 2) = v59;
          memcpy(v58, v26, v57);
          *((void *)v56 + 1) = v59;
        }
        v60 = v56 + 24;
        uint64_t v23 = (void *)v416;
      }
      v444 = v60;
      uint64_t v61 = objc_msgSend_objectAtIndex_(v418->super._transcriptionPathScores, v29, (uint64_t)v11, v30, v31, v32);
      objc_msgSend_doubleValue(v61, v71, v72, v73, v74, v75);
      uint64_t v77 = v76;
      v78 = v438;
      if (v438 < v439)
      {
        *(void *)v438 = v76;
        uint64_t v79 = (uint64_t)(v78 + 8);
LABEL_91:
        uint64_t v12 = v414;
        v438 = (char *)v79;
        goto LABEL_92;
      }
      v88 = v437;
      uint64_t v89 = (v438 - v437) >> 3;
      unint64_t v90 = v89 + 1;
      if ((unint64_t)(v89 + 1) >> 61) {
        sub_1C494A220();
      }
      uint64_t v91 = v439 - v437;
      if ((v439 - v437) >> 2 > v90) {
        unint64_t v90 = v91 >> 2;
      }
      if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v92 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v92 = v90;
      }
      if (v92)
      {
        if (v92 >> 61) {
          sub_1C4949AA8();
        }
        v93 = operator new(8 * v92);
        v94 = &v93[8 * v89];
        *(void *)v94 = v77;
        uint64_t v79 = (uint64_t)(v94 + 8);
        uint64_t v95 = v78 - v88;
        if (v78 == v88) {
          goto LABEL_89;
        }
LABEL_83:
        unint64_t v105 = v95 - 8;
        if (v105 < 0x58) {
          goto LABEL_433;
        }
        if ((unint64_t)(v88 - v93) < 0x20) {
          goto LABEL_433;
        }
        uint64_t v106 = (v105 >> 3) + 1;
        uint64_t v107 = 8 * (v106 & 0x3FFFFFFFFFFFFFFCLL);
        uint64_t v108 = &v78[-v107];
        v94 -= v107;
        uint64_t v109 = &v93[8 * v89 - 16];
        uint64_t v110 = v78 - 16;
        uint64_t v111 = v106 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v112 = *(_OWORD *)v110;
          *(v109 - 1) = *((_OWORD *)v110 - 1);
          *uint64_t v109 = v112;
          v109 -= 2;
          v110 -= 32;
          v111 -= 4;
        }
        while (v111);
        v78 = v108;
        if (v106 != (v106 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_433:
          do
          {
            uint64_t v113 = *((void *)v78 - 1);
            v78 -= 8;
            *((void *)v94 - 1) = v113;
            v94 -= 8;
          }
          while (v78 != v88);
        }
      }
      else
      {
        v93 = 0;
        v94 = (char *)(8 * v89);
        *(void *)(8 * v89) = v76;
        uint64_t v79 = 8 * v89 + 8;
        uint64_t v95 = v78 - v88;
        if (v78 != v88) {
          goto LABEL_83;
        }
      }
LABEL_89:
      v437 = v94;
      v438 = (char *)v79;
      v439 = &v93[8 * v92];
      if (v88) {
        operator delete(v88);
      }
      goto LABEL_91;
    }
    uint64_t v51 = v447;
    if ((unint64_t)v447 >= v448)
    {
      uint64_t v55 = sub_1C4A9BFB8(&v446, v26, (uint64_t)v25);
    }
    else
    {
      *(void *)v447 = 0;
      *((void *)v51 + 1) = 0;
      *((void *)v51 + 2) = 0;
      int64_t v52 = (char *)v25 - (char *)v26;
      if (v25 != v26)
      {
        if (v52 < 0) {
          sub_1C494A220();
        }
        v53 = (char *)operator new((char *)v25 - (char *)v26);
        *(void *)uint64_t v51 = v53;
        *((void *)v51 + 1) = v53;
        uint64_t v54 = &v53[8 * (v52 >> 3)];
        *((void *)v51 + 2) = v54;
        memcpy(v53, v26, v52);
        *((void *)v51 + 1) = v54;
      }
      uint64_t v55 = v51 + 24;
      uint64_t v23 = (void *)v416;
    }
    v447 = v55;
    uint64_t v61 = objc_msgSend_objectAtIndex_(v418->super._transcriptionPathScores, v29, (uint64_t)v11, v30, v31, v32);
    objc_msgSend_doubleValue(v61, v62, v63, v64, v65, v66);
    uint64_t v68 = v67;
    uint64_t v69 = v441;
    if ((unint64_t)v441 < v442)
    {
      *(void *)v441 = v67;
      uint64_t v70 = v69 + 8;
      goto LABEL_81;
    }
    uint64_t v80 = v440;
    int64_t v81 = (v441 - v440) >> 3;
    unint64_t v82 = v81 + 1;
    if ((unint64_t)(v81 + 1) >> 61) {
      sub_1C494A220();
    }
    uint64_t v83 = v442 - (void)v440;
    if ((uint64_t)(v442 - (void)v440) >> 2 > v82) {
      unint64_t v82 = v83 >> 2;
    }
    if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v84 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v84 = v82;
    }
    if (v84)
    {
      if (v84 >> 61) {
        sub_1C4949AA8();
      }
      unint64_t v85 = operator new(8 * v84);
      v86 = &v85[8 * v81];
      void *v86 = v68;
      uint64_t v70 = (char *)(v86 + 1);
      uint64_t v87 = v69 - v80;
      if (v69 == v80) {
        goto LABEL_79;
      }
LABEL_73:
      unint64_t v96 = v87 - 8;
      if (v96 < 0x58) {
        goto LABEL_434;
      }
      if ((unint64_t)(v80 - v85) < 0x20) {
        goto LABEL_434;
      }
      uint64_t v97 = (v96 >> 3) + 1;
      uint64_t v98 = 8 * (v97 & 0x3FFFFFFFFFFFFFFCLL);
      v99 = &v69[-v98];
      v86 = (void *)((char *)v86 - v98);
      uint64_t v100 = &v85[8 * v81 - 16];
      uint64_t v101 = v69 - 16;
      uint64_t v102 = v97 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v103 = *(_OWORD *)v101;
        *(v100 - 1) = *((_OWORD *)v101 - 1);
        *uint64_t v100 = v103;
        v100 -= 2;
        v101 -= 32;
        v102 -= 4;
      }
      while (v102);
      uint64_t v69 = v99;
      if (v97 != (v97 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_434:
        do
        {
          uint64_t v104 = *((void *)v69 - 1);
          v69 -= 8;
          *--v86 = v104;
        }
        while (v69 != v80);
      }
    }
    else
    {
      unint64_t v85 = 0;
      v86 = (void *)(8 * v81);
      *(void *)(8 * v81) = v67;
      uint64_t v70 = (char *)(8 * v81 + 8);
      uint64_t v87 = v69 - v80;
      if (v69 != v80) {
        goto LABEL_73;
      }
    }
LABEL_79:
    v440 = v86;
    v441 = v70;
    unint64_t v442 = (unint64_t)&v85[8 * v84];
    if (v80) {
      operator delete(v80);
    }
LABEL_81:
    uint64_t v12 = v414;
    v441 = v70;
LABEL_92:

    if (v434) {
      operator delete(v434);
    }

    uint64_t v11 = v417 + 1;
  }
  unint64_t v114 = 0;
  uint64_t v416 = 32;
  while (v114 < objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v416), v13, v14, v15, v16, v17))
  {
    uint64_t v414 = objc_msgSend_objectAtIndexedSubscript_(*(void **)((char *)&v418->super.super.super.isa + v416), v115, v114, v117, v118, v119);
    v435 = 0;
    v436 = 0;
    v434 = (void **)&v435;
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v120, v121, v122, v123, v124);
    v415 = (char *)objc_claimAutoreleasedReturnValue();
    v431 = 0;
    v432 = 0;
    unint64_t v433 = 0;
    v429 = 0;
    v428 = 0;
    unint64_t v430 = 0;
    v426 = 0;
    v425 = 0;
    unint64_t v427 = 0;
    v423 = 0;
    v422 = 0;
    unint64_t v424 = 0;
    uint64_t v125 = v446;
    v417 = (char *)v114;
    if (v447 != v446)
    {
      unint64_t v126 = 0;
      while (1)
      {
        v420 = 0;
        v419 = 0;
        v421 = 0;
        long long v128 = *(_OWORD *)&v125[24 * v126];
        uint64_t v129 = *(void *)&v125[24 * v126 + 8];
        uint64_t v130 = (const void *)v128;
        int64_t v131 = v129 - v128;
        if (v129 - (uint64_t)v128 < 0) {
          sub_1C494A220();
        }
        v419 = (char *)operator new(v129 - v128);
        v421 = &v419[8 * (v131 >> 3)];
        memcpy(v419, v130, v131);
        v420 = v421;
        uint64_t v137 = *(void *)&v419[8 * v114];
        uint64_t v138 = v435;
        BOOL v139 = &v435;
        v140 = v435;
        if (!v435) {
          break;
        }
        do
        {
          uint64_t v141 = v140;
          uint64_t v142 = v139;
          uint64_t v143 = v140[4];
          if (v143 >= v137) {
            BOOL v139 = (void **)v140;
          }
          else {
            ++v140;
          }
          v140 = (void *)*v140;
        }
        while (v140);
        if (v139 == &v435) {
          goto LABEL_112;
        }
        if (v143 < v137) {
          uint64_t v141 = v142;
        }
        if (v137 < v141[4])
        {
LABEL_112:
          uint64_t v144 = v436;
          while (1)
          {
            while (1)
            {
              v145 = (void **)v138;
              uint64_t v146 = v138[4];
              if (v137 >= v146) {
                break;
              }
              uint64_t v138 = *v145;
              if (!*v145)
              {
                uint64_t v147 = v145;
                goto LABEL_120;
              }
            }
            if (v146 >= v137) {
              break;
            }
            uint64_t v138 = v145[1];
            if (!v138)
            {
              uint64_t v147 = v145 + 1;
              goto LABEL_120;
            }
          }
          uint64_t v148 = v145;
          goto LABEL_145;
        }
LABEL_146:
        if (v138)
        {
          v172 = &v435;
          v173 = v138;
          do
          {
            uint64_t v174 = v173;
            uint64_t v175 = v172;
            uint64_t v176 = v173[4];
            if (v176 >= v137) {
              v172 = (void **)v173;
            }
            else {
              ++v173;
            }
            v173 = (void *)*v173;
          }
          while (v173);
          if (v172 != &v435)
          {
            if (v176 < v137) {
              uint64_t v174 = v175;
            }
            if (v137 >= v174[4])
            {
              do
              {
                while (1)
                {
                  uint64_t v177 = v138;
                  uint64_t v178 = v138[4];
                  if (v137 < v178) {
                    break;
                  }
                  if (v178 >= v137)
                  {
                    v192 = v419;
                    *(void *)&v419[8 * v114] = v177[5];
                    uint64_t v193 = v432;
                    if ((unint64_t)v432 >= v433) {
                      goto LABEL_182;
                    }
                    goto LABEL_195;
                  }
                  uint64_t v138 = (void *)v177[1];
                  if (!v138)
                  {
                    v179 = v177 + 1;
                    goto LABEL_163;
                  }
                }
                uint64_t v138 = (void *)*v177;
              }
              while (*v177);
              v179 = v177;
LABEL_163:
              uint64_t v180 = operator new(0x30uLL);
              v180[4] = v137;
              v180[5] = 0;
              *uint64_t v180 = 0;
              v180[1] = 0;
              v180[2] = v177;
              void *v179 = v180;
              if (*v434)
              {
                v434 = (void **)*v434;
                uint64_t v180 = (void *)*v179;
              }
              uint64_t v181 = v435;
              *((unsigned char *)v180 + 24) = v180 == v435;
              unint64_t v114 = (unint64_t)v417;
              if (v180 != v181)
              {
                do
                {
                  uint64_t v182 = v180[2];
                  if (*(unsigned char *)(v182 + 24)) {
                    break;
                  }
                  v183 = *(void **)(v182 + 16);
                  uint64_t v184 = *v183;
                  if (*v183 == v182)
                  {
                    uint64_t v187 = v183[1];
                    if (!v187 || (v188 = *(unsigned __int8 *)(v187 + 24), uint64_t v185 = (unsigned char *)(v187 + 24), v188))
                    {
                      if (*(void **)v182 == v180)
                      {
                        *(unsigned char *)(v182 + 24) = 1;
                        *((unsigned char *)v183 + 24) = 0;
                        uint64_t v191 = *(void *)(v182 + 8);
                        void *v183 = v191;
                        if (v191) {
                          goto LABEL_179;
                        }
                      }
                      else
                      {
                        uint64_t v189 = *(uint64_t **)(v182 + 8);
                        uint64_t v190 = *v189;
                        *(void *)(v182 + 8) = *v189;
                        if (v190)
                        {
                          *(void *)(v190 + 16) = v182;
                          v183 = *(void **)(v182 + 16);
                        }
                        v189[2] = (uint64_t)v183;
                        *(void *)(*(void *)(v182 + 16) + 8 * (**(void **)(v182 + 16) != v182)) = v189;
                        *uint64_t v189 = v182;
                        *(void *)(v182 + 16) = v189;
                        v183 = (void *)v189[2];
                        uint64_t v182 = *v183;
                        *((unsigned char *)v189 + 24) = 1;
                        *((unsigned char *)v183 + 24) = 0;
                        uint64_t v191 = *(void *)(v182 + 8);
                        void *v183 = v191;
                        if (v191) {
LABEL_179:
                        }
                          *(void *)(v191 + 16) = v183;
                      }
                      *(void *)(v182 + 16) = v183[2];
                      *(void *)(v183[2] + 8 * (*(void *)v183[2] != (void)v183)) = v182;
                      *(void *)(v182 + 8) = v183;
LABEL_193:
                      v183[2] = v182;
                      break;
                    }
                  }
                  else if (!v184 || (v186 = *(unsigned __int8 *)(v184 + 24), uint64_t v185 = (unsigned char *)(v184 + 24), v186))
                  {
                    if (*(void **)v182 == v180)
                    {
                      uint64_t v220 = v180[1];
                      *(void *)uint64_t v182 = v220;
                      if (v220)
                      {
                        *(void *)(v220 + 16) = v182;
                        v183 = *(void **)(v182 + 16);
                      }
                      v180[2] = v183;
                      *(void *)(*(void *)(v182 + 16) + 8 * (**(void **)(v182 + 16) != v182)) = v180;
                      v180[1] = v182;
                      *(void *)(v182 + 16) = v180;
                      v183 = (void *)v180[2];
                      *((unsigned char *)v180 + 24) = 1;
                      *((unsigned char *)v183 + 24) = 0;
                      uint64_t v182 = v183[1];
                      v196 = *(void **)v182;
                      v183[1] = *(void *)v182;
                      if (v196) {
LABEL_191:
                      }
                        v196[2] = v183;
                    }
                    else
                    {
                      *(unsigned char *)(v182 + 24) = 1;
                      *((unsigned char *)v183 + 24) = 0;
                      uint64_t v182 = v183[1];
                      v196 = *(void **)v182;
                      v183[1] = *(void *)v182;
                      if (v196) {
                        goto LABEL_191;
                      }
                    }
                    *(void *)(v182 + 16) = v183[2];
                    *(void *)(v183[2] + 8 * (*(void *)v183[2] != (void)v183)) = v182;
                    *(void *)uint64_t v182 = v183;
                    goto LABEL_193;
                  }
                  *(unsigned char *)(v182 + 24) = 1;
                  uint64_t v180 = v183;
                  *((unsigned char *)v183 + 24) = v183 == v181;
                  *uint64_t v185 = 1;
                }
                while (v183 != v181);
              }
              v436 = (uint64_t *)((char *)v436 + 1);
              v192 = v419;
              *(void *)&v419[8 * v114] = 0;
              uint64_t v193 = v432;
              if ((unint64_t)v432 >= v433)
              {
LABEL_182:
                uint64_t v194 = sub_1C4A9BFB8((char **)&v431, v192, (uint64_t)v420);
                unint64_t v114 = (unint64_t)v417;
                goto LABEL_199;
              }
LABEL_195:
              *(void *)uint64_t v193 = 0;
              *((void *)v193 + 1) = 0;
              *((void *)v193 + 2) = 0;
              int64_t v197 = v420 - v192;
              if (v420 != v192)
              {
                if (v197 < 0) {
                  sub_1C494A220();
                }
                uint64_t v198 = (char *)operator new(v420 - v192);
                *(void *)uint64_t v193 = v198;
                *((void *)v193 + 1) = v198;
                uint64_t v199 = &v198[8 * (v197 >> 3)];
                *((void *)v193 + 2) = v199;
                memcpy(v198, v192, v197);
                *((void *)v193 + 1) = v199;
              }
              uint64_t v194 = v193 + 24;
LABEL_199:
              v432 = v194;
              uint64_t v200 = v440;
              v201 = v426;
              if ((unint64_t)v426 < v427)
              {
                *(void *)v426 = *(void *)&v440[8 * v126];
                uint64_t v202 = v201 + 8;
                goto LABEL_221;
              }
              uint64_t v203 = v425;
              int64_t v204 = (v426 - v425) >> 3;
              unint64_t v205 = v204 + 1;
              if ((unint64_t)(v204 + 1) >> 61) {
                sub_1C494A220();
              }
              uint64_t v206 = v427 - (void)v425;
              if ((uint64_t)(v427 - (void)v425) >> 2 > v205) {
                unint64_t v205 = v206 >> 2;
              }
              if ((unint64_t)v206 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v207 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v207 = v205;
              }
              if (v207)
              {
                if (v207 >> 61) {
                  sub_1C4949AA8();
                }
                v208 = operator new(8 * v207);
                unint64_t v209 = &v208[8 * v204];
                *(void *)unint64_t v209 = *(void *)&v200[8 * v126];
                uint64_t v202 = v209 + 8;
                int64_t v210 = v201 - v203;
                if (v201 != v203)
                {
LABEL_210:
                  unint64_t v211 = v210 - 8;
                  if (v211 < 0x58)
                  {
                    unint64_t v114 = (unint64_t)v417;
                    goto LABEL_218;
                  }
                  unint64_t v114 = (unint64_t)v417;
                  if ((unint64_t)(v203 - v208) < 0x20) {
                    goto LABEL_435;
                  }
                  uint64_t v212 = (v211 >> 3) + 1;
                  uint64_t v213 = 8 * (v212 & 0x3FFFFFFFFFFFFFFCLL);
                  uint64_t v214 = &v201[-v213];
                  v209 -= v213;
                  unint64_t v215 = &v208[8 * v204 - 16];
                  uint64_t v216 = v201 - 16;
                  uint64_t v217 = v212 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    long long v218 = *(_OWORD *)v216;
                    *(v215 - 1) = *((_OWORD *)v216 - 1);
                    *unint64_t v215 = v218;
                    v215 -= 2;
                    v216 -= 32;
                    v217 -= 4;
                  }
                  while (v217);
                  v201 = v214;
                  if (v212 != (v212 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_435:
                    do
                    {
LABEL_218:
                      uint64_t v219 = *((void *)v201 - 1);
                      v201 -= 8;
                      *((void *)v209 - 1) = v219;
                      v209 -= 8;
                    }
                    while (v201 != v203);
                  }
LABEL_219:
                  v425 = v209;
                  unint64_t v427 = (unint64_t)&v208[8 * v207];
                  if (v203) {
                    operator delete(v203);
                  }
LABEL_221:
                  v426 = v202;
                  uint64_t v127 = v419;
                  if (!v419) {
                    goto LABEL_101;
                  }
LABEL_100:
                  operator delete(v127);
                  goto LABEL_101;
                }
              }
              else
              {
                v208 = 0;
                unint64_t v209 = (char *)(8 * v204);
                *(void *)(8 * v204) = *(void *)&v440[8 * v126];
                uint64_t v202 = (char *)(8 * v204 + 8);
                int64_t v210 = v201 - v203;
                if (v201 != v203) {
                  goto LABEL_210;
                }
              }
              unint64_t v114 = (unint64_t)v417;
              goto LABEL_219;
            }
          }
        }
        uint64_t v127 = v419;
        if (v419) {
          goto LABEL_100;
        }
LABEL_101:
        ++v126;
        uint64_t v125 = v446;
        if (v126 >= 0xAAAAAAAAAAAAAAABLL * ((v447 - v446) >> 3)) {
          goto LABEL_229;
        }
      }
      uint64_t v144 = v436;
      uint64_t v147 = &v435;
      v145 = &v435;
LABEL_120:
      uint64_t v148 = operator new(0x30uLL);
      v148[4] = v137;
      v148[5] = 0;
      *uint64_t v148 = 0;
      v148[1] = 0;
      v148[2] = v145;
      *uint64_t v147 = v148;
      uint64_t v149 = v148;
      if (*v434)
      {
        v434 = (void **)*v434;
        uint64_t v149 = (void *)*v147;
      }
      v150 = v435;
      *((unsigned char *)v149 + 24) = v149 == v435;
      if (v149 != v150)
      {
        do
        {
          uint64_t v151 = v149[2];
          if (*(unsigned char *)(v151 + 24)) {
            break;
          }
          uint64_t v152 = *(void **)(v151 + 16);
          uint64_t v153 = *v152;
          if (*v152 == v151)
          {
            uint64_t v156 = v152[1];
            if (!v156 || (v157 = *(unsigned __int8 *)(v156 + 24), uint64_t v154 = (unsigned char *)(v156 + 24), v157))
            {
              if (*(void **)v151 == v149)
              {
                *(unsigned char *)(v151 + 24) = 1;
                *((unsigned char *)v152 + 24) = 0;
                uint64_t v160 = *(void *)(v151 + 8);
                *uint64_t v152 = v160;
                if (v160) {
                  goto LABEL_136;
                }
              }
              else
              {
                uint64_t v158 = *(uint64_t **)(v151 + 8);
                uint64_t v159 = *v158;
                *(void *)(v151 + 8) = *v158;
                if (v159)
                {
                  *(void *)(v159 + 16) = v151;
                  uint64_t v152 = *(void **)(v151 + 16);
                }
                v158[2] = (uint64_t)v152;
                *(void *)(*(void *)(v151 + 16) + 8 * (**(void **)(v151 + 16) != v151)) = v158;
                *uint64_t v158 = v151;
                *(void *)(v151 + 16) = v158;
                uint64_t v152 = (void *)v158[2];
                uint64_t v151 = *v152;
                *((unsigned char *)v158 + 24) = 1;
                *((unsigned char *)v152 + 24) = 0;
                uint64_t v160 = *(void *)(v151 + 8);
                *uint64_t v152 = v160;
                if (v160) {
LABEL_136:
                }
                  *(void *)(v160 + 16) = v152;
              }
              *(void *)(v151 + 16) = v152[2];
              *(void *)(v152[2] + 8 * (*(void *)v152[2] != (void)v152)) = v151;
              *(void *)(v151 + 8) = v152;
LABEL_143:
              v152[2] = v151;
              break;
            }
          }
          else if (!v153 || (v155 = *(unsigned __int8 *)(v153 + 24), uint64_t v154 = (unsigned char *)(v153 + 24), v155))
          {
            if (*(void **)v151 == v149)
            {
              uint64_t v195 = v149[1];
              *(void *)uint64_t v151 = v195;
              if (v195)
              {
                *(void *)(v195 + 16) = v151;
                uint64_t v152 = *(void **)(v151 + 16);
              }
              v149[2] = v152;
              *(void *)(*(void *)(v151 + 16) + 8 * (**(void **)(v151 + 16) != v151)) = v149;
              v149[1] = v151;
              *(void *)(v151 + 16) = v149;
              uint64_t v152 = (void *)v149[2];
              *((unsigned char *)v149 + 24) = 1;
              *((unsigned char *)v152 + 24) = 0;
              uint64_t v151 = v152[1];
              uint64_t v161 = *(void **)v151;
              v152[1] = *(void *)v151;
              if (v161) {
LABEL_141:
              }
                v161[2] = v152;
            }
            else
            {
              *(unsigned char *)(v151 + 24) = 1;
              *((unsigned char *)v152 + 24) = 0;
              uint64_t v151 = v152[1];
              uint64_t v161 = *(void **)v151;
              v152[1] = *(void *)v151;
              if (v161) {
                goto LABEL_141;
              }
            }
            *(void *)(v151 + 16) = v152[2];
            *(void *)(v152[2] + 8 * (*(void *)v152[2] != (void)v152)) = v151;
            *(void *)uint64_t v151 = v152;
            goto LABEL_143;
          }
          *(unsigned char *)(v151 + 24) = 1;
          uint64_t v149 = v152;
          *((unsigned char *)v152 + 24) = v152 == v150;
          *uint64_t v154 = 1;
        }
        while (v152 != v150);
      }
      v436 = (uint64_t *)((char *)v144 + 1);
LABEL_145:
      v148[5] = v144;
      uint64_t v162 = objc_msgSend_textTokenRows((void *)v414, v132, v133, v134, v135, v136);
      uint64_t v167 = objc_msgSend_objectAtIndexedSubscript_(v162, v163, v137, v164, v165, v166);
      objc_msgSend_addObject_(v415, v168, (uint64_t)v167, v169, v170, v171);

      unint64_t v114 = (unint64_t)v417;
      uint64_t v138 = v435;
      goto LABEL_146;
    }
LABEL_229:
    v221 = v443;
    if (v444 != (char *)v443)
    {
      unint64_t v222 = 0;
      while (1)
      {
        uint64_t v225 = &v221[3 * v222];
        v420 = 0;
        v419 = 0;
        v421 = 0;
        v227 = *v225;
        v226 = v225[1];
        int64_t v228 = v226 - v227;
        if (v226 == v227)
        {
          uint64_t v224 = 0;
          uint64_t v229 = v435;
          if (!v435) {
            goto LABEL_234;
          }
        }
        else
        {
          if (v228 < 0) {
            sub_1C494A220();
          }
          uint64_t v224 = (char *)operator new(v226 - v227);
          v419 = v224;
          v421 = &v224[8 * (v228 >> 3)];
          memcpy(v224, v227, v228);
          v420 = v421;
          uint64_t v229 = v435;
          if (!v435)
          {
LABEL_234:
            v420 = v224;
            operator delete(v224);
            goto LABEL_235;
          }
        }
        uint64_t v230 = *(void *)&v224[8 * v114];
        uint64_t v231 = &v435;
        v232 = v229;
        do
        {
          uint64_t v233 = v232;
          uint64_t v234 = v231;
          uint64_t v235 = v232[4];
          if (v235 >= v230) {
            uint64_t v231 = (void **)v232;
          }
          else {
            ++v232;
          }
          v232 = (void *)*v232;
        }
        while (v232);
        if (v231 != &v435)
        {
          if (v235 < v230) {
            uint64_t v233 = v234;
          }
          if (v230 >= v233[4]) {
            break;
          }
        }
LABEL_233:
        if (v224) {
          goto LABEL_234;
        }
LABEL_235:
        ++v222;
        v221 = v443;
        if (v222 >= 0xAAAAAAAAAAAAAAABLL * ((v444 - (char *)v443) >> 3)) {
          goto LABEL_315;
        }
      }
      do
      {
        while (1)
        {
          v236 = v229;
          uint64_t v237 = v229[4];
          if (v230 < v237) {
            break;
          }
          if (v237 >= v230)
          {
            uint64_t v251 = v236[5];
            goto LABEL_282;
          }
          uint64_t v229 = (void *)v236[1];
          if (!v229)
          {
            uint64_t v238 = v236 + 1;
            goto LABEL_257;
          }
        }
        uint64_t v229 = (void *)*v236;
      }
      while (*v236);
      uint64_t v238 = v236;
LABEL_257:
      uint64_t v239 = operator new(0x30uLL);
      v239[4] = v230;
      v239[5] = 0;
      *uint64_t v239 = 0;
      v239[1] = 0;
      v239[2] = v236;
      *uint64_t v238 = v239;
      if (*v434)
      {
        v434 = (void **)*v434;
        uint64_t v239 = (void *)*v238;
      }
      uint64_t v240 = v435;
      *((unsigned char *)v239 + 24) = v239 == v435;
      unint64_t v114 = (unint64_t)v417;
      if (v239 != v240)
      {
        do
        {
          uint64_t v241 = v239[2];
          if (*(unsigned char *)(v241 + 24)) {
            break;
          }
          v242 = *(void **)(v241 + 16);
          uint64_t v243 = *v242;
          if (*v242 == v241)
          {
            uint64_t v246 = v242[1];
            if (!v246 || (int v247 = *(unsigned __int8 *)(v246 + 24), v244 = (unsigned char *)(v246 + 24), v247))
            {
              if (*(void **)v241 == v239)
              {
                *(unsigned char *)(v241 + 24) = 1;
                *((unsigned char *)v242 + 24) = 0;
                uint64_t v250 = *(void *)(v241 + 8);
                void *v242 = v250;
                if (v250) {
                  goto LABEL_273;
                }
              }
              else
              {
                v248 = *(uint64_t **)(v241 + 8);
                uint64_t v249 = *v248;
                *(void *)(v241 + 8) = *v248;
                if (v249)
                {
                  *(void *)(v249 + 16) = v241;
                  v242 = *(void **)(v241 + 16);
                }
                v248[2] = (uint64_t)v242;
                *(void *)(*(void *)(v241 + 16) + 8 * (**(void **)(v241 + 16) != v241)) = v248;
                uint64_t *v248 = v241;
                *(void *)(v241 + 16) = v248;
                v242 = (void *)v248[2];
                uint64_t v241 = *v242;
                *((unsigned char *)v248 + 24) = 1;
                *((unsigned char *)v242 + 24) = 0;
                uint64_t v250 = *(void *)(v241 + 8);
                void *v242 = v250;
                if (v250) {
LABEL_273:
                }
                  *(void *)(v250 + 16) = v242;
              }
              *(void *)(v241 + 16) = v242[2];
              *(void *)(v242[2] + 8 * (*(void *)v242[2] != (void)v242)) = v241;
              *(void *)(v241 + 8) = v242;
LABEL_280:
              v242[2] = v241;
              break;
            }
          }
          else if (!v243 || (int v245 = *(unsigned __int8 *)(v243 + 24), v244 = (unsigned char *)(v243 + 24), v245))
          {
            if (*(void **)v241 == v239)
            {
              uint64_t v278 = v239[1];
              *(void *)uint64_t v241 = v278;
              if (v278)
              {
                *(void *)(v278 + 16) = v241;
                v242 = *(void **)(v241 + 16);
              }
              v239[2] = v242;
              *(void *)(*(void *)(v241 + 16) + 8 * (**(void **)(v241 + 16) != v241)) = v239;
              v239[1] = v241;
              *(void *)(v241 + 16) = v239;
              v242 = (void *)v239[2];
              *((unsigned char *)v239 + 24) = 1;
              *((unsigned char *)v242 + 24) = 0;
              uint64_t v241 = v242[1];
              v252 = *(void **)v241;
              v242[1] = *(void *)v241;
              if (v252) {
LABEL_278:
              }
                v252[2] = v242;
            }
            else
            {
              *(unsigned char *)(v241 + 24) = 1;
              *((unsigned char *)v242 + 24) = 0;
              uint64_t v241 = v242[1];
              v252 = *(void **)v241;
              v242[1] = *(void *)v241;
              if (v252) {
                goto LABEL_278;
              }
            }
            *(void *)(v241 + 16) = v242[2];
            *(void *)(v242[2] + 8 * (*(void *)v242[2] != (void)v242)) = v241;
            *(void *)uint64_t v241 = v242;
            goto LABEL_280;
          }
          *(unsigned char *)(v241 + 24) = 1;
          uint64_t v239 = v242;
          *((unsigned char *)v242 + 24) = v242 == v240;
          unsigned char *v244 = 1;
        }
        while (v242 != v240);
      }
      uint64_t v251 = 0;
      v436 = (uint64_t *)((char *)v436 + 1);
      uint64_t v224 = v419;
LABEL_282:
      *(void *)&v224[8 * v114] = v251;
      uint64_t v253 = v429;
      if ((unint64_t)v429 >= v430)
      {
        v258 = sub_1C4A9BFB8((char **)&v428, v419, (uint64_t)v420);
      }
      else
      {
        *(void *)v429 = 0;
        *((void *)v253 + 1) = 0;
        *((void *)v253 + 2) = 0;
        uint64_t v254 = v419;
        int64_t v255 = v420 - v419;
        if (v420 != v419)
        {
          if (v255 < 0) {
            sub_1C494A220();
          }
          uint64_t v256 = (char *)operator new(v420 - v419);
          *(void *)uint64_t v253 = v256;
          *((void *)v253 + 1) = v256;
          uint64_t v257 = &v256[8 * (v255 >> 3)];
          *((void *)v253 + 2) = v257;
          memcpy(v256, v254, v255);
          *((void *)v253 + 1) = v257;
        }
        v258 = v253 + 24;
      }
      v429 = v258;
      uint64_t v259 = v440;
      uint64_t v260 = v423;
      if ((unint64_t)v423 < v424)
      {
        *(void *)v423 = *(void *)&v440[8 * v222];
        unint64_t v223 = v260 + 8;
        unint64_t v114 = (unint64_t)v417;
        goto LABEL_232;
      }
      uint64_t v261 = v422;
      int64_t v262 = (v423 - v422) >> 3;
      unint64_t v263 = v262 + 1;
      if ((unint64_t)(v262 + 1) >> 61) {
        sub_1C494A220();
      }
      uint64_t v264 = v424 - (void)v422;
      if ((uint64_t)(v424 - (void)v422) >> 2 > v263) {
        unint64_t v263 = v264 >> 2;
      }
      if ((unint64_t)v264 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v265 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v265 = v263;
      }
      if (v265)
      {
        if (v265 >> 61) {
          sub_1C4949AA8();
        }
        uint64_t v266 = operator new(8 * v265);
        uint64_t v267 = &v266[8 * v262];
        *(void *)uint64_t v267 = *(void *)&v259[8 * v222];
        unint64_t v223 = v267 + 8;
        int64_t v268 = v260 - v261;
        if (v260 != v261)
        {
LABEL_298:
          unint64_t v269 = v268 - 8;
          unint64_t v114 = (unint64_t)v417;
          if (v269 < 0x58) {
            goto LABEL_436;
          }
          if ((unint64_t)(v261 - v266) < 0x20) {
            goto LABEL_436;
          }
          uint64_t v270 = (v269 >> 3) + 1;
          uint64_t v271 = 8 * (v270 & 0x3FFFFFFFFFFFFFFCLL);
          uint64_t v272 = &v260[-v271];
          v267 -= v271;
          v273 = &v266[8 * v262 - 16];
          uint64_t v274 = v260 - 16;
          uint64_t v275 = v270 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v276 = *(_OWORD *)v274;
            *(v273 - 1) = *((_OWORD *)v274 - 1);
            _OWORD *v273 = v276;
            v273 -= 2;
            v274 -= 32;
            v275 -= 4;
          }
          while (v275);
          uint64_t v260 = v272;
          if (v270 != (v270 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_436:
            do
            {
              uint64_t v277 = *((void *)v260 - 1);
              v260 -= 8;
              *((void *)v267 - 1) = v277;
              v267 -= 8;
            }
            while (v260 != v261);
          }
          v422 = v267;
          unint64_t v424 = (unint64_t)&v266[8 * v265];
          if (!v261) {
            goto LABEL_232;
          }
LABEL_308:
          operator delete(v261);
LABEL_232:
          v423 = v223;
          uint64_t v224 = v419;
          goto LABEL_233;
        }
      }
      else
      {
        uint64_t v266 = 0;
        uint64_t v267 = (char *)(8 * v262);
        *(void *)(8 * v262) = *(void *)&v440[8 * v222];
        unint64_t v223 = (char *)(8 * v262 + 8);
        int64_t v268 = v260 - v261;
        if (v260 != v261) {
          goto LABEL_298;
        }
      }
      unint64_t v114 = (unint64_t)v417;
      v422 = v267;
      unint64_t v424 = (unint64_t)&v266[8 * v265];
      if (v261) {
        goto LABEL_308;
      }
      goto LABEL_232;
    }
LABEL_315:
    sub_1C4A9C1AC((uint64_t)&v446, v431, (uint64_t)v432, 0xAAAAAAAAAAAAAAABLL * ((v432 - (char *)v431) >> 3));
    sub_1C494ACB0(&v440, v425, v426, (v426 - v425) >> 3);
    sub_1C4A9C1AC((uint64_t)&v443, v428, (uint64_t)v429, 0xAAAAAAAAAAAAAAABLL * ((v429 - (char *)v428) >> 3));
    sub_1C494ACB0(&v437, v422, v423, (v423 - v422) >> 3);
    uint64_t v279 = [CHTokenizedResultColumn alloc];
    uint64_t v284 = objc_msgSend_initWithTokenRows_(v279, v280, (uint64_t)v415, v281, v282, v283);
    objc_msgSend_addObject_(v413, v285, (uint64_t)v284, v286, v287, v288);

    if (v422) {
      operator delete(v422);
    }
    if (v425) {
      operator delete(v425);
    }
    uint64_t v289 = (char *)v428;
    if (v428)
    {
      v290 = v429;
      uint64_t v291 = (char *)v428;
      if (v429 != (char *)v428)
      {
        uint64_t v292 = v429;
        do
        {
          v294 = (void *)*((void *)v292 - 3);
          v292 -= 24;
          uint64_t v293 = v294;
          if (v294)
          {
            *((void *)v290 - 2) = v293;
            operator delete(v293);
          }
          v290 = v292;
        }
        while (v292 != v289);
        uint64_t v291 = (char *)v428;
      }
      v429 = v289;
      operator delete(v291);
    }
    v295 = (char *)v431;
    if (v431)
    {
      uint64_t v296 = v432;
      v297 = (char *)v431;
      if (v432 != (char *)v431)
      {
        uint64_t v298 = v432;
        do
        {
          uint64_t v300 = (void *)*((void *)v298 - 3);
          v298 -= 24;
          uint64_t v299 = v300;
          if (v300)
          {
            *((void *)v296 - 2) = v299;
            operator delete(v299);
          }
          uint64_t v296 = v298;
        }
        while (v298 != v295);
        v297 = (char *)v431;
      }
      v432 = v295;
      operator delete(v297);
    }

    sub_1C4999C7C((uint64_t)&v434, v435);
    ++v114;
  }
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v115, v116, v117, v118, v119);
  v417 = (char *)objc_claimAutoreleasedReturnValue();
  v306 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v301, v302, v303, v304, v305);
  sub_1C4A9BA70((char ***)&v446, (uint64_t)v447, v443, (uint64_t)v444, 0xAAAAAAAAAAAAAAABLL * ((v444 - (char *)v443) >> 3));
  v312 = v437;
  uint64_t v313 = v438 - v437;
  if (v438 - v437 >= 1)
  {
    uint64_t v314 = v313 >> 3;
    unint64_t v316 = (unint64_t)v440;
    v315 = v441;
    int64_t v317 = v441 - v440;
    int64_t v318 = (v441 - v440) >> 3;
    uint64_t v307 = (char *)(v316 + ((unint64_t)&v441[-v316] & 0xFFFFFFFFFFFFFFF8));
    if (v313 >> 3 > (uint64_t)(v442 - (void)v441) >> 3)
    {
      unint64_t v319 = v318 + v314;
      if ((unint64_t)(v318 + v314) >> 61) {
        sub_1C494A220();
      }
      uint64_t v320 = v442 - (void)v440;
      if ((uint64_t)(v442 - (void)v440) >> 2 > v319) {
        unint64_t v319 = v320 >> 2;
      }
      if ((unint64_t)v320 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v321 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v321 = v319;
      }
      if (v321)
      {
        if (v321 >> 61) {
          sub_1C4949AA8();
        }
        uint64_t v322 = operator new(8 * v321);
        uint64_t v307 = (char *)(v316 + ((unint64_t)&v315[-v316] & 0xFFFFFFFFFFFFFFF8));
        int64_t v318 = (uint64_t)&v315[-v316] >> 3;
        uint64_t v323 = &v322[8 * v318];
        v324 = &v323[8 * v314];
        unint64_t v325 = v313 - 8;
        if ((unint64_t)(v313 - 8) < 0x38) {
          goto LABEL_347;
        }
      }
      else
      {
        uint64_t v322 = 0;
        uint64_t v323 = (char *)(8 * v318);
        v324 = (char *)(8 * v318 + 8 * v314);
        unint64_t v325 = v313 - 8;
        if ((unint64_t)(v313 - 8) < 0x38)
        {
LABEL_347:
          uint64_t v326 = v323;
          goto LABEL_364;
        }
      }
      uint64_t v326 = v323;
      if ((unint64_t)(&v322[v317 & 0xFFFFFFFFFFFFFFF8] - v312) >= 0x20)
      {
        uint64_t v340 = (v325 >> 3) + 1;
        uint64_t v341 = 8 * (v340 & 0x3FFFFFFFFFFFFFFCLL);
        uint64_t v326 = &v323[v341];
        v342 = &v312[v341];
        uint64_t v343 = (long long *)(v312 + 16);
        v344 = &v322[8 * v318 + 16];
        uint64_t v345 = v340 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v346 = *v343;
          *(v344 - 1) = *(v343 - 1);
          _OWORD *v344 = v346;
          v343 += 2;
          v344 += 2;
          v345 -= 4;
        }
        while (v345);
        v312 = v342;
        if (v340 == (v340 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_365:
          if ((char *)v316 != v315)
          {
            if ((unint64_t)(v317 - 8) >= 0x68)
            {
              unint64_t v348 = v307;
              if ((v317 & 0xFFFFFFFFFFFFFFF8) + v316 - (unint64_t)&v322[v317 & 0xFFFFFFFFFFFFFFF8] >= 0x20)
              {
                unint64_t v349 = ((unint64_t)(v317 - 8) >> 3) + 1;
                uint64_t v350 = 8 * (v349 & 0x3FFFFFFFFFFFFFFCLL);
                unint64_t v348 = &v307[-v350];
                v323 -= v350;
                uint64_t v351 = 8 * v318 - 16;
                v352 = &v322[v351];
                v353 = (long long *)(v316 + v351);
                uint64_t v354 = v349 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  long long v355 = *v353;
                  *(v352 - 1) = *(v353 - 1);
                  _OWORD *v352 = v355;
                  v352 -= 2;
                  v353 -= 2;
                  v354 -= 4;
                }
                while (v354);
                if (v349 == (v349 & 0x3FFFFFFFFFFFFFFCLL)) {
                  goto LABEL_373;
                }
              }
            }
            else
            {
              unint64_t v348 = v307;
            }
            do
            {
              uint64_t v356 = *((void *)v348 - 1);
              v348 -= 8;
              *((void *)v323 - 1) = v356;
              v323 -= 8;
            }
            while (v348 != (char *)v316);
          }
LABEL_373:
          v357 = &v322[8 * v321];
          size_t v358 = v315 - v307;
          if (v358) {
            memmove(v324, v307, v358);
          }
          v440 = v323;
          v441 = &v324[v358];
          unint64_t v442 = (unint64_t)v357;
          if (v316) {
            operator delete((void *)v316);
          }
          goto LABEL_386;
        }
      }
      do
      {
LABEL_364:
        uint64_t v347 = *(void *)v312;
        v312 += 8;
        *(void *)uint64_t v326 = v347;
        v326 += 8;
      }
      while (v326 != v324);
      goto LABEL_365;
    }
    uint64_t v327 = v441 - v307;
    uint64_t v328 = (v441 - v307) >> 3;
    if (v328 >= v314)
    {
      uint64_t v329 = &v437[8 * v314];
      uint64_t v331 = v441;
    }
    else
    {
      uint64_t v329 = &v437[8 * v328];
      size_t v330 = v438 - v329;
      if (v438 != v329)
      {
        v415 = &v440[(v441 - v440) & 0xFFFFFFFFFFFFFFF8];
        memmove(v441, &v437[8 * v328], v330);
        int64_t v318 = (uint64_t)&v315[-v316] >> 3;
        uint64_t v307 = v415;
      }
      uint64_t v331 = &v315[v330];
      v441 = &v315[v330];
      if (v327 < 1) {
        goto LABEL_386;
      }
    }
    v332 = &v307[8 * v314];
    size_t v333 = v331 - v332;
    uint64_t v334 = (v331 - v332) >> 3;
    uint64_t v335 = &v331[-8 * v314];
    uint64_t v336 = v331;
    if (v335 < v315)
    {
      unint64_t v337 = (v317 & 0xFFFFFFFFFFFFFFF8) + v333;
      unint64_t v338 = v337 + v316 + 8;
      if ((unint64_t)v315 > v338) {
        unint64_t v338 = (unint64_t)v315;
      }
      unint64_t v339 = v338 + ~v316 - v337;
      if (v339 >= 0x58)
      {
        uint64_t v336 = v331;
        if ((unint64_t)&v332[-(v317 & 0xFFFFFFFFFFFFFFF8) - v316] >= 0x20)
        {
          uint64_t v359 = (v339 >> 3) + 1;
          uint64_t v360 = 8 * (v359 & 0x3FFFFFFFFFFFFFFCLL);
          v335 += v360;
          uint64_t v336 = &v331[v360];
          id v361 = v331 + 16;
          uint64_t v362 = (long long *)(8 * v334 + 8 * v318 + v316 + 16);
          uint64_t v363 = v359 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v364 = *v362;
            *(v361 - 1) = *(v362 - 1);
            *id v361 = v364;
            v361 += 2;
            v362 += 2;
            v363 -= 4;
          }
          while (v363);
          if (v359 == (v359 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_382;
          }
        }
      }
      else
      {
        uint64_t v336 = v331;
      }
      do
      {
        uint64_t v365 = *(void *)v335;
        v335 += 8;
        *(void *)uint64_t v336 = v365;
        v336 += 8;
      }
      while (v335 < v315);
    }
LABEL_382:
    v441 = v336;
    if (v331 != v332)
    {
      id v366 = v307;
      memmove(&v331[-8 * v334], v307, v333);
      uint64_t v307 = v366;
    }
    size_t v308 = v329 - v312;
    if (v329 != v312) {
      memmove(v307, v312, v308);
    }
  }
LABEL_386:
  if (v447 != v446)
  {
    unint64_t v367 = 0;
    do
    {
      uint64_t v368 = objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v416), v307, v308, v309, v310, v311);
      MEMORY[0x1F4188790](v368);
      v375 = (char *)&v413 - ((v374 + 15) & 0xFFFFFFFFFFFFFFF0);
      for (unint64_t i = 0;
            i < objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v416), v369, v370, v371, v372, v373);
            ++i)
      {
        *(void *)&v375[8 * i] = *(void *)(*(void *)&v446[24 * v367] + 8 * i);
      }
      v377 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v378 = objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v416), v369, v370, v371, v372, v373);
      v382 = objc_msgSend_indexPathWithIndexes_length_(v377, v379, (uint64_t)v375, v378, v380, v381);
      objc_msgSend_addObject_(v417, v383, (uint64_t)v382, v384, v385, v386);

      v392 = objc_msgSend_numberWithDouble_(NSNumber, v387, v388, v389, v390, v391, *(double *)&v440[8 * v367]);
      objc_msgSend_addObject_(v306, v393, (uint64_t)v392, v394, v395, v396);

      ++v367;
    }
    while (v367 < 0xAAAAAAAAAAAAAAABLL * ((v447 - v446) >> 3));
  }
  v397 = v418;
  objc_msgSend_setTokenColumns_(v418, v307, (uint64_t)v413, v309, v310, v311);
  objc_msgSend_setTranscriptionPaths_scores_(v397, v398, (uint64_t)v417, (uint64_t)v306, v399, v400);

  if (v437)
  {
    v438 = v437;
    operator delete(v437);
  }
  if (v440)
  {
    v441 = v440;
    operator delete(v440);
  }
  v401 = (char *)v443;
  if (v443)
  {
    v402 = v444;
    v403 = (char *)v443;
    if (v444 != (char *)v443)
    {
      v404 = v444;
      do
      {
        v406 = (void *)*((void *)v404 - 3);
        v404 -= 24;
        v405 = v406;
        if (v406)
        {
          *((void *)v402 - 2) = v405;
          operator delete(v405);
        }
        v402 = v404;
      }
      while (v404 != v401);
      v403 = (char *)v443;
    }
    v444 = v401;
    operator delete(v403);
  }
  v407 = v446;
  if (v446)
  {
    v408 = v447;
    v409 = v446;
    if (v447 != v446)
    {
      v410 = v447;
      do
      {
        v412 = (void *)*((void *)v410 - 3);
        v410 -= 24;
        v411 = v412;
        if (v412)
        {
          *((void *)v408 - 2) = v411;
          operator delete(v411);
        }
        v408 = v410;
      }
      while (v410 != v407);
      v409 = v446;
    }
    v447 = v407;
    operator delete(v409);
  }
}

- (void)filterCandidatesWithOutOfPattern:(BOOL)a3 duplicateTokenIDs:(BOOL)a4 keepOutOfLexiconAlternatives:(BOOL)a5 keepAlternativeLengths:(BOOL)a6 keepSubstrings:(BOOL)a7 shouldKeepOriginalSpelling:(BOOL)a8
{
  BOOL v286 = a8;
  BOOL v276 = a7;
  BOOL v283 = a6;
  BOOL v284 = a3;
  BOOL v281 = a5;
  BOOL v8 = a4;
  uint64_t v323 = *MEMORY[0x1E4F143B8];
  p_transcriptionPaths = (uint64_t *)&self->super._transcriptionPaths;
  uint64_t v279 = objc_msgSend_firstObject(self->super._transcriptionPaths, a2, a3, a4, a5, a6);
  v295 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v10, *p_transcriptionPaths, v11, v12, v13);
  uint64_t v14 = self;
  uint64_t v291 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v15, (uint64_t)self->super._transcriptionPathScores, v16, v17, v18);
  uint64_t v277 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21, v22, v23);
  unint64_t v294 = 0;
  int v285 = !v8;
LABEL_2:
  if (v294 < objc_msgSend_count(v14->super._tokenColumns, v24, v25, v26, v27, v28))
  {
    uint64_t v289 = objc_msgSend_objectAtIndex_(v14->super._tokenColumns, v29, v294, v30, v31, v32);
    uint64_t v33 = [CHMutableTokenizedResultColumn alloc];
    uint64_t v293 = objc_msgSend_initWithTokenRows_(v33, v34, MEMORY[0x1E4F1CBF0], v35, v36, v37);
    uint64_t v288 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40, v41, v42);
    uint64_t v287 = objc_msgSend_indexAtPosition_(v279, v43, v294, v44, v45, v46);
    int64_t v52 = objc_msgSend_textTokenRows(v289, v47, v48, v49, v50, v51);
    v280 = objc_msgSend_objectAtIndex_(v52, v53, v287, v54, v55, v56);

    uint64_t v282 = objc_msgSend_count(v280, v57, v58, v59, v60, v61);
    long long v318 = 0u;
    long long v319 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    obuint64_t j = v280;
    uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v62, (uint64_t)&v316, (uint64_t)v322, 16, v63);
    if (v69)
    {
      uint64_t v70 = *(void *)v317;
      LOBYTE(v296) = 1;
      v297 = &stru_1F20141C8;
      do
      {
        uint64_t v71 = 0;
        uint64_t v72 = v297;
        do
        {
          if (*(void *)v317 != v70) {
            objc_enumerationMutation(obj);
          }
          uint64_t v73 = *(void **)(*((void *)&v316 + 1) + 8 * v71);
          if (v296) {
            unint64_t v296 = ((unint64_t)objc_msgSend_properties(*(void **)(*((void *)&v316 + 1) + 8 * v71), v64, v65, v66, v67, v68) >> 2) & 1;
          }
          else {
            LODWORD(v296) = 0;
          }
          uint64_t v74 = objc_msgSend_string(v73, v64, v65, v66, v67, v68);
          objc_msgSend_length(v74, v75, v76, v77, v78, v79);

          unint64_t v85 = objc_msgSend_string(v73, v80, v81, v82, v83, v84);
          objc_msgSend_stringByAppendingString_(v72, v86, (uint64_t)v85, v87, v88, v89);
          v297 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v71;
          uint64_t v72 = v297;
        }
        while (v69 != v71);
        uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v64, (uint64_t)&v316, (uint64_t)v322, 16, v68);
      }
      while (v69);
    }
    else
    {
      LODWORD(v296) = 1;
      v297 = &stru_1F20141C8;
    }

    for (unint64_t i = 0; ; ++i)
    {
      uint64_t v95 = objc_msgSend_textTokenRows(v289, v90, v91, v92, v93, v94);
      BOOL v101 = i < objc_msgSend_count(v95, v96, v97, v98, v99, v100);

      if (!v101)
      {
        objc_msgSend_addObject_(v277, v102, (uint64_t)v293, v104, v105, v106);

        ++v294;
        uint64_t v14 = self;
        goto LABEL_2;
      }
      uint64_t v107 = objc_msgSend_textTokenRows(v289, v102, v103, v104, v105, v106);
      long long v112 = objc_msgSend_objectAtIndex_(v107, v108, i, v109, v110, v111);

      long long v314 = 0u;
      long long v315 = 0u;
      long long v312 = 0u;
      long long v313 = 0u;
      id v300 = v112;
      uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v300, v113, (uint64_t)&v312, (uint64_t)v321, 16, v114);
      if (!v120)
      {
        LODWORD(v305) = 0;
        LODWORD(v306) = 0;
        LODWORD(v303) = 1;
        LODWORD(v304) = 1;
        uint64_t v307 = &stru_1F20141C8;
        goto LABEL_35;
      }
      LOBYTE(v305) = 0;
      LOBYTE(v306) = 0;
      uint64_t v121 = *(void *)v313;
      LOBYTE(v303) = 1;
      LOBYTE(v304) = 1;
      uint64_t v307 = &stru_1F20141C8;
      do
      {
        uint64_t v122 = 0;
        uint64_t v123 = v307;
        do
        {
          if (*(void *)v313 != v121) {
            objc_enumerationMutation(v300);
          }
          uint64_t v124 = *(void **)(*((void *)&v312 + 1) + 8 * v122);
          if (v306)
          {
            LODWORD(v306) = 1;
            if (v305) {
              goto LABEL_24;
            }
          }
          else
          {
            unint64_t v306 = ((unint64_t)objc_msgSend_properties(*(void **)(*((void *)&v312 + 1) + 8 * v122), v115, v116, v117, v118, v119) >> 4) & 1;
            if (v305)
            {
LABEL_24:
              LODWORD(v305) = 1;
              if (v303) {
                goto LABEL_25;
              }
              goto LABEL_29;
            }
          }
          unint64_t v305 = ((unint64_t)objc_msgSend_inputSources(v124, v115, v116, v117, v118, v119) >> 4) & 1;
          if (v303)
          {
LABEL_25:
            unint64_t v303 = ((unint64_t)objc_msgSend_properties(v124, v115, v116, v117, v118, v119) >> 2) & 1;
            if ((v304 & 1) == 0) {
              goto LABEL_26;
            }
            goto LABEL_30;
          }
LABEL_29:
          LODWORD(v303) = 0;
          if ((v304 & 1) == 0)
          {
LABEL_26:
            LODWORD(v304) = 0;
            goto LABEL_31;
          }
LABEL_30:
          unint64_t v304 = ((unint64_t)objc_msgSend_properties(v124, v115, v116, v117, v118, v119) >> 3) & 1;
LABEL_31:
          uint64_t v125 = objc_msgSend_string(v124, v115, v116, v117, v118, v119);
          objc_msgSend_length(v125, v126, v127, v128, v129, v130);

          uint64_t v136 = objc_msgSend_string(v124, v131, v132, v133, v134, v135);
          objc_msgSend_stringByAppendingString_(v123, v137, (uint64_t)v136, v138, v139, v140);
          uint64_t v307 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v122;
          uint64_t v123 = v307;
        }
        while (v120 != v122);
        uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v300, v115, (uint64_t)&v312, (uint64_t)v321, 16, v119);
      }
      while (v120);
LABEL_35:

      uint64_t v298 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v141, v142, v143, v144, v145);
      long long v310 = 0u;
      long long v311 = 0u;
      long long v308 = 0u;
      long long v309 = 0u;
      id v299 = v300;
      uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v299, v146, (uint64_t)&v308, (uint64_t)v320, 16, v147);
      if (!v148)
      {

        int v155 = 0;
        int v157 = 1;
        int v156 = 1;
LABEL_50:
        int v196 = objc_msgSend_containsObject_(v288, v191, (uint64_t)v298, v193, v194, v195);
        objc_msgSend_addObject_(v288, v197, (uint64_t)v298, v198, v199, v200);
        goto LABEL_51;
      }
      char v154 = 0;
      int v155 = 0;
      uint64_t v301 = *(void *)v309;
      int v156 = 1;
      int v157 = 1;
      do
      {
        uint64_t v158 = 0;
        uint64_t v302 = v148;
        do
        {
          if (*(void *)v309 != v301) {
            objc_enumerationMutation(v299);
          }
          uint64_t v159 = *(void **)(*((void *)&v308 + 1) + 8 * v158);
          int isTopOriginal = objc_msgSend_isTopOriginal(v159, v149, v150, v151, v152, v153);
          if (objc_msgSend_isOriginal(v159, v161, v162, v163, v164, v165))
          {
            objc_msgSend_modelScore(v159, v166, v167, v168, v169, v170);
            BOOL v172 = v171 > 0.8;
          }
          else
          {
            BOOL v172 = 0;
          }
          BOOL v173 = objc_msgSend_wordID(v159, v166, v167, v168, v169, v170) < 0x1F4;
          int isTransliterated = objc_msgSend_isTransliterated(v159, v174, v175, v176, v177, v178);
          v154 |= v173;
          if ((v154 & 1) == 0)
          {
            uint64_t v180 = NSNumber;
            unsigned int v181 = objc_msgSend_wordID(v159, v149, v150, v151, v152, v153);
            int v186 = objc_msgSend_numberWithUnsignedInteger_(v180, v182, v181, v183, v184, v185);
            objc_msgSend_addObject_(v298, v187, (uint64_t)v186, v188, v189, v190);
          }
          v156 &= isTopOriginal;
          v157 &= v172;
          v155 |= isTransliterated;
          ++v158;
        }
        while (v302 != v158);
        uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v299, v149, (uint64_t)&v308, (uint64_t)v320, 16, v153);
      }
      while (v148);

      if ((v154 & 1) == 0) {
        goto LABEL_50;
      }
      int v196 = 0;
LABEL_51:
      if (i == v287 || ((v156 | v157) & v286 & 1) != 0) {
        goto LABEL_66;
      }
      if ((v306 | v305) & 1) != 0 || (v196 & v285) {
        goto LABEL_67;
      }
      if (((v304 | v284) & v296) != 1)
      {
        if (v304 | v284) {
          goto LABEL_59;
        }
LABEL_67:
        uint64_t v224 = objc_msgSend_count(v295, v191, v192, v193, v194, v195);
        if (v224 - 1 >= 0)
        {
          do
          {
            objc_msgSend_objectAtIndex_(v295, v220, --v224, v221, v222, v223);
            uint64_t v225 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
            uint64_t v230 = objc_msgSend_indexAtPosition_(v225, v226, v294, v227, v228, v229);
            v236 = objc_msgSend_textTokenRows(v293, v231, v232, v233, v234, v235);
            BOOL v242 = v230 == objc_msgSend_count(v236, v237, v238, v239, v240, v241);

            if (v242)
            {
              objc_msgSend_removeObjectAtIndex_(v295, v243, v224, v244, v245, v246);
              objc_msgSend_removeObjectAtIndex_(v291, v247, v224, v248, v249, v250);
            }
            else
            {
              unint64_t v251 = objc_msgSend_indexAtPosition_(v225, v243, v294, v244, v245, v246);
              uint64_t v257 = objc_msgSend_textTokenRows(v293, v252, v253, v254, v255, v256);
              BOOL v263 = v251 > objc_msgSend_count(v257, v258, v259, v260, v261, v262);

              if (v263)
              {
                uint64_t v268 = objc_msgSend_indexAtPosition_(v225, v264, v294, v265, v266, v267);
                unint64_t v269 = modifyIndexPath(v225, v294, v268 - 1);
                objc_msgSend_replaceObjectAtIndex_withObject_(v295, v270, v224, (uint64_t)v269, v271, v272);
              }
            }
          }
          while (v224 > 0);
        }
        goto LABEL_73;
      }
      if (((v303 | v281) & 1) == 0) {
        goto LABEL_67;
      }
LABEL_59:
      if (v282 != objc_msgSend_count(v299, v191, v192, v193, v194, v195) && !v283) {
        goto LABEL_67;
      }
      uint64_t v201 = objc_msgSend_length(v307, v191, v192, v193, v194, v195);
      uint64_t v207 = objc_msgSend_length(v297, v202, v203, v204, v205, v206);
      int v208 = v283;
      if ((double)(unint64_t)v207 * 0.75 <= (double)(unint64_t)v201) {
        int v208 = 1;
      }
      if (((v208 | v155) & 1) == 0
        || objc_msgSend_rangeOfString_options_(v297, v191, (uint64_t)v307, 2, v194, v195) != 0x7FFFFFFFFFFFFFFFLL
        && !v276)
      {
        goto LABEL_67;
      }
LABEL_66:
      unint64_t v209 = objc_msgSend_textTokenRows(v293, v191, v192, v193, v194, v195);
      uint64_t v215 = objc_msgSend_count(v209, v210, v211, v212, v213, v214);

      if (objc_msgSend_addTokenRowWithTokens_(v293, v216, (uint64_t)v299, v217, v218, v219) != v215) {
        goto LABEL_67;
      }
LABEL_73:
    }
  }
  objc_msgSend_setTokenColumns_(v14, v29, (uint64_t)v277, v30, v31, v32);
  objc_msgSend_setTranscriptionPaths_scores_(v14, v273, (uint64_t)v295, (uint64_t)v291, v274, v275);
}

- (void)setPrecedingLineBreaks:(int64_t)a3
{
  self->super._precedingLineBreaks = a3;
}

- (void)setChangeableTokenColumnCount:(int64_t)a3
{
  self->super._int64_t changeableCount = a3;
}

- (void)setBaseWritingDirection:(int)a3
{
  *(void *)&self->super._baseWritingDirection = *(void *)&a3;
}

- (void)setRecognizerGenerationIdentifier:(int64_t)a3
{
  self->super._recognizerGenerationIdentifier = a3;
}

- (void)offsetAllStrokeIndexesBy:(int64_t)a3
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  p_tokenColumns = &self->super._tokenColumns;
  uint64_t v9 = objc_msgSend_count(self->super._tokenColumns, a2, a3, v3, v4, v5);
  objc_msgSend_arrayWithCapacity_(v7, v10, v9, v11, v12, v13);
  uint64_t v148 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  obunint64_t j = *p_tokenColumns;
  uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v151, (uint64_t)v155, 16, v15);
  if (v149)
  {
    uint64_t v147 = *(void *)v152;
    do
    {
      for (uint64_t i = 0; i != v149; ++i)
      {
        if (*(void *)v152 != v147) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v151 + 1) + 8 * i);
        uint64_t v22 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v23 = objc_msgSend_textTokenRows(v21, v16, v17, v18, v19, v20);
        uint64_t v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);
        uint64_t v34 = objc_msgSend_arrayWithCapacity_(v22, v30, v29, v31, v32, v33);

        for (unint64_t j = 0; ; ++j)
        {
          uint64_t v41 = objc_msgSend_textTokenRows(v21, v35, v36, v37, v38, v39);
          BOOL v47 = j < objc_msgSend_count(v41, v42, v43, v44, v45, v46);

          if (!v47) {
            break;
          }
          v53 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v54 = objc_msgSend_textTokenRows(v21, v48, v49, v50, v51, v52);
          uint64_t v59 = objc_msgSend_objectAtIndexedSubscript_(v54, v55, j, v56, v57, v58);
          uint64_t v65 = objc_msgSend_count(v59, v60, v61, v62, v63, v64);
          uint64_t v70 = objc_msgSend_arrayWithCapacity_(v53, v66, v65, v67, v68, v69);

          for (unint64_t k = 0; ; ++k)
          {
            uint64_t v77 = objc_msgSend_textTokenRows(v21, v71, v72, v73, v74, v75);
            uint64_t v82 = objc_msgSend_objectAtIndexedSubscript_(v77, v78, j, v79, v80, v81);
            BOOL v88 = k < objc_msgSend_count(v82, v83, v84, v85, v86, v87);

            if (!v88) {
              break;
            }
            uint64_t v94 = objc_msgSend_textTokenRows(v21, v89, v90, v91, v92, v93);
            uint64_t v99 = objc_msgSend_objectAtIndexedSubscript_(v94, v95, j, v96, v97, v98);
            uint64_t v104 = objc_msgSend_objectAtIndexedSubscript_(v99, v100, k, v101, v102, v103);
            uint64_t v110 = objc_msgSend_mutableCopy(v104, v105, v106, v107, v108, v109);

            uint64_t v116 = objc_msgSend_strokeIndexes(v110, v111, v112, v113, v114, v115);
            uint64_t v122 = objc_msgSend_mutableCopy(v116, v117, v118, v119, v120, v121);

            objc_msgSend_shiftIndexesStartingAtIndex_by_(v122, v123, 0, a3, v124, v125);
            objc_msgSend_setStrokeIndexes_(v110, v126, (uint64_t)v122, v127, v128, v129);
            objc_msgSend_addObject_(v70, v130, (uint64_t)v110, v131, v132, v133);
          }
          objc_msgSend_addObject_(v34, v89, (uint64_t)v70, v91, v92, v93);
        }
        uint64_t v134 = [CHTokenizedResultColumn alloc];
        uint64_t v139 = objc_msgSend_initWithTokenRows_(v134, v135, (uint64_t)v34, v136, v137, v138);
        objc_msgSend_addObject_(v148, v140, (uint64_t)v139, v141, v142, v143);
      }
      uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v151, (uint64_t)v155, 16, v20);
    }
    while (v149);
  }

  tokenColumns = self->super._tokenColumns;
  self->super._tokenColumns = v148;
}

- (void)remapAllStrokeIndexesWithIndexSet:(id)a3
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v164 = v3;
  uint64_t v10 = objc_msgSend_count(v3, v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_dictionaryWithCapacity_(v4, v11, v10, v12, v13, v14);
  v179[0] = MEMORY[0x1E4F143A8];
  v179[1] = 3221225472;
  v179[2] = sub_1C4A9B3B0;
  v179[3] = &unk_1E64E19F0;
  id v16 = v15;
  id v180 = v16;
  objc_msgSend_enumerateIndexesUsingBlock_(v164, v17, (uint64_t)v179, v18, v19, v20);
  uint64_t v21 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v27 = objc_msgSend_count(self->super._tokenColumns, v22, v23, v24, v25, v26);
  objc_msgSend_arrayWithCapacity_(v21, v28, v27, v29, v30, v31);
  uint64_t v168 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  obunint64_t j = self->super._tokenColumns;
  uint64_t v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v175, (uint64_t)v181, 16, v33);
  if (v169)
  {
    uint64_t v167 = *(void *)v176;
    do
    {
      for (uint64_t i = 0; i != v169; ++i)
      {
        if (*(void *)v176 != v167) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void **)(*((void *)&v175 + 1) + 8 * i);
        uint64_t v40 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v41 = objc_msgSend_textTokenRows(v39, v34, v35, v36, v37, v38);
        uint64_t v47 = objc_msgSend_count(v41, v42, v43, v44, v45, v46);
        double v171 = objc_msgSend_arrayWithCapacity_(v40, v48, v47, v49, v50, v51);

        for (unint64_t j = 0; ; ++j)
        {
          uint64_t v58 = objc_msgSend_textTokenRows(v39, v52, v53, v54, v55, v56);
          BOOL v64 = j < objc_msgSend_count(v58, v59, v60, v61, v62, v63);

          if (!v64) {
            break;
          }
          uint64_t v70 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v71 = objc_msgSend_textTokenRows(v39, v65, v66, v67, v68, v69);
          uint64_t v76 = objc_msgSend_objectAtIndexedSubscript_(v71, v72, j, v73, v74, v75);
          uint64_t v82 = objc_msgSend_count(v76, v77, v78, v79, v80, v81);
          uint64_t v87 = objc_msgSend_arrayWithCapacity_(v70, v83, v82, v84, v85, v86);

          for (unint64_t k = 0; ; ++k)
          {
            uint64_t v94 = objc_msgSend_textTokenRows(v39, v88, v89, v90, v91, v92);
            uint64_t v99 = objc_msgSend_objectAtIndexedSubscript_(v94, v95, j, v96, v97, v98);
            BOOL v105 = k < objc_msgSend_count(v99, v100, v101, v102, v103, v104);

            if (!v105) {
              break;
            }
            uint64_t v111 = objc_msgSend_textTokenRows(v39, v106, v107, v108, v109, v110);
            uint64_t v116 = objc_msgSend_objectAtIndexedSubscript_(v111, v112, j, v113, v114, v115);
            uint64_t v121 = objc_msgSend_objectAtIndexedSubscript_(v116, v117, k, v118, v119, v120);
            uint64_t v127 = objc_msgSend_mutableCopy(v121, v122, v123, v124, v125, v126);

            uint64_t v133 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v128, v129, v130, v131, v132);
            uint64_t v139 = objc_msgSend_strokeIndexes(v127, v134, v135, v136, v137, v138);
            v172[0] = MEMORY[0x1E4F143A8];
            v172[1] = 3221225472;
            v172[2] = sub_1C4A9B474;
            v172[3] = &unk_1E64E29C8;
            id v140 = v133;
            id v173 = v140;
            id v174 = v16;
            objc_msgSend_enumerateIndexesUsingBlock_(v139, v141, (uint64_t)v172, v142, v143, v144);

            objc_msgSend_setStrokeIndexes_(v127, v145, (uint64_t)v140, v146, v147, v148);
            objc_msgSend_addObject_(v87, v149, (uint64_t)v127, v150, v151, v152);
          }
          objc_msgSend_addObject_(v171, v106, (uint64_t)v87, v108, v109, v110);
        }
        long long v153 = [CHTokenizedResultColumn alloc];
        uint64_t v158 = objc_msgSend_initWithTokenRows_(v153, v154, (uint64_t)v171, v155, v156, v157);
        objc_msgSend_addObject_(v168, v159, (uint64_t)v158, v160, v161, v162);
      }
      uint64_t v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v175, (uint64_t)v181, 16, v38);
    }
    while (v169);
  }

  tokenColumns = self->super._tokenColumns;
  self->super._tokenColumns = v168;
}

- (void)remapAllStrokeIndexesWithArray:(id)a3
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v148 = self;
  uint64_t v11 = objc_msgSend_count(self->super._tokenColumns, v6, v7, v8, v9, v10);
  objc_msgSend_arrayWithCapacity_(v5, v12, v11, v13, v14, v15);
  uint64_t v151 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  obunint64_t j = self->super._tokenColumns;
  uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v158, (uint64_t)v162, 16, v17);
  if (v152)
  {
    uint64_t v150 = *(void *)v159;
    do
    {
      for (uint64_t i = 0; i != v152; ++i)
      {
        if (*(void *)v159 != v150) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v158 + 1) + 8 * i);
        uint64_t v24 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v25 = objc_msgSend_textTokenRows(v23, v18, v19, v20, v21, v22);
        uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
        long long v154 = objc_msgSend_arrayWithCapacity_(v24, v32, v31, v33, v34, v35);

        for (unint64_t j = 0; ; ++j)
        {
          uint64_t v42 = objc_msgSend_textTokenRows(v23, v36, v37, v38, v39, v40);
          BOOL v48 = j < objc_msgSend_count(v42, v43, v44, v45, v46, v47);

          if (!v48) {
            break;
          }
          uint64_t v54 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v55 = objc_msgSend_textTokenRows(v23, v49, v50, v51, v52, v53);
          uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_(v55, v56, j, v57, v58, v59);
          uint64_t v66 = objc_msgSend_count(v60, v61, v62, v63, v64, v65);
          uint64_t v71 = objc_msgSend_arrayWithCapacity_(v54, v67, v66, v68, v69, v70);

          for (unint64_t k = 0; ; ++k)
          {
            uint64_t v78 = objc_msgSend_textTokenRows(v23, v72, v73, v74, v75, v76);
            uint64_t v83 = objc_msgSend_objectAtIndexedSubscript_(v78, v79, j, v80, v81, v82);
            BOOL v89 = k < objc_msgSend_count(v83, v84, v85, v86, v87, v88);

            if (!v89) {
              break;
            }
            uint64_t v95 = objc_msgSend_textTokenRows(v23, v90, v91, v92, v93, v94);
            uint64_t v100 = objc_msgSend_objectAtIndexedSubscript_(v95, v96, j, v97, v98, v99);
            BOOL v105 = objc_msgSend_objectAtIndexedSubscript_(v100, v101, k, v102, v103, v104);
            uint64_t v111 = objc_msgSend_mutableCopy(v105, v106, v107, v108, v109, v110);

            uint64_t v117 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v112, v113, v114, v115, v116);
            uint64_t v123 = objc_msgSend_strokeIndexes(v111, v118, v119, v120, v121, v122);
            v155[0] = MEMORY[0x1E4F143A8];
            v155[1] = 3221225472;
            v155[2] = sub_1C4A9BA00;
            v155[3] = &unk_1E64E29C8;
            id v156 = v4;
            id v124 = v117;
            id v157 = v124;
            objc_msgSend_enumerateIndexesUsingBlock_(v123, v125, (uint64_t)v155, v126, v127, v128);

            objc_msgSend_setStrokeIndexes_(v111, v129, (uint64_t)v124, v130, v131, v132);
            objc_msgSend_addObject_(v71, v133, (uint64_t)v111, v134, v135, v136);
          }
          objc_msgSend_addObject_(v154, v90, (uint64_t)v71, v92, v93, v94);
        }
        uint64_t v137 = [CHTokenizedResultColumn alloc];
        uint64_t v142 = objc_msgSend_initWithTokenRows_(v137, v138, (uint64_t)v154, v139, v140, v141);
        objc_msgSend_addObject_(v151, v143, (uint64_t)v142, v144, v145, v146);
      }
      uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v158, (uint64_t)v162, 16, v22);
    }
    while (v152);
  }

  tokenColumns = v148->super._tokenColumns;
  v148->super._tokenColumns = v151;
}

@end