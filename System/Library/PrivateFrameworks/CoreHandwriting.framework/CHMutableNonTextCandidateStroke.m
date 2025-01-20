@interface CHMutableNonTextCandidateStroke
- (BOOL)adjustSupportByAddingStroke:(id)a3 consistingOfSubstrokes:(id)a4 strokeClassification:(int64_t)a5;
- (BOOL)adjustSupportByRemovingStrokeIdentifier:(id)a3;
- (id)description;
- (void)setFallbackClassification:(int64_t)a3;
- (void)setSupportByStrokeIdentifier:(id)a3;
@end

@implementation CHMutableNonTextCandidateStroke

- (void)setFallbackClassification:(int64_t)a3
{
  self->super._fallbackClassification = a3;
}

- (void)setSupportByStrokeIdentifier:(id)a3
{
  v4 = (NSMutableDictionary *)a3;
  if (self->super._supportByStrokeIdentifier != v4)
  {
    v12 = v4;
    v10 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v4, v5, v6, v7, v8, v9);
    supportByStrokeIdentifier = self->super._supportByStrokeIdentifier;
    self->super._supportByStrokeIdentifier = v10;

    v4 = v12;
  }
}

- (BOOL)adjustSupportByRemovingStrokeIdentifier:(id)a3
{
  return sub_1C49DF400((uint64_t)self, a3);
}

