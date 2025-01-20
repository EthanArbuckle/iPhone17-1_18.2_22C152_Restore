@interface CHHorizontalUndersegmentationSplittingStep
- (CHHorizontalUndersegmentationSplittingStep)initWithAdditionalMathRecognitionBlock:(id)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHHorizontalUndersegmentationSplittingStep

- (CHHorizontalUndersegmentationSplittingStep)initWithAdditionalMathRecognitionBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHHorizontalUndersegmentationSplittingStep;
  v5 = [(CHHorizontalUndersegmentationSplittingStep *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1C8786E90](v4);
    id additionalMathRecognitionBlock = v5->_additionalMathRecognitionBlock;
    v5->_id additionalMathRecognitionBlock = (id)v6;
  }
  return v5;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v638 = *MEMORY[0x1E4F143B8];
  v5 = (void **)a3;
  id v600 = a4;
  long long v619 = 0u;
  long long v620 = 0u;
  long long v621 = 0u;
  long long v622 = 0u;
  v618 = v5;
  if (v5) {
    v11 = objc_msgSend_copy(v5[9], v6, v7, v8, v9, v10);
  }
  else {
    v11 = objc_msgSend_copy(0, v6, v7, v8, v9, v10);
  }
  id obj = v11;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v619, (uint64_t)v633, 16, v13);
  uint64_t v20 = v14;
  if (v14)
  {
    uint64_t v604 = *(void *)v620;
    if (self)
    {
      while (1)
      {
        uint64_t v613 = 0;
        uint64_t v605 = v20;
        do
        {
          if (*(void *)v620 != v604) {
            objc_enumerationMutation(obj);
          }
          v21 = v618;
          if (v618) {
            v21 = (void **)v618[10];
          }
          v22 = *(void **)(*((void *)&v619 + 1) + 8 * v613);
          v23 = v21;
          v24 = NSNumber;
          uint64_t v30 = objc_msgSend_uniqueIdentifier(v22, v25, v26, v27, v28, v29);
          v35 = objc_msgSend_numberWithInteger_(v24, v31, v30, v32, v33, v34);
          v614 = objc_msgSend_objectForKeyedSubscript_(v23, v36, (uint64_t)v35, v37, v38, v39);

          objc_msgSend_mathResult(v614, v40, v41, v42, v43, v44);
          id v45 = (id)objc_claimAutoreleasedReturnValue();
          id v617 = v22;
          v56 = objc_msgSend_topTranscription(v45, v46, v47, v48, v49, v50);
          if (!v45) {
            goto LABEL_13;
          }
          v57 = objc_msgSend_strokeIndexes(v45, v51, v52, v53, v54, v55);
          uint64_t v63 = objc_msgSend_count(v57, v58, v59, v60, v61, v62);
          v69 = objc_msgSend_strokeIdentifiers(v617, v64, v65, v66, v67, v68);
          LOBYTE(v63) = v63 == objc_msgSend_count(v69, v70, v71, v72, v73, v74);

          if ((v63 & 1) == 0
            || (objc_msgSend_containsString_(v56, v75, @"\\hline", v76, v77, v78) & 1) != 0)
          {
LABEL_13:

            id v83 = v45;
            goto LABEL_14;
          }
          v86 = objc_msgSend_componentsSeparatedByString_(v56, v79, @"=", v80, v81, v82);
          BOOL v92 = (unint64_t)objc_msgSend_count(v86, v87, v88, v89, v90, v91) > 2;

          if (v92)
          {
            objc_msgSend_mathResult(v614, v93, v94, v95, v96, v97);
            id v98 = (id)objc_claimAutoreleasedReturnValue();
            v635 = 0;
            v636 = 0;
            uint64_t v637 = 0;
            id v606 = v98;
            v102 = objc_msgSend_syntaxAllowedSplitsForResult_outSubResultBounds_(CHMathUtilities, v99, (uint64_t)v98, (uint64_t)&v635, v100, v101);
            uint64_t v108 = objc_msgSend_count(v102, v103, v104, v105, v106, v107);
            if (v108 != (v636 - (unsigned char *)v635) >> 5)
            {
              v601 = 0;
              goto LABEL_177;
            }
            objc_msgSend_baseCharacterHeight(v606, v109, v110, v111, v112, v113);
            v119 = 0;
            v120 = 0;
            v121 = 0;
            unint64_t v122 = 0;
            float v124 = v123;
            long long v629 = 0uLL;
            *(void *)&long long v630 = 0;
            v610 = v102;
            while (2)
            {
              if (v122 < objc_msgSend_count(v102, v114, v115, v116, v117, v118))
              {
                v129 = objc_msgSend_objectAtIndexedSubscript_(v102, v125, v122, v126, v127, v128);
                if (objc_msgSend_count(v129, v130, v131, v132, v133, v134) == 1)
                {
                  v139 = objc_msgSend_objectAtIndexedSubscript_(v129, v135, 0, v136, v137, v138);
                  v145 = objc_msgSend_string(v139, v140, v141, v142, v143, v144);
                  int isEqualToString = objc_msgSend_isEqualToString_(v145, v146, @"=", v147, v148, v149);

                  v102 = v610;
                  if (isEqualToString)
                  {
                    if (v121 < v119)
                    {
                      *(void *)v121 = v122;
                      uint64_t v151 = (uint64_t)(v121 + 8);
                      goto LABEL_40;
                    }
                    v152 = (char *)v629;
                    v153 = &v121[-v629];
                    uint64_t v154 = (uint64_t)&v121[-v629] >> 3;
                    unint64_t v155 = v154 + 1;
                    if ((unint64_t)(v154 + 1) >> 61) {
                      sub_1C494A220();
                    }
                    if ((uint64_t)&v119[-v629] >> 2 > v155) {
                      unint64_t v155 = (uint64_t)&v119[-v629] >> 2;
                    }
                    if ((unint64_t)&v119[-v629] >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v156 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v156 = v155;
                    }
                    if (v156)
                    {
                      if (v156 >> 61) {
                        sub_1C4949AA8();
                      }
                      v157 = operator new(8 * v156);
                      v120 = (char *)v157 + 8 * v154;
                      *(void *)v120 = v122;
                      uint64_t v151 = (uint64_t)(v120 + 8);
                      int64_t v158 = v121 - v152;
                      if (v121 != v152)
                      {
LABEL_35:
                        unint64_t v159 = v158 - 8;
                        if (v159 < 0x168
                          || (unint64_t v162 = (v121 - 8 - v152) & 0xFFFFFFFFFFFFFFF8,
                              &v153[(void)v157 - 8 - v162] > &v153[(void)v157 - 8])
                          || &v121[-v162 - 8] > v121 - 8
                          || (unint64_t)(v121 - &v153[(void)v157]) < 0x20)
                        {
                          v160 = v121;
                          v102 = v610;
                        }
                        else
                        {
                          uint64_t v163 = (v159 >> 3) + 1;
                          uint64_t v164 = 8 * (v163 & 0x3FFFFFFFFFFFFFFCLL);
                          v160 = &v121[-v164];
                          v120 -= v164;
                          v165 = (char *)v157 + 8 * v154 - 16;
                          v166 = v121 - 16;
                          uint64_t v167 = v163 & 0x3FFFFFFFFFFFFFFCLL;
                          v102 = v610;
                          do
                          {
                            long long v168 = *(_OWORD *)v166;
                            *(v165 - 1) = *((_OWORD *)v166 - 1);
                            _OWORD *v165 = v168;
                            v165 -= 2;
                            v166 -= 32;
                            v167 -= 4;
                          }
                          while (v167);
                          if (v163 == (v163 & 0x3FFFFFFFFFFFFFFCLL))
                          {
LABEL_38:
                            v119 = (char *)v157 + 8 * v156;
                            *(void *)&long long v629 = v120;
                            *(void *)&long long v630 = v119;
                            if (v152) {
                              goto LABEL_39;
                            }
                            goto LABEL_40;
                          }
                        }
                        do
                        {
                          uint64_t v161 = *((void *)v160 - 1);
                          v160 -= 8;
                          *((void *)v120 - 1) = v161;
                          v120 -= 8;
                        }
                        while (v160 != v152);
                        goto LABEL_38;
                      }
                    }
                    else
                    {
                      v157 = 0;
                      v120 = (char *)(8 * v154);
                      *(void *)(8 * v154) = v122;
                      uint64_t v151 = 8 * v154 + 8;
                      int64_t v158 = v121 - v152;
                      if (v121 != v152) {
                        goto LABEL_35;
                      }
                    }
                    v102 = v610;
                    v119 = (char *)v157 + 8 * v156;
                    *(void *)&long long v629 = v120;
                    *(void *)&long long v630 = v119;
                    if (v152) {
LABEL_39:
                    }
                      operator delete(v152);
LABEL_40:
                    *((void *)&v629 + 1) = v151;
                    v121 = (char *)v151;
                  }
                }
                else
                {
                  v102 = v610;
                }

                ++v122;
                continue;
              }
              break;
            }
            if ((unint64_t)(v121 - v120) < 0x10)
            {
              v601 = 0;
              goto LABEL_175;
            }
            v169 = 0;
            v170 = 0;
            __p = 0;
            uint64_t v627 = 0;
            v628 = 0;
            v171 = (CGRect *)v635;
            if (v636 - (unsigned char *)v635 == 32) {
              goto LABEL_88;
            }
            v172 = 0;
            v173 = 0;
            v169 = 0;
            unint64_t v174 = 0;
            while (2)
            {
              double MaxX = CGRectGetMaxX(v171[v174++]);
              CGFloat MinX = CGRectGetMinX(*((CGRect *)v635 + v174));
              float v177 = MaxX;
              *(float *)&CGFloat MinX = MinX;
              float v178 = *(float *)&MinX - v177;
              if (v169 >= v173)
              {
                uint64_t v179 = v169 - v172;
                unint64_t v180 = v179 + 1;
                if ((unint64_t)(v179 + 1) >> 62) {
                  sub_1C494A220();
                }
                if (((char *)v173 - (char *)v172) >> 1 > v180) {
                  unint64_t v180 = ((char *)v173 - (char *)v172) >> 1;
                }
                if ((unint64_t)((char *)v173 - (char *)v172) >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v181 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v181 = v180;
                }
                if (v181)
                {
                  if (v181 >> 62) {
                    sub_1C4949AA8();
                  }
                  v182 = operator new(4 * v181);
                  v183 = (float *)&v182[4 * v179];
                  float *v183 = v178;
                  uint64_t v184 = (uint64_t)(v183 + 1);
                  int64_t v185 = (char *)v169 - (char *)v172;
                  if (v169 == v172)
                  {
LABEL_74:
                    v173 = (float *)&v182[4 * v181];
                    __p = v183;
                    uint64_t v627 = v184;
                    v628 = v173;
                    if (v172) {
                      operator delete(v172);
                    }
                    v172 = v183;
                    v169 = (float *)v184;
LABEL_58:
                    uint64_t v627 = (uint64_t)v169;
                    v171 = (CGRect *)v635;
                    if (v174 >= ((v636 - (unsigned char *)v635) >> 5) - 1)
                    {
                      v170 = (float *)__p;
LABEL_88:
                      unint64_t v196 = 126 - 2 * __clz(v169 - v170);
                      if (v169 == v170) {
                        uint64_t v197 = 0;
                      }
                      else {
                        uint64_t v197 = v196;
                      }
                      sub_1C4B67C7C((uint64_t)v170, v169, v197, 1);
                      v198 = (uint64_t *)operator new(8uLL);
                      uint64_t *v198 = -1;
                      v624 = (char *)(v198 + 1);
                      v625 = (char *)(v198 + 1);
                      v623 = v198;
                      v120 = (char *)v629;
                      if (*((void *)&v629 + 1) - (void)v629 == 8)
                      {
LABEL_92:
                        uint64_t v204 = objc_msgSend_count(v102, v199, v200, v201, v202, v203) - 1;
                        v205 = v624;
                        if (v624 < v625)
                        {
                          *(void *)v624 = v204;
                          uint64_t v206 = (uint64_t)(v205 + 8);
                          goto LABEL_160;
                        }
                        v280 = v623;
                        v281 = (char *)(v624 - (char *)v623);
                        uint64_t v282 = (v624 - (char *)v623) >> 3;
                        unint64_t v283 = v282 + 1;
                        if ((unint64_t)(v282 + 1) >> 61) {
                          sub_1C494A220();
                        }
                        uint64_t v284 = v625 - (char *)v623;
                        if ((v625 - (char *)v623) >> 2 > v283) {
                          unint64_t v283 = v284 >> 2;
                        }
                        if ((unint64_t)v284 >= 0x7FFFFFFFFFFFFFF8) {
                          unint64_t v285 = 0x1FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v285 = v283;
                        }
                        if (v285)
                        {
                          if (v285 >> 61) {
                            sub_1C4949AA8();
                          }
                          v286 = (char *)operator new(8 * v285);
                          v287 = (uint64_t *)&v286[8 * v282];
                          uint64_t *v287 = v204;
                          uint64_t v206 = (uint64_t)(v287 + 1);
                          int64_t v288 = v205 - (char *)v280;
                          if (v205 == (char *)v280) {
                            goto LABEL_158;
                          }
LABEL_152:
                          unint64_t v289 = v288 - 8;
                          if (v289 < 0x58) {
                            goto LABEL_243;
                          }
                          if ((unint64_t)(v205 - v286 - (void)v281) < 0x20) {
                            goto LABEL_243;
                          }
                          uint64_t v290 = (v289 >> 3) + 1;
                          uint64_t v291 = 8 * (v290 & 0x3FFFFFFFFFFFFFFCLL);
                          v292 = &v205[-v291];
                          v287 = (uint64_t *)((char *)v287 - v291);
                          v293 = &v286[8 * v282 - 16];
                          v294 = v205 - 16;
                          uint64_t v295 = v290 & 0x3FFFFFFFFFFFFFFCLL;
                          do
                          {
                            long long v296 = *(_OWORD *)v294;
                            *((_OWORD *)v293 - 1) = *((_OWORD *)v294 - 1);
                            *(_OWORD *)v293 = v296;
                            v293 -= 32;
                            v294 -= 32;
                            v295 -= 4;
                          }
                          while (v295);
                          v205 = v292;
                          if (v290 != (v290 & 0x3FFFFFFFFFFFFFFCLL))
                          {
LABEL_243:
                            do
                            {
                              uint64_t v297 = *((void *)v205 - 1);
                              v205 -= 8;
                              *--v287 = v297;
                            }
                            while (v205 != (char *)v280);
                          }
                        }
                        else
                        {
                          v286 = 0;
                          v287 = (uint64_t *)(8 * v282);
                          *(void *)(8 * v282) = v204;
                          uint64_t v206 = 8 * v282 + 8;
                          int64_t v288 = v205 - (char *)v280;
                          if (v205 != (char *)v280) {
                            goto LABEL_152;
                          }
                        }
LABEL_158:
                        v623 = v287;
                        v624 = (char *)v206;
                        v625 = &v286[8 * v285];
                        if (v280) {
                          operator delete(v280);
                        }
LABEL_160:
                        v624 = (char *)v206;
                        v298 = v623;
                        if (v206 - (void)v623 == 16)
                        {
                          v601 = 0;
                        }
                        else
                        {
                          if (qword_1EA3CA000 != -1) {
                            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                          }
                          v299 = (id)qword_1EA3C9FA8;
                          if (os_log_type_enabled(v299, OS_LOG_TYPE_DEBUG))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl(&dword_1C492D000, v299, OS_LOG_TYPE_DEBUG, "CHHorizontalUndersegmentationSplittingStep found a viable split", buf, 2u);
                          }

                          v601 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v300, v301, v302, v303, v304);
                          v298 = v623;
                          if (v624 - (char *)v623 != 8)
                          {
                            unint64_t v310 = 0;
                            do
                            {
                              v315 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v305, v306, v307, v308, v309);
                              uint64_t v316 = v623[v310++];
                              while (v316 < v623[v310])
                              {
                                v317 = objc_msgSend_objectAtIndexedSubscript_(v102, v311, ++v316, v312, v313, v314);
                                objc_msgSend_addObjectsFromArray_(v315, v318, (uint64_t)v317, v319, v320, v321);
                              }
                              v322 = [CHTokenizedMathResult alloc];
                              *(void *)buf = v315;
                              v326 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v323, (uint64_t)buf, 1, v324, v325);
                              v331 = objc_msgSend_initWithBestPathTokens_(v322, v327, (uint64_t)v326, v328, v329, v330);
                              objc_msgSend_addObject_(v601, v332, (uint64_t)v331, v333, v334, v335);

                              v298 = v623;
                            }
                            while (v310 < ((v624 - (char *)v623) >> 3) - 1);
                          }
                        }
                        if (v298)
                        {
                          v624 = (char *)v298;
                          operator delete(v298);
                        }
                        if (__p) {
                          operator delete(__p);
                        }
LABEL_175:
                        if (v120)
                        {
                          *((void *)&v629 + 1) = v120;
                          operator delete(v120);
                        }
LABEL_177:

                        if (v635)
                        {
                          v636 = v635;
                          operator delete(v635);
                        }

                        v341 = objc_msgSend_mathResult(v614, v336, v337, v338, v339, v340);
                        objc_msgSend_updateStrokeIndexOffsetForSubResults_fromResult_(CHTokenizedMathResult, v342, (uint64_t)v601, (uint64_t)v341, v343, v344);
                        id v45 = (id)objc_claimAutoreleasedReturnValue();

                        id v83 = v601;
                        if (v601)
                        {
                          id v345 = v601;
                          long long v629 = 0u;
                          long long v630 = 0u;
                          long long v631 = 0u;
                          long long v632 = 0u;
                          id v83 = v345;
                          uint64_t v353 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v346, (uint64_t)&v629, (uint64_t)&v635, 16, v347);
                          if (v353)
                          {
                            uint64_t v354 = *(void *)v630;
                            while (2)
                            {
                              for (uint64_t i = 0; i != v353; ++i)
                              {
                                if (*(void *)v630 != v354) {
                                  objc_enumerationMutation(v83);
                                }
                                v356 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v629 + 1) + 8 * i), v348, v349, v350, v351, v352);
                                BOOL v362 = objc_msgSend_count(v356, v357, v358, v359, v360, v361) == 0;

                                if (v362)
                                {

                                  goto LABEL_14;
                                }
                              }
                              uint64_t v353 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v348, (uint64_t)&v629, (uint64_t)&v635, 16, v352);
                              if (v353) {
                                continue;
                              }
                              break;
                            }
                          }

                          v603 = objc_msgSend_inputStrokeIdentifiers(v614, v363, v364, v365, v366, v367);
                          for (unint64_t j = 0; j < objc_msgSend_count(v83, v368, v369, v370, v371, v372); ++j)
                          {
                            v377 = objc_msgSend_objectAtIndexedSubscript_(v83, v373, j, v374, v375, v376);
                            v607 = objc_msgSend_strokeIndexes(v377, v378, v379, v380, v381, v382);
                            v387 = objc_msgSend_objectsAtIndexes_(v603, v383, (uint64_t)v607, v384, v385, v386);
                            v393 = objc_msgSend_firstObject(v387, v388, v389, v390, v391, v392);
                            v609 = objc_msgSend_lastObject(v387, v394, v395, v396, v397, v398);
                            objc_msgSend_bounds(v377, v399, v400, v401, v402, v403);
                            v409 = objc_msgSend_groupingManager(self, v404, v405, v406, v407, v408);
                            v415 = objc_msgSend_strokeProvider(v409, v410, v411, v412, v413, v414);
                            BOOL v416 = v415 == 0;

                            if (!v416)
                            {
                              v422 = objc_msgSend_groupingManager(self, v417, v418, v419, v420, v421);
                              v428 = objc_msgSend_strokeProvider(v422, v423, v424, v425, v426, v427);
                              v432 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v429, (uint64_t)v393, (uint64_t)v428, v430, v431);
                              objc_msgSend_bounds(v432, v433, v434, v435, v436, v437);
                            }
                            v438 = [CHStrokeGroup alloc];
                            uint64_t v444 = objc_msgSend_ancestorIdentifier(v617, v439, v440, v441, v442, v443);
                            v449 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v445, (uint64_t)v387, v446, v447, v448);
                            objc_msgSend_bounds(v377, v450, v451, v452, v453, v454);
                            StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v438, v455, v444, (uint64_t)v449, (uint64_t)v393, (uint64_t)v609, 3, @"CHGroupingPostProcessingManager");

                            if (v618) {
                              v457 = v618[9];
                            }
                            else {
                              v457 = 0;
                            }
                            id v458 = v457;
                            objc_msgSend_addObject_(v458, v459, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v460, v461, v462);

                            if (!objc_msgSend_saveInputDrawings(self, v463, v464, v465, v466, v467)
                              || (objc_msgSend_groupingManager(self, v468, v469, v470, v471, v472),
                                  v473 = objc_claimAutoreleasedReturnValue(),
                                  BOOL v474 = v473 == 0,
                                  v473,
                                  v474))
                            {
                              v477 = 0;
                            }
                            else
                            {
                              v475 = objc_msgSend_groupingManager(self, v468, v469, v470, v471, v472);
                              v477 = objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(v475, v476, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, 0, 0, 0, 0, 0.0, 0.0);
                            }
                            v478 = objc_msgSend_cachedRecognitionResultsFromPostProcessing(v618, v468, v469, v470, v471, v472);
                            v484 = objc_msgSend_strokeIdentifiers(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v479, v480, v481, v482, v483);
                            v489 = objc_msgSend_objectForKeyedSubscript_(v478, v485, (uint64_t)v484, v486, v487, v488);

                            if (!v489)
                            {
                              id additionalMathRecognitionBlock = (void (**)(id, void *, void))self->_additionalMathRecognitionBlock;
                              if (additionalMathRecognitionBlock) {
                                additionalMathRecognitionBlock[2](additionalMathRecognitionBlock, StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, 0);
                              }
                              else {
                              v496 = objc_msgSend_objectAtIndexedSubscript_(v45, v490, j, v492, v493, v494);
                              }
                              v497 = [CHStrokeGroupRecognitionResult alloc];
                              v489 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v497, v498, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08], v496, v387, v477, 0, v600);
                            }
                            v499 = objc_msgSend_strokeIdentifiers(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v490, v491, v492, v493, v494);
                            id v500 = v489;
                            id v501 = v499;
                            v505 = v501;
                            if (v618)
                            {
                              objc_msgSend_setObject_forKeyedSubscript_(v618[1], v502, (uint64_t)v500, (uint64_t)v501, v503, v504);
                              objc_msgSend_setObject_forKeyedSubscript_(v618[2], v506, (uint64_t)v500, (uint64_t)v505, v507, v508);

                              v509 = v618[10];
                            }
                            else
                            {

                              v509 = 0;
                            }
                            id v510 = v509;
                            v511 = NSNumber;
                            uint64_t v517 = objc_msgSend_uniqueIdentifier(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v512, v513, v514, v515, v516);
                            v522 = objc_msgSend_numberWithInteger_(v511, v518, v517, v519, v520, v521);
                            objc_msgSend_setObject_forKey_(v510, v523, (uint64_t)v500, (uint64_t)v522, v524, v525);
                          }
                          v526 = v618;
                          if (v618) {
                            v526 = (void **)v618[9];
                          }
                          v527 = v526;
                          objc_msgSend_removeObject_(v527, v528, (uint64_t)v617, v529, v530, v531);

                          if (v618) {
                            v532 = v618[10];
                          }
                          else {
                            v532 = 0;
                          }
                          id v533 = v532;
                          v534 = NSNumber;
                          uint64_t v540 = objc_msgSend_uniqueIdentifier(v617, v535, v536, v537, v538, v539);
                          v545 = objc_msgSend_numberWithInteger_(v534, v541, v540, v542, v543, v544);
                          objc_msgSend_removeObjectForKey_(v533, v546, (uint64_t)v545, v547, v548, v549);
                        }
