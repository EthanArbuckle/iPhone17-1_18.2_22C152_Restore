@interface CHCornerDetector
- (BOOL)shouldUseDynamicSampling;
- (CHCornerDetector)init;
- (CHDrawing)drawing;
- (CHDrawing)resampledDrawing;
- (double)minimumSignificantSegmentLength;
- (id).cxx_construct;
- (id)cornerIndexes;
- (id)directionChangeCornerIndexes;
- (unint64_t)directionChangeCount;
- (unint64_t)highestDirectionChangeCount;
- (void)setDrawing:(id)a3;
- (void)setMinimumSignificantSegmentLength:(double)a3;
- (void)setShouldUseDynamicSampling:(BOOL)a3;
@end

@implementation CHCornerDetector

- (CHCornerDetector)init
{
  v21.receiver = self;
  v21.super_class = (Class)CHCornerDetector;
  v2 = [(CHCornerDetector *)&v21 init];
  v3 = v2;
  if (v2)
  {
    drawing = v2->_drawing;
    v2->_drawing = 0;

    resampledDrawing = v3->_resampledDrawing;
    v3->_resampledDrawing = 0;

    v3->_minimumSignificantSegmentLength = 35.0;
    v3->_shouldUseDynamicSampling = 1;
    v3->__strawSize = 3;
    uint64_t v11 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v6, v7, v8, v9, v10);
    cornerIndexSet = v3->__cornerIndexSet;
    v3->__cornerIndexSet = (NSMutableIndexSet *)v11;

    uint64_t v18 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v13, v14, v15, v16, v17);
    directionChangeCornerIndexes = v3->__directionChangeCornerIndexes;
    v3->__directionChangeCornerIndexes = (NSMutableIndexSet *)v18;

    v3->_directionChangeCount = 0;
    v3->_highestDirectionChangeCount = 0;
  }
  return v3;
}