- (BOOL)adjustSupportByAddingStroke:(id)a3 consistingOfSubstrokes:(id)a4 strokeClassification:(int64_t)a5
{
  uint64_t v331 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v8;
  id v317 = v9;
  supportByStrokeIdentifier = self->super._supportByStrokeIdentifier;
  v17 = objc_msgSend_encodedStrokeIdentifier(v8, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_objectForKey_(supportByStrokeIdentifier, v18, (uint64_t)v17, v19, v20, v21);

  if (v22)
  {
    v28 = self->super._supportByStrokeIdentifier;
    v29 = objc_msgSend_encodedStrokeIdentifier(v8, v23, v24, v25, v26, v27);
    v34 = objc_msgSend_objectForKey_(v28, v30, (uint64_t)v29, v31, v32, v33);
    objc_msgSend_doubleValue(v34, v35, v36, v37, v38, v39);
    double v318 = v40;

    BOOL v316 = a5 == 5;
    if (a5 == 5 && (double v41 = v318, v318 > 0.0))
    {
      BOOL v316 = 1;
    }
    else if ((v318 >= 0.0 {
            || (objc_msgSend_isStrokeClassificationText_(CHStrokeUtilities, v23, a5, v25, v26, v27, v318) & 1) == 0)
    }
           && (v318 <= 0.0
            || self->super._classificationAsNonText != 6
            || (objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v23, a5, v25, v26, v27, v318) & 1) == 0))
    {
      double v41 = v318;
      if (v318 == 0.0
        || self->super._classificationAsNonText != 7
        || (objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v23, a5, v25, v26, v27, v318) & 1) == 0)
      {
LABEL_12:
        v43 = 0;
        goto LABEL_13;
      }
    }
  }
  else
  {
    BOOL v316 = a5 == 5;
    double v41 = 0.0;
    double v318 = 0.0;
  }
  switch(self->super._classificationAsNonText)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 8:
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v42 = (id)qword_1EA3C9FA8;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v42, OS_LOG_TYPE_ERROR, "Trying to get support for unsupported non-text candidate class.", buf, 2u);
      }

      goto LABEL_12;
    case 6:
      id v75 = v8;
      id v315 = v317;
      CGFloat x = self->super._enlargedBounds.origin.x;
      CGFloat y = self->super._enlargedBounds.origin.y;
      CGFloat width = self->super._enlargedBounds.size.width;
      CGFloat height = self->super._enlargedBounds.size.height;
      objc_msgSend_bounds(v75, v80, v81, v82, v83, v84);
      v346.origin.CGFloat x = v85;
      v346.origin.CGFloat y = v86;
      v346.size.CGFloat width = v87;
      v346.size.CGFloat height = v88;
      v332.origin.CGFloat x = x;
      v332.origin.CGFloat y = y;
      v332.size.CGFloat width = width;
      v332.size.CGFloat height = height;
      if (!CGRectIntersectsRect(v332, v346))
      {
        int v103 = 0;
        double v106 = 0.0;
        double v107 = 0.0;
        goto LABEL_84;
      }
      long long v324 = 0u;
      long long v325 = 0u;
      long long v322 = 0u;
      long long v323 = 0u;
      id v94 = v315;
      uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v322, (uint64_t)buf, 16, v96);
      id v313 = v75;
      int64_t v314 = a5;
      int v103 = 0;
      if (v102)
      {
        uint64_t v104 = *(void *)v323;
        v105 = (double *)MEMORY[0x1E4F1DAD8];
        double v106 = 0.0;
        double v107 = 0.0;
        while (1)
        {
          for (uint64_t i = 0; i != v102; ++i)
          {
            if (*(void *)v323 != v104) {
              objc_enumerationMutation(v94);
            }
            v120 = *(void **)(*((void *)&v322 + 1) + 8 * i);
            CGFloat v121 = self->super._enlargedBounds.origin.x;
            CGFloat v122 = self->super._enlargedBounds.origin.y;
            CGFloat v123 = self->super._enlargedBounds.size.width;
            CGFloat v124 = self->super._enlargedBounds.size.height;
            objc_msgSend_bounds(v120, v97, v98, v99, v100, v101);
            v347.origin.CGFloat x = v125;
            v347.origin.CGFloat y = v126;
            v347.size.CGFloat width = v127;
            v347.size.CGFloat height = v128;
            v333.origin.CGFloat x = v121;
            v333.origin.CGFloat y = v122;
            v333.size.CGFloat width = v123;
            v333.size.CGFloat height = v124;
            if (CGRectIntersectsRect(v333, v347))
            {
              v129 = objc_opt_class();
              uint64_t v135 = objc_msgSend_convexHull(v120, v130, v131, v132, v133, v134);
              objc_msgSend_boundingBoxOfPoints_rotatedAroundPoint_byAngle_(v129, v136, v135, v137, v138, v139, *v105, v105[1], -self->super._lineOrientationAngle);
              CGFloat v140 = v334.origin.x;
              CGFloat v141 = v334.origin.y;
              double v142 = v334.size.width;
              double v143 = v334.size.height;
              double MinX = CGRectGetMinX(v334);
              BOOL v118 = MinX <= CGRectGetMinX(self->super._rotatedBounds);
              CGFloat v145 = v140;
              CGFloat v146 = v141;
              CGFloat v147 = v142;
              CGFloat v148 = v143;
              if (v118)
              {
                CGFloat v145 = self->super._rotatedBounds.origin.x;
                CGFloat v146 = self->super._rotatedBounds.origin.y;
                CGFloat v147 = self->super._rotatedBounds.size.width;
                CGFloat v148 = self->super._rotatedBounds.size.height;
              }
              double v149 = CGRectGetMinX(*(CGRect *)&v145);
              v335.origin.CGFloat x = v140;
              v335.origin.CGFloat y = v141;
              v335.size.CGFloat width = v142;
              v335.size.CGFloat height = v143;
              double MaxX = CGRectGetMaxX(v335);
              BOOL v151 = MaxX < CGRectGetMaxX(self->super._rotatedBounds);
              CGFloat v152 = v140;
              CGFloat v153 = v141;
              CGFloat v154 = v142;
              CGFloat v155 = v143;
              if (!v151)
              {
                CGFloat v152 = self->super._rotatedBounds.origin.x;
                CGFloat v153 = self->super._rotatedBounds.origin.y;
                CGFloat v154 = self->super._rotatedBounds.size.width;
                CGFloat v155 = self->super._rotatedBounds.size.height;
              }
              double v319 = v107;
              double v321 = v106;
              double v156 = CGRectGetMaxX(*(CGRect *)&v152) - v149 + 1.0;
              if (v156 >= 0.0) {
                double v157 = v156;
              }
              else {
                double v157 = 0.0;
              }
              v336.origin.CGFloat x = v140;
              v336.origin.CGFloat y = v141;
              v336.size.CGFloat width = v142;
              v336.size.CGFloat height = v143;
              double v158 = CGRectGetMaxX(v336);
              v337.origin.CGFloat x = v140;
              v337.origin.CGFloat y = v141;
              v337.size.CGFloat width = v142;
              v337.size.CGFloat height = v143;
              double v159 = CGRectGetMinX(v337);
              v338.origin.CGFloat x = v140;
              v338.origin.CGFloat y = v141;
              v338.size.CGFloat width = v142;
              v338.size.CGFloat height = v143;
              double MaxY = CGRectGetMaxY(v338);
              if (MaxY < CGRectGetMinY(self->super._rotatedBounds))
              {
                v339.origin.CGFloat x = v140;
                v339.origin.CGFloat y = v141;
                v339.size.CGFloat width = v142;
                v339.size.CGFloat height = v143;
                double v161 = CGRectGetMaxY(v339);
                double MinY = CGRectGetMinY(self->super._rotatedBounds);
                goto LABEL_34;
              }
              v340.origin.CGFloat x = v140;
              v340.origin.CGFloat y = v141;
              v340.size.CGFloat width = v142;
              v340.size.CGFloat height = v143;
              double v163 = CGRectGetMinY(v340);
              CGFloat v164 = CGRectGetMaxY(self->super._rotatedBounds);
              double v109 = 0.0;
              if (v163 > v164)
              {
                v341.origin.CGFloat x = v140;
                v341.origin.CGFloat y = v141;
                v341.size.CGFloat width = v142;
                v341.size.CGFloat height = v143;
                double v161 = CGRectGetMinY(v341);
                double MinY = CGRectGetMaxY(self->super._rotatedBounds);
LABEL_34:
                double v109 = vabdd_f64(v161, MinY);
              }
              ++v103;
              double v110 = v157 / (v158 - v159 + 1.0);
              double v111 = v109 / 63.0 / sqrt(v109 / 63.0 * (v109 / 63.0) + 1.0);
              double v112 = sqrt(v143 * v143 + v142 * v142);
              if (v112 < 21.0) {
                double v112 = 21.0;
              }
              double v113 = self->super._boundsDiagonal / v112 * 0.1;
              double v114 = sqrt(v113 * v113 + 1.0);
              double v115 = (1.0 - v111) * (1.0 - v111);
              double v116 = v113 / v114 * (v113 / v114);
              double v106 = v321 + v116;
              int64_t substrokesCount = self->super._substrokesCount;
              BOOL v118 = substrokesCount < 2;
              uint64_t v119 = substrokesCount - 2;
              if (v118) {
                uint64_t v119 = 0;
              }
              double v107 = v319 + pow(1.0 - self->super._lineError, (double)v119 * 0.4 + 1.0) * (v110 * v115 * v116);
              continue;
            }
          }
          uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v97, (uint64_t)&v322, (uint64_t)buf, 16, v101);
          if (!v102) {
            goto LABEL_83;
          }
        }
      }
      double v106 = 0.0;
      double v107 = 0.0;
