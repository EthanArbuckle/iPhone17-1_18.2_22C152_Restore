@interface CHMergeColumnsStep
- (BOOL)_doesColumnContainSameMathTranscriptionCandidates:(id)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHMergeColumnsStep

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v418 = *MEMORY[0x1E4F143B8];
  id v388 = a3;
  id v381 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHMergeColumnsStep is running", buf, 2u);
  }

  v11 = objc_msgSend_result(v388, v6, v7, v8, v9, v10);
  v17 = objc_msgSend_transcriptionPaths(v11, v12, v13, v14, v15, v16);
  BOOL v23 = (unint64_t)objc_msgSend_count(v17, v18, v19, v20, v21, v22) < 2;

  if (v23)
  {
    id v29 = v388;
    goto LABEL_121;
  }
  if (qword_1EA3C9CF0 != -1) {
    dispatch_once(&qword_1EA3C9CF0, &unk_1F20134D0);
  }
  *(void *)buf = 0;
  v407 = buf;
  uint64_t v408 = 0x4812000000;
  v409 = sub_1C4943834;
  v410 = sub_1C4943858;
  v411 = &unk_1C4CB5C62;
  v413 = 0;
  uint64_t v414 = 0;
  __p = 0;
  long long v402 = 0u;
  long long v403 = 0u;
  long long v404 = 0u;
  long long v405 = 0u;
  v30 = objc_msgSend_result(v388, v24, v25, v26, v27, v28);
  objc_msgSend_transcriptionPaths(v30, v31, v32, v33, v34, v35);
  id obj = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v402, (uint64_t)v417, 16, v37);
  if (v43)
  {
    uint64_t v386 = *(void *)v403;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v403 != v386) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void *)(*((void *)&v402 + 1) + 8 * v44);
        *(void *)v415 = 0;
        *(void *)&v415[8] = v415;
        *(void *)&v415[16] = 0x2020000000;
        uint64_t v416 = 0x7FFFFFFFFFFFFFFFLL;
        v401[0] = 0;
        v401[1] = v401;
        v401[2] = 0x2020000000;
        v401[3] = 0x7FFFFFFFFFFFFFFFLL;
        v400[0] = 0;
        v400[1] = v400;
        v400[2] = 0x2020000000;
        v400[3] = 0;
        v399[0] = 0;
        v399[1] = v399;
        v399[2] = 0x2020000000;
        v399[3] = 0;
        v398[0] = 0;
        v398[1] = v398;
        v398[2] = 0x2020000000;
        v398[3] = 1;
        v46 = objc_msgSend_result(v388, v38, v39, v40, v41, v42);
        v52 = objc_msgSend_result(v388, v47, v48, v49, v50, v51);
        uint64_t v58 = objc_msgSend_tokenColumnCount(v52, v53, v54, v55, v56, v57);
        v390[0] = MEMORY[0x1E4F143A8];
        v390[1] = 3221225472;
        v390[2] = sub_1C4943870;
        v390[3] = &unk_1E64E0E88;
        id v59 = v388;
        id v391 = v59;
        v392 = v415;
        v393 = v401;
        v394 = v399;
        v395 = v398;
        v396 = v400;
        v397 = buf;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v46, v60, v45, 0, v58, (uint64_t)v390);

        if (*(void *)(*(void *)&v415[8] + 24) != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v61 = (id)qword_1EA3C9F98;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v389 = 0;
            _os_log_impl(&dword_1C492D000, v61, OS_LOG_TYPE_ERROR, "Unexpected fragmented candidate encountered.", v389, 2u);
          }

          v62 = v407;
          uint64_t v63 = *(void *)(*(void *)&v415[8] + 24);
          v69 = objc_msgSend_result(v59, v64, v65, v66, v67, v68);
          uint64_t v75 = objc_msgSend_tokenColumnCount(v69, v70, v71, v72, v73, v74);
          uint64_t v76 = v75 - *(void *)(*(void *)&v415[8] + 24);
          v78 = (char *)*((void *)v62 + 7);
          unint64_t v77 = *((void *)v62 + 8);
          if ((unint64_t)v78 < v77)
          {
            *(void *)v78 = v63;
            *((void *)v78 + 1) = v76;
            v79 = v78 + 16;
LABEL_36:
            *((void *)v62 + 7) = v79;

            goto LABEL_37;
          }
          v80 = (char **)(v62 + 48);
          v81 = (char *)*((void *)v62 + 6);
          uint64_t v82 = (v78 - v81) >> 4;
          unint64_t v83 = v82 + 1;
          if ((unint64_t)(v82 + 1) >> 60) {
            sub_1C494A220();
          }
          uint64_t v84 = v77 - (void)v81;
          if (v84 >> 3 > v83) {
            unint64_t v83 = v84 >> 3;
          }
          if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v85 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v85 = v83;
          }
          if (v85)
          {
            uint64_t v382 = v75 - *(void *)(*(void *)&v415[8] + 24);
            if (v85 >> 60) {
              sub_1C4949AA8();
            }
            unint64_t v86 = v85;
            v87 = (char *)operator new(16 * v85);
            v80 = (char **)(v62 + 48);
            unint64_t v85 = v86;
            v88 = &v87[16 * v82];
            *(void *)v88 = v63;
            *((void *)v88 + 1) = v382;
            uint64_t v89 = (uint64_t)v88;
            if (v78 == v81) {
              goto LABEL_34;
            }
            do
            {
LABEL_32:
              *(_OWORD *)(v89 - 16) = *((_OWORD *)v78 - 1);
              v89 -= 16;
              v78 -= 16;
            }
            while (v78 != v81);
            v78 = *v80;
          }
          else
          {
            v87 = 0;
            v88 = (char *)(16 * v82);
            *(void *)v88 = v63;
            *((void *)v88 + 1) = v76;
            uint64_t v89 = 16 * v82;
            if (v78 != v81) {
              goto LABEL_32;
            }
          }