LABEL_14:

                        goto LABEL_15;
                      }
                      uint64_t v207 = 0;
                      uint64_t v208 = (uint64_t)(*((void *)&v629 + 1) - v629) >> 3;
                      uint64_t v608 = v208 - 2;
                      unint64_t v209 = v208 - 1;
                      if (v209 <= 1) {
                        uint64_t v210 = 1;
                      }
                      else {
                        uint64_t v210 = v209;
                      }
                      while (2)
                      {
                        int64_t v212 = *(void *)&v120[8 * v207++];
                        int64_t v213 = *(void *)&v120[8 * v207];
                        if (v212 >= v213)
                        {
                          unint64_t v215 = 0x7FFFFFFFFFFFFFFFLL;
                          float v216 = -INFINITY;
                        }
                        else
                        {
                          uint64_t v214 = 32 * v212 + 56;
                          unint64_t v215 = 0x7FFFFFFFFFFFFFFFLL;
                          float v216 = -INFINITY;
                          do
                          {
                            double v217 = CGRectGetMaxX(*(CGRect *)((char *)v635 + v214 - 56));
                            CGFloat v218 = CGRectGetMinX(*(CGRect *)((char *)v635 + v214 - 24));
                            float v219 = v217;
                            *(float *)&CGFloat v218 = v218;
                            float v220 = *(float *)&v218 - v219;
                            if (v220 > v216) {
                              unint64_t v215 = v212;
                            }
                            int64_t v221 = v212 + 1;
                            if (v220 > v216) {
                              float v216 = v220;
                            }
                            v214 += 32;
                            ++v212;
                          }
                          while (v213 != v221);
                        }
                        if (v215 >= objc_msgSend_count(v102, v199, v200, v201, v202, v203)
                          || (objc_msgSend_objectAtIndexedSubscript_(v102, v199, v215, v201, v202, v203),
                              (v222 = objc_claimAutoreleasedReturnValue()) == 0)
                          || (objc_msgSend_objectAtIndexedSubscript_(v102, v199, v215, v201, v202, v203),
                              v223 = objc_claimAutoreleasedReturnValue(),
                              BOOL v229 = objc_msgSend_count(v223, v224, v225, v226, v227, v228) == 0,
                              v223,
                              v222,
                              v229))
                        {
                          float v258 = 0.7;
                        }
                        else
                        {
                          v230 = objc_msgSend_objectAtIndexedSubscript_(v102, v199, v215, v201, v202, v203);
                          v235 = objc_msgSend_objectAtIndexedSubscript_(v102, v231, v215, v232, v233, v234);
                          uint64_t v241 = objc_msgSend_count(v235, v236, v237, v238, v239, v240);
                          v246 = objc_msgSend_objectAtIndexedSubscript_(v230, v242, v241 - 1, v243, v244, v245);
                          v252 = objc_msgSend_string(v246, v247, v248, v249, v250, v251);
                          int v257 = objc_msgSend_isEqualToString_(v252, v253, @"=", v254, v255, v256);

                          float v258 = 0.7;
                          if (v257) {
                            float v258 = 1.25;
                          }
                        }
                        if (v216 < (float)(v258 * v124) || v216 < *((float *)__p + v608)) {
                          goto LABEL_99;
                        }
                        v260 = v624;
                        if (v624 < v625)
                        {
                          *(void *)v624 = v215;
                          uint64_t v211 = (uint64_t)(v260 + 8);
                          goto LABEL_98;
                        }
                        v261 = v623;
                        v262 = (char *)(v624 - (char *)v623);
                        uint64_t v263 = (v624 - (char *)v623) >> 3;
                        unint64_t v264 = v263 + 1;
                        if ((unint64_t)(v263 + 1) >> 61) {
                          sub_1C494A220();
                        }
                        uint64_t v265 = v625 - (char *)v623;
                        if ((v625 - (char *)v623) >> 2 > v264) {
                          unint64_t v264 = v265 >> 2;
                        }
                        if ((unint64_t)v265 >= 0x7FFFFFFFFFFFFFF8) {
                          unint64_t v266 = 0x1FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v266 = v264;
                        }
                        if (v266)
                        {
                          if (v266 >> 61) {
                            sub_1C4949AA8();
                          }
                          v267 = (char *)operator new(8 * v266);
                          v268 = (unint64_t *)&v267[8 * v263];
                          unint64_t *v268 = v215;
                          uint64_t v211 = (uint64_t)(v268 + 1);
                          int64_t v269 = v260 - (char *)v261;
                          if (v260 != (char *)v261)
                          {
LABEL_130:
                            unint64_t v270 = v269 - 8;
                            if (v270 < 0x58)
                            {
                              v102 = v610;
                              goto LABEL_138;
                            }
                            unint64_t v271 = v260 - v267 - (void)v262;
                            v102 = v610;
                            if (v271 < 0x20) {
                              goto LABEL_244;
                            }
                            uint64_t v272 = (v270 >> 3) + 1;
                            uint64_t v273 = 8 * (v272 & 0x3FFFFFFFFFFFFFFCLL);
                            v274 = &v260[-v273];
                            v268 = (unint64_t *)((char *)v268 - v273);
                            v275 = &v267[8 * v263 - 16];
                            v276 = v260 - 16;
                            uint64_t v277 = v272 & 0x3FFFFFFFFFFFFFFCLL;
                            do
                            {
                              long long v278 = *(_OWORD *)v276;
                              *((_OWORD *)v275 - 1) = *((_OWORD *)v276 - 1);
                              *(_OWORD *)v275 = v278;
                              v275 -= 32;
                              v276 -= 32;
                              v277 -= 4;
                            }
                            while (v277);
                            v260 = v274;
                            if (v272 != (v272 & 0x3FFFFFFFFFFFFFFCLL))
                            {
LABEL_244:
                              do
                              {
LABEL_138:
                                unint64_t v279 = *((void *)v260 - 1);
                                v260 -= 8;
                                *--v268 = v279;
                              }
                              while (v260 != (char *)v261);
                            }
LABEL_139:
                            v623 = (uint64_t *)v268;
                            v624 = (char *)v211;
                            v625 = &v267[8 * v266];
                            if (v261) {
                              operator delete(v261);
                            }
LABEL_98:
                            v624 = (char *)v211;
LABEL_99:
                            if (v207 == v210) {
                              goto LABEL_92;
                            }
                            continue;
                          }
                        }
                        else
                        {
                          v267 = 0;
                          v268 = (unint64_t *)(8 * v263);
                          *(void *)(8 * v263) = v215;
                          uint64_t v211 = 8 * v263 + 8;
                          int64_t v269 = v260 - (char *)v261;
                          if (v260 != (char *)v261) {
                            goto LABEL_130;
                          }
                        }
                        break;
                      }
                      v102 = v610;
                      goto LABEL_139;
                    }
                    continue;
                  }
                }
                else
                {
                  v182 = 0;
                  v183 = (float *)(4 * v179);
                  *(float *)(4 * v179) = v178;
                  uint64_t v184 = 4 * v179 + 4;
                  int64_t v185 = (char *)v169 - (char *)v172;
                  if (v169 == v172) {
                    goto LABEL_74;
                  }
                }
                unint64_t v186 = v185 - 4;
                if (v186 >= 0xBC)
                {
                  unint64_t v189 = ((char *)(v169 - 1) - (char *)v172) & 0xFFFFFFFFFFFFFFFCLL;
                  if (&v182[(char *)v169 - (char *)v172 - 4 - v189] > &v182[(char *)v169 - (char *)v172 - 4])
                  {
                    v187 = v169;
                  }
                  else if ((float *)((char *)v169 - v189 - 4) > v169 - 1)
                  {
                    v187 = v169;
                  }
                  else if ((unint64_t)((char *)v172 - v182) >= 0x20)
                  {
                    uint64_t v190 = (v186 >> 2) + 1;
                    uint64_t v191 = 4 * (v190 & 0x7FFFFFFFFFFFFFF8);
                    v187 = &v169[v191 / 0xFFFFFFFFFFFFFFFCLL];
                    v183 = (float *)((char *)v183 - v191);
                    v192 = &v182[4 * v179 - 16];
                    v193 = v169 - 4;
                    uint64_t v194 = v190 & 0x7FFFFFFFFFFFFFF8;
                    do
                    {
                      long long v195 = *(_OWORD *)v193;
                      *(v192 - 1) = *((_OWORD *)v193 - 1);
                      _OWORD *v192 = v195;
                      v192 -= 2;
                      v193 -= 8;
                      v194 -= 8;
                    }
                    while (v194);
                    if (v190 == (v190 & 0x7FFFFFFFFFFFFFF8)) {
                      goto LABEL_74;
                    }
                  }
                  else
                  {
                    v187 = v169;
                  }
                }
                else
                {
                  v187 = v169;
                }
                do
                {
                  int v188 = *((_DWORD *)v187-- - 1);
                  *((_DWORD *)v183-- - 1) = v188;
                }
                while (v187 != v172);
                goto LABEL_74;
              }
              break;
            }
            *v169++ = v178;
            goto LABEL_58;
          }