LABEL_83:

      v10 = v8;
      a5 = v314;
      id v75 = v313;
LABEL_84:
      v326 = @"support";
      v300 = objc_msgSend_numberWithDouble_(NSNumber, v89, v90, v91, v92, v93, v107);
      v327 = @"sizeRatio";
      v328 = v300;
      if (v103) {
        double v106 = v106 / (double)v103;
      }
      v301 = objc_msgSend_numberWithDouble_(NSNumber, v295, v296, v297, v298, v299, v106);
      v329 = v301;
      v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v302, (uint64_t)&v328, (uint64_t)&v326, 2, v303);

      break;
    case 7:
      id v165 = v8;
      id v166 = v8;
      id v167 = v317;
      CGFloat v168 = self->super._bounds.origin.x;
      CGFloat v169 = self->super._bounds.origin.y;
      CGFloat v170 = self->super._bounds.size.width;
      CGFloat v171 = self->super._bounds.size.height;
      objc_msgSend_bounds(v166, v172, v173, v174, v175, v176);
      v348.origin.CGFloat x = v177;
      v348.origin.CGFloat y = v178;
      v348.size.CGFloat width = v179;
      v348.size.CGFloat height = v180;
      v342.origin.CGFloat x = v168;
      v342.origin.CGFloat y = v169;
      v342.size.CGFloat width = v170;
      v342.size.CGFloat height = v171;
      if (CGRectIntersectsRect(v342, v348))
      {
        long long v324 = 0u;
        long long v325 = 0u;
        long long v322 = 0u;
        long long v323 = 0u;
        id v186 = v167;
        uint64_t v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(v186, v187, (uint64_t)&v322, (uint64_t)buf, 16, v188);
        id v320 = v167;
        int v195 = 0;
        if (v194)
        {
          uint64_t v196 = *(void *)v323;
          double v197 = 0.0;
          double v198 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v194; ++j)
            {
              if (*(void *)v323 != v196) {
                objc_enumerationMutation(v186);
              }
              v207 = *(void **)(*((void *)&v322 + 1) + 8 * j);
              CGFloat v208 = self->super._bounds.origin.x;
              CGFloat v209 = self->super._bounds.origin.y;
              CGFloat v210 = self->super._bounds.size.width;
              CGFloat v211 = self->super._bounds.size.height;
              objc_msgSend_bounds(v207, v189, v190, v191, v192, v193);
              v349.origin.CGFloat x = v212;
              v349.origin.CGFloat y = v213;
              v349.size.CGFloat width = v214;
              v349.size.CGFloat height = v215;
              v343.origin.CGFloat x = v208;
              v343.origin.CGFloat y = v209;
              v343.size.CGFloat width = v210;
              v343.size.CGFloat height = v211;
              if (CGRectIntersectsRect(v343, v349))
              {
                CGFloat v216 = self->super._bounds.origin.x;
                CGFloat v217 = self->super._bounds.origin.y;
                CGFloat v218 = self->super._bounds.size.width;
                CGFloat v219 = self->super._bounds.size.height;
                objc_msgSend_bounds(v207, v189, v190, v191, v192, v193);
                v350.origin.CGFloat x = v220;
                v350.origin.CGFloat y = v221;
                v350.size.CGFloat width = v222;
                v350.size.CGFloat height = v223;
                v344.origin.CGFloat x = v216;
                v344.origin.CGFloat y = v217;
                v344.size.CGFloat width = v218;
                v344.size.CGFloat height = v219;
                CGRect v345 = CGRectIntersection(v344, v350);
                double v224 = v345.size.width;
                double v225 = v345.size.height;
                objc_msgSend_bounds(v207, v226, v227, v228, v229, v230, v345.origin.x, v345.origin.y);
                double v232 = v231;
                objc_msgSend_bounds(v207, v233, v234, v235, v236, v237);
                if (v232 * v243 <= 0.0) {
                  double v244 = 1.0;
                }
                else {
                  double v244 = v224 * v225 / (v232 * v243);
                }
                objc_msgSend_bounds(v207, v238, v239, v240, v241, v242);
                double v246 = v245;
                objc_msgSend_bounds(v207, v247, v248, v249, v250, v251);
                double v253 = v252;
                objc_msgSend_bounds(v207, v254, v255, v256, v257, v258);
                double v260 = v259;
                objc_msgSend_bounds(v207, v261, v262, v263, v264, v265);
                double v272 = 21.0;
                if (sqrt(v260 * v271 + v246 * v253) >= 21.0)
                {
                  objc_msgSend_bounds(v207, v266, v267, v268, v269, v270);
                  double v274 = v273;
                  objc_msgSend_bounds(v207, v275, v276, v277, v278, v279);
                  double v281 = v280;
                  objc_msgSend_bounds(v207, v282, v283, v284, v285, v286);
                  double v288 = v287;
                  objc_msgSend_bounds(v207, v289, v290, v291, v292, v293);
                  double v272 = sqrt(v288 * v200 + v274 * v281);
                }
                ++v195;
                double v201 = self->super._boundsDiagonal / v272 * 0.1;
                double v202 = sqrt(v201 * v201 + 1.0);
                double v203 = v201 / v202 * (v201 / v202);
                double v197 = v197 + v203;
                double v204 = fmax(self->super._containerScore * 0.015625, 0.1);
                int64_t v205 = self->super._substrokesCount;
                BOOL v118 = v205 < 2;
                uint64_t v206 = v205 - 2;
                if (v118) {
                  uint64_t v206 = 0;
                }
                double v198 = v198 + v203 * (v244 * pow(v204, (double)v206 * 0.4 + 1.0));
              }
            }
            uint64_t v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(v186, v189, (uint64_t)&v322, (uint64_t)buf, 16, v193);
          }
          while (v194);
        }
        else
        {
          double v197 = 0.0;
          double v198 = 0.0;
        }

        id v167 = v320;
      }
      else
      {
        int v195 = 0;
        double v197 = 0.0;
        double v198 = 0.0;
      }
      v326 = @"support";
      v309 = objc_msgSend_numberWithDouble_(NSNumber, v181, v182, v183, v184, v185, v198);
      v327 = @"sizeRatio";
      v328 = v309;
      if (v195) {
        double v197 = v197 / (double)v195;
      }
      v10 = v165;
      v310 = objc_msgSend_numberWithDouble_(NSNumber, v304, v305, v306, v307, v308, v197);
      v329 = v310;
      v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v311, (uint64_t)&v328, (uint64_t)&v326, 2, v312);

      break;
    default:
      goto LABEL_12;
  }