LABEL_34:
          v79 = v88 + 16;
          *((void *)v62 + 6) = v89;
          *((void *)v62 + 7) = v88 + 16;
          *((void *)v62 + 8) = &v87[16 * v85];
          if (v78) {
            operator delete(v78);
          }
          goto LABEL_36;
        }
LABEL_37:

        _Block_object_dispose(v398, 8);
        _Block_object_dispose(v399, 8);
        _Block_object_dispose(v400, 8);
        _Block_object_dispose(v401, 8);
        _Block_object_dispose(v415, 8);
        ++v44;
      }
      while (v44 != v43);
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v402, (uint64_t)v417, 16, v42);
    }
    while (v43);
  }

  uint64_t v95 = 1;
  unint64_t v96 = 0x1E4F1C000uLL;
  while (1)
  {
    v97 = objc_msgSend_result(v388, v90, v91, v92, v93, v94);
    BOOL v103 = v95 < objc_msgSend_tokenColumnCount(v97, v98, v99, v100, v101, v102);

    if (!v103) {
      break;
    }
    v109 = objc_msgSend_result(v388, v104, v105, v106, v107, v108);
    v115 = objc_msgSend_tokenColumns(v109, v110, v111, v112, v113, v114);
    v120 = objc_msgSend_objectAtIndexedSubscript_(v115, v116, v95, v117, v118, v119);

    v126 = objc_msgSend_mathTokenRows(v120, v121, v122, v123, v124, v125);
    v137 = objc_msgSend_set(*(void **)(v96 + 2688), v127, v128, v129, v130, v131);
    unint64_t v138 = 0;
    uint64_t v139 = 0;
    while (v138 < objc_msgSend_count(v126, v132, v133, v134, v135, v136))
    {
      v145 = objc_msgSend_objectAtIndexedSubscript_(v126, v140, v138, v142, v143, v144);
      v151 = objc_msgSend_firstObject(v145, v146, v147, v148, v149, v150);
      BOOL v157 = (objc_msgSend_properties(v151, v152, v153, v154, v155, v156) & 0x2000) == 0;

      if (!v157)
      {
        v158 = objc_msgSend_objectAtIndexedSubscript_(v126, v132, v138, v134, v135, v136);
        v164 = objc_msgSend_firstObject(v158, v159, v160, v161, v162, v163);
        v170 = objc_msgSend_string(v164, v165, v166, v167, v168, v169);
        objc_msgSend_addObject_(v137, v171, (uint64_t)v170, v172, v173, v174);

        ++v139;
      }
      ++v138;
    }
    if (v139 > 0
      && (v139 != objc_msgSend_count(v126, v140, v141, v142, v143, v144)
       || (unint64_t)objc_msgSend_count(v137, v175, v176, v177, v178, v179) >= 2))
    {
      uint64_t v180 = v95;
      unint64_t v181 = v96;
      v182 = v407;
      uint64_t v387 = v180;
      uint64_t v183 = v180 - 1;
      v185 = (char *)*((void *)v407 + 7);
      unint64_t v184 = *((void *)v407 + 8);
      if ((unint64_t)v185 < v184)
      {
        *(void *)v185 = v183;
        *((void *)v185 + 1) = 2;
        v186 = v185 + 16;
        unint64_t v96 = v181;
        uint64_t v95 = v387;
LABEL_64:
        *((void *)v182 + 7) = v186;
        goto LABEL_65;
      }
      id obja = v120;
      v187 = (char **)(v407 + 48);
      v188 = (char *)*((void *)v407 + 6);
      uint64_t v189 = (v185 - v188) >> 4;
      unint64_t v190 = v189 + 1;
      if ((unint64_t)(v189 + 1) >> 60) {
        sub_1C494A220();
      }
      uint64_t v191 = v184 - (void)v188;
      if (v191 >> 3 > v190) {
        unint64_t v190 = v191 >> 3;
      }
      if ((unint64_t)v191 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v192 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v192 = v190;
      }
      if (v192)
      {
        if (v192 >> 60) {
          sub_1C4949AA8();
        }
        v193 = (char *)operator new(16 * v192);
        v194 = &v193[16 * v189];
        *(void *)v194 = v183;
        *((void *)v194 + 1) = 2;
        uint64_t v195 = (uint64_t)v194;
        if (v185 != v188) {
          goto LABEL_60;
        }
LABEL_67:
        unint64_t v96 = v181;
        v120 = obja;
        uint64_t v95 = v387;
        v186 = v194 + 16;
        *((void *)v182 + 6) = v195;
        *((void *)v182 + 7) = v194 + 16;
        *((void *)v182 + 8) = &v193[16 * v192];
        if (!v185) {
          goto LABEL_64;
        }
      }
      else
      {
        v193 = 0;
        v194 = (char *)(16 * v189);
        *(void *)v194 = v183;
        *((void *)v194 + 1) = 2;
        uint64_t v195 = 16 * v189;
        if (v185 == v188) {
          goto LABEL_67;
        }
LABEL_60:
        v120 = obja;
        unint64_t v96 = v181;
        do
        {
          *(_OWORD *)(v195 - 16) = *((_OWORD *)v185 - 1);
          v195 -= 16;
          v185 -= 16;
        }
        while (v185 != v188);
        v185 = *v187;
        uint64_t v95 = v387;
        v186 = v194 + 16;
        *((void *)v182 + 6) = v195;
        *((void *)v182 + 7) = v194 + 16;
        *((void *)v182 + 8) = &v193[16 * v192];
        if (!v185) {
          goto LABEL_64;
        }
      }
      operator delete(v185);
      goto LABEL_64;
    }
LABEL_65:

    ++v95;
  }
  for (uint64_t i = 0; ; uint64_t i = v231 + 1)
  {
    v197 = objc_msgSend_result(v388, v104, v105, v106, v107, v108);
    BOOL v203 = i < objc_msgSend_tokenColumnCount(v197, v198, v199, v200, v201, v202);

    if (!v203) {
      break;
    }
    v209 = objc_msgSend_result(v388, v204, v205, v206, v207, v208);
    v215 = objc_msgSend_tokenColumns(v209, v210, v211, v212, v213, v214);
    v220 = objc_msgSend_objectAtIndexedSubscript_(v215, v216, i, v217, v218, v219);

    if (!objc_msgSend__doesColumnContainSameMathTranscriptionCandidates_(self, v221, (uint64_t)v220, v222, v223, v224))goto LABEL_88; {
    uint64_t v230 = i;
    }
    do
    {
      uint64_t v231 = v230;
      v232 = objc_msgSend_result(v388, v225, v226, v227, v228, v229);
      BOOL v238 = v231 + 1 < objc_msgSend_tokenColumnCount(v232, v233, v234, v235, v236, v237);

      if (!v238) {
        break;
      }
      uint64_t v239 = objc_msgSend_result(v388, v225, v226, v227, v228, v229);
      v245 = objc_msgSend_tokenColumns((void *)v239, v240, v241, v242, v243, v244);
      v250 = objc_msgSend_objectAtIndexedSubscript_(v245, v246, v231 + 1, v247, v248, v249);

      LOBYTE(v239) = objc_msgSend__doesColumnContainSameMathTranscriptionCandidates_(self, v251, (uint64_t)v250, v252, v253, v254);
      uint64_t v230 = v231 + 1;
    }
    while ((v239 & 1) != 0);
    uint64_t v255 = i - 1;
    if (i < 1) {
      goto LABEL_77;
    }
    v256 = objc_msgSend_result(v388, v225, v226, v227, v228, v229);
    v262 = objc_msgSend_tokenColumns(v256, v257, v258, v259, v260, v261);
    v267 = objc_msgSend_objectAtIndexedSubscript_(v262, v263, i - 1, v264, v265, v266);
    v273 = objc_msgSend_tokenRows(v267, v268, v269, v270, v271, v272);
    BOOL v279 = (unint64_t)objc_msgSend_count(v273, v274, v275, v276, v277, v278) > 1;

    if (!v279)
    {
LABEL_77:
      v280 = objc_msgSend_result(v388, v225, v226, v227, v228, v229);
      if (v231 >= objc_msgSend_tokenColumnCount(v280, v281, v282, v283, v284, v285) - 1)
      {

LABEL_83:
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v319 = (id)qword_1EA3C9F98;
        if (os_log_type_enabled(v319, OS_LOG_TYPE_ERROR))
        {
          v325 = objc_msgSend_tokenRows(v220, v320, v321, v322, v323, v324);
          uint64_t v331 = objc_msgSend_count(v325, v326, v327, v328, v329, v330);
          *(_DWORD *)v415 = 134218240;
          *(void *)&v415[4] = i;
          *(_WORD *)&v415[12] = 2048;
          *(void *)&v415[14] = v331;
          _os_log_impl(&dword_1C492D000, v319, OS_LOG_TYPE_ERROR, "Found column at index %lu with %lu rows where some rows have identical transcription but there is no neighboring column with candidates having different transcription.", v415, 0x16u);
        }
LABEL_88:
        uint64_t v231 = i;
        goto LABEL_89;
      }
      v291 = objc_msgSend_result(v388, v286, v287, v288, v289, v290);
      v297 = objc_msgSend_tokenColumns(v291, v292, v293, v294, v295, v296);
      v302 = objc_msgSend_objectAtIndexedSubscript_(v297, v298, ++v231, v299, v300, v301);
      v308 = objc_msgSend_tokenRows(v302, v303, v304, v305, v306, v307);
      BOOL v314 = (unint64_t)objc_msgSend_count(v308, v309, v310, v311, v312, v313) > 1;

      if (!v314) {
        goto LABEL_83;
      }
      uint64_t v255 = i;
    }
    v315 = v407;
    uint64_t v316 = v231 - v255 + 1;
    v318 = (char *)*((void *)v407 + 7);
    unint64_t v317 = *((void *)v407 + 8);
    if ((unint64_t)v318 < v317)
    {
      *(void *)v318 = v255;
      *((void *)v318 + 1) = v316;
      *((void *)v315 + 7) = v318 + 16;
      goto LABEL_89;
    }
    v332 = (char **)(v407 + 48);
    v333 = (char *)*((void *)v407 + 6);
    uint64_t v334 = (v318 - v333) >> 4;
    unint64_t v335 = v334 + 1;
    if ((unint64_t)(v334 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v336 = v317 - (void)v333;
    if (v336 >> 3 > v335) {
      unint64_t v335 = v336 >> 3;
    }
    if ((unint64_t)v336 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v337 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v337 = v335;
    }
    if (v337)
    {
      if (v337 >> 60) {
        sub_1C4949AA8();
      }
      v338 = (char *)operator new(16 * v337);
      v339 = (uint64_t *)&v338[16 * v334];
      uint64_t *v339 = v255;
      v339[1] = v316;
      uint64_t v340 = (uint64_t)v339;
      if (v318 != v333)
      {
        do
        {
LABEL_103:
          *(_OWORD *)(v340 - 16) = *((_OWORD *)v318 - 1);
          v340 -= 16;
          v318 -= 16;
        }
        while (v318 != v333);
        v318 = *v332;
        v341 = v339 + 2;
        *((void *)v315 + 6) = v340;
        *((void *)v315 + 7) = v339 + 2;
        *((void *)v315 + 8) = &v338[16 * v337];
        if (!v318) {
          goto LABEL_101;
        }
LABEL_100:
        operator delete(v318);
        goto LABEL_101;
      }
    }
    else
    {
      v338 = 0;
      v339 = (uint64_t *)(16 * v334);
      uint64_t *v339 = v255;
      v339[1] = v316;
      uint64_t v340 = 16 * v334;
      if (v318 != v333) {
        goto LABEL_103;
      }
    }
    v341 = v339 + 2;
    *((void *)v315 + 6) = v340;
    *((void *)v315 + 7) = v339 + 2;
    *((void *)v315 + 8) = &v338[16 * v337];
    if (v318) {
      goto LABEL_100;
    }
LABEL_101:
    *((void *)v315 + 7) = v341;
LABEL_89:
  }
  v342 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v204, v205, v206, v207, v208);
  v344 = (__n128 *)*((void *)v407 + 6);
  v345 = (__n128 *)*((void *)v407 + 7);
  unint64_t v346 = 126 - 2 * __clz(v345 - v344);
  if (v345 == v344) {
    uint64_t v347 = 0;
  }
  else {
    uint64_t v347 = v346;
  }
  *(void *)&double v353 = sub_1C494CC84(v344, v345, v347, 1, v343).n128_u64[0];
  uint64_t v354 = *((void *)v407 + 6);
  uint64_t v355 = *((void *)v407 + 7);
  if (v355 != v354)
  {
    unint64_t v356 = 0;
    unint64_t v357 = (v355 - v354) >> 4;
    do
    {
      v358 = (uint64_t *)(v354 + 16 * v356);
      uint64_t v359 = *v358;
      unint64_t v360 = v358[1] + *v358;
      if (++v356 < v357)
      {
        v361 = v358 + 3;
        while (1)
        {
          unint64_t v362 = *(v361 - 1);
          if (v362 >= v360) {
            break;
          }
          uint64_t v363 = *v361;
          v361 += 2;
          unint64_t v364 = v363 + v362;
          if (v360 <= v364) {
            unint64_t v360 = v364;
          }
          if (v357 == ++v356)
          {
            unint64_t v356 = v357;
            break;
          }
        }
      }
      v365 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v348, v359, v360 - v359, v351, v352, v353);
      objc_msgSend_addObject_(v342, v366, (uint64_t)v365, v367, v368, v369);

      uint64_t v354 = *((void *)v407 + 6);
      unint64_t v357 = (*((void *)v407 + 7) - v354) >> 4;
    }
    while (v356 < v357);
  }
  v370 = objc_msgSend_result(v388, v348, v349, v350, v351, v352, v353);
  v374 = objc_msgSend_mathResultWithMergedColumns_columnRangesToMerge_(CHTokenizedMathResult, v371, (uint64_t)v370, (uint64_t)v342, v372, v373);
  objc_msgSend_setResult_(v388, v375, (uint64_t)v374, v376, v377, v378);

  id v379 = v388;
  _Block_object_dispose(buf, 8);
  if (__p)
  {
    v413 = __p;
    operator delete(__p);
  }
