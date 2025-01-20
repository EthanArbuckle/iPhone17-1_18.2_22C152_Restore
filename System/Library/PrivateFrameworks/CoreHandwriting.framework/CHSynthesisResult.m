@interface CHSynthesisResult
+ (BOOL)supportsSecureCoding;
- ($9936F71585EAE7D8081FB1B234834B3F)principalLines;
- (CHDrawing)drawing;
- (CHDrawing)inventoryDebuggingStyleDrawing;
- (CHSynthesisResult)initWithCoder:(id)a3;
- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4;
- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6 inventoryDebuggingStyleDrawing:(id)a7 inventoryDebuggingStyleContent:(id)a8 numberOfNotSynthesizedCharacters:(unint64_t)a9;
- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6 numberOfNotSynthesizedCharacters:(unint64_t)a7;
- (NSArray)contractViolations;
- (NSArray)segmentContents;
- (NSArray)segmentStrokeIndexes;
- (NSString)content;
- (NSString)inventoryDebuggingStyleContent;
- (unint64_t)numberOfNotSynthesizedCharacters;
- (void)applyDesiredDistanceBetweenDigitCenters:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resampleDrawing;
- (void)scaleDrawingWithWidth:(double)a3 height:(double)a4 desiredDistanceBetweenDigitCenters:(double)a5;
- (void)setContractViolations:(id)a3;
- (void)setNumberOfNotSynthesizedCharacters:(unint64_t)a3;
- (void)setPrincipalLines:(id *)a3;
@end

@implementation CHSynthesisResult

- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v13 = objc_msgSend_copy(v6, v8, v9, v10, v11, v12);
  v37[0] = v13;
  v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v37, 1, v15, v16);
  v18 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v24 = objc_msgSend_strokeCount(v7, v19, v20, v21, v22, v23);
  v28 = objc_msgSend_indexSetWithIndexesInRange_(v18, v25, 0, v24, v26, v27);
  v36 = v28;
  v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v29, (uint64_t)&v36, 1, v30, v31);
  v34 = (CHSynthesisResult *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(self, v33, (uint64_t)v6, (uint64_t)v7, (uint64_t)v17, (uint64_t)v32, 0);

  return v34;
}

- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6 numberOfNotSynthesizedCharacters:(unint64_t)a7
{
  return (CHSynthesisResult *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_inventoryDebuggingStyleDrawing_inventoryDebuggingStyleContent_numberOfNotSynthesizedCharacters_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, 0, 0, a7);
}

- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6 inventoryDebuggingStyleDrawing:(id)a7 inventoryDebuggingStyleContent:(id)a8 numberOfNotSynthesizedCharacters:(unint64_t)a9
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v89.receiver = self;
  v89.super_class = (Class)CHSynthesisResult;
  uint64_t v26 = [(CHSynthesisResult *)&v89 init];
  if (v26)
  {
    uint64_t v27 = objc_msgSend_copy(v15, v21, v22, v23, v24, v25);
    v28 = (void *)*((void *)v26 + 2);
    *((void *)v26 + 2) = v27;

    uint64_t v34 = objc_msgSend_copy(v16, v29, v30, v31, v32, v33);
    v35 = (void *)*((void *)v26 + 1);
    *((void *)v26 + 1) = v34;

    uint64_t v41 = objc_msgSend_copy(v17, v36, v37, v38, v39, v40);
    v42 = (void *)*((void *)v26 + 3);
    *((void *)v26 + 3) = v41;

    uint64_t v48 = objc_msgSend_copy(v18, v43, v44, v45, v46, v47);
    v49 = (void *)*((void *)v26 + 4);
    *((void *)v26 + 4) = v48;

    uint64_t v55 = objc_msgSend_copy(v19, v50, v51, v52, v53, v54);
    v56 = (void *)*((void *)v26 + 6);
    *((void *)v26 + 6) = v55;

    uint64_t v62 = objc_msgSend_copy(v20, v57, v58, v59, v60, v61);
    v63 = (void *)*((void *)v26 + 7);
    *((void *)v26 + 7) = v62;

    *(_OWORD *)(v26 + 184) = 0u;
    *(_OWORD *)(v26 + 168) = 0u;
    *(_OWORD *)(v26 + 152) = 0u;
    *(_OWORD *)(v26 + 136) = 0u;
    *(_OWORD *)(v26 + 120) = 0u;
    *(_OWORD *)(v26 + 104) = 0u;
    *(_OWORD *)(v26 + 88) = 0u;
    *(_OWORD *)(v26 + 72) = 0u;
    uint64_t v69 = objc_msgSend_count(*((void **)v26 + 3), v64, v65, v66, v67, v68);
    if (v69 != objc_msgSend_count(*((void **)v26 + 4), v70, v71, v72, v73, v74))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v75 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
      {
        uint64_t v81 = objc_msgSend_count(*((void **)v26 + 3), v76, v77, v78, v79, v80);
        uint64_t v87 = objc_msgSend_count(*((void **)v26 + 4), v82, v83, v84, v85, v86);
        *(_DWORD *)buf = 134218240;
        uint64_t v91 = v81;
        __int16 v92 = 2048;
        uint64_t v93 = v87;
        _os_log_impl(&dword_1C492D000, v75, OS_LOG_TYPE_FAULT, "Expected an equal number of segments (%lu) and segmentStrokeIndexes (%lu)", buf, 0x16u);
      }
    }
    *((void *)v26 + 5) = a9;
  }

  return (CHSynthesisResult *)v26;
}

