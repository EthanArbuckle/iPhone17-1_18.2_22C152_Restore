@interface CHVerticalMathLinkingStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHVerticalMathLinkingStep

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v678 = *MEMORY[0x1E4F143B8];
  v5 = (id *)a3;
  id v632 = a4;
  v14 = objc_msgSend_objectForKeyedSubscript_(v632, v6, (uint64_t)CHMathPostProcessingOptionForceLocaleNumberFormat, v7, v8, v9);
  if (v14)
  {
    v15 = objc_msgSend_objectForKeyedSubscript_(v632, v10, (uint64_t)CHMathPostProcessingOptionForceLocaleNumberFormat, v11, v12, v13);
    int v21 = objc_msgSend_BOOLValue(v15, v16, v17, v18, v19, v20);
  }
  else
  {
    int v21 = 1;
  }

  v27 = objc_msgSend_groupingManager(self, v22, v23, v24, v25, v26);
  v33 = objc_msgSend_strokeProvider(v27, v28, v29, v30, v31, v32);
  findStemsAndEntryCandidates(v5, v33, v21, (uint64_t)&v667);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v34 = (id)qword_1EA3C9FA8;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = (v668 - v667) >> 3;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v671 - v670;
    _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_DEBUG, "Got %lu stems and %lu entries", buf, 0x16u);
  }

  v633 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v35, v36, v37, v38, v39);
  while (1)
  {
    id v40 = v5 ? v5[10] : 0;
    id v41 = v40;
    sub_1C4B5BD54((id *)buf, (id **)&v667, &v670, v672, v633, v41);

    if (!buf[16]) {
      break;
    }
    v46 = v671;
    if (v670 == v671)
    {
      v47 = v670;
LABEL_21:
      if (v47 == v671) {
        goto LABEL_30;
      }
LABEL_27:
      while (v46 != v47)
      {
        v51 = *--v46;
      }
      v671 = v47;
      goto LABEL_30;
    }
    v47 = v670;
    while (*v47 != *(id *)&buf[8])
    {
      if (++v47 == v671)
      {
        v47 = v671;
        break;
      }
    }
    if (v47 == v671) {
      goto LABEL_21;
    }
    v48 = v47 + 1;
    if (v47 + 1 == v671) {
      goto LABEL_21;
    }
    do
    {
      v49 = *v48;
      if (*v48 != *(void **)&buf[8])
      {
        *v48 = 0;
        id v50 = *v47;
        id *v47 = v49;

        ++v47;
      }
      ++v48;
    }
    while (v48 != v46);
    v46 = v671;
    if (v47 != v671) {
      goto LABEL_27;
    }
LABEL_30:
    v642 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v42, *(uint64_t *)&buf[8], v43, v44, v45);
    if (v5) {
      id v52 = v5[10];
    }
    else {
      id v52 = 0;
    }
    id v53 = v52;
    v54 = NSNumber;
    uint64_t v60 = objc_msgSend_uniqueIdentifier(*(void **)buf, v55, v56, v57, v58, v59);
    v65 = objc_msgSend_numberWithInteger_(v54, v61, v60, v62, v63, v64);
    v70 = objc_msgSend_objectForKeyedSubscript_(v53, v66, (uint64_t)v65, v67, v68, v69);
    v76 = objc_msgSend_mathResult(v70, v71, v72, v73, v74, v75);
    BOOL v77 = v76 == 0;

    if (!v77) {
      goto LABEL_87;
    }
    objc_msgSend_bounds(*(void **)buf, v78, v79, v80, v81, v82);
    CGFloat v84 = v83;
    CGFloat v86 = v85;
    CGFloat v88 = v87;
    CGFloat v90 = v89;
    objc_msgSend_bounds(*(void **)&buf[8], v91, v92, v93, v94, v95);
    v682.origin.double x = v96;
    v682.origin.double y = v97;
    v682.size.double width = v98;
    v682.size.double height = v99;
    v680.origin.double x = v84;
    v680.origin.double y = v86;
    v680.size.double width = v88;
    v680.size.double height = v90;
    CGRect v681 = CGRectUnion(v680, v682);
    double x = v681.origin.x;
    double y = v681.origin.y;
    double width = v681.size.width;
    double height = v681.size.height;
    v104 = [CHStrokeGroup alloc];
    v110 = objc_msgSend_strokeIdentifiers(*(void **)buf, v105, v106, v107, v108, v109);
    v116 = objc_msgSend_firstStrokeIdentifier(*(void **)buf, v111, v112, v113, v114, v115);
    v122 = objc_msgSend_lastStrokeIdentifier(*(void **)buf, v117, v118, v119, v120, v121);
    objc_msgSend_groupingConfidence(*(void **)buf, v123, v124, v125, v126, v127);
    double v129 = v128;
    objc_msgSend_firstStrokeOrigin(*(void **)buf, v130, v131, v132, v133, v134);
    StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v104, v135, (uint64_t)v110, (uint64_t)v116, (uint64_t)v122, 3, @"CHGroupingPostProcessingManager", x, y, width, height, v129, v136, v137);

    id v139 = StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
    v140 = operator new(8uLL);
    __p = v140;
    v666 = v140 + 1;
    id v141 = v139;
    void *v140 = v141;
    v665 = (char *)(v140 + 1);

    if (v5) {
      id v142 = v5[10];
    }
    else {
      id v142 = 0;
    }
    id v143 = v142;
    v144 = NSNumber;
    uint64_t v150 = objc_msgSend_uniqueIdentifier(*(void **)&buf[8], v145, v146, v147, v148, v149);
    v155 = objc_msgSend_numberWithInteger_(v144, v151, v150, v152, v153, v154);
    v160 = objc_msgSend_objectForKeyedSubscript_(v143, v156, (uint64_t)v155, v157, v158, v159);
    if (v5) {
      id v161 = v5[10];
    }
    else {
      id v161 = 0;
    }
    id v162 = v161;
    v163 = NSNumber;
    uint64_t v169 = objc_msgSend_uniqueIdentifier(v141, v164, v165, v166, v167, v168);
    v174 = objc_msgSend_numberWithInteger_(v163, v170, v169, v171, v172, v173);
    objc_msgSend_setObject_forKeyedSubscript_(v162, v175, (uint64_t)v160, (uint64_t)v174, v176, v177);

    if (v5) {
      id v178 = v5[10];
    }
    else {
      id v178 = 0;
    }
    id v179 = v178;
    sub_1C4B5BD54(&v661, (id **)&__p, &v670, v672, v633, v179);

    if (v5) {
      id v180 = v5[10];
    }
    else {
      id v180 = 0;
    }
    id v181 = v180;
    v182 = NSNumber;
    uint64_t v188 = objc_msgSend_uniqueIdentifier(v141, v183, v184, v185, v186, v187);
    v193 = objc_msgSend_numberWithInteger_(v182, v189, v188, v190, v191, v192);
    objc_msgSend_removeObjectForKey_(v181, v194, (uint64_t)v193, v195, v196, v197);

    int v202 = v663;
    if (v663)
    {
      objc_msgSend_addObject_(v642, v198, (uint64_t)v662, v199, v200, v201);
      v203 = v671;
      if (v670 == v671)
      {
        v204 = v670;
LABEL_58:
        if (v204 == v671) {
          goto LABEL_79;
        }
      }
      else
      {
        v204 = v670;
        while (*v204 != v662)
        {
          if (++v204 == v671)
          {
            v204 = v671;
            break;
          }
        }
        if (v204 == v671) {
          goto LABEL_58;
        }
        v207 = v204 + 1;
        if (v204 + 1 == v671) {
          goto LABEL_58;
        }
        do
        {
          id v208 = *v207;
          if (*v207 != v662)
          {
            id *v207 = 0;
            id v209 = *v204;
            id *v204 = v208;

            ++v204;
          }
          ++v207;
        }
        while (v207 != v203);
        v203 = v671;
        if (v204 == v671) {
          goto LABEL_79;
        }
      }
      while (v203 != v204)
      {
        v210 = *--v203;
      }
      v671 = v204;
      if (v663) {
        goto LABEL_80;
      }
      goto LABEL_81;
    }
    v205 = v668;
    if (v667 == v668)
    {
      v206 = v667;
    }
    else
    {
      v206 = v667;
      while (*(void *)v206 != *(void *)buf)
      {
        v206 += 8;
        if (v206 == v668)
        {
          v206 = v668;
          break;
        }
      }
      if (v206 != v668)
      {
        v211 = v206 + 8;
        if (v206 + 8 != v668)
        {
          do
          {
            uint64_t v213 = *(void *)v211;
            if (*(void *)v211 != *(void *)buf)
            {
              *(void *)v211 = 0;
              v214 = *(void **)v206;
              *(void *)v206 = v213;

              v206 += 8;
            }
            v211 += 8;
          }
          while (v211 != v205);
          v205 = v668;
          if (v206 == v668)
          {
LABEL_79:
            if (!v663) {
              goto LABEL_81;
            }
LABEL_80:

            goto LABEL_81;
          }
          goto LABEL_71;
        }
      }
    }
    if (v206 == v668) {
      goto LABEL_79;
    }