- (void)setDrawing:(id)a3
{
  uint64_t v677 = *MEMORY[0x1E4F143B8];
  id v626 = a3;
  if (objc_msgSend_isEqualToDrawing_(self->_drawing, v4, (uint64_t)v626, v5, v6, v7)) {
    goto LABEL_125;
  }
  self->_directionChangeCount = 0;
  if ((objc_msgSend_isPrefixForDrawing_(self->_drawing, v8, (uint64_t)v626, v9, v10, v11) & 1) == 0) {
    self->_unint64_t highestDirectionChangeCount = 0;
  }
  uint64_t v17 = (CHDrawing *)objc_msgSend_copy(v626, v12, v13, v14, v15, v16);
  drawing = self->_drawing;
  self->_drawing = v17;

  __p = 0;
  v653 = 0;
  uint64_t v654 = 0;
  objc_msgSend_drawing(self, v19, v20, v21, v22, v23);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  double v35 = 5.0;
  if (objc_msgSend_shouldUseDynamicSampling(self, v25, v26, v27, v28, v29))
  {
    objc_msgSend_bounds(v24, v30, v31, v32, v33, v34);
    CGFloat x = v679.origin.x;
    CGFloat y = v679.origin.y;
    CGFloat width = v679.size.width;
    CGFloat height = v679.size.height;
    double MinX = CGRectGetMinX(v679);
    v680.origin.CGFloat x = x;
    v680.origin.CGFloat y = y;
    v680.size.CGFloat width = width;
    v680.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v680);
    v681.origin.CGFloat x = x;
    v681.origin.CGFloat y = y;
    v681.size.CGFloat width = width;
    v681.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v681);
    v682.origin.CGFloat x = x;
    v682.origin.CGFloat y = y;
    v682.size.CGFloat width = width;
    v682.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v682);
    v43.f32[0] = MinX;
    float32_t v44 = MinY;
    v43.f32[1] = v44;
    v45.f64[0] = MaxX;
    v45.f64[1] = MaxY;
    float32x2_t v46 = vsub_f32(v43, vcvt_f32_f64(v45));
    double v35 = sqrtf(vaddv_f32(vmul_f32(v46, v46))) * 0.025;
  }

  objc_msgSend_drawingSpatiallyResampled_outputPointMap_(v24, v47, (uint64_t)&__p, v48, v49, v50, v35);
  v51 = (CHDrawing *)objc_claimAutoreleasedReturnValue();

  resampledDrawing = self->_resampledDrawing;
  self->_resampledDrawing = v51;

  p_resampledDrawingPointMap = &self->__resampledDrawingPointMap;
  if (&self->__resampledDrawingPointMap != (vector<std::map<long, long>, std::allocator<std::map<long, long>>> *)&__p)
  {
    v59 = (char *)__p;
    v58 = v653;
    unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((v653 - (unsigned char *)__p) >> 3);
    uint64_t value = (uint64_t)self->__resampledDrawingPointMap.__end_cap_.__value_;
    begiuint64_t n = (char *)self->__resampledDrawingPointMap.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * ((value - (uint64_t)begin) >> 3) < v60)
    {
      if (begin)
      {
        end = (char *)self->__resampledDrawingPointMap.__end_;
        v64 = self->__resampledDrawingPointMap.__begin_;
        if (end != begin)
        {
          do
          {
            v65 = end - 24;
            sub_1C4999C7C((uint64_t)(end - 24), *((void **)end - 2));
            end = v65;
          }
          while (v65 != begin);
          v64 = p_resampledDrawingPointMap->__begin_;
        }
        self->__resampledDrawingPointMap.__end_ = begin;
        operator delete(v64);
        uint64_t value = 0;
        p_resampledDrawingPointMap->__begin_ = 0;
        self->__resampledDrawingPointMap.__end_ = 0;
        self->__resampledDrawingPointMap.__end_cap_.__value_ = 0;
      }
      if (v60 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_130;
      }
      unint64_t v66 = 0xAAAAAAAAAAAAAAABLL * (value >> 3);
      uint64_t v67 = 2 * v66;
      if (2 * v66 <= v60) {
        uint64_t v67 = v60;
      }
      unint64_t v68 = v66 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v67;
      if (v68 > 0xAAAAAAAAAAAAAAALL) {
LABEL_130:
      }
        sub_1C494A220();
      v69 = (char *)operator new(24 * v68);
      self->__resampledDrawingPointMap.__begin_ = v69;
      self->__resampledDrawingPointMap.__end_ = v69;
      self->__resampledDrawingPointMap.__end_cap_.__value_ = &v69[24 * v68];
      if (v59 != v58)
      {
        unint64_t v70 = 0;
        do
        {
          v71 = &v69[v70];
          *((void *)v71 + 2) = 0;
          *(void *)&v69[v70 + 8] = 0;
          *(void *)v71 = &v69[v70 + 8];
          sub_1C49CA4EC(&v69[v70], *(void **)&v59[v70], &v59[v70 + 8]);
          v70 += 24;
        }
        while (&v59[v70] != v58);
        v69 += v70;
      }
      self->__resampledDrawingPointMap.__end_ = v69;
      goto LABEL_45;
    }
    v72 = (char *)self->__resampledDrawingPointMap.__end_;
    unint64_t v73 = 0xAAAAAAAAAAAAAAABLL * ((v72 - begin) >> 3);
    if (v73 < v60)
    {
      if (v72 != begin)
      {
        uint64_t v74 = 8 * ((v72 - begin) >> 3);
        v75 = (char *)__p + 8;
        v76 = (char *)__p;
        do
        {
          if (v76 != begin) {
            sub_1C49E2994((uint64_t)begin, *(void **)v76, v75);
          }
          v76 += 24;
          begin += 24;
          v75 += 3;
          v74 -= 24;
        }
        while (v74);
        begiuint64_t n = (char *)self->__resampledDrawingPointMap.__end_;
      }
      v79 = &v59[24 * v73];
      v80 = begin;
      if (v79 != v58)
      {
        unint64_t v81 = 0;
        uint64_t v82 = (uint64_t)&v59[24 * v73 + 8];
        do
        {
          v83 = &begin[v81];
          *((void *)v83 + 2) = 0;
          *(void *)&begin[v81 + 8] = 0;
          *(void *)v83 = &begin[v81 + 8];
          sub_1C49CA4EC(&begin[v81], *(void **)&v79[v81], (void *)(v82 + v81));
          v81 += 24;
        }
        while (&v79[v81] != v58);
        v80 = &begin[v81];
      }
      self->__resampledDrawingPointMap.__end_ = v80;
      goto LABEL_45;
    }
    if (__p == v653)
    {
      v78 = (char *)self->__resampledDrawingPointMap.__begin_;
      if (v72 == begin)
      {
LABEL_44:
        self->__resampledDrawingPointMap.__end_ = v78;
        goto LABEL_45;
      }
    }
    else
    {
      v77 = (char *)__p + 8;
      v78 = (char *)self->__resampledDrawingPointMap.__begin_;
      do
      {
        if (v59 != begin) {
          sub_1C49E2994((uint64_t)begin, *(void **)v59, v77);
        }
        v59 += 24;
        begin += 24;
        v78 += 24;
        v77 += 3;
      }
      while (v59 != v58);
      v72 = (char *)self->__resampledDrawingPointMap.__end_;
      if (v72 == v78) {
        goto LABEL_44;
      }
    }
    do
    {
      v84 = v72 - 24;
      sub_1C4999C7C((uint64_t)(v72 - 24), *((void **)v72 - 2));
      v72 = v84;
    }
    while (v84 != v78);
    goto LABEL_44;
  }