LABEL_121:

  return v388;
}

- (BOOL)_doesColumnContainSameMathTranscriptionCandidates:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v83 = a3;
  uint64_t v8 = objc_msgSend_tokenRows(v83, v3, v4, v5, v6, v7);
  unint64_t v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);

  if (v14 < 2)
  {
    BOOL v81 = 0;
  }
  else
  {
    uint64_t v20 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v15, v16, v17, v18, v19);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v26 = objc_msgSend_mathTokenRows(v83, v21, v22, v23, v24, v25);
    id obj = v26;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v89, (uint64_t)v94, 16, v28);
    if (v34)
    {
      uint64_t v35 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v90 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          v38 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v29, v30, v31, v32, v33);
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v39 = v37;
          uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v85, (uint64_t)v93, 16, v41);
          if (v47)
          {
            uint64_t v48 = *(void *)v86;
            do
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v86 != v48) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v50 = objc_msgSend_string(*(void **)(*((void *)&v85 + 1) + 8 * j), v42, v43, v44, v45, v46);
                objc_msgSend_addObject_(v38, v51, (uint64_t)v50, v52, v53, v54);
              }
              uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v85, (uint64_t)v93, 16, v46);
            }
            while (v47);
          }

          id v59 = objc_msgSend_componentsJoinedByString_(v38, v55, @" ", v56, v57, v58);
          objc_msgSend_addObject_(v20, v60, (uint64_t)v59, v61, v62, v63);
        }
        uint64_t v26 = obj;
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v89, (uint64_t)v94, 16, v33);
      }
      while (v34);
    }

    uint64_t v69 = objc_msgSend_count(v20, v64, v65, v66, v67, v68);
    uint64_t v75 = objc_msgSend_tokenRows(v83, v70, v71, v72, v73, v74);
    BOOL v81 = v69 != objc_msgSend_count(v75, v76, v77, v78, v79, v80);
  }
  return v81;
}

@end