LABEL_15:

          ++v613;
        }
        while (v613 != v605);
        uint64_t v550 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v619, (uint64_t)v633, 16, v85);
        uint64_t v20 = v550;
        if (!v550) {
          goto LABEL_216;
        }
      }
    }
    if (v5)
    {
      do
      {
        uint64_t v552 = v14;
        for (uint64_t k = 0; k != v552; ++k)
        {
          if (*(void *)v620 != v604) {
            objc_enumerationMutation(obj);
          }
          v554 = *(void **)(*((void *)&v619 + 1) + 8 * k);
          id v555 = v618[10];
          v556 = NSNumber;
          uint64_t v562 = objc_msgSend_uniqueIdentifier(v554, v557, v558, v559, v560, v561);
          v567 = objc_msgSend_numberWithInteger_(v556, v563, v562, v564, v565, v566);
          v615 = objc_msgSend_objectForKeyedSubscript_(v555, v568, (uint64_t)v567, v569, v570, v571);

          objc_msgSend_mathResult(v615, v572, v573, v574, v575, v576);
          id v577 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v578, (uint64_t)&v619, (uint64_t)v633, 16, v579);
      }
      while (v14);
    }
    else
    {
      do
      {
        uint64_t v580 = v14;
        for (uint64_t m = 0; m != v580; ++m)
        {
          if (*(void *)v620 != v604) {
            objc_enumerationMutation(obj);
          }
          v582 = *(void **)(*((void *)&v619 + 1) + 8 * m);
          v583 = NSNumber;
          uint64_t v584 = objc_msgSend_uniqueIdentifier(v582, v15, v16, v17, v18, v19);
          v589 = objc_msgSend_numberWithInteger_(v583, v585, v584, v586, v587, v588);
          v616 = objc_msgSend_objectForKeyedSubscript_(0, v590, (uint64_t)v589, v591, v592, v593);

          objc_msgSend_mathResult(v616, v594, v595, v596, v597, v598);
          id v599 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v619, (uint64_t)v633, 16, v19);
      }
      while (v14);
    }
  }
LABEL_216:

  return v618;
}

- (void).cxx_destruct
{
}

@end