LABEL_45:
  objc_msgSend_removeAllIndexes(self->__cornerIndexSet, v53, v54, v55, v56, v57, p_resampledDrawingPointMap);
  v627 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v85, v86, v87, v88, v89);
  v647 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v90, v91, v92, v93, v94);
  objc_msgSend_addObject_(v627, v95, (uint64_t)&unk_1F203E298, v96, v97, v98);
  for (int64_t i = self->__strawSize; ; ++i)
  {
    v105 = objc_msgSend_resampledDrawing(self, v99, v100, v101, v102, v103);
    BOOL v110 = i < (int64_t)(objc_msgSend_pointCountForStrokeIndex_(v105, v106, 0, v107, v108, v109)
                              - self->__strawSize);

    if (!v110) {
      break;
    }
    v116 = objc_msgSend_resampledDrawing(self, v111, v112, v113, v114, v115);
    unint64_t strawSize = self->__strawSize;
    id v118 = v116;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v118, v119, 0, i - strawSize, v120, v121);
    float64_t v641 = v123;
    float64_t v644 = v122;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v118, v124, 0, i + strawSize, v125, v126);
    float64_t v636 = v128;
    float64_t v638 = v127;

    v129.f64[0] = v644;
    v129.f64[1] = v641;
    v130.f64[0] = v638;
    v130.f64[1] = v636;
    *(float32x2_t *)&v129.f64[0] = vsub_f32(vcvt_f32_f64(v129), vcvt_f32_f64(v130));
    v136 = objc_msgSend_numberWithDouble_(NSNumber, v131, v132, v133, v134, v135, sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v129.f64[0], *(float32x2_t *)&v129.f64[0]))));
    v141 = objc_msgSend_numberWithInteger_(NSNumber, v137, i, v138, v139, v140);
    objc_msgSend_setObject_forKeyedSubscript_(v647, v142, (uint64_t)v136, (uint64_t)v141, v143, v144);
  }
  if (objc_msgSend_count(v647, v111, v112, v113, v114, v115))
  {
    v150 = objc_msgSend_allValues(v647, v145, v146, v147, v148, v149);
    v155 = objc_msgSend_sortedArrayUsingSelector_(v150, v151, (uint64_t)sel_compare_, v152, v153, v154);

    unint64_t v161 = objc_msgSend_count(v155, v156, v157, v158, v159, v160);
    v166 = objc_msgSend_objectAtIndexedSubscript_(v155, v162, v161 >> 1, v163, v164, v165);
    objc_msgSend_floatValue(v166, v167, v168, v169, v170, v171);
    float v173 = v172;

    double v179 = v173 * 0.95;
    for (unint64_t j = self->__strawSize; ; ++j)
    {
      v181 = objc_msgSend_resampledDrawing(self, v174, v175, v176, v177, v178);
      BOOL v186 = j < objc_msgSend_pointCountForStrokeIndex_(v181, v182, 0, v183, v184, v185) - self->__strawSize;

      if (!v186) {
        break;
      }
      v191 = objc_msgSend_numberWithInteger_(NSNumber, v187, j, v188, v189, v190);
      v196 = objc_msgSend_objectForKeyedSubscript_(v647, v192, (uint64_t)v191, v193, v194, v195);
      objc_msgSend_floatValue(v196, v197, v198, v199, v200, v201);
      BOOL v203 = v179 > v202;

      if (v203)
      {
        double v204 = 1.79769313e308;
        uint64_t v205 = j;
        while (j < objc_msgSend_count(v647, v174, v175, v176, v177, v178))
        {
          v210 = objc_msgSend_numberWithInteger_(NSNumber, v206, j, v207, v208, v209);
          v215 = objc_msgSend_objectForKeyedSubscript_(v647, v211, (uint64_t)v210, v212, v213, v214);
          objc_msgSend_floatValue(v215, v216, v217, v218, v219, v220);
          BOOL v222 = v179 > v221;

          if (!v222) {
            break;
          }
          v223 = objc_msgSend_numberWithInteger_(NSNumber, v206, j, v207, v208, v209);
          v228 = objc_msgSend_objectForKeyedSubscript_(v647, v224, (uint64_t)v223, v225, v226, v227);
          objc_msgSend_floatValue(v228, v229, v230, v231, v232, v233);
          BOOL v235 = v204 > v234;

          if (v235)
          {
            v236 = objc_msgSend_numberWithInteger_(NSNumber, v174, j, v176, v177, v178);
            v241 = objc_msgSend_objectForKeyedSubscript_(v647, v237, (uint64_t)v236, v238, v239, v240);
            objc_msgSend_floatValue(v241, v242, v243, v244, v245, v246);
            float v248 = v247;

            double v204 = v248;
            uint64_t v205 = j;
          }
          ++j;
        }
        v249 = objc_msgSend_numberWithInteger_(NSNumber, v206, v205, v207, v208, v209);
        objc_msgSend_addObject_(v627, v250, (uint64_t)v249, v251, v252, v253);
      }
    }
  }
  v254 = NSNumber;
  v255 = objc_msgSend_resampledDrawing(self, v145, v146, v147, v148, v149);
  uint64_t v260 = objc_msgSend_pointCountForStrokeIndex_(v255, v256, 0, v257, v258, v259);
  v265 = objc_msgSend_numberWithUnsignedInteger_(v254, v261, v260 - 1, v262, v263, v264);
  objc_msgSend_addObject_(v627, v266, (uint64_t)v265, v267, v268, v269);

  id v274 = (id)objc_msgSend_sortedArrayUsingSelector_(v627, v270, (uint64_t)sel_compare_, v271, v272, v273);
  objc_msgSend_resampledDrawing(self, v275, v276, v277, v278, v279);
  id v629 = (id)objc_claimAutoreleasedReturnValue();
  id v645 = v627;
  id v628 = v647;
  for (unint64_t k = 1; k < objc_msgSend_count(v645, v280, v281, v282, v283, v284); ++k)
  {
    v290 = objc_msgSend_objectAtIndex_(v645, v286, k - 1, v287, v288, v289);
    uint64_t v296 = objc_msgSend_integerValue(v290, v291, v292, v293, v294, v295);

    v301 = objc_msgSend_objectAtIndex_(v645, v297, k, v298, v299, v300);
    uint64_t v307 = objc_msgSend_integerValue(v301, v302, v303, v304, v305, v306);

    if (!sub_1C49E2550(v629, v296, v307, 0.95))
    {
      id v312 = v628;
      uint64_t v313 = v307 - v296;
      if (v307 < v296) {
        uint64_t v313 = v307 - v296 + 3;
      }
      uint64_t v314 = v313 >> 2;
      if (self->__strawSize <= v314 + v296) {
        int64_t v315 = v314 + v296;
      }
      else {
        int64_t v315 = self->__strawSize;
      }
      int64_t v316 = v307 - v314;
      uint64_t v317 = 0x7FFFFFFFFFFFFFFFLL;
      if (v315 < v316)
      {
        double v318 = 1.79769313e308;
        do
        {
          v319 = objc_msgSend_numberWithInteger_(NSNumber, v308, v315, v309, v310, v311);
          v324 = objc_msgSend_objectForKeyedSubscript_(v312, v320, (uint64_t)v319, v321, v322, v323);
          objc_msgSend_floatValue(v324, v325, v326, v327, v328, v329);
          BOOL v331 = v318 > v330;

          if (v331)
          {
            v332 = objc_msgSend_numberWithInteger_(NSNumber, v308, v315, v309, v310, v311);
            v337 = objc_msgSend_objectForKeyedSubscript_(v312, v333, (uint64_t)v332, v334, v335, v336);
            objc_msgSend_floatValue(v337, v338, v339, v340, v341, v342);
            float v344 = v343;

            double v318 = v344;
            uint64_t v317 = v315;
          }
          ++v315;
        }
        while (v315 < v316);
      }

      v353 = objc_msgSend_numberWithInteger_(NSNumber, v345, v317, v346, v347, v348);
      if (v317 != 0x7FFFFFFFFFFFFFFFLL
        && (objc_msgSend_containsObject_(v645, v349, (uint64_t)v353, v350, v351, v352) & 1) == 0)
      {
        objc_msgSend_insertObject_atIndex_(v645, v354, (uint64_t)v353, k, v355, v356);
        unint64_t k = 1;
      }
    }
  }
  id v357 = v629;
  id v363 = v645;
  unint64_t v364 = 1;
  while (1)
  {
    uint64_t v365 = v364;
    if (v364 >= objc_msgSend_count(v363, v358, v359, v360, v361, v362) - 1) {
      break;
    }
    uint64_t v370 = v364 - 1;
    v371 = objc_msgSend_objectAtIndex_(v363, v366, v364 - 1, v367, v368, v369);
    uint64_t v377 = objc_msgSend_integerValue(v371, v372, v373, v374, v375, v376);

    unint64_t v364 = v365 + 1;
    v382 = objc_msgSend_objectAtIndex_(v363, v378, v365 + 1, v379, v380, v381);
    uint64_t v388 = objc_msgSend_integerValue(v382, v383, v384, v385, v386, v387);

    if (sub_1C49E2550(v357, v377, v388, 0.99))
    {
      objc_msgSend_removeObjectAtIndex_(v363, v358, v365, v360, v361, v362);
      if (v370 <= 1) {
        uint64_t v389 = 1;
      }
      else {
        uint64_t v389 = v365 - 1;
      }
      unint64_t v364 = v389 + 1;
    }
  }

  id v630 = v357;
  id v395 = v363;
  unint64_t v396 = 1;
  while (1)
  {
    uint64_t v397 = v396;
    if (v396 >= objc_msgSend_count(v395, v390, v391, v392, v393, v394) - 1) {
      break;
    }
    uint64_t v402 = v396 - 1;
    v403 = objc_msgSend_objectAtIndex_(v395, v398, v396 - 1, v399, v400, v401);
    uint64_t v409 = objc_msgSend_integerValue(v403, v404, v405, v406, v407, v408);

    v414 = objc_msgSend_objectAtIndex_(v395, v410, v396, v411, v412, v413);
    uint64_t v420 = objc_msgSend_integerValue(v414, v415, v416, v417, v418, v419);

    ++v396;
    v425 = objc_msgSend_objectAtIndex_(v395, v421, v397 + 1, v422, v423, v424);
    uint64_t v431 = objc_msgSend_integerValue(v425, v426, v427, v428, v429, v430);

    id v432 = v630;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v432, v433, 0, v409, v434, v435);
    float64_t v639 = v437;
    float64_t v642 = v436;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v432, v438, 0, v420, v439, v440);
    float64_t v635 = v442;
    float64_t v637 = v441;

    id v443 = v432;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v443, v444, 0, v420, v445, v446);
    float64_t v633 = v448;
    float64_t v634 = v447;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v443, v449, 0, v431, v450, v451);
    float64_t v631 = v453;
    float64_t v632 = v452;

    v454.f64[0] = v642;
    v454.f64[1] = v639;
    v455.f64[0] = v637;
    v455.f64[1] = v635;
    *(float32x2_t *)&v454.f64[0] = vsub_f32(vcvt_f32_f64(v454), vcvt_f32_f64(v455));
    v455.f64[0] = v634;
    v455.f64[1] = v633;
    v456.f64[0] = v632;
    v456.f64[1] = v631;
    *(float32x2_t *)&v455.f64[0] = vsub_f32(vcvt_f32_f64(v455), vcvt_f32_f64(v456));
    if (sub_1C49E2550(v443, v409, v431, dbl_1C4C3A7B0[sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v454.f64[0], *(float32x2_t *)&v454.f64[0])))+ sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v455.f64[0], *(float32x2_t *)&v455.f64[0]))) > 10.0]))
    {
      objc_msgSend_removeObjectAtIndex_(v395, v390, v397, v392, v393, v394);
      if (v402 <= 1) {
        uint64_t v457 = 1;
      }
      else {
        uint64_t v457 = v397 - 1;
      }
      unint64_t v396 = v457 + 1;
    }
  }

  id v640 = v630;
  id v458 = v395;
  id v643 = v628;
  for (uint64_t m = 1; m < (unint64_t)(objc_msgSend_count(v458, v459, v460, v461, v462, v463) - 2); ++m)
  {
    v470 = objc_msgSend_objectAtIndex_(v458, v466, m, v467, v468, v469);
    uint64_t v476 = objc_msgSend_integerValue(v470, v471, v472, v473, v474, v475);

    v481 = objc_msgSend_objectAtIndex_(v458, v477, m + 1, v478, v479, v480);
    uint64_t v487 = objc_msgSend_integerValue(v481, v482, v483, v484, v485, v486);

    uint64_t v488 = v487 - v476;
    if (v487 - v476 < 0) {
      uint64_t v488 = v476 - v487;
    }
    if (v488 == 1)
    {
      v489 = objc_msgSend_numberWithInteger_(NSNumber, v459, v476, v461, v462, v463);
      v494 = objc_msgSend_objectForKeyedSubscript_(v643, v490, (uint64_t)v489, v491, v492, v493);
      objc_msgSend_floatValue(v494, v495, v496, v497, v498, v499);
      float v501 = v500;
      v506 = objc_msgSend_numberWithInteger_(NSNumber, v502, v487, v503, v504, v505);
      v511 = objc_msgSend_objectForKeyedSubscript_(v643, v507, (uint64_t)v506, v508, v509, v510);
      objc_msgSend_floatValue(v511, v512, v513, v514, v515, v516);
      BOOL v518 = v501 > v517;

      if (v518) {
        objc_msgSend_removeObjectAtIndex_(v458, v519, m, v520, v521, v522);
      }
      else {
        objc_msgSend_removeObjectAtIndex_(v458, v519, m + 1, v520, v521, v522);
      }
      uint64_t v465 = 2;
      if (m > 2) {
        uint64_t v465 = m;
      }
      uint64_t m = v465 - 1;
    }
  }

  id v523 = v458;
  long long v650 = 0u;
  long long v651 = 0u;
  long long v648 = 0u;
  long long v649 = 0u;
  id v524 = v523;
  uint64_t v527 = objc_msgSend_countByEnumeratingWithState_objects_count_(v524, v525, (uint64_t)&v648, (uint64_t)v676, 16, v526);
  if (v527)
  {
    uint64_t v528 = *(void *)v649;
    do
    {
      for (uint64_t n = 0; n != v527; ++n)
      {
        if (*(void *)v649 != v528) {
          objc_enumerationMutation(v524);
        }
        v530 = *(void **)(*((void *)&v648 + 1) + 8 * n);
        v531 = self->__cornerIndexSet;
        uint64_t v537 = objc_msgSend_unsignedIntegerValue(v530, v532, v533, v534, v535, v536);
        objc_msgSend_addIndex_(v531, v538, v537, v539, v540, v541);
      }
      uint64_t v527 = objc_msgSend_countByEnumeratingWithState_objects_count_(v524, v542, (uint64_t)&v648, (uint64_t)v676, 16, v543);
    }
    while (v527);
  }

  uint64_t v666 = 0;
  v667 = (double *)&v666;
  uint64_t v668 = 0x2020000000;
  uint64_t v669 = 0;
  uint64_t v662 = 0;
  v663 = &v662;
  uint64_t v664 = 0x2020000000;
  uint64_t v665 = 0;
  v549 = objc_msgSend_cornerIndexes(self, v544, v545, v546, v547, v548);
  IndeCGFloat x = objc_msgSend_firstIndex(v549, v550, v551, v552, v553, v554);

  uint64_t v665 = Index;
  v561 = objc_msgSend_cornerIndexes(self, v556, v557, v558, v559, v560);
  v661[0] = MEMORY[0x1E4F143A8];
  v661[1] = 3221225472;
  v661[2] = sub_1C49E212C;
  v661[3] = &unk_1E64E1C08;
  v661[4] = self;
  v661[5] = &v662;
  v661[6] = &v666;
  objc_msgSend_enumerateIndexesUsingBlock_(v561, v562, (uint64_t)v661, v563, v564, v565);

  double v566 = v667[3];
  objc_msgSend_minimumSignificantSegmentLength(self, v567, v568, v569, v570, v571);
  double v577 = v566 * 0.25;
  BOOL v579 = v578 < v566 * 0.25;
  double v580 = v566 * 0.25;
  if (v579) {
    objc_msgSend_minimumSignificantSegmentLength(self, v572, v573, v574, v575, v576, v580);
  }
  uint64_t v581 = 0x3F847AE147AE147BLL;
  if (v580 >= 0.01)
  {
    objc_msgSend_minimumSignificantSegmentLength(self, v572, v573, v574, v575, v576);
    uint64_t v581 = *(void *)&v577;
    if (v582 < v577)
    {
      objc_msgSend_minimumSignificantSegmentLength(self, v572, v573, v574, v575, v576);
      uint64_t v581 = v583;
    }
  }
  v584 = objc_msgSend_cornerIndexes(self, v572, v573, v574, v575, v576);
  uint64_t v590 = objc_msgSend_firstIndex(v584, v585, v586, v587, v588, v589);
  v663[3] = v590;

  v660[0] = 0;
  v660[1] = v660;
  v660[2] = 0x2020000000;
  v660[3] = 0;
  v596 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v591, v592, v593, v594, v595);
  v602 = objc_msgSend_cornerIndexes(self, v597, v598, v599, v600, v601);
  v655[0] = MEMORY[0x1E4F143A8];
  v655[1] = 3221225472;
  v655[2] = sub_1C49E2264;
  v655[3] = &unk_1E64E1C30;
  v655[4] = self;
  v657 = &v662;
  uint64_t v659 = v581;
  v658 = v660;
  id v603 = v596;
  id v656 = v603;
  objc_msgSend_enumerateIndexesUsingBlock_(v602, v604, (uint64_t)v655, v605, v606, v607);

  unint64_t highestDirectionChangeCount = self->_highestDirectionChangeCount;
  if (highestDirectionChangeCount <= self->_directionChangeCount) {
    unint64_t highestDirectionChangeCount = self->_directionChangeCount;
  }
  self->_unint64_t highestDirectionChangeCount = highestDirectionChangeCount;
  id v609 = v603;
  id v610 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v673[0] = 0;
  v673[1] = v673;
  v673[2] = 0x4812000000;
  v673[3] = sub_1C49E2704;
  v673[4] = sub_1C49E2740;
  v673[5] = &unk_1C4CB5C62;
  uint64_t v611 = *v625;
  v675[1] = 0;
  v675[0] = 0;
  v674 = v675;
  sub_1C49CA4EC(&v674, *(void **)v611, (void *)(v611 + 8));
  v670[0] = MEMORY[0x1E4F143A8];
  v670[1] = 3221225472;
  v670[2] = sub_1C49E2750;
  v670[3] = &unk_1E64E1C58;
  v672 = v673;
  id v612 = v610;
  id v671 = v612;
  objc_msgSend_enumerateIndexesUsingBlock_(v609, v613, (uint64_t)v670, v614, v615, v616);
  v617 = v671;
  v618 = (NSMutableIndexSet *)v612;

  _Block_object_dispose(v673, 8);
  sub_1C4999C7C((uint64_t)&v674, v675[0]);

  directionChangeCornerIndexes = self->__directionChangeCornerIndexes;
  self->__directionChangeCornerIndexes = v618;

  _Block_object_dispose(v660, 8);
  _Block_object_dispose(&v662, 8);
  _Block_object_dispose(&v666, 8);

  v620 = (char *)__p;
  if (__p)
  {
    v621 = v653;
    v622 = __p;
    if (v653 != __p)
    {
      do
      {
        v623 = v621 - 24;
        sub_1C4999C7C((uint64_t)(v621 - 24), *((void **)v621 - 2));
        v621 = v623;
      }
      while (v623 != v620);
      v622 = __p;
    }
    v653 = v620;
    operator delete(v622);
  }
