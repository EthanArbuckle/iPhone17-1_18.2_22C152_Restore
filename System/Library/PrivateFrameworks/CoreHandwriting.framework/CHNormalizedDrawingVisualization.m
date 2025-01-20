@interface CHNormalizedDrawingVisualization
- (BOOL)shouldDrawStrokeGroup:(id)a3;
- (BOOL)wantsInputDrawings;
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (int64_t)layeringPriority;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHNormalizedDrawingVisualization

- (int64_t)layeringPriority
{
  return 2;
}

- (BOOL)wantsInputDrawings
{
  return 1;
}

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CHNormalizedDrawingVisualization;
  [(CHStrokeGroupBasedVisualization *)&v13 dirtyRectForStrokeGroup:a3];
  double y = v14.origin.y;
  double height = v14.size.height;
  double v5 = 200.0 - CGRectGetHeight(v14);
  double v6 = v5 * 0.5;
  BOOL v7 = v5 <= 0.0;
  if (v5 <= 0.0) {
    double v5 = -0.0;
  }
  double v8 = height + v5;
  double v9 = 0.0;
  if (!v7) {
    double v9 = v6;
  }
  double v10 = y - v9;
  uint64_t v11 = 0x40C3880000000000;
  uint64_t v12 = 0;
  return CGRectInset(*(CGRect *)(&v8 - 3), -2.0, -2.0);
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  BOOL v7 = self;
  uint64_t v279 = *MEMORY[0x1E4F143B8];
  v274.receiver = self;
  v274.super_class = (Class)CHNormalizedDrawingVisualization;
  CGFloat x = a5.origin.x;
  CGFloat y = a5.origin.y;
  CGFloat width = a5.size.width;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v274, sel_drawVisualizationInRect_context_viewBounds_);
  objc_super v13 = objc_msgSend_resultDrawn(v7, v8, v9, v10, v11, v12);
  objc_msgSend_strokeGroupingResult(v13, v14, v15, v16, v17, v18);
  long long v270 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  v238 = long long v273 = 0u;
  objc_msgSend_strokeGroups(v238, v19, v20, v21, v22, v23);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v270, (uint64_t)v277, 16, v25);
  if (v26)
  {
    uint64_t v31 = v26;
    uint64_t v258 = *(void *)v271;
    double v241 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v242 = *MEMORY[0x1E4F1DB30];
    CGFloat rect = height;
    v239 = v13;
    v240 = v7;
    do
    {
      uint64_t v32 = 0;
      uint64_t v246 = v31;
      do
      {
        if (*(void *)v271 != v258) {
          objc_enumerationMutation(obj);
        }
        v36 = *(void **)(*((void *)&v270 + 1) + 8 * v32);
        objc_msgSend_dirtyRectForStrokeGroup_(v7, v27, (uint64_t)v36, v28, v29, v30);
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        CGFloat v44 = v43;
        int shouldDrawStrokeGroup = objc_msgSend_shouldDrawStrokeGroup_(v7, v45, (uint64_t)v36, v46, v47, v48);
        v280.origin.CGFloat x = v38;
        v280.origin.CGFloat y = v40;
        v280.size.CGFloat width = v42;
        v280.size.CGFloat height = v44;
        if (CGRectIntersectsRect(v280, a3) && shouldDrawStrokeGroup != 0)
        {
          uint64_t v52 = objc_msgSend_uniqueIdentifier(v36, v27, v50, v28, v29, v30);
          v33 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v13, v53, v52, v54, v55, v56);
          v62 = objc_msgSend_inputDrawing(v33, v57, v58, v59, v60, v61);
          v34 = v62;
          if (v62)
          {
            memset(&v269, 0, sizeof(v269));
            objc_msgSend_bounds(v62, v63, v64, v65, v66, v67);
            CGColorSpaceRef space = v68;
            CGFloat v266 = v69;
            CGFloat v71 = v70;
            CGFloat v73 = v72;
            objc_msgSend_bounds(v36, v74, v75, v76, v77, v78);
            if (v7)
            {
              CGFloat v88 = v84;
              CGFloat v89 = v85;
              CGFloat v90 = v86;
              CGFloat v91 = v87;
              long long v92 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
              long long v247 = *MEMORY[0x1E4F1DAB8];
              *(_OWORD *)&v269.double a = *MEMORY[0x1E4F1DAB8];
              *(_OWORD *)&v269.double c = v92;
              long long v243 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
              long long v244 = v92;
              *(_OWORD *)&v269.double tx = v243;
              *(CGFloat *)&long long v92 = v89;
              double MidX = CGRectGetMidX(*(CGRect *)&v84);
              v281.origin.CGFloat x = v88;
              v281.origin.CGFloat y = v89;
              v281.size.CGFloat width = v90;
              v281.size.CGFloat height = v91;
              CGFloat MidY = CGRectGetMidY(v281);
              v282.origin.CGFloat x = x;
              v282.origin.CGFloat y = y;
              v282.size.CGFloat width = width;
              v282.size.CGFloat height = rect;
              double v94 = CGRectGetWidth(v282);
              *(void *)&v283.origin.CGFloat x = space;
              v283.origin.CGFloat y = v266;
              v283.size.CGFloat width = v71;
              v283.size.CGFloat height = v73;
              double v260 = 1.0;
              double v261 = MidY;
              if (CGRectGetWidth(v283) > 0.0)
              {
                *(void *)&v284.origin.CGFloat x = space;
                v284.origin.CGFloat y = v266;
                v284.size.CGFloat width = v71;
                v284.size.CGFloat height = v73;
                if (CGRectGetWidth(v284) > v94 + -8.0)
                {
                  *(void *)&v285.origin.CGFloat x = space;
                  v285.origin.CGFloat y = v266;
                  v285.size.CGFloat width = v71;
                  v285.size.CGFloat height = v73;
                  CGFloat v95 = CGRectGetWidth(v285);
                  *(_OWORD *)&m.double a = v247;
                  *(_OWORD *)&m.double c = v244;
                  *(_OWORD *)&m.double tx = v243;
                  double v260 = (v94 + -8.0) / v95;
                  CGAffineTransformScale(&v269, &m, v260, v260);
                }
              }
              CGAffineTransform m = v269;
              v286.size.CGFloat height = v73;
              v286.origin.CGFloat y = v266;
              *(void *)&v286.origin.CGFloat x = space;
              v286.size.CGFloat width = v71;
              CGRect v287 = CGRectApplyAffineTransform(v286, &m);
              CGFloat v96 = v287.origin.x;
              CGFloat v248 = v71;
              CGFloat v97 = v287.origin.y;
              CGFloat v98 = v287.size.width;
              CGFloat v99 = v287.size.height;
              double v100 = MidX - CGRectGetMidX(v287);
              v288.origin.CGFloat x = v96;
              v288.origin.CGFloat y = v97;
              v288.size.CGFloat width = v98;
              v288.size.CGFloat height = v99;
              CGFloat v101 = CGRectGetMidY(v288);
              CGAffineTransform v275 = v269;
              CGAffineTransformTranslate(&m, &v275, v100 / v260, (v261 - v101) / v260);
              CGAffineTransform v269 = m;
              *(void *)&v289.origin.CGFloat x = space;
              v289.origin.CGFloat y = v266;
              v289.size.CGFloat width = v248;
              v289.size.CGFloat height = v73;
              CGRect v290 = CGRectApplyAffineTransform(v289, &m);
              CGFloat v102 = v290.origin.x;
              spacedouble a = v290.size.width;
              CGFloat v267 = v290.origin.y;
              CGFloat v262 = v290.size.height;
              double MaxX = CGRectGetMaxX(v290);
              v291.origin.CGFloat x = x;
              v291.origin.CGFloat y = y;
              v291.size.CGFloat width = width;
              v291.size.CGFloat height = rect;
              BOOL v104 = MaxX <= CGRectGetMaxX(v291) + -4.0;
              double v105 = v242;
              if (!v104)
              {
                v292.origin.CGFloat x = x;
                v292.origin.CGFloat y = y;
                v292.size.CGFloat width = width;
                v292.size.CGFloat height = rect;
                CGFloat v106 = CGRectGetMaxX(v292) + -4.0;
                v293.origin.CGFloat x = v102;
                v293.size.CGFloat width = spacea;
                v293.origin.CGFloat y = v267;
                v293.size.CGFloat height = v262;
                double v105 = v106 - CGRectGetMaxX(v293);
              }
              double v249 = v105;
              v294.origin.CGFloat x = v102;
              v294.size.CGFloat width = spacea;
              v294.origin.CGFloat y = v267;
              v294.size.CGFloat height = v262;
              double MinX = CGRectGetMinX(v294);
              v295.origin.CGFloat x = x;
              v295.origin.CGFloat y = y;
              v295.size.CGFloat width = width;
              v295.size.CGFloat height = rect;
              if (MinX < CGRectGetMinX(v295) + 4.0)
              {
                v296.origin.CGFloat x = x;
                v296.origin.CGFloat y = y;
                v296.size.CGFloat width = width;
                v296.size.CGFloat height = rect;
                CGFloat v108 = CGRectGetMinX(v296) + 4.0;
                v297.origin.CGFloat x = v102;
                v297.size.CGFloat width = spacea;
                v297.origin.CGFloat y = v267;
                v297.size.CGFloat height = v262;
                double v249 = v108 - CGRectGetMinX(v297);
              }
              v298.origin.CGFloat x = v102;
              v298.size.CGFloat width = spacea;
              v298.origin.CGFloat y = v267;
              v298.size.CGFloat height = v262;
              double MaxY = CGRectGetMaxY(v298);
              v299.origin.CGFloat x = x;
              v299.origin.CGFloat y = y;
              v299.size.CGFloat width = width;
              v299.size.CGFloat height = rect;
              double v110 = v241;
              if (MaxY > CGRectGetMaxY(v299) + -4.0)
              {
                v300.origin.CGFloat x = x;
                v300.origin.CGFloat y = y;
                v300.size.CGFloat width = width;
                v300.size.CGFloat height = rect;
                CGFloat v111 = CGRectGetMaxY(v300) + -4.0;
                v301.origin.CGFloat x = v102;
                v301.size.CGFloat width = spacea;
                v301.origin.CGFloat y = v267;
                v301.size.CGFloat height = v262;
                double v110 = v111 - CGRectGetMaxY(v301);
              }
              v302.origin.CGFloat x = v102;
              v302.size.CGFloat width = spacea;
              v302.origin.CGFloat y = v267;
              v302.size.CGFloat height = v262;
              double MinY = CGRectGetMinY(v302);
              v303.origin.CGFloat x = x;
              v303.origin.CGFloat y = y;
              v303.size.CGFloat width = width;
              v303.size.CGFloat height = rect;
              if (MinY < CGRectGetMinY(v303) + 4.0)
              {
                v304.origin.CGFloat x = x;
                v304.origin.CGFloat y = y;
                v304.size.CGFloat width = width;
                v304.size.CGFloat height = rect;
                CGFloat v113 = CGRectGetMinY(v304) + 4.0;
                v305.origin.CGFloat x = v102;
                v305.size.CGFloat width = spacea;
                v305.origin.CGFloat y = v267;
                v305.size.CGFloat height = v262;
                double v110 = v113 - CGRectGetMinY(v305);
              }
              CGAffineTransform v275 = v269;
              CGAffineTransformTranslate(&m, &v275, v249 / v260, v110 / v260);
              CGAffineTransform v269 = m;
            }
            else
            {
              memset(&v269, 0, sizeof(v269));
            }
            objc_msgSend_bounds(v34, v79, v80, v81, v82, v83);
            CGAffineTransform m = v269;
            CGRect v307 = CGRectApplyAffineTransform(v306, &m);
            v255 = v33;
            uint64_t v256 = v32;
            v254 = v34;
            if (v7)
            {
              CGFloat v114 = v307.origin.x;
              CGFloat v115 = v307.origin.y;
              CGFloat v116 = v307.size.width;
              CGFloat v117 = v307.size.height;
              v118 = v13;
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
              v308.origin.CGFloat x = v114;
              v308.origin.CGFloat y = v115;
              v308.size.CGFloat width = v116;
              v308.size.CGFloat height = v117;
              CGRect v309 = CGRectInset(v308, -1.0, -1.0);
              CGFloat v120 = v309.origin.x;
              CGFloat v121 = v309.origin.y;
              CGFloat v122 = v309.size.width;
              CGFloat v123 = v309.size.height;
              v124 = CGColorCreate(DeviceRGB, dbl_1C4C3A7D0);
              CGContextSetFillColorWithColor(a4, v124);
              v310.origin.CGFloat x = v120;
              v310.origin.CGFloat y = v121;
              v310.size.CGFloat width = v122;
              v310.size.CGFloat height = v123;
              CGContextFillRect(a4, v310);
              v125 = CGColorCreate(DeviceRGB, dbl_1C4C3A7F0);
              CGContextSetStrokeColorWithColor(a4, v125);
              CGContextSetLineWidth(a4, 1.0);
              v311.origin.CGFloat x = v120;
              v311.origin.CGFloat y = v121;
              v311.size.CGFloat width = v122;
              v311.size.CGFloat height = v123;
              CGContextStrokeRect(a4, v311);
              CGColorRelease(v124);
              CGColorRelease(v125);
              CGColorSpaceRelease(DeviceRGB);
              CGAffineTransform m = v269;
              id v126 = v34;
              v127 = CGColorSpaceCreateDeviceRGB();
              v128 = CGColorCreate(v127, dbl_1C4C3A810);
              v129 = CGColorCreate(v127, dbl_1C4C3A830);
              CGContextSetLineWidth(a4, 1.0);
              CGContextSetLineCap(a4, kCGLineCapRound);
              CGContextSetLineJoin(a4, kCGLineJoinRound);
              Mutable = CGPathCreateMutable();
              if (objc_msgSend_strokeCount(v126, v131, v132, v133, v134, v135))
              {
                uint64_t v140 = 0;
                for (uint64_t i = objc_msgSend_pointCountForStrokeIndex_(v126, v136, 0, v137, v138, v139);
                      ;
                      uint64_t i = objc_msgSend_pointCountForStrokeIndex_(v126, v147, v140, v148, v149, v150))
                {
                  if (i)
                  {
                    objc_msgSend_pointForStrokeIndex_pointIndex_(v126, v142, v140, 0, v145, v146);
                    CGPathMoveToPoint(Mutable, &m, v151, v152);
                    if ((unint64_t)objc_msgSend_pointCountForStrokeIndex_(v126, v153, v140, v154, v155, v156) >= 2)
                    {
                      unint64_t v157 = 1;
                      do
                      {
                        objc_msgSend_pointForStrokeIndex_pointIndex_(v126, v142, v140, v157, v145, v146);
                        CGPathAddLineToPoint(Mutable, &m, v158, v159);
                        ++v157;
                      }
                      while (v157 < objc_msgSend_pointCountForStrokeIndex_(v126, v160, v140, v161, v162, v163));
                    }
                  }
                  if (++v140 >= (unint64_t)objc_msgSend_strokeCount(v126, v142, v143, v144, v145, v146)) {
                    break;
                  }
                }
              }
              CGContextSetStrokeColorWithColor(a4, v128);
              CGContextAddPath(a4, Mutable);
              CGContextStrokePath(a4);
              CGPathRelease(Mutable);
              CGContextSetFillColorWithColor(a4, v129);
              objc_super v13 = v118;
              if (objc_msgSend_strokeCount(v126, v164, v165, v166, v167, v168))
              {
                uint64_t v173 = 0;
                for (uint64_t j = objc_msgSend_pointCountForStrokeIndex_(v126, v169, 0, v170, v171, v172);
                      ;
                      uint64_t j = objc_msgSend_pointCountForStrokeIndex_(v126, v180, v173, v181, v182, v183))
                {
                  if (j)
                  {
                    unint64_t v184 = 0;
                    do
                    {
                      objc_msgSend_pointForStrokeIndex_pointIndex_(v126, v175, v173, v184, v178, v179);
                      CGFloat v187 = m.tx + v185 * m.c + m.a * v186;
                      CGFloat v188 = m.ty + v185 * m.d + m.b * v186;
                      v312.origin.CGFloat x = v187 + -1.5;
                      v312.origin.CGFloat y = v188 + -1.5;
                      v312.size.CGFloat width = 3.0;
                      v312.size.CGFloat height = 3.0;
                      CGContextFillEllipseInRect(a4, v312);
                      ++v184;
                    }
                    while (v184 < objc_msgSend_pointCountForStrokeIndex_(v126, v189, v173, v190, v191, v192));
                  }
                  if (++v173 >= (unint64_t)objc_msgSend_strokeCount(v126, v175, v176, v177, v178, v179)) {
                    break;
                  }
                }
              }
              CGColorRelease(v128);
              CGColorRelease(v129);
              CGColorSpaceRelease(v127);
              uint64_t v31 = v246;
              v33 = v255;
              uint64_t v32 = v256;
              v34 = v254;

              v198 = objc_msgSend_inputDrawingCutPoints(v255, v193, v194, v195, v196, v197);
              if (v198)
              {
LABEL_49:
                double a = v269.a;
                double b = v269.b;
                double c = v269.c;
                double d = v269.d;
                double tx = v269.tx;
                tCGFloat y = v269.ty;
                id v35 = v198;
                id v205 = v34;
                if (v7)
                {
                  spacedouble b = CGColorSpaceCreateDeviceRGB();
                  v206 = CGColorCreate(spaceb, dbl_1C4C3A850);
                  CGContextSetFillColorWithColor(a4, v206);
                  long long v276 = 0u;
                  memset(&v275, 0, sizeof(v275));
                  id v268 = v35;
                  id v207 = v35;
                  uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v207, v208, (uint64_t)&v275, (uint64_t)&m, 16, v209);
                  if (v210)
                  {
                    uint64_t v215 = v210;
                    uint64_t v216 = **(void **)&v275.c;
                    do
                    {
                      for (uint64_t k = 0; k != v215; ++k)
                      {
                        if (**(void **)&v275.c != v216) {
                          objc_enumerationMutation(v207);
                        }
                        v218 = *(void **)(*(void *)&v275.b + 8 * k);
                        uint64_t v219 = objc_msgSend_indexAtPosition_(v218, v211, 0, v212, v213, v214);
                        uint64_t v224 = objc_msgSend_indexAtPosition_(v218, v220, 1, v221, v222, v223);
                        objc_msgSend_pointForStrokeIndex_pointIndex_(v205, v225, v219, v224, v226, v227);
                        double v230 = tx + c * v228 + a * v229;
                        double v231 = ty + d * v228 + b * v229;
                        v313.origin.CGFloat x = v230 + -2.0;
                        v313.origin.CGFloat y = v231 + -2.0;
                        v313.size.CGFloat width = 4.0;
                        v313.size.CGFloat height = 4.0;
                        CGContextFillEllipseInRect(a4, v313);
                      }
                      uint64_t v215 = objc_msgSend_countByEnumeratingWithState_objects_count_(v207, v211, (uint64_t)&v275, (uint64_t)&m, 16, v214);
                    }
                    while (v215);
                  }

                  CGColorSpaceRelease(spaceb);
                  CGColorRelease(v206);
                  objc_super v13 = v239;
                  BOOL v7 = v240;
                  uint64_t v31 = v246;
                  v33 = v255;
                  uint64_t v32 = v256;
                  v34 = v254;
                  id v35 = v268;
                }
              }
            }
            else
            {
              CGAffineTransform m = v269;
              id v232 = v34;

              v198 = objc_msgSend_inputDrawingCutPoints(v33, v233, v234, v235, v236, v237);
              if (v198) {
                goto LABEL_49;
              }
            }
          }
        }
        ++v32;
      }
      while (v32 != v31);
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v270, (uint64_t)v277, 16, v30);
    }
    while (v31);
  }
}

- (BOOL)shouldDrawStrokeGroup:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_class();
  uint64_t v11 = objc_msgSend_classification(v4, v6, v7, v8, v9, v10);
  if (objc_msgSend_isStrokeClassificationTextOrMath_(v5, v12, v11, v13, v14, v15))
  {
    uint64_t v21 = objc_msgSend_activeStrokeGroupAncestorIdentifiers(self, v16, v17, v18, v19, v20);
    uint64_t v22 = NSNumber;
    uint64_t v28 = objc_msgSend_ancestorIdentifier(v4, v23, v24, v25, v26, v27);
    v33 = objc_msgSend_numberWithInteger_(v22, v29, v28, v30, v31, v32);
    LOBYTE(v22) = objc_msgSend_containsObject_(v21, v34, (uint64_t)v33, v35, v36, v37);

    return (char)v22;
  }
  else
  {

    return 0;
  }
}

@end