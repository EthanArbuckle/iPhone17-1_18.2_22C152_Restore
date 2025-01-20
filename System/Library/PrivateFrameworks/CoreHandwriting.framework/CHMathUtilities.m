@interface CHMathUtilities
+ (id)syntaxAllowedSplitsForResult:(id)a3 outSubResultBounds:(void *)a4;
@end

@implementation CHMathUtilities

+ (id)syntaxAllowedSplitsForResult:(id)a3 outSubResultBounds:(void *)a4
{
  id v4 = a3;
  v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  v397[0] = 0;
  v397[1] = v397;
  v397[2] = 0x3032000000;
  v397[3] = sub_1C4AAF778;
  v397[4] = sub_1C4AAF788;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15);
  id v398 = (id)objc_claimAutoreleasedReturnValue();
  v396[0] = 0;
  v396[1] = v396;
  v396[2] = 0x2020000000;
  v396[3] = 0;
  v392[0] = MEMORY[0x1E4F143A8];
  v392[1] = 3221225472;
  v392[2] = sub_1C4AAF790;
  v392[3] = &unk_1E64E0E10;
  v394 = v396;
  v395 = v397;
  id v16 = v10;
  id v393 = v16;
  v381 = v4;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v4, v17, (uint64_t)v392, v18, v19, v20);
  if ((unint64_t)objc_msgSend_count(v16, v21, v22, v23, v24, v25) <= 1)
  {
    id v31 = v16;
    v32 = v31;
    goto LABEL_86;
  }
  v33 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v26, v27, v28, v29, v30);
  v386 = v16;
  v388 = objc_msgSend_objectAtIndexedSubscript_(v16, v34, 0, v35, v36, v37);
  unint64_t v43 = 0;
  while (v43 < objc_msgSend_count(v386, v38, v39, v40, v41, v42) - 1)
  {
    v49 = objc_msgSend_objectAtIndexedSubscript_(v386, v44, v43 + 1, v46, v47, v48);
    v55 = objc_msgSend_lastObject(v388, v50, v51, v52, v53, v54);
    if ((objc_msgSend_properties(v55, v56, v57, v58, v59, v60) & 0x100) != 0)
    {
      v67 = objc_msgSend_firstObject(v49, v61, v62, v63, v64, v65);
      v73 = objc_msgSend_string(v67, v68, v69, v70, v71, v72);
      if (objc_msgSend_isEqualToString_(v73, v74, @"{", v75, v76, v77))
      {
        v83 = objc_msgSend_lastObject(v49, v78, v79, v80, v81, v82);
        v89 = objc_msgSend_string(v83, v84, v85, v86, v87, v88);
        int isEqualToString = objc_msgSend_isEqualToString_(v89, v90, @"}", v91, v92, v93);
      }
      else
      {
        int isEqualToString = 0;
      }
    }
    else
    {
      int isEqualToString = 0;
    }

    v99 = objc_msgSend_lastObject(v388, v94, v95, v96, v97, v98);
    v105 = objc_msgSend_string(v99, v100, v101, v102, v103, v104);
    if (objc_msgSend_isEqualToString_(v105, v106, @"\\frac", v107, v108, v109))
    {
      unint64_t v115 = objc_msgSend_count(v386, v110, v111, v112, v113, v114);

      if (v43 + 2 >= v115)
      {
        if (isEqualToString) {
          goto LABEL_23;
        }
      }
      else
      {
        v120 = objc_msgSend_objectAtIndexedSubscript_(v386, v116, v43 + 2, v117, v118, v119);
        v126 = objc_msgSend_firstObject(v49, v121, v122, v123, v124, v125);
        v132 = objc_msgSend_string(v126, v127, v128, v129, v130, v131);
        if (objc_msgSend_isEqualToString_(v132, v133, @"{", v134, v135, v136))
        {
          v384 = objc_msgSend_lastObject(v49, v137, v138, v139, v140, v141);
          v383 = objc_msgSend_string(v384, v142, v143, v144, v145, v146);
          if (objc_msgSend_isEqualToString_(v383, v147, @"}", v148, v149, v150))
          {
            objc_msgSend_firstObject(v120, v151, v152, v153, v154, v155);
            v380 = v382 = v120;
            v379 = objc_msgSend_string(v380, v156, v157, v158, v159, v160);
            if (objc_msgSend_isEqualToString_(v379, v161, @"{", v162, v163, v164))
            {
              v378 = objc_msgSend_lastObject(v120, v165, v166, v167, v168, v169);
              v175 = objc_msgSend_string(v378, v170, v171, v172, v173, v174);
              int v180 = objc_msgSend_isEqualToString_(v175, v176, @"}", v177, v178, v179);
            }
            else
            {
              int v180 = 0;
            }
            v120 = v382;
          }
          else
          {
            int v180 = 0;
          }

          if (isEqualToString)
          {
LABEL_23:
            objc_msgSend_addObjectsFromArray_(v388, v116, (uint64_t)v49, v117, v118, v119);
            objc_msgSend_addObject_(v33, v181, (uint64_t)v388, v182, v183, v184);
            v43 += 2;
            goto LABEL_31;
          }
        }
        else
        {
          int v180 = 0;

          if (isEqualToString) {
            goto LABEL_23;
          }
        }
        if (v180)
        {
          objc_msgSend_addObjectsFromArray_(v388, v116, (uint64_t)v49, v117, v118, v119);
          v194 = objc_msgSend_objectAtIndexedSubscript_(v386, v190, v43 + 2, v191, v192, v193);
          objc_msgSend_addObjectsFromArray_(v388, v195, (uint64_t)v194, v196, v197, v198);

          objc_msgSend_addObject_(v33, v199, (uint64_t)v388, v200, v201, v202);
          v43 += 3;
          goto LABEL_31;
        }
      }
    }
    else
    {

      if (isEqualToString) {
        goto LABEL_23;
      }
    }
    objc_msgSend_addObject_(v33, v116, (uint64_t)v388, v117, v118, v119);
    ++v43;
LABEL_31:
    if (v43 < objc_msgSend_count(v386, v185, v186, v187, v188, v189))
    {
      uint64_t v207 = objc_msgSend_objectAtIndexedSubscript_(v386, v203, v43, v204, v205, v206);

      v388 = (void *)v207;
    }
  }
  v213 = v386;
  if (v43 == objc_msgSend_count(v386, v44, v45, v46, v47, v48) - 1)
  {
    v214 = objc_msgSend_lastObject(v386, v208, v209, v210, v211, v212);
    objc_msgSend_addObject_(v33, v215, (uint64_t)v214, v216, v217, v218);

    v213 = v386;
  }
  id v219 = v33;

  v32 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v220, v221, v222, v223, v224);

  objc_msgSend_objectAtIndexedSubscript_(v219, v225, 0, v226, v227, v228);
  v387 = v219;
  unint64_t v229 = 0;
  v231 = v230 = v388;
  while (2)
  {
    v389 = v231;
LABEL_37:

    if (v229 < objc_msgSend_count(v387, v232, v233, v234, v235, v236) - 1)
    {
      v230 = objc_msgSend_objectAtIndexedSubscript_(v387, v237, v229 + 1, v239, v240, v241);
      if (objc_msgSend_count(v230, v242, v243, v244, v245, v246) != 1) {
        goto LABEL_43;
      }
      v251 = objc_msgSend_objectAtIndexedSubscript_(v230, v247, 0, v248, v249, v250);
      v257 = objc_msgSend_string(v251, v252, v253, v254, v255, v256);
      char v267 = objc_msgSend_isEqualToString_(v257, v258, @"^", v259, v260, v261);
      if ((v267 & 1) != 0
        || (objc_msgSend_objectAtIndexedSubscript_(v230, v262, 0, v264, v265, v266),
            v384 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_string(v384, v268, v269, v270, v271, v272),
            v383 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_isEqualToString_(v383, v273, @"_", v274, v275, v276)))
      {
        unint64_t v277 = objc_msgSend_count(v387, v262, v263, v264, v265, v266);
        BOOL v278 = v229 + 2 < v277;
        if (v267)
        {

          if (v229 + 2 >= v277) {
            goto LABEL_43;
          }
LABEL_46:
          v231 = v389;
          objc_msgSend_addObjectsFromArray_(v389, v247, (uint64_t)v230, v248, v249, v250);
          v288 = objc_msgSend_objectAtIndexedSubscript_(v387, v284, v229 + 2, v285, v286, v287);
          objc_msgSend_addObjectsFromArray_(v389, v289, (uint64_t)v288, v290, v291, v292);

          objc_msgSend_addObject_(v32, v293, (uint64_t)v389, v294, v295, v296);
          v229 += 3;
          goto LABEL_47;
        }
      }
      else
      {
        BOOL v278 = 0;
      }

      if (v278) {
        goto LABEL_46;
      }
LABEL_43:
      v231 = v389;
      objc_msgSend_addObject_(v32, v247, (uint64_t)v389, v248, v249, v250);
      ++v229;
LABEL_47:
      if (v229 < objc_msgSend_count(v387, v279, v280, v281, v282, v283))
      {
        uint64_t v301 = objc_msgSend_objectAtIndexedSubscript_(v387, v297, v229, v298, v299, v300);

        v231 = (void *)v301;
        continue;
      }
      goto LABEL_37;
    }
    break;
  }
  if (v229 == objc_msgSend_count(v387, v237, v238, v239, v240, v241) - 1)
  {
    v307 = objc_msgSend_lastObject(v387, v302, v303, v304, v305, v306);
    objc_msgSend_addObject_(v32, v308, (uint64_t)v307, v309, v310, v311);
  }
  unint64_t v312 = 0;
  v313 = (CGFloat *)MEMORY[0x1E4F1DB20];
  while (2)
  {
    if (v312 < objc_msgSend_count(v32, v302, v303, v304, v305, v306))
    {
      unint64_t v319 = 0;
      CGFloat x = *v313;
      CGFloat y = v313[1];
      CGFloat width = v313[2];
      CGFloat height = v313[3];
      while (1)
      {
        v324 = objc_msgSend_objectAtIndexedSubscript_(v32, v315, v312, v316, v317, v318);
        unint64_t v330 = objc_msgSend_count(v324, v325, v326, v327, v328, v329);

        if (v319 >= v330) {
          break;
        }
        v331 = objc_msgSend_objectAtIndexedSubscript_(v32, v302, v312, v304, v305, v306);
        v336 = objc_msgSend_objectAtIndexedSubscript_(v331, v332, v319, v333, v334, v335);

        v342 = objc_msgSend_strokeIndexes(v336, v337, v338, v339, v340, v341);
        uint64_t v348 = objc_msgSend_count(v342, v343, v344, v345, v346, v347);

        if (v348)
        {
          objc_msgSend_bounds(v336, v349, v350, v351, v352, v353);
          v402.origin.CGFloat x = v354;
          v402.origin.CGFloat y = v355;
          v402.size.CGFloat width = v356;
          v402.size.CGFloat height = v357;
          v400.origin.CGFloat x = x;
          v400.origin.CGFloat y = y;
          v400.size.CGFloat width = width;
          v400.size.CGFloat height = height;
          CGRect v401 = CGRectUnion(v400, v402);
          CGFloat x = v401.origin.x;
          CGFloat y = v401.origin.y;
          CGFloat width = v401.size.width;
          CGFloat height = v401.size.height;
        }

        ++v319;
      }
      v359 = (CGFloat *)*((void *)a4 + 1);
      unint64_t v358 = *((void *)a4 + 2);
      if ((unint64_t)v359 < v358)
      {
        CGFloat *v359 = x;
        v359[1] = y;
        v314 = v359 + 4;
        v359[2] = width;
        v359[3] = height;
        goto LABEL_53;
      }
      v360 = *(CGFloat **)a4;
      uint64_t v361 = ((uint64_t)v359 - *(void *)a4) >> 5;
      unint64_t v362 = v361 + 1;
      if ((unint64_t)(v361 + 1) >> 59) {
        sub_1C494A220();
      }
      uint64_t v363 = v358 - (void)v360;
      if (v363 >> 4 > v362) {
        unint64_t v362 = v363 >> 4;
      }
      if ((unint64_t)v363 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v364 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v364 = v362;
      }
      if (v364)
      {
        if (v364 >> 59) {
          sub_1C4949AA8();
        }
        v365 = (char *)operator new(32 * v364);
        v366 = (CGFloat *)&v365[32 * v361];
        CGFloat *v366 = x;
        v366[1] = y;
        v366[2] = width;
        v366[3] = height;
        uint64_t v367 = (uint64_t)v366;
        if (v359 == v360)
        {
LABEL_75:
          v314 = v366 + 4;
          *(void *)a4 = v367;
          *((void *)a4 + 1) = v366 + 4;
          *((void *)a4 + 2) = &v365[32 * v364];
          if (v359) {
            goto LABEL_76;
          }
          goto LABEL_53;
        }
      }
      else
      {
        v365 = 0;
        v366 = (CGFloat *)(32 * v361);
        CGFloat *v366 = x;
        v366[1] = y;
        v366[2] = width;
        v366[3] = height;
        uint64_t v367 = 32 * v361;
        if (v359 == v360) {
          goto LABEL_75;
        }
      }
      do
      {
        long long v368 = *((_OWORD *)v359 - 1);
        *(_OWORD *)(v367 - 32) = *((_OWORD *)v359 - 2);
        *(_OWORD *)(v367 - 16) = v368;
        v367 -= 32;
        v359 -= 4;
      }
      while (v359 != v360);
      v359 = *(CGFloat **)a4;
      v314 = v366 + 4;
      *(void *)a4 = v367;
      *((void *)a4 + 1) = v366 + 4;
      *((void *)a4 + 2) = &v365[32 * v364];
      if (v359) {
LABEL_76:
      }
        operator delete(v359);
LABEL_53:
      *((void *)a4 + 1) = v314;
      ++v312;
      continue;
    }
    break;
  }
  v369 = *(CGFloat **)a4;
  uint64_t v370 = *((void *)a4 + 1);
  BOOL v371 = v370 == *(void *)a4;
  if (v370 == *(void *)a4) {
    v372 = v313;
  }
  else {
    v372 = *(CGFloat **)a4;
  }
  long long v390 = *(_OWORD *)v372;
  long long v391 = *((_OWORD *)v372 + 1);
  if (!v371)
  {
    uint64_t v373 = 0;
    unint64_t v374 = 0;
    do
    {
      while (1)
      {
        BOOL IsNull = CGRectIsNull(*(CGRect *)&v369[v373]);
        v369 = *(CGFloat **)a4;
        v376 = (long long *)(*(void *)a4 + v373 * 8);
        if (IsNull) {
          break;
        }
        long long v390 = *v376;
        long long v391 = v376[1];
        ++v374;
        v373 += 4;
        if (v374 >= (uint64_t)(*((void *)a4 + 1) - (void)v369) >> 5) {
          goto LABEL_85;
        }
      }
      long long *v376 = v390;
      v376[1] = v391;
      v369 = *(CGFloat **)a4;
      ++v374;
      v373 += 4;
    }
    while (v374 < (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
  }
LABEL_85:

  id v31 = v387;
LABEL_86:

  _Block_object_dispose(v396, 8);
  _Block_object_dispose(v397, 8);

  return v32;
}

@end