- (CHSynthesisResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"content", v7, v8);
  uint64_t v10 = objc_opt_class();
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"drawing", v12, v13);
  uint64_t v15 = objc_opt_class();
  id v19 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v16, v15, @"segmentContents", v17, v18);
  uint64_t v20 = objc_opt_class();
  uint64_t v24 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v21, v20, @"segmentStrokeIndexes", v22, v23);
  uint64_t v25 = objc_opt_class();
  v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"inventoryDebuggingStyleDrawing", v27, v28);
  uint64_t v30 = objc_opt_class();
  uint64_t v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"inventoryDebuggingStyleContent", v32, v33);
  uint64_t v39 = objc_msgSend_decodeIntegerForKey_(v4, v35, @"numberOfNotSynthesizedCharacters", v36, v37, v38);
  uint64_t v41 = (CHSynthesisResult *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_inventoryDebuggingStyleDrawing_inventoryDebuggingStyleContent_numberOfNotSynthesizedCharacters_(self, v40, (uint64_t)v9, (uint64_t)v14, (uint64_t)v19, (uint64_t)v24, v29, v34, v39);
  uint64_t v54 = 0;
  id v42 = v4;
  uint64_t v46 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(v42, v43, @"principalLines", (uint64_t)&v54, v44, v45);
  if (v46 && v54 == 128)
  {
    v50 = __dst;
    memmove(__dst, v46, 0x80uLL);
  }
  else
  {
    v50 = v52;
    memset(v52, 0, sizeof(v52));
  }
  objc_msgSend_setPrincipalLines_(v41, (const char *)v46, (uint64_t)v50, v47, v48, v49);

  return v41;
}

