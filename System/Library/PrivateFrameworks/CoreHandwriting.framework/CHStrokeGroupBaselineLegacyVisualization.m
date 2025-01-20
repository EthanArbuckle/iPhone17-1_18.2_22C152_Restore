@interface CHStrokeGroupBaselineLegacyVisualization
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (int64_t)layeringPriority;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHStrokeGroupBaselineLegacyVisualization

- (int64_t)layeringPriority
{
  return 0;
}

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  objc_msgSend_bounds(a3, a2, (uint64_t)a3, v3, v4, v5);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double MinX = CGRectGetMinX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v12 = CGRectGetMaxY(v20) + 10.0 + -22.0;
  if (self) {
    double v13 = 22.0;
  }
  else {
    double v13 = 0.0;
  }
  if (self) {
    double v14 = v12;
  }
  else {
    double v14 = 0.0;
  }
  if (self) {
    double v15 = MinX + -22.0;
  }
  else {
    double v15 = 0.0;
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v16 = v13;
  CGRect v22 = CGRectUnion(v21, *(CGRect *)(&v13 - 2));
  CGRect result = CGRectInset(v22, -22.0, -22.0);
  double v17 = result.size.height + 13.0;
  double v18 = result.size.width + 7.0;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v18;
  return result;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  uint64_t v402 = *MEMORY[0x1E4F143B8];
  v372.receiver = self;
  v372.super_class = (Class)CHStrokeGroupBaselineLegacyVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v372, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v10 = objc_msgSend_recognitionSession(self, v5, v6, v7, v8, v9);
  uint64_t v363 = objc_msgSend_latestStrokeProvider(v10, v11, v12, v13, v14, v15);
  space = CGColorSpaceCreateDeviceRGB();
  color = CGColorCreate(space, dbl_1C4C44FA0);
  v311 = CGColorCreate(space, dbl_1C4C44FC0);
  CFTypeRef cf = (CFTypeRef)sub_1C4BF3B58(10.0);
  CFTypeRef v312 = (CFTypeRef)sub_1C4BF3B58(12.0);
  CGContextSetStrokeColorWithColor(a4, color);
  CGContextSetFillColorWithColor(a4, color);
  long long v370 = 0u;
  long long v371 = 0u;
  long long v368 = 0u;
  long long v369 = 0u;
  CGRect v21 = objc_msgSend_resultDrawn(self, v16, v17, v18, v19, v20);
  v27 = objc_msgSend_strokeGroupingResult(v21, v22, v23, v24, v25, v26);
  id obj = (id)objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v27, v28, 1, 1, v29, v30);
  uint64_t v322 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v368, (uint64_t)v394, 16, v32);
  if (v322)
  {
    uint64_t v320 = *(void *)v369;
    double v37 = 22.0;
    if (!self) {
      double v37 = 0.0;
    }
    CGFloat v319 = v37;
    double v314 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v315 = *MEMORY[0x1E4F1DAD8];
    double v332 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
    double v333 = *MEMORY[0x1E4F1DAB8];
    double v330 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
    double v331 = *(double *)(MEMORY[0x1E4F1DAB8] + 16);
    uint64_t v328 = *(void *)(MEMORY[0x1E4F1DAB8] + 40);
    uint64_t v329 = *(void *)(MEMORY[0x1E4F1DAB8] + 32);
    CGFloat v309 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v310 = *MEMORY[0x1E4F1DB28];
    CGFloat v308 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v307 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t i = 0; i != v322; ++i)
      {
        if (*(void *)v369 != v320) {
          objc_enumerationMutation(obj);
        }
        v357 = *(void **)(*((void *)&v368 + 1) + 8 * i);
        objc_msgSend_dirtyRectForStrokeGroup_(self, v33, (uint64_t)v357, v34, v35, v36);
        if (CGRectIntersectsRect(v403, a3))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v39 = objc_msgSend_delegate(self, v33, v38, v34, v35, v36);
            uint64_t v317 = objc_msgSend_visualizationIndexForStrokeGroup_(v39, v40, (uint64_t)v357, v41, v42, v43);
            CGContextSaveGState(a4);
            *(_OWORD *)lengths = xmmword_1C4C3A740;
            CGContextSetLineWidth(a4, 2.0);
            CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
            CGContextSetAlpha(a4, 0.8);
            if (self)
            {
              v44 = [CHQuadCurvePointFIFO alloc];
              id v318 = (id)objc_msgSend_initWithFIFO_(v44, v45, 0, v46, v47, v48);
              v49 = [CHBoxcarFilterPointFIFO alloc];
              LODWORD(v50) = 2.0;
              id v54 = (id)objc_msgSend_initWithFIFO_width_spacing_(v49, v51, (uint64_t)v318, 3, v52, v53, v50);
              v55 = [CHPointFIFO alloc];
              id v335 = (id)objc_msgSend_initWithFIFO_(v55, v56, (uint64_t)v54, v57, v58, v59);
              v65 = objc_msgSend_writingDirectionSortedStrokeIdentifiers(v357, v60, v61, v62, v63, v64);
              size_t v71 = objc_msgSend_count(v65, v66, v67, v68, v69, v70);
              v336 = (char *)malloc_type_calloc(v71, 0x20uLL, 0x1000040E0EAB150uLL);
              size_t v77 = objc_msgSend_count(v65, v72, v73, v74, v75, v76);
              v334 = (double *)malloc_type_calloc(v77, 8uLL, 0x100004000313F17uLL);
              long long v377 = 0u;
              long long v378 = 0u;
              long long v375 = 0u;
              long long v376 = 0u;
              uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v78, (uint64_t)&v375, (uint64_t)&v395, 16, v79);
              if (v85)
              {
                uint64_t v86 = 0;
                uint64_t v87 = *(void *)v376;
                double v88 = 0.0;
                do
                {
                  uint64_t v89 = 0;
                  v90 = &v336[32 * v86];
                  do
                  {
                    if (*(void *)v376 != v87) {
                      objc_enumerationMutation(v65);
                    }
                    uint64_t v93 = *(void *)(*((void *)&v375 + 1) + 8 * v89);
                    v94 = objc_opt_class();
                    v103 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v94, v95, v93, v363, v96, v97);
                    long long v364 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
                    long long v366 = *MEMORY[0x1E4F1DB28];
                    long long v373 = *MEMORY[0x1E4F1DB28];
                    long long v374 = v364;
                    if (v103)
                    {
                      if (!(v86 - 0x7FFFFFFFFFFFFFFFLL + v89))
                      {
                        if (qword_1EA3CA000 != -1) {
                          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                        }
                        v104 = (id)qword_1EA3C9F90[0];
                        if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
                        {
                          LODWORD(buf.a) = 134217984;
                          *(CGFloat *)((char *)&buf.a + 4) = NAN;
                          _os_log_impl(&dword_1C492D000, v104, OS_LOG_TYPE_FAULT, "Invalid stroke index %ld", (uint8_t *)&buf, 0xCu);
                        }
                      }
                      objc_msgSend_bounds(v103, v98, v99, v100, v101, v102);
                      CGFloat v106 = v105;
                      CGFloat v108 = v107;
                      CGFloat v110 = v109;
                      CGFloat v112 = v111;
                      objc_msgSend_localWritingOrientationAtStrokeIndex_(v357, v113, v86 + v89, v114, v115, v116);
                      long double v119 = atan2(v118, v117);
                      v404.origin.CGFloat x = v106;
                      v404.origin.CGFloat y = v108;
                      v404.size.CGFloat width = v110;
                      v404.size.CGFloat height = v112;
                      double MidX = CGRectGetMidX(v404);
                      v405.origin.CGFloat x = v106;
                      v405.origin.CGFloat y = v108;
                      v405.size.CGFloat width = v110;
                      v405.size.CGFloat height = v112;
                      double MidY = CGRectGetMidY(v405);
                      memset(&v389, 0, sizeof(v389));
                      CGAffineTransformMakeTranslation(&v389, MidX, MidY);
                      CGAffineTransform v390 = v389;
                      CGAffineTransformRotate(&buf, &v390, v119);
                      CGAffineTransform v389 = buf;
                      CGAffineTransform v390 = buf;
                      CGAffineTransformTranslate(&buf, &v390, -MidX, -MidY);
                      CGAffineTransform v389 = buf;
                      memset(&v390, 0, sizeof(v390));
                      CGAffineTransformInvert(&v390, &buf);
                      buf.double a = 0.0;
                      *(void *)&buf.double b = &buf;
                      *(void *)&buf.c = 0x4010000000;
                      *(void *)&buf.double d = &unk_1C4CB5C62;
                      *(_OWORD *)&buf.tCGFloat x = v366;
                      long long v401 = v364;
                      uint64_t v385 = 0;
                      v386 = (double *)&v385;
                      uint64_t v387 = 0x2020000000;
                      uint64_t v388 = 0;
                      v384.double a = 0.0;
                      *(void *)&v384.double b = &v384;
                      *(void *)&v384.c = 0x3010000000;
                      *(void *)&v384.double d = &unk_1C4CB5C62;
                      *(_OWORD *)&v384.tCGFloat x = *MEMORY[0x1E4F1DAD8];
                      v383[0] = 0;
                      v383[1] = v383;
                      v383[2] = 0x2020000000;
                      v383[3] = 0;
                      *(void *)&v379.double a = MEMORY[0x1E4F143A8];
                      *(void *)&v379.double b = 3221225472;
                      *(void *)&v379.c = sub_1C4BF3C58;
                      *(void *)&v379.double d = &unk_1E64E4F90;
                      CGAffineTransform v382 = v390;
                      *(void *)&v379.tCGFloat x = v383;
                      *(void *)&v379.tCGFloat y = &buf;
                      v380 = &v384;
                      v381 = &v385;
                      objc_msgSend_enumeratePointsWithTimestep_usingBlock_(v103, v122, (uint64_t)&v379, v123, v124, v125, 0.00833333333);
                      long long v126 = *(_OWORD *)(*(void *)&buf.b + 48);
                      long long v373 = *(_OWORD *)(*(void *)&buf.b + 32);
                      long long v374 = v126;
                      double v91 = v386[3];
                      _Block_object_dispose(v383, 8);
                      _Block_object_dispose(&v384, 8);
                      _Block_object_dispose(&v385, 8);
                      _Block_object_dispose(&buf, 8);
                    }
                    else
                    {
                      double v91 = 0.0;
                    }
                    long long v92 = v374;
                    *(_OWORD *)v90 = v373;
                    *((_OWORD *)v90 + 1) = v92;
                    v90 += 32;
                    v334[v86 + v89] = v91;
                    double v88 = v88 + v91;
                    ++v89;
                  }
                  while (v85 != v89);
                  uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v98, (uint64_t)&v375, (uint64_t)&v395, 16, v102);
                  v86 += v89;
                }
                while (v85);
              }
              else
              {
                double v88 = 0.0;
              }
              uint64_t v127 = objc_msgSend_count(v65, v80, v81, v82, v83, v84);
              *(void *)&long long v351 = v329;
              *((void *)&v351 + 1) = v328;
              double b = v332;
              double d = v330;
              double a = v333;
              double v348 = v331;
              v352.size.CGFloat height = v307;
              v352.origin.CGFloat y = v309;
              v352.size.CGFloat width = v308;
              v352.origin.CGFloat x = v310;
              double v325 = v314;
              double v326 = v315;
              if (objc_msgSend_count(v65, v128, v129, v130, v131, v132))
              {
                char v138 = 0;
                unint64_t v139 = 0;
                double v337 = v88 / (double)(unint64_t)v127 * 0.2;
                double v325 = v314;
                double v326 = v315;
                do
                {
                  uint64_t v140 = objc_msgSend_objectAtIndexedSubscript_(v65, v133, v139, v135, v136, v137);
                  v141 = objc_opt_class();
                  v145 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v141, v142, v140, v363, v143, v144);
                  *(void *)&long long v351 = v329;
                  *((void *)&v351 + 1) = v328;
                  double b = v332;
                  double d = v330;
                  double a = v333;
                  double v348 = v331;
                  if (v145)
                  {
                    objc_msgSend_bounds(v145, v146, v147, v148, v149, v150);
                    CGFloat v152 = v151;
                    CGFloat v154 = v153;
                    CGFloat v156 = v155;
                    CGFloat v158 = v157;
                    objc_msgSend_localWritingOrientationAtStrokeIndex_(v357, v159, v139, v160, v161, v162);
                    long double v165 = atan2(v164, v163);
                    v406.origin.CGFloat x = v152;
                    v406.origin.CGFloat y = v154;
                    v406.size.CGFloat width = v156;
                    v406.size.CGFloat height = v158;
                    double v166 = CGRectGetMidX(v406);
                    v407.origin.CGFloat x = v152;
                    v407.origin.CGFloat y = v154;
                    v407.size.CGFloat width = v156;
                    v407.size.CGFloat height = v158;
                    double v167 = CGRectGetMidY(v407);
                    memset(&v390, 0, sizeof(v390));
                    CGAffineTransformMakeTranslation(&v390, v166, v167);
                    CGAffineTransform buf = v390;
                    CGAffineTransformRotate(&v379, &buf, v165);
                    CGAffineTransform v390 = v379;
                    CGAffineTransform buf = v379;
                    CGAffineTransformTranslate(&v379, &buf, -v166, -v167);
                    CGAffineTransform v390 = v379;
                    double a = v379.a;
                    double v348 = v379.c;
                    double b = v379.b;
                    double d = v379.d;
                    long long v351 = *(_OWORD *)&v379.tx;
                  }
                  v168 = (CGFloat *)&v336[32 * v139];
                  CGFloat v365 = *v168;
                  CGFloat v362 = v168[1];
                  double v367 = v168[2];
                  CGFloat v361 = v168[3];
                  if (v139 >= objc_msgSend_count(v65, v146, v147, v148, v149, v150) - 1)
                  {
                    v352.size.CGFloat height = v361;
                    v352.origin.CGFloat y = v362;
                    v352.size.CGFloat width = v367;
                    v352.origin.CGFloat x = v365;
                    unint64_t v174 = v139;
LABEL_49:
                    if (v138) {
                      goto LABEL_51;
                    }
                  }
                  else
                  {
                    v352.origin.CGFloat x = v365;
                    v352.origin.CGFloat y = v362;
                    v352.size.CGFloat width = v367;
                    v352.size.CGFloat height = v361;
                    v173 = (CGFloat *)&v336[32 * v139 + 56];
                    while (1)
                    {
                      unint64_t v174 = v139 + 1;
                      double v359 = *(v173 - 3);
                      double v358 = *(v173 - 2);
                      CGFloat v355 = *(v173 - 1);
                      rectdouble a = *v173;
                      uint64_t v175 = objc_msgSend_objectAtIndexedSubscript_(v65, v169, v139 + 1, v170, v171, v172);
                      v176 = objc_opt_class();
                      v180 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v176, v177, v175, v363, v178, v179);
                      objc_msgSend_bounds(v180, v181, v182, v183, v184, v185);
                      CGFloat v187 = v186;
                      CGFloat v189 = v188;
                      CGFloat v191 = v190;
                      CGFloat v193 = v192;
                      objc_msgSend_localWritingOrientationAtStrokeIndex_(v357, v194, v139 + 1, v195, v196, v197);
                      long double v200 = atan2(v199, v198);
                      v408.origin.CGFloat x = v187;
                      v408.origin.CGFloat y = v189;
                      v408.size.CGFloat width = v191;
                      v408.size.CGFloat height = v193;
                      double v201 = CGRectGetMidX(v408);
                      v409.origin.CGFloat x = v187;
                      v409.origin.CGFloat y = v189;
                      v409.size.CGFloat width = v191;
                      v409.size.CGFloat height = v193;
                      double v202 = CGRectGetMidY(v409);
                      memset(&v390, 0, sizeof(v390));
                      CGAffineTransformMakeTranslation(&v390, v201, v202);
                      CGAffineTransform buf = v390;
                      CGAffineTransformRotate(&v379, &buf, v200);
                      CGAffineTransform v390 = v379;
                      CGAffineTransform buf = v379;
                      CGAffineTransformTranslate(&v379, &buf, -v201, -v202);
                      CGAffineTransform v390 = v379;
                      long long v346 = *(_OWORD *)&v379.a;
                      long long v203 = *(_OWORD *)&v379.c;
                      long long v204 = *(_OWORD *)&v379.tx;
                      tCGFloat y = v379.ty;
                      double v345 = v379.d;
                      v379.double a = a;
                      v379.double b = b;
                      v379.c = v348;
                      v379.double d = d;
                      *(_OWORD *)&v379.tCGFloat x = v351;
                      CGAffineTransformInvert(&v389, &v379);
                      double v205 = v389.c;
                      double v339 = v389.d;
                      tCGFloat x = v389.tx;
                      double v343 = v389.a;
                      double v340 = v389.ty;
                      double v341 = v389.b;
                      v410.origin.CGFloat x = v359;
                      v410.origin.CGFloat y = v358;
                      v410.size.CGFloat width = v355;
                      v410.size.CGFloat height = recta;
                      double MaxX = CGRectGetMaxX(v410);
                      v411.origin.CGFloat x = v359;
                      v411.origin.CGFloat y = v358;
                      v411.size.CGFloat width = v355;
                      v411.size.CGFloat height = recta;
                      double MaxY = CGRectGetMaxY(v411);
                      v379.double a = a;
                      v379.double b = b;
                      v379.c = v348;
                      v379.double d = d;
                      *(_OWORD *)&v379.tCGFloat x = v351;
                      CGAffineTransformInvert(&v384, &v379);
                      double v208 = v384.a;
                      double v356 = v384.b;
                      double v209 = v384.c;
                      double v338 = v384.d;
                      double v210 = v384.tx;
                      double rect = v384.ty;
                      v412.origin.CGFloat x = v365;
                      v412.origin.CGFloat y = v362;
                      v412.size.CGFloat width = v367;
                      v412.size.CGFloat height = v361;
                      CGFloat MinX = CGRectGetMinX(v412);
                      double v212 = *(double *)&v204 + v358 * *(double *)&v203 + *(double *)&v346 * v359;
                      double v360 = ty + v358 * v345 + *((double *)&v346 + 1) * v359;
                      double v213 = v360 * v205;
                      double v214 = v212;
                      double v215 = *(double *)&v204 + *(double *)&v203 * MaxY + *(double *)&v346 * MaxX;
                      double v216 = ty + v345 * MaxY + *((double *)&v346 + 1) * MaxX;
                      double v217 = v210 + v216 * v209 + v208 * v215;
                      double v218 = tx + v213 + v343 * v212;
                      if (MinX > v218
                        || (v413.origin.CGFloat x = v365,
                            v413.origin.CGFloat y = v362,
                            v413.size.CGFloat width = v367,
                            v413.size.CGFloat height = v361,
                            v218 > CGRectGetMaxX(v413)))
                      {
                        v414.origin.CGFloat x = v365;
                        v414.origin.CGFloat y = v362;
                        v414.size.CGFloat width = v367;
                        v414.size.CGFloat height = v361;
                        if (v218 > CGRectGetMinX(v414)) {
                          goto LABEL_45;
                        }
                        v415.origin.CGFloat x = v365;
                        v415.origin.CGFloat y = v362;
                        v415.size.CGFloat width = v367;
                        v415.size.CGFloat height = v361;
                        if (CGRectGetMinX(v415) > v217) {
                          goto LABEL_45;
                        }
                      }
                      v416.origin.CGFloat x = v365;
                      v416.origin.CGFloat y = v362;
                      v416.size.CGFloat width = v367;
                      v416.size.CGFloat height = v361;
                      double v219 = v218;
                      if (CGRectGetMinX(v416) > v218)
                      {
                        v417.origin.CGFloat x = v365;
                        v417.origin.CGFloat y = v362;
                        v417.size.CGFloat width = v367;
                        v417.size.CGFloat height = v361;
                        double v219 = CGRectGetMinX(v417);
                      }
                      v418.origin.CGFloat x = v365;
                      v418.origin.CGFloat y = v362;
                      v418.size.CGFloat width = v367;
                      v418.size.CGFloat height = v361;
                      BOOL v220 = CGRectGetMaxX(v418) < v217;
                      double v221 = v217;
                      if (v220)
                      {
                        v419.origin.CGFloat x = v365;
                        v419.origin.CGFloat y = v362;
                        v419.size.CGFloat width = v367;
                        v419.size.CGFloat height = v361;
                        double v221 = CGRectGetMaxX(v419);
                      }
                      if ((v221 - v219) / v367 + (v221 - v219) / (v217 - v218) < 0.3)
                      {
LABEL_45:
                        if (v334[v139 + 1] >= v337) {
                          break;
                        }
                      }
                      v427.origin.CGFloat y = v340 + v360 * v339 + v341 * v214;
                      v427.origin.CGFloat x = v218 + -1.0;
                      v427.size.CGFloat width = 1.0;
                      v427.size.CGFloat height = 1.0;
                      CGRect v420 = CGRectUnion(v352, v427);
                      v428.origin.CGFloat y = rect + v216 * v338 + v356 * v215;
                      v428.origin.CGFloat x = v217 + -1.0;
                      v428.size.CGFloat width = 1.0;
                      v428.size.CGFloat height = 1.0;
                      CGRect v352 = CGRectUnion(v420, v428);
                      v173 += 4;
                      ++v139;
                      if (v174 >= objc_msgSend_count(v65, v222, v223, v224, v225, v226) - 1) {
                        goto LABEL_49;
                      }
                    }
                    unint64_t v174 = v139;
                    if (v138) {
                      goto LABEL_51;
                    }
                  }
                  double v227 = CGRectGetMinX(v352);
                  CGFloat v228 = CGRectGetMaxY(v352) + 6.0;
                  double v325 = *((double *)&v351 + 1) + d * v228 + b * v227;
                  double v326 = *(double *)&v351 + v348 * v228 + a * v227;
                  *(float *)&unsigned int v229 = v326;
                  *(float *)&unsigned int v230 = v325;
                  objc_msgSend_addPoint_(v335, v231, v232, v233, v234, v235, COERCE_DOUBLE(__PAIR64__(v230, v229)));