LABEL_71:
    while (v205 != v206)
    {
      v212 = (void *)*((void *)v205 - 1);
      v205 -= 8;
    }
    v668 = v206;
    if (v663) {
      goto LABEL_80;
    }
LABEL_81:
    v215 = (char *)__p;
    if (__p)
    {
      for (i = v665; i != v215; i -= 8)
      {
        v217 = (void *)*((void *)i - 1);
      }
      operator delete(v215);
    }

    if (!v202)
    {
      id v228 = 0;
      goto LABEL_154;
    }
LABEL_87:
    v218 = objc_msgSend_reverseObjectEnumerator(v642, v78, v79, v80, v81, v82);
    v224 = objc_msgSend_allObjects(v218, v219, v220, v221, v222, v223);
    if (v5) {
      id v225 = v5[10];
    }
    else {
      id v225 = 0;
    }
    v226 = *(void **)buf;
    id v227 = v225;
    id v659 = 0;
    id v660 = 0;
    sub_1C4B5E588(self, v224, v226, 0, v673, v227, &v660, &v659);
    id v228 = v660;
    id v229 = v659;

    v230 = v668;
    if (v667 == v668)
    {
      v231 = v667;
    }
    else
    {
      v231 = v667;
      while (*(void *)v231 != *(void *)buf)
      {
        v231 += 8;
        if (v231 == v668)
        {
          v231 = v668;
          break;
        }
      }
      if (v231 != v668)
      {
        v232 = v231 + 8;
        if (v231 + 8 != v668)
        {
          do
          {
            uint64_t v233 = *(void *)v232;
            if (*(void *)v232 != *(void *)buf)
            {
              *(void *)v232 = 0;
              v234 = *(void **)v231;
              *(void *)v231 = v233;

              v231 += 8;
            }
            v232 += 8;
          }
          while (v232 != v230);
          v230 = v668;
          if (v231 == v668) {
            goto LABEL_107;
          }
LABEL_104:
          while (v230 != v231)
          {
            v235 = (void *)*((void *)v230 - 1);
            v230 -= 8;
          }
          v668 = v231;
          goto LABEL_107;
        }
      }
    }
    if (v231 != v668) {
      goto LABEL_104;
    }