- (void)applyDesiredDistanceBetweenDigitCenters:(double)a3
{
  objc_msgSend_bounds(self->_drawing, a2, v3, v4, v5, v6);
  double Height = CGRectGetHeight(v103);
  v101 = objc_alloc_init(CHDrawing);
  uint64_t v20 = objc_msgSend_count(self->_segmentContents, v10, v11, v12, v13, v14);
  if (v20 >= 1)
  {
    uint64_t v21 = 0;
    double v22 = Height * 0.05;
    double v23 = a3 * 0.5;
    unint64_t v24 = 0x8000000000000000;
    double v25 = 0.0;
    unint64_t v99 = 0x8000000000000000;
    double MidX = 0.0;
    do
    {
      uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentStrokeIndexes, v15, v21, v17, v18, v19, v99);
      uint64_t v32 = objc_msgSend_drawingWithStrokesFromIndexSet_(self->_drawing, v28, (uint64_t)v27, v29, v30, v31);
      uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentContents, v33, v21, v34, v35, v36);
      objc_msgSend_bounds(v101, v38, v39, v40, v41, v42);
      double MaxX = CGRectGetMaxX(v104);
      objc_msgSend_bounds(v32, v44, v45, v46, v47, v48);
      double MinX = CGRectGetMinX(v105);
      uint64_t v55 = objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E4F28B88], v50, v51, v52, v53, v54);
      uint64_t v59 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v37, v56, (uint64_t)v55, 1, v57, v58);
      double v60 = v25 + MinX;

      if (!v59)
      {
        uint64_t v68 = objc_msgSend_ch_mathDecimalSeparatorCharSet(MEMORY[0x1E4F28B88], v61, v62, v63, v64, v65);
        uint64_t v72 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v37, v69, (uint64_t)v68, 1, v70, v71);

        if (!v72) {
          goto LABEL_11;
        }
        if (v21 - 1 != v24) {
          goto LABEL_11;
        }
        uint64_t v62 = v21 + 1;
        if (v21 + 1 >= v20) {
          goto LABEL_11;
        }
        uint64_t v73 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentContents, v61, v62, v63, v64, v65);
        uint64_t v79 = objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E4F28B88], v74, v75, v76, v77, v78);
        uint64_t v83 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v73, v80, (uint64_t)v79, 1, v81, v82);

        if (v83)
        {
          objc_msgSend_bounds(v32, v61, v62, v63, v64, v65);
          double v85 = MaxX + fmax(v23 + MidX - MaxX + v84 * -0.5, v22);
          uint64_t v100 = v21;
        }
        else
        {
LABEL_11:
          double v85 = v60;
        }
        goto LABEL_17;
      }
      if (v21 - 1 == v24)
      {
        objc_msgSend_bounds(v32, v61, v62, v63, v64, v65);
        double v67 = fmax(MidX + a3 - MaxX + v66 * -0.5, 0.0);
      }
      else
      {
        if (v21 - 2 != v24 || v21 - 1 != v100)
        {
          double v85 = v60;
          unint64_t v24 = v21;
          goto LABEL_17;
        }
        objc_msgSend_bounds(v32, v61, v62, v63, v64, v65);
        double v67 = fmax(v23 + MidX - MaxX + v86 * -0.5, v22);
      }
      double v85 = MaxX + v67;
      unint64_t v24 = v21;
LABEL_17:
      double v25 = v25 + v85 - v60;
      uint64_t v87 = objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v32, v61, v62, v63, v64, v65, v25, 0.0, 1.0, v100);

      objc_msgSend_bounds(v87, v88, v89, v90, v91, v92);
      double MidX = CGRectGetMidX(v106);
      objc_msgSend_appendDrawing_(v101, v93, (uint64_t)v87, v94, v95, v96);

      ++v21;
    }
    while (v20 != v21);
  }
  v97 = (CHDrawing *)objc_msgSend_copy(v101, v15, v16, v17, v18, v19);
  drawing = self->_drawing;
  self->_drawing = v97;
}