LABEL_51:
                  double v236 = CGRectGetMidX(v352);
                  CGFloat v237 = CGRectGetMaxY(v352) + 6.0;
                  *(float *)&unsigned int v238 = *(double *)&v351 + v348 * v237 + a * v236;
                  *(float *)&unsigned int v239 = *((double *)&v351 + 1) + d * v237 + b * v236;
                  objc_msgSend_addPoint_(v335, v240, v241, v242, v243, v244, COERCE_DOUBLE(__PAIR64__(v239, v238)));
                  unint64_t v139 = v174 + 1;
                  char v138 = 1;
                }
                while (v174 + 1 < objc_msgSend_count(v65, v245, v246, v247, v248, v249));
              }
              if (objc_msgSend_count(v65, v133, v134, v135, v136, v137))
              {
                double v255 = CGRectGetMaxX(v352);
                CGFloat v256 = CGRectGetMaxY(v352) + 6.0;
                *(float *)&unsigned int v257 = *(double *)&v351 + v348 * v256 + a * (v255 + 7.0);
                *(float *)&unsigned int v258 = *((double *)&v351 + 1) + d * v256 + b * (v255 + 7.0);
                objc_msgSend_addPoint_(v335, v259, v260, v261, v262, v263, COERCE_DOUBLE(__PAIR64__(v258, v257)));
              }
              objc_msgSend_flush(v335, v250, v251, v252, v253, v254);
              free(v336);
              free(v334);
              v269 = (const CGPath *)objc_msgSend_path(v318, v264, v265, v266, v267, v268);
              v270 = CGPathRetain(v269);
            }
            else
            {
              v270 = 0;
              double v325 = v314;
              double v326 = v315;
            }
            CGContextAddPath(a4, v270);
            CGContextStrokePath(a4);
            CGPathRelease(v270);
            if (self) {
              double v271 = v325 + 10.0 + -22.0;
            }
            else {
              double v271 = 0.0;
            }
            if (self) {
              double v272 = v326 + -22.0;
            }
            else {
              double v272 = 0.0;
            }
            CGContextSetLineWidth(a4, 2.0);
            CGContextSetAlpha(a4, 0.8);
            v421.origin.CGFloat x = v272;
            v421.origin.CGFloat y = v271;
            v421.size.CGFloat width = v319;
            v421.size.CGFloat height = v319;
            CGContextFillEllipseInRect(a4, v421);
            v422.origin.CGFloat x = v272;
            v422.origin.CGFloat y = v271;
            v422.size.CGFloat width = v319;
            v422.size.CGFloat height = v319;
            CGFloat v273 = CGRectGetMidY(v422);
            CGContextTranslateCTM(a4, 0.0, v273);
            CGContextScaleCTM(a4, 1.0, -1.0);
            v423.origin.CGFloat x = v272;
            v423.origin.CGFloat y = v271;
            v423.size.CGFloat width = v319;
            v423.size.CGFloat height = v319;
            CGFloat v274 = CGRectGetMidY(v423);
            CGContextTranslateCTM(a4, 0.0, -v274);
            if (v317 <= 98) {
              double v275 = 3.0;
            }
            else {
              double v275 = 4.5;
            }
            v424.origin.CGFloat x = v272;
            v424.origin.CGFloat y = v271;
            v424.size.CGFloat width = v319;
            v424.size.CGFloat height = v319;
            CGRect v425 = CGRectInset(v424, 0.0, v275);
            CGFloat x = v425.origin.x;
            CGFloat y = v425.origin.y;
            CGFloat width = v425.size.width;
            CGFloat height = v425.size.height;
            if (v317 <= 98) {
              CFTypeRef v280 = v312;
            }
            else {
              CFTypeRef v280 = cf;
            }
            LOBYTE(v375) = 2;
            LODWORD(buf.a) = 0;
            *(void *)&buf.double b = 1;
            *(void *)&buf.c = &v375;
            v379.double a = 0.0;
            *(void *)&v379.double b = &v379;
            *(void *)&v379.c = 0x2020000000;
            v281 = (uint64_t (*)(CGAffineTransform *, uint64_t))off_1EA3C9538;
            *(void *)&v379.double d = off_1EA3C9538;
            if (!off_1EA3C9538)
            {
              uint64_t v395 = MEMORY[0x1E4F143A8];
              uint64_t v396 = 3221225472;
              v397 = sub_1C4BF3F68;
              v398 = &unk_1E64E1EC8;
              v399 = &v379;
              sub_1C4BF3F68((uint64_t)&v395);
              v281 = *(uint64_t (**)(CGAffineTransform *, uint64_t))(*(void *)&v379.b + 24);
            }
            _Block_object_dispose(&v379, 8);
            if (!v281) {
              goto LABEL_95;
            }
            v282 = (const void *)v281(&buf, 1);
            v379.double a = 0.0;
            *(void *)&v379.double b = &v379;
            *(void *)&v379.c = 0x2020000000;
            v283 = (void *)qword_1EA3C9540;
            *(void *)&v379.double d = qword_1EA3C9540;
            if (!qword_1EA3C9540)
            {
              uint64_t v395 = MEMORY[0x1E4F143A8];
              uint64_t v396 = 3221225472;
              v397 = sub_1C4BF40A8;
              v398 = &unk_1E64E1EC8;
              v399 = &v379;
              sub_1C4BF40A8((uint64_t)&v395);
              v283 = *(void **)(*(void *)&v379.b + 24);
            }
            _Block_object_dispose(&v379, 8);
            if (!v283) {
              goto LABEL_95;
            }
            v391[0] = *v283;
            v392[0] = v280;
            v379.double a = 0.0;
            *(void *)&v379.double b = &v379;
            *(void *)&v379.c = 0x2020000000;
            v284 = (void *)qword_1EA3C9548;
            *(void *)&v379.double d = qword_1EA3C9548;
            if (!qword_1EA3C9548)
            {
              uint64_t v395 = MEMORY[0x1E4F143A8];
              uint64_t v396 = 3221225472;
              v397 = sub_1C4BF41E8;
              v398 = &unk_1E64E1EC8;
              v399 = &v379;
              sub_1C4BF41E8((uint64_t)&v395);
              v284 = *(void **)(*(void *)&v379.b + 24);
            }
            _Block_object_dispose(&v379, 8);
            if (!v284) {
              goto LABEL_95;
            }
            v391[1] = *v284;
            v392[1] = v311;
            v379.double a = 0.0;
            *(void *)&v379.double b = &v379;
            *(void *)&v379.c = 0x2020000000;
            v285 = (void *)qword_1EA3C9550;
            *(void *)&v379.double d = qword_1EA3C9550;
            if (!qword_1EA3C9550)
            {
              uint64_t v395 = MEMORY[0x1E4F143A8];
              uint64_t v396 = 3221225472;
              v397 = sub_1C4BF4328;
              v398 = &unk_1E64E1EC8;
              v399 = &v379;
              sub_1C4BF4328((uint64_t)&v395);
              v285 = *(void **)(*(void *)&v379.b + 24);
            }
            _Block_object_dispose(&v379, 8);
            if (!v285) {
              goto LABEL_95;
            }
            v391[2] = *v285;
            v392[2] = v282;
            uint64_t v288 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v286, (uint64_t)v392, (uint64_t)v391, 3, v287);
            id v289 = objc_alloc(MEMORY[0x1E4F28B18]);
            uint64_t v294 = objc_msgSend_stringWithFormat_(NSString, v290, @"%ld", v291, v292, v293, v317 + 1);
            id v298 = (id)objc_msgSend_initWithString_attributes_(v289, v295, v294, v288, v296, v297);
            v426.origin.CGFloat x = x;
            v426.origin.CGFloat y = y;
            v426.size.CGFloat width = width;
            v426.size.CGFloat height = height;
            v299 = CGPathCreateWithRect(v426, 0);
            v379.double a = 0.0;
            *(void *)&v379.double b = &v379;
            *(void *)&v379.c = 0x2020000000;
            v300 = (uint64_t (*)(id))off_1EA3C9558;
            *(void *)&v379.double d = off_1EA3C9558;
            if (!off_1EA3C9558)
            {
              uint64_t v395 = MEMORY[0x1E4F143A8];
              uint64_t v396 = 3221225472;
              v397 = sub_1C4BF4468;
              v398 = &unk_1E64E1EC8;
              v399 = &v379;
              sub_1C4BF4468((uint64_t)&v395);
              v300 = *(uint64_t (**)(id))(*(void *)&v379.b + 24);
            }
            _Block_object_dispose(&v379, 8);
            if (!v300) {
              goto LABEL_95;
            }
            v301 = (const void *)v300(v298);
            v379.double a = 0.0;
            *(void *)&v379.double b = &v379;
            *(void *)&v379.c = 0x2020000000;
            v302 = off_1EA3C9560;
            *(void *)&v379.double d = off_1EA3C9560;
            if (!off_1EA3C9560)
            {
              uint64_t v395 = MEMORY[0x1E4F143A8];
              uint64_t v396 = 3221225472;
              v397 = sub_1C4BF45A8;
              v398 = &unk_1E64E1EC8;
              v399 = &v379;
              sub_1C4BF45A8((uint64_t)&v395);
              v302 = *(void **)(*(void *)&v379.b + 24);
            }
            _Block_object_dispose(&v379, 8);
            if (!v302) {
              goto LABEL_95;
            }
            v303 = (const void *)((uint64_t (*)(const void *, void, void, const CGPath *, void))v302)(v301, 0, 0, v299, 0);
            CGContextSetAlpha(a4, 1.0);
            v379.double a = 0.0;
            *(void *)&v379.double b = &v379;
            *(void *)&v379.c = 0x2020000000;
            v304 = (void (*)(const void *, CGContext *))off_1EA3C9568;
            *(void *)&v379.double d = off_1EA3C9568;
            if (!off_1EA3C9568)
            {
              uint64_t v395 = MEMORY[0x1E4F143A8];
              uint64_t v396 = 3221225472;
              v397 = sub_1C4BF46E8;
              v398 = &unk_1E64E1EC8;
              v399 = &v379;
              sub_1C4BF46E8((uint64_t)&v395);
              v304 = *(void (**)(const void *, CGContext *))(*(void *)&v379.b + 24);
            }
            _Block_object_dispose(&v379, 8);
            if (!v304)
            {
LABEL_95:
              dlerror();
              abort_report_np();
              __break(1u);
            }
            v304(v303, a4);
            CFRelease(v303);
            CFRelease(v301);
            CGPathRelease(v299);
            CFRelease(v282);
            CGContextRestoreGState(a4);
          }
        }
      }
      uint64_t v322 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v368, (uint64_t)v394, 16, v36);
    }
    while (v322);
  }
  CGColorRelease(color);
  CGColorRelease(v311);
  CGColorSpaceRelease(space);
  CFRelease(cf);
  CFRelease(v312);
}

@end