LABEL_107:
    if (v5) {
      id v236 = v5[9];
    }
    else {
      id v236 = 0;
    }
    id v237 = v236;
    objc_msgSend_removeObject_(v237, v238, *(uint64_t *)buf, v239, v240, v241);

    if (v5) {
      id v242 = v5[10];
    }
    else {
      id v242 = 0;
    }
    id v243 = v242;
    v244 = NSNumber;
    uint64_t v250 = objc_msgSend_uniqueIdentifier(*(void **)buf, v245, v246, v247, v248, v249);
    v255 = objc_msgSend_numberWithInteger_(v244, v251, v250, v252, v253, v254);
    objc_msgSend_removeObjectForKey_(v243, v256, (uint64_t)v255, v257, v258, v259);

    long long v657 = 0u;
    long long v658 = 0u;
    long long v655 = 0u;
    long long v656 = 0u;
    id v260 = v642;
    uint64_t v267 = objc_msgSend_countByEnumeratingWithState_objects_count_(v260, v261, (uint64_t)&v655, (uint64_t)v676, 16, v262);
    if (v267)
    {
      uint64_t v268 = *(void *)v656;
      do
      {
        uint64_t v269 = 0;
        if (v5)
        {
          do
          {
            if (*(void *)v656 != v268) {
              objc_enumerationMutation(v260);
            }
            v270 = *(void **)(*((void *)&v655 + 1) + 8 * v269);
            id v271 = v5[9];
            objc_msgSend_removeObject_(v271, v272, (uint64_t)v270, v273, v274, v275);

            id v276 = v5[10];
            v277 = NSNumber;
            uint64_t v283 = objc_msgSend_uniqueIdentifier(v270, v278, v279, v280, v281, v282);
            v288 = objc_msgSend_numberWithInteger_(v277, v284, v283, v285, v286, v287);
            objc_msgSend_removeObjectForKey_(v276, v289, (uint64_t)v288, v290, v291, v292);

            ++v269;
          }
          while (v267 != v269);
        }
        else
        {
          do
          {
            if (*(void *)v656 != v268) {
              objc_enumerationMutation(v260);
            }
            v293 = *(void **)(*((void *)&v655 + 1) + 8 * v269);
            objc_msgSend_removeObject_(0, v263, (uint64_t)v293, v264, v265, v266);
            v294 = NSNumber;
            uint64_t v300 = objc_msgSend_uniqueIdentifier(v293, v295, v296, v297, v298, v299);
            v305 = objc_msgSend_numberWithInteger_(v294, v301, v300, v302, v303, v304);
            objc_msgSend_removeObjectForKey_(0, v306, (uint64_t)v305, v307, v308, v309);

            ++v269;
          }
          while (v267 != v269);
        }
        uint64_t v267 = objc_msgSend_countByEnumeratingWithState_objects_count_(v260, v263, (uint64_t)&v655, (uint64_t)v676, 16, v266);
      }
      while (v267);
    }

    v310 = v668;
    if ((unint64_t)v668 >= v669)
    {
      uint64_t v312 = v668 - v667;
      uint64_t v313 = (v668 - v667) >> 3;
      if ((unint64_t)(v313 + 1) >> 61) {
        sub_1C494A220();
      }
      unint64_t v314 = (uint64_t)(v669 - (void)v667) >> 2;
      if (v314 <= v313 + 1) {
        unint64_t v314 = v313 + 1;
      }
      if (v669 - (unint64_t)v667 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v315 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v315 = v314;
      }
      if (v315)
      {
        if (v315 >> 61) {
          sub_1C4949AA8();
        }
        v316 = (char *)operator new(8 * v315);
      }
      else
      {
        v316 = 0;
      }
      v317 = &v316[8 * v313];
      v318 = &v316[8 * v315];
      *(void *)v317 = v228;
      v311 = v317 + 8;
      v319 = v667;
      v320 = v668;
      if (v668 == v667)
      {
        v667 = &v316[8 * v313];
        v668 = v317 + 8;
        unint64_t v669 = (unint64_t)v318;
      }
      else
      {
        unint64_t v321 = v668 - v667 - 8;
        if (v321 < 0x78) {
          goto LABEL_294;
        }
        unint64_t v322 = (v668 - 8 - v667) & 0xFFFFFFFFFFFFFFF8;
        if (&v668[-v322 - 8] < v317 && &v316[v312 - v322 - 8] < v668) {
          goto LABEL_294;
        }
        uint64_t v323 = (v321 >> 3) + 1;
        uint64_t v324 = 8 * (v323 & 0x3FFFFFFFFFFFFFFCLL);
        v317 -= v324;
        v325 = &v668[-v324];
        v326 = v668 - 16;
        v327 = &v316[8 * v313 - 16];
        uint64_t v328 = v323 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v330 = *((_OWORD *)v326 - 1);
          long long v329 = *(_OWORD *)v326;
          *((_OWORD *)v326 - 1) = 0uLL;
          *(_OWORD *)v326 = 0uLL;
          *((_OWORD *)v327 - 1) = v330;
          *(_OWORD *)v327 = v329;
          v326 -= 32;
          v327 -= 32;
          v328 -= 4;
        }
        while (v328);
        v320 = v325;
        if (v323 != (v323 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_294:
          do
          {
            uint64_t v331 = *((void *)v320 - 1);
            v320 -= 8;
            *(void *)v320 = 0;
            *((void *)v317 - 1) = v331;
            v317 -= 8;
          }
          while (v320 != v319);
        }
        v320 = v667;
        v332 = v668;
        v667 = v317;
        v668 = v311;
        unint64_t v669 = (unint64_t)v318;
        while (v332 != v320)
        {
          v333 = (void *)*((void *)v332 - 1);
          v332 -= 8;
        }
      }
      if (v320) {
        operator delete(v320);
      }
    }
    else
    {
      *(void *)v310 = v228;
      v311 = v310 + 8;
    }
    v668 = v311;
    if (v5) {
      id v334 = v5[9];
    }
    else {
      id v334 = 0;
    }
    id v335 = v334;
    objc_msgSend_addObject_(v335, v336, (uint64_t)v228, v337, v338, v339);

    if (v5) {
      id v340 = v5[10];
    }
    else {
      id v340 = 0;
    }
    id v341 = v340;
    v342 = NSNumber;
    uint64_t v348 = objc_msgSend_uniqueIdentifier(v228, v343, v344, v345, v346, v347);
    v353 = objc_msgSend_numberWithInteger_(v342, v349, v348, v350, v351, v352);
    objc_msgSend_setObject_forKey_(v341, v354, (uint64_t)v229, (uint64_t)v353, v355, v356);