LABEL_125:
}

- (id)cornerIndexes
{
  id v3 = objc_alloc(MEMORY[0x1E4F28D60]);
  uint64_t v8 = objc_msgSend_initWithIndexSet_(v3, v4, (uint64_t)self->__cornerIndexSet, v5, v6, v7);
  return v8;
}

- (id)directionChangeCornerIndexes
{
  id v3 = objc_alloc(MEMORY[0x1E4F28D60]);
  uint64_t v8 = objc_msgSend_initWithIndexSet_(v3, v4, (uint64_t)self->__directionChangeCornerIndexes, v5, v6, v7);
  return v8;
}

- (void)setMinimumSignificantSegmentLength:(double)a3
{
  self->_minimumSignificantSegmentLength = a3;
}

- (BOOL)shouldUseDynamicSampling
{
  return self->_shouldUseDynamicSampling;
}

- (void)setShouldUseDynamicSampling:(BOOL)a3
{
  self->_shouldUseDynamicSampling = a3;
}

- (double)minimumSignificantSegmentLength
{
  return self->_minimumSignificantSegmentLength;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (CHDrawing)resampledDrawing
{
  return self->_resampledDrawing;
}

- (unint64_t)directionChangeCount
{
  return self->_directionChangeCount;
}

- (unint64_t)highestDirectionChangeCount
{
  return self->_highestDirectionChangeCount;
}

- (void).cxx_destruct
{
  begiuint64_t n = (char *)self->__resampledDrawingPointMap.__begin_;
  if (begin)
  {
    end = (char *)self->__resampledDrawingPointMap.__end_;
    uint64_t v5 = self->__resampledDrawingPointMap.__begin_;
    if (end != begin)
    {
      do
      {
        uint64_t v6 = end - 24;
        sub_1C4999C7C((uint64_t)(end - 24), *((void **)end - 2));
        end = v6;
      }
      while (v6 != begin);
      uint64_t v5 = self->__resampledDrawingPointMap.__begin_;
    }
    self->__resampledDrawingPointMap.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->__directionChangeCornerIndexes, 0);
  objc_storeStrong((id *)&self->__cornerIndexSet, 0);
  objc_storeStrong((id *)&self->_resampledDrawing, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

@end