- (void)scaleDrawingWithWidth:(double)a3 height:(double)a4 desiredDistanceBetweenDigitCenters:(double)a5
{
  uint64_t v255 = *MEMORY[0x1E4F143B8];
  drawing = self->_drawing;
  if (drawing)
  {
    uint64_t v10 = drawing;
    double x = self->_principalLines.descender.start.x;
    double y = self->_principalLines.descender.start.y;
    double v13 = self->_principalLines.descender.end.x;
    double v230 = self->_principalLines.descender.end.y;
    $52684A533F9881AC3B923BCCCF5A9B81 base = self->_principalLines.base;
    $52684A533F9881AC3B923BCCCF5A9B81 median = self->_principalLines.median;
    $52684A533F9881AC3B923BCCCF5A9B81 top = self->_principalLines.top;
    objc_msgSend_bounds(v10, v14, v15, v16, v17, v18);
    double v20 = v19;
    objc_msgSend_bounds(v10, v21, v22, v23, v24, v25);
    if (v20 < 0.001 || v31 < 0.001 || a3 < 0.001 && a4 < 0.001) {
      goto LABEL_33;
    }
    double v32 = a3 / v20;
    double v33 = a4 / v31;
    if (a3 < 0.001 || a4 < 0.001)
    {
      if (a3 < 0.001)
      {
        if (a4 >= 0.001)
        {
          objc_msgSend_bounds(v10, v26, v27, v28, v29, v30);
          double v190 = v189;
          objc_msgSend_bounds(v10, v191, v192, v193, v194, v195);
          objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v10, v197, v198, v199, v200, v201, -v190, -v196, v33);
          v202 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
          v203 = self->_drawing;
          self->_drawing = v202;

          v243[0] = x;
          v243[1] = y;
          v243[2] = v13;
          v243[3] = v230;
          $52684A533F9881AC3B923BCCCF5A9B81 v244 = base;
          $52684A533F9881AC3B923BCCCF5A9B81 v245 = median;
          $52684A533F9881AC3B923BCCCF5A9B81 v246 = top;
          objc_msgSend_bounds(v10, v204, v205, v206, v207, v208);
          double v210 = v209;
          objc_msgSend_bounds(v10, v211, v212, v213, v214, v215);
          sub_1C4B56AB4((double *)buf, v243, v210, v216, 1.0 / v33, 1.0 / v33);
          CGPoint v222 = v252;
          self->_principalLines.median.start = v251;
          self->_principalLines.median.end = v222;
          CGPoint v223 = v254;
          self->_principalLines.top.start = v253;
          self->_principalLines.top.end = v223;
          CGPoint v224 = v248;
          self->_principalLines.descender.start = *(CGPoint *)buf;
          self->_principalLines.descender.end = v224;
          CGPoint v225 = v250;
          self->_principalLines.base.start = v249;
          self->_principalLines.base.end = v225;
          if (a5 > 0.0) {
            objc_msgSend_applyDesiredDistanceBetweenDigitCenters_(self, v217, v218, v219, v220, v221, a5);
          }
        }
      }
      else
      {
        objc_msgSend_bounds(v10, v26, v27, v28, v29, v30);
        double v87 = v86;
        objc_msgSend_bounds(v10, v88, v89, v90, v91, v92);
        objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v10, v94, v95, v96, v97, v98, -v87, -v93, v32);
        unint64_t v99 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
        uint64_t v100 = self->_drawing;
        self->_drawing = v99;

        objc_msgSend_bounds(v10, v101, v102, v103, v104, v105);
        double v107 = v106;
        objc_msgSend_bounds(v10, v108, v109, v110, v111, v112);
        double v114 = 1.0;
        if (1.0 / v32 != 0.0) {
          double v114 = 1.0 / v32;
        }
        self->_principalLines.descender.start.double x = (x - v107) / v114;
        self->_principalLines.descender.start.double y = (y - v113) / v114;
        self->_principalLines.descender.end.double x = (v13 - v107) / v114;
        self->_principalLines.descender.end.double y = (v230 - v113) / v114;
        self->_principalLines.base.start.double x = (base.start.x - v107) / v114;
        self->_principalLines.base.start.double y = (base.start.y - v113) / v114;
        self->_principalLines.base.end.double x = (base.end.x - v107) / v114;
        self->_principalLines.base.end.double y = (base.end.y - v113) / v114;
        self->_principalLines.median.start.double x = (median.start.x - v107) / v114;
        self->_principalLines.median.start.double y = (median.start.y - v113) / v114;
        self->_principalLines.median.end.double x = (median.end.x - v107) / v114;
        self->_principalLines.median.end.double y = (median.end.y - v113) / v114;
        self->_principalLines.top.start.double x = (top.start.x - v107) / v114;
        self->_principalLines.top.start.double y = (top.start.y - v113) / v114;
        self->_principalLines.top.end.double x = (top.end.x - v107) / v114;
        self->_principalLines.top.end.double y = (top.end.y - v113) / v114;
      }
      goto LABEL_33;
    }
    if (v33 <= v32)
    {
      objc_msgSend_bounds(v10, v26, v27, v28, v29, v30);
      double v229 = v115;
      objc_msgSend_bounds(v10, v116, v117, v118, v119, v120);
      double v127 = v126;
      if (1.0 / v33 == 0.0) {
        double v128 = 1.0;
      }
      else {
        double v128 = 1.0 / v33;
      }
      objc_msgSend_bounds(v10, v121, v122, v123, v124, v125);
      double v130 = v129;
      objc_msgSend_bounds(v10, v131, v132, v133, v134, v135);
      objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v10, v137, v138, v139, v140, v141, -v130, -v136, v33);
      v142 = (CHDrawing *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_bounds(v142, v143, v144, v145, v146, v147);
      double v154 = a3 - v153;
      if (a3 - v153 < 0.0)
      {
        v226 = CHOSLogForCategory(9);
        if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v154;
          _os_log_impl(&dword_1C492D000, v226, OS_LOG_TYPE_ERROR, "Synthesizer: Error in scaleDrawingFromResult: needToAddSpaces=%f < 0", buf, 0xCu);
        }

        uint64_t v10 = v142;
        goto LABEL_33;
      }
      unint64_t v155 = objc_msgSend_count(self->_segmentContents, v148, v149, v150, v151, v152);
      double v227 = (x - v229) / v128;
      double v156 = (y - v127) / v128;
      double v75 = (v13 - v229) / v128;
      double v76 = (v230 - v127) / v128;
      double v77 = (base.start.x - v229) / v128;
      double v78 = (base.start.y - v127) / v128;
      double v65 = (base.end.x - v229) / v128;
      double v66 = (base.end.y - v127) / v128;
      double v79 = (median.start.x - v229) / v128;
      double v67 = (median.start.y - v127) / v128;
      double v80 = (median.end.x - v229) / v128;
      double v81 = (median.end.y - v127) / v128;
      double v82 = (top.start.x - v229) / v128;
      double v83 = (top.start.y - v127) / v128;
      double v242 = (top.end.x - v229) / v128;
      double v69 = (top.end.y - v127) / v128;
      if (v155 < 2)
      {
        uint64_t v10 = v142;
        double v63 = v227;
        double v64 = v156;
        double v68 = v242;
        goto LABEL_14;
      }
      double v240 = (top.start.x - v229) / v128;
      double v241 = (top.start.y - v127) / v128;
      double v237 = (median.end.x - v229) / v128;
      double v238 = (median.end.y - v127) / v128;
      double v236 = (median.start.x - v229) / v128;
      double v233 = (base.start.x - v229) / v128;
      double v234 = (base.start.y - v127) / v128;
      double v228 = v75;
      double v231 = (v230 - v127) / v128;
      uint64_t v62 = objc_alloc_init(CHDrawing);
      unint64_t v162 = 0;
      double v163 = 0.0;
      double v64 = v156;
      while (v162 < objc_msgSend_count(self->_segmentContents, v157, v158, v159, v160, v161))
      {
        v168 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentStrokeIndexes, v164, v162, v165, v166, v167);
        v173 = objc_msgSend_drawingWithStrokesFromIndexSet_(v142, v169, (uint64_t)v168, v170, v171, v172);
        v179 = objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v173, v174, v175, v176, v177, v178, v163, 0.0, 1.0);
        objc_msgSend_appendDrawing_(v62, v180, (uint64_t)v179, v181, v182, v183);

        double v163 = v163
             + v154
             / (double)(unint64_t)(objc_msgSend_count(self->_segmentContents, v184, v185, v186, v187, v188) - 1);

        ++v162;
      }
      uint64_t v10 = v142;
      double v63 = v227;
      double v68 = v242;
    }
    else
    {
      objc_msgSend_bounds(v10, v26, v27, v28, v29, v30);
      double v35 = v34;
      objc_msgSend_bounds(v10, v36, v37, v38, v39, v40);
      double v47 = v46;
      if (1.0 / v32 == 0.0) {
        double v48 = 1.0;
      }
      else {
        double v48 = 1.0 / v32;
      }
      objc_msgSend_bounds(v10, v41, v42, v43, v44, v45);
      double v50 = v49;
      objc_msgSend_bounds(v10, v51, v52, v53, v54, v55);
      objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v10, v57, v58, v59, v60, v61, -v50, -v56, v32);
      uint64_t v62 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
      double v63 = (x - v35) / v48;
      double v64 = (y - v47) / v48;
      double v228 = (v13 - v35) / v48;
      double v231 = (v230 - v47) / v48;
      double v233 = (base.start.x - v35) / v48;
      double v234 = (base.start.y - v47) / v48;
      double v65 = (base.end.x - v35) / v48;
      double v66 = (base.end.y - v47) / v48;
      double v236 = (median.start.x - v35) / v48;
      double v67 = (median.start.y - v47) / v48;
      double v237 = (median.end.x - v35) / v48;
      double v238 = (median.end.y - v47) / v48;
      double v240 = (top.start.x - v35) / v48;
      double v241 = (top.start.y - v47) / v48;
      double v68 = (top.end.x - v35) / v48;
      double v69 = (top.end.y - v47) / v48;
    }

    uint64_t v10 = v62;
    double v75 = v228;
    double v76 = v231;
    double v77 = v233;
    double v78 = v234;
    double v79 = v236;
    double v80 = v237;
    double v81 = v238;
    double v82 = v240;
    double v83 = v241;