LABEL_154:
    if (buf[16])
    {
    }
  }
  long long v651 = 0u;
  long long v652 = 0u;
  long long v653 = 0u;
  long long v654 = 0u;
  obuint64_t j = v633;
  uint64_t v359 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v357, (uint64_t)&v651, (uint64_t)v675, 16, v358);
  if (!v359) {
    goto LABEL_204;
  }
  uint64_t v360 = *(void *)v652;
  uint64_t v643 = *(void *)v652;
  while (2)
  {
    uint64_t v361 = 0;
    while (2)
    {
      if (*(void *)v652 != v360) {
        objc_enumerationMutation(obj);
      }
      v365 = *(void **)(*((void *)&v651 + 1) + 8 * v361);
      v366 = v668;
      if ((unint64_t)v668 < v669)
      {
        *(void *)v366 = v365;
        v364 = v366 + 8;
        goto LABEL_172;
      }
      uint64_t v367 = v668 - v667;
      uint64_t v368 = (v668 - v667) >> 3;
      if ((unint64_t)(v368 + 1) >> 61) {
        sub_1C494A220();
      }
      unint64_t v369 = (uint64_t)(v669 - (void)v667) >> 2;
      if (v369 <= v368 + 1) {
        unint64_t v369 = v368 + 1;
      }
      if (v669 - (unint64_t)v667 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v370 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v370 = v369;
      }
      if (v370)
      {
        if (v370 >> 61) {
          sub_1C4949AA8();
        }
        v371 = (char *)operator new(8 * v370);
      }
      else
      {
        v371 = 0;
      }
      v372 = &v371[8 * v368];
      v373 = &v371[8 * v370];
      *(void *)v372 = v365;
      v364 = v372 + 8;
      v374 = v667;
      v375 = v668;
      if (v668 == v667)
      {
        v667 = &v371[8 * v368];
        v668 = v372 + 8;
        unint64_t v669 = (unint64_t)v373;
        uint64_t v360 = v643;
        if (!v375) {
          goto LABEL_172;
        }
        goto LABEL_202;
      }
      unint64_t v376 = v668 - v667 - 8;
      if (v376 < 0x78) {
        goto LABEL_295;
      }
      unint64_t v377 = (v668 - 8 - v667) & 0xFFFFFFFFFFFFFFF8;
      if (&v668[-v377 - 8] < v372 && &v371[v367 - v377 - 8] < v668) {
        goto LABEL_295;
      }
      uint64_t v378 = (v376 >> 3) + 1;
      uint64_t v379 = 8 * (v378 & 0x3FFFFFFFFFFFFFFCLL);
      v372 -= v379;
      v380 = &v668[-v379];
      v381 = v668 - 16;
      v382 = &v371[8 * v368 - 16];
      uint64_t v383 = v378 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v385 = *((_OWORD *)v381 - 1);
        long long v384 = *(_OWORD *)v381;
        *((_OWORD *)v381 - 1) = 0uLL;
        *(_OWORD *)v381 = 0uLL;
        *((_OWORD *)v382 - 1) = v385;
        *(_OWORD *)v382 = v384;
        v381 -= 32;
        v382 -= 32;
        v383 -= 4;
      }
      while (v383);
      v375 = v380;
      if (v378 != (v378 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_295:
        do
        {
          uint64_t v386 = *((void *)v375 - 1);
          v375 -= 8;
          *(void *)v375 = 0;
          *((void *)v372 - 1) = v386;
          v372 -= 8;
        }
        while (v375 != v374);
      }
      v375 = v667;
      v387 = v668;
      v667 = v372;
      v668 = v364;
      unint64_t v669 = (unint64_t)v373;
      if (v387 == v375)
      {
        uint64_t v360 = v643;
        if (!v375) {
          goto LABEL_172;
        }
        goto LABEL_202;
      }
      uint64_t v360 = v643;
      do
      {
        v388 = (void *)*((void *)v387 - 1);
        v387 -= 8;
      }
      while (v387 != v375);
      if (v375) {
LABEL_202:
      }
        operator delete(v375);
LABEL_172:
      v668 = v364;
      if (++v361 != v359) {
        continue;
      }
      break;
    }
    uint64_t v359 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v362, (uint64_t)&v651, (uint64_t)v675, 16, v363);
    if (v359) {
      continue;
    }
    break;
  }