LABEL_13:
  v44 = objc_msgSend_objectForKey_(v43, v23, @"support", v25, v26, v27, v41);
  objc_msgSend_floatValue(v44, v45, v46, v47, v48, v49);
  float v51 = v50;

  v56 = objc_msgSend_objectForKey_(v43, v52, @"sizeRatio", v53, v54, v55);
  objc_msgSend_floatValue(v56, v57, v58, v59, v60, v61);
  float v63 = v62;

  double v68 = v51;
  if (v51 != 0.0)
  {
    if (objc_msgSend_isStrokeClassificationText_(CHStrokeUtilities, v64, a5, v65, v66, v67))
    {
      v74 = objc_msgSend_encodedStrokeIdentifier(v10, v69, v70, v71, v72, v73);
      sub_1C49DF2FC((uint64_t)self, v74, v68, v63);
    }
    else if (v316 {
           || objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v69, a5, v71, v72, v73)&& self->super._classificationAsNonText == 6)
    }
    {
      v74 = objc_msgSend_encodedStrokeIdentifier(v10, v69, v70, v71, v72, v73);
      double v68 = -v68;
      sub_1C49DF2FC((uint64_t)self, v74, v68, v63);
    }
    else
    {
      v74 = objc_msgSend_encodedStrokeIdentifier(v10, v69, v70, v71, v72, v73);
      double v68 = 0.0;
      sub_1C49DF400((uint64_t)self, v74);
    }
  }
  return v68 != v318;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v11 = objc_msgSend_strokeIdentifier(self, v6, v7, v8, v9, v10);
  objc_msgSend_support(self, v12, v13, v14, v15, v16);
  uint64_t v23 = v22;
  if (self) {
    int64_t classificationAsNonText = self->super._classificationAsNonText;
  }
  else {
    int64_t classificationAsNonText = 0;
  }
  uint64_t v25 = objc_msgSend_fallbackClassification(self, v17, v18, v19, v20, v21);
  v30 = objc_msgSend_stringWithFormat_(v3, v26, @"<%@: %p strokeIdentifier=(%@) support=%.3f class=%ld fallbackClass=%ld>", v27, v28, v29, v5, self, v11, v23, classificationAsNonText, v25);

  return v30;
}

@end