LABEL_14:
    self->_principalLines.descender.start.double x = v63;
    self->_principalLines.descender.start.double y = v64;
    self->_principalLines.descender.end.double x = v75;
    self->_principalLines.descender.end.double y = v76;
    self->_principalLines.base.start.double x = v77;
    self->_principalLines.base.start.double y = v78;
    self->_principalLines.base.end.double x = v65;
    self->_principalLines.base.end.double y = v66;
    self->_principalLines.median.start.double x = v79;
    self->_principalLines.median.start.double y = v67;
    self->_principalLines.median.end.double x = v80;
    self->_principalLines.median.end.double y = v81;
    self->_principalLines.top.start.double x = v82;
    self->_principalLines.top.start.double y = v83;
    self->_principalLines.top.end.double x = v68;
    self->_principalLines.top.end.double y = v69;
    double v84 = (CHDrawing *)objc_msgSend_copy(v10, v70, v71, v72, v73, v74);
    double v85 = self->_drawing;
    self->_drawing = v84;

LABEL_33:
  }
}

- (void)resampleDrawing
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  drawing = self->_drawing;
  if (drawing)
  {
    if (objc_msgSend_strokeCount(drawing, a2, v2, v3, v4, v5))
    {
      unint64_t v13 = objc_msgSend_pointCount(self->_drawing, v8, v9, v10, v11, v12);
      if (v13 >= 2)
      {
        unint64_t v19 = v13;
        objc_msgSend_cumulativePointToPointDistance(self->_drawing, v14, v15, v16, v17, v18);
        float v21 = v20 / (float)(v19 - 1);
        objc_msgSend_drawingResampledWithCatmullRomSplineInterpolation_(self->_drawing, v22, v23, v24, v25, v26, (float)(v21 / 3.0));
        uint64_t v27 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = self->_drawing;
        self->_drawing = v27;

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v29 = (id)qword_1EA3C9FD8;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = objc_msgSend_pointCount(self->_drawing, v30, v31, v32, v33, v34);
          v36[0] = 67109888;
          v36[1] = v19;
          __int16 v37 = 2048;
          double v38 = v21;
          __int16 v39 = 1024;
          int v40 = v35;
          __int16 v41 = 2048;
          double v42 = (float)(v21 / 3.0);
          _os_log_impl(&dword_1C492D000, v29, OS_LOG_TYPE_DEFAULT, "Synthesizer: resample drawing with %d points and %f average distance to %d points with sampling rate %f", (uint8_t *)v36, 0x22u);
        }
      }
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v40 = a3;
  objc_msgSend_encodeObject_forKey_(v40, v4, (uint64_t)self->_content, @"content", v5, v6);
  objc_msgSend_encodeObject_forKey_(v40, v7, (uint64_t)self->_drawing, @"drawing", v8, v9);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v10, (uint64_t)&self->_principalLines, 128, v11, v12);
  id v13 = objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_bytes(v13, v14, v15, v16, v17, v18);
  uint64_t v25 = objc_msgSend_length(v13, v20, v21, v22, v23, v24);
  objc_msgSend_encodeBytes_length_forKey_(v40, v26, v19, v25, @"principalLines", v27);
  objc_msgSend_encodeObject_forKey_(v40, v28, (uint64_t)self->_segmentContents, @"segmentContents", v29, v30);
  objc_msgSend_encodeObject_forKey_(v40, v31, (uint64_t)self->_segmentStrokeIndexes, @"segmentStrokeIndexes", v32, v33);
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend_encodeObject_forKey_(v40, v34, (uint64_t)self->_inventoryDebuggingStyleDrawing, @"inventoryDebuggingStyleDrawing", v35, v36);
    objc_msgSend_encodeObject_forKey_(v40, v37, (uint64_t)self->_inventoryDebuggingStyleContent, @"inventoryDebuggingStyleContent", v38, v39);
  }
  objc_msgSend_encodeInteger_forKey_(v40, v34, self->_numberOfNotSynthesizedCharacters, @"numberOfNotSynthesizedCharacters", v35, v36);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHDrawing)drawing
{
  return (CHDrawing *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)content
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)segmentContents
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)segmentStrokeIndexes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)numberOfNotSynthesizedCharacters
{
  return self->_numberOfNotSynthesizedCharacters;
}