LABEL_204:

  v389 = (id *)v667;
  v390 = v668;
  if (v667 != v668)
  {
    while (2)
    {
      id v391 = *v389;
      if (v5) {
        id v392 = v5[10];
      }
      else {
        id v392 = 0;
      }
      id v393 = v392;
      v394 = (CHStrokeGroup *)v391;
      id v395 = v393;
      v396 = NSNumber;
      uint64_t v402 = objc_msgSend_uniqueIdentifier(v394, v397, v398, v399, v400, v401);
      v407 = objc_msgSend_numberWithInteger_(v396, v403, v402, v404, v405, v406);
      v412 = objc_msgSend_objectForKeyedSubscript_(v395, v408, (uint64_t)v407, v409, v410, v411);
      v418 = objc_msgSend_mathResult(v412, v413, v414, v415, v416, v417);
      objc_msgSend_baseCharacterHeight(v418, v419, v420, v421, v422, v423);
      double v425 = v424;

      v426 = v670;
      v427 = v671;
      if (v670 == v671)
      {
        v428 = 0;
        if (qword_1EA3CA000 == -1) {
          goto LABEL_213;
        }
      }
      else
      {
        v428 = 0;
        double v429 = 0.0;
        do
        {
          v430 = (CHStrokeGroup *)*v426;
          double v431 = scoreStemEntry(v394, v430, v425, 1, 0);
          if (v431 > v429)
          {
            v432 = v430;

            v428 = v432;
            double v429 = v431;
          }

          ++v426;
        }
        while (v426 != v427);
        if (qword_1EA3CA000 == -1)
        {
LABEL_213:
          v433 = (id)qword_1EA3C9FA8;
          if (os_log_type_enabled(v433, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v428;
            _os_log_impl(&dword_1C492D000, v433, OS_LOG_TYPE_DEBUG, "findBestResultForStem: %@", buf, 0xCu);
          }

          if (v428)
          {
            if (v5) {
              id v434 = v5[10];
            }
            else {
              id v434 = 0;
            }
            id v435 = v434;
            id v649 = 0;
            id v650 = 0;
            sub_1C4B5E588(self, MEMORY[0x1E4F1CBF0], v394, v428, v673, v435, &v650, &v649);
            id v436 = v650;
            id v437 = v649;

            if (v5) {
              id v438 = v5[9];
            }
            else {
              id v438 = 0;
            }
            id v439 = v438;
            objc_msgSend_removeObject_(v439, v440, (uint64_t)v394, v441, v442, v443);

            if (v5) {
              id v444 = v5[10];
            }
            else {
              id v444 = 0;
            }
            id v445 = v444;
            v446 = NSNumber;
            uint64_t v452 = objc_msgSend_uniqueIdentifier(v394, v447, v448, v449, v450, v451);
            v457 = objc_msgSend_numberWithInteger_(v446, v453, v452, v454, v455, v456);
            objc_msgSend_removeObjectForKey_(v445, v458, (uint64_t)v457, v459, v460, v461);

            v462 = v671;
            v463 = v670;
            if (v670 != v671)
            {
              while (*v463 != v428)
              {
                if (++v463 == v671)
                {
                  v463 = v671;
                  break;
                }
              }
            }
            if (v463 == v671 || (v464 = v463 + 1, v463 + 1 == v671))
            {
              if (v463 == v671) {
                goto LABEL_239;
              }
LABEL_236:
              while (v462 != v463)
              {
                v467 = *--v462;
              }
              v671 = v463;
            }
            else
            {
              do
              {
                v465 = *v464;
                if (*v464 != v428)
                {
                  *v464 = 0;
                  id v466 = *v463;
                  id *v463 = v465;

                  ++v463;
                }
                ++v464;
              }
              while (v464 != v462);
              v462 = v671;
              if (v463 != v671) {
                goto LABEL_236;
              }
            }
LABEL_239:
            if (v5) {
              id v468 = v5[9];
            }
            else {
              id v468 = 0;
            }
            id v469 = v468;
            objc_msgSend_removeObject_(v469, v470, (uint64_t)v428, v471, v472, v473);

            if (v5) {
              id v474 = v5[10];
            }
            else {
              id v474 = 0;
            }
            id v475 = v474;
            v476 = NSNumber;
            uint64_t v482 = objc_msgSend_uniqueIdentifier(v428, v477, v478, v479, v480, v481);
            v487 = objc_msgSend_numberWithInteger_(v476, v483, v482, v484, v485, v486);
            objc_msgSend_removeObjectForKey_(v475, v488, (uint64_t)v487, v489, v490, v491);

            if (v5) {
              id v492 = v5[9];
            }
            else {
              id v492 = 0;
            }
            id v493 = v492;
            objc_msgSend_addObject_(v493, v494, (uint64_t)v436, v495, v496, v497);

            if (v5) {
              id v498 = v5[10];
            }
            else {
              id v498 = 0;
            }
            id v499 = v498;
            v500 = NSNumber;
            uint64_t v506 = objc_msgSend_uniqueIdentifier(v436, v501, v502, v503, v504, v505);
            v511 = objc_msgSend_numberWithInteger_(v500, v507, v506, v508, v509, v510);
            objc_msgSend_setObject_forKey_(v499, v512, (uint64_t)v437, (uint64_t)v511, v513, v514);
          }
          if (++v389 == (id *)v390) {
            goto LABEL_258;
          }
          continue;
        }
      }
      break;
    }
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    goto LABEL_213;
  }
LABEL_258:
  id v515 = v632;
  self;
  v520 = v515;
  if (v515)
  {
    v521 = objc_msgSend_objectForKey_(v515, v516, (uint64_t)CHGroupingPostProcessingManagerOptionExplicitOperators, v517, v518, v519);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v636 = objc_msgSend_BOOLValue(v521, v522, v523, v524, v525, v526);
    }
    else {
      unsigned int v636 = 0;
    }

    v520 = v515;
  }
  else
  {
    unsigned int v636 = 0;
  }
  v631 = v520;

  long long v647 = 0u;
  long long v648 = 0u;
  long long v645 = 0u;
  long long v646 = 0u;
  if (v5) {
    id v527 = v5[9];
  }
  else {
    id v527 = 0;
  }
  id v634 = v527;
  uint64_t v530 = objc_msgSend_countByEnumeratingWithState_objects_count_(v634, v528, (uint64_t)&v645, (uint64_t)v674, 16, v529);
  if (v530)
  {
    uint64_t v637 = *(void *)v646;
    do
    {
      uint64_t v639 = v530;
      for (uint64_t j = 0; j != v639; ++j)
      {
        if (*(void *)v646 != v637) {
          objc_enumerationMutation(v634);
        }
        if (v5) {
          id v532 = v5[10];
        }
        else {
          id v532 = 0;
        }
        v533 = *(void **)(*((void *)&v645 + 1) + 8 * j);
        id v534 = v532;
        v535 = NSNumber;
        uint64_t v541 = objc_msgSend_uniqueIdentifier(v533, v536, v537, v538, v539, v540);
        v546 = objc_msgSend_numberWithInteger_(v535, v542, v541, v543, v544, v545);
        v551 = objc_msgSend_objectForKeyedSubscript_(v534, v547, (uint64_t)v546, v548, v549, v550);

        v557 = objc_msgSend_mathResult(v551, v552, v553, v554, v555, v556);
        LOBYTE(v534) = v557 == 0;

        if ((v534 & 1) == 0)
        {
          v563 = objc_msgSend_mathResult(v551, v558, v559, v560, v561, v562);
          v644 = objc_msgSend_resultTransformedToOfficialNotationWithExplicitOperators_(v563, v564, v636, v565, v566, v567);

          if (v644)
          {
            v568 = [CHStrokeGroupRecognitionResult alloc];
            v574 = objc_msgSend_orderedLocales(v551, v569, v570, v571, v572, v573);
            v641 = objc_msgSend_recognitionResultsByLocale(v551, v575, v576, v577, v578, v579);
            v640 = objc_msgSend_errorsByLocale(v551, v580, v581, v582, v583, v584);
            v590 = objc_msgSend_languageFitnessByLocale(v551, v585, v586, v587, v588, v589);
            v596 = objc_msgSend_inputStrokeIdentifiers(v551, v591, v592, v593, v594, v595);
            v602 = objc_msgSend_inputDrawing(v551, v597, v598, v599, v600, v601);
            v608 = objc_msgSend_inputDrawingCutPoints(v551, v603, v604, v605, v606, v607);
            v610 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v568, v609, (uint64_t)v574, (uint64_t)v641, (uint64_t)v640, (uint64_t)v590, v644, v596, v602, v608);

            if (v5) {
              id v611 = v5[10];
            }
            else {
              id v611 = 0;
            }
            id v612 = v611;
            v613 = NSNumber;
            uint64_t v619 = objc_msgSend_uniqueIdentifier(v533, v614, v615, v616, v617, v618);
            v624 = objc_msgSend_numberWithInteger_(v613, v620, v619, v621, v622, v623);
            objc_msgSend_setObject_forKeyedSubscript_(v612, v625, (uint64_t)v610, (uint64_t)v624, v626, v627);
          }
        }
      }
      uint64_t v530 = objc_msgSend_countByEnumeratingWithState_objects_count_(v634, v628, (uint64_t)&v645, (uint64_t)v674, 16, v629);
    }
    while (v530);
  }

  sub_1C4B67A08(&v667);
  return v5;
}

@end