- (void)setNumberOfNotSynthesizedCharacters:(unint64_t)a3
{
  self->_numberOfNotSynthesizedCharacters = a3;
}

- (CHDrawing)inventoryDebuggingStyleDrawing
{
  return self->_inventoryDebuggingStyleDrawing;
}

- (NSString)inventoryDebuggingStyleContent
{
  return self->_inventoryDebuggingStyleContent;
}

- ($9936F71585EAE7D8081FB1B234834B3F)principalLines
{
  CGPoint v3 = *(CGPoint *)&self[1].var0.var1.y;
  retstr->var2.var0 = *(CGPoint *)&self[1].var0.var0.y;
  retstr->var2.var1 = v3;
  CGPoint v4 = *(CGPoint *)&self[1].var1.var1.y;
  retstr->var3.var0 = *(CGPoint *)&self[1].var1.var0.y;
  retstr->var3.var1 = v4;
  CGPoint v5 = *(CGPoint *)&self->var2.var1.y;
  retstr->var0.var0 = *(CGPoint *)&self->var2.var0.y;
  retstr->var0.var1 = v5;
  CGPoint v6 = *(CGPoint *)&self->var3.var1.y;
  retstr->var1.var0 = *(CGPoint *)&self->var3.var0.y;
  retstr->var1.var1 = v6;
  return self;
}

- (void)setPrincipalLines:(id *)a3
{
  CGPoint var0 = a3->var0.var0;
  CGPoint var1 = a3->var0.var1;
  CGPoint v5 = a3->var1.var0;
  self->_principalLines.base.end = a3->var1.var1;
  self->_principalLines.base.start = v5;
  self->_principalLines.descender.end = var1;
  self->_principalLines.descender.start = var0;
  CGPoint v6 = a3->var2.var0;
  CGPoint v7 = a3->var2.var1;
  CGPoint v8 = a3->var3.var0;
  self->_principalLines.top.end = a3->var3.var1;
  self->_principalLines.top.start = v8;
  self->_principalLines.median.end = v7;
  self->_principalLines.median.start = v6;
}

- (NSArray)contractViolations
{
  return self->_contractViolations;
}

- (void)setContractViolations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contractViolations, 0);
  objc_storeStrong((id *)&self->_inventoryDebuggingStyleContent, 0);
  objc_storeStrong((id *)&self->_inventoryDebuggingStyleDrawing, 0);
  objc_storeStrong((id *)&self->_segmentStrokeIndexes, 0);
  objc_storeStrong((id *)&self->_segmentContents, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end