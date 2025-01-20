@interface CHDiffusionTextSynthesizer
- (BOOL)isLoaded;
- (BOOL)shouldAlignAlphaShapesForOriginalString:(id)a3 replacementString:(id)a4;
- (CHDiffusionTextSynthesizer)init;
- (id).cxx_construct;
- (id)alignAlphaShapes:(id)a3 original:(id)a4 allowAnisotropicScaling:(BOOL)a5;
- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7;
- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8;
- (id)rescaleAndShiftSynthesizedDrawing:(id)a3 original:(id)a4;
- (id)stylePredictionResultForTranscription:(id)a3 drawing:(id)a4 shouldCancel:(id)a5;
- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4;
- (id)supportedCharactersForPersonalizedSynthesis;
- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6;
@end

@implementation CHDiffusionTextSynthesizer

- (CHDiffusionTextSynthesizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHDiffusionTextSynthesizer;
  if ([(CHDiffusionTextSynthesizer *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (BOOL)isLoaded
{
  uint64_t v2 = *(void *)self->_pipeline.__ptr_.__value_;
  return v2 && *(void *)(v2 + 16) && *(void *)(v2 + 40) != 0;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (CHHasPersonalizedSynthesisModelReady((uint64_t)v6, v7, v8, v9, v10, v11))
  {
    v17 = objc_msgSend_objectForKeyedSubscript_(v6, v12, (uint64_t)CHTextSynthesisOptionSupportedCharactersStrict, v14, v15, v16);
    uint64_t v23 = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);

    indicesWithPersonalizedSynthesisSupport(v5, v23);
  }
  else
  {
    objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v12, v13, v14, v15, v16);
  v24 = };

  return v24;
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v109 = a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v11 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = objc_msgSend_length(v9, v12, v13, v14, v15, v16);
    _os_log_impl(&dword_1C492D000, v11, OS_LOG_TYPE_DEFAULT, "Synthesizer: Synthesizing drawing with content=\"%{sensitive}@\" (length=%lu)", buf, 0x16u);
  }

  if (!objc_msgSend_length(v9, v17, v18, v19, v20, v21))
  {
    v84 = 0;
    goto LABEL_25;
  }
  replaceUnsupportedCharactersByTransliteration(v9, 0, buf);
  int v111 = 0;
  long long v110 = xmmword_1C4C44120;
  v26 = objc_msgSend_objectForKeyedSubscript_(v10, v22, (uint64_t)CHTextSynthesisOptionXZeroDrawing, v23, v24, v25);
  BOOL v27 = v26 == 0;

  if (!v27)
  {
    if (qword_1EA3CA000 == -1)
    {
      v32 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:

        int v111 = 2;
        long long v110 = xmmword_1C4C44134;
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v32 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
    }
    *(_WORD *)v112 = 0;
    _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_DEBUG, "Synthesizer: Using DEFAULT_CONFIG_WITH_X0_INIT", v112, 2u);
    goto LABEL_10;
  }
LABEL_11:
  v33 = objc_msgSend_synthesisOptionsWithDictionary_(CHSynthesisRequestOptions, v28, (uint64_t)v10, v29, v30, v31);
  v39 = CoreHandwriting::synthesis::CHDiffusionPipeline::run((uint64_t)self->_pipeline.__ptr_.__value_, *(void **)buf, v33, v109, (uint64_t)&v110);
  if (!v39)
  {
    v84 = 0;
    goto LABEL_22;
  }
  if (!objc_msgSend_saveStyleSample(v33, v34, v35, v36, v37, v38)
    || !os_variant_has_internal_diagnostics())
  {
    v85 = [CHSynthesisResult alloc];
    v53 = objc_msgSend_content(v39, v86, v87, v88, v89, v90);
    v59 = objc_msgSend_drawing(v39, v91, v92, v93, v94, v95);
    v65 = objc_msgSend_segmentContents(v39, v96, v97, v98, v99, v100);
    v71 = objc_msgSend_segmentStrokeIndexes(v39, v101, v102, v103, v104, v105);
    v84 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v85, v106, (uint64_t)v53, (uint64_t)v59, (uint64_t)v65, (uint64_t)v71, v115);
    goto LABEL_20;
  }
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v40 = (id)qword_1EA3C9FD8;
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v40 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
LABEL_16:
    v46 = objc_msgSend_styleContent(v33, v41, v42, v43, v44, v45);
    *(_DWORD *)v112 = 138412290;
    v113 = v46;
    _os_log_impl(&dword_1C492D000, v40, OS_LOG_TYPE_DEBUG, "Style Sampling: saving style sample with content: %@ for inventory debugging experiments", v112, 0xCu);
  }
LABEL_17:

  v47 = [CHSynthesisResult alloc];
  v53 = objc_msgSend_content(v39, v48, v49, v50, v51, v52);
  v59 = objc_msgSend_drawing(v39, v54, v55, v56, v57, v58);
  v65 = objc_msgSend_segmentContents(v39, v60, v61, v62, v63, v64);
  v71 = objc_msgSend_segmentStrokeIndexes(v39, v66, v67, v68, v69, v70);
  v108 = objc_msgSend_styleDrawing(v33, v72, v73, v74, v75, v76);
  v82 = objc_msgSend_styleContent(v33, v77, v78, v79, v80, v81);
  v84 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_inventoryDebuggingStyleDrawing_inventoryDebuggingStyleContent_numberOfNotSynthesizedCharacters_(v47, v83, (uint64_t)v53, (uint64_t)v59, (uint64_t)v65, (uint64_t)v71, v108, v82, v115);

LABEL_20:
LABEL_22:

  if (*(void *)&buf[8])
  {
    *(void *)&buf[16] = *(void *)&buf[8];
    operator delete(*(void **)&buf[8]);
  }

LABEL_25:
  return v84;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v143 = a3;
  id v11 = a4;
  id v141 = a5;
  id v142 = a6;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v12 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    id v145 = v11;
    __int16 v146 = 2048;
    uint64_t v147 = objc_msgSend_length(v11, v13, v14, v15, v16, v17);
    _os_log_impl(&dword_1C492D000, v12, OS_LOG_TYPE_DEFAULT, "Synthesizer: Refining drawing with transcription=\"%{sensitive}@\" (length=%lu)", buf, 0x16u);
  }

  if (objc_msgSend_length(v11, v18, v19, v20, v21, v22) && objc_msgSend_pointCount(v143, v23, v24, v25, v26, v27))
  {
    v32 = objc_msgSend_synthesisOptionsWithDictionary_(CHSynthesisRequestOptions, v28, (uint64_t)v141, v29, v30, v31);
    uint64_t v43 = objc_msgSend_styleContent(v32, v33, v34, v35, v36, v37);
    if (!v43
      || (objc_msgSend_styleDrawing(v32, v38, v39, v40, v41, v42),
          uint64_t v44 = objc_claimAutoreleasedReturnValue(),
          BOOL v45 = v44 == 0,
          v44,
          v43,
          v45))
    {
      objc_msgSend_setStyleDrawing_(v32, v38, (uint64_t)v143, v40, v41, v42);
      objc_msgSend_setStyleContent_(v32, v46, (uint64_t)v11, v47, v48, v49);
    }
    uint64_t v55 = CoreHandwriting::synthesis::CHDiffusionPipeline::run((uint64_t)self->_pipeline.__ptr_.__value_, v11, v32, v142, (uint64_t)&CoreHandwriting::synthesis::CHDiffusionPipeline::REFINE_CONFIG);
    if (v55)
    {
      if ((unint64_t)objc_msgSend_length(v11, v50, v51, v52, v53, v54) >= 6)
      {
        uint64_t v61 = objc_msgSend_styleContent(v32, v56, v57, v58, v59, v60);
        int isEqualToString = objc_msgSend_isEqualToString_(v11, v62, (uint64_t)v61, v63, v64, v65);

        if (isEqualToString)
        {
          uint64_t v67 = [CHSynthesisResult alloc];
          v140 = objc_msgSend_content(v55, v68, v69, v70, v71, v72);
          uint64_t v78 = objc_msgSend_drawing(v55, v73, v74, v75, v76, v77);
          uint64_t v81 = objc_msgSend_alignAlphaShapes_original_allowAnisotropicScaling_(self, v79, (uint64_t)v78, (uint64_t)v143, 0, v80);
          uint64_t v87 = objc_msgSend_segmentContents(v55, v82, v83, v84, v85, v86);
          uint64_t v93 = objc_msgSend_segmentStrokeIndexes(v55, v88, v89, v90, v91, v92);
          uint64_t v99 = objc_msgSend_numberOfNotSynthesizedCharacters(v55, v94, v95, v96, v97, v98);
          uint64_t v101 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v67, v100, (uint64_t)v140, (uint64_t)v81, (uint64_t)v87, (uint64_t)v93, v99);

          uint64_t v55 = (void *)v101;
        }
      }
      uint64_t v102 = [CHSynthesisResult alloc];
      v108 = objc_msgSend_content(v55, v103, v104, v105, v106, v107);
      v114 = objc_msgSend_drawing(v55, v109, v110, v111, v112, v113);
      v118 = objc_msgSend_rescaleAndShiftSynthesizedDrawing_original_(self, v115, (uint64_t)v114, (uint64_t)v143, v116, v117);
      v124 = objc_msgSend_segmentContents(v55, v119, v120, v121, v122, v123);
      v130 = objc_msgSend_segmentStrokeIndexes(v55, v125, v126, v127, v128, v129);
      uint64_t v136 = objc_msgSend_numberOfNotSynthesizedCharacters(v55, v131, v132, v133, v134, v135);
      v138 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v102, v137, (uint64_t)v108, (uint64_t)v118, (uint64_t)v124, (uint64_t)v130, v136);
    }
    else
    {
      v138 = 0;
    }
  }
  else
  {
    v138 = 0;
  }

  return v138;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v149 = a6;
  id v150 = a7;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v16 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219267;
    *(void *)&uint8_t buf[4] = objc_msgSend_strokeCount(v13, v17, v18, v19, v20, v21);
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = objc_msgSend_pointCount(v13, v22, v23, v24, v25, v26);
    *(_WORD *)&buf[22] = 2117;
    id v156 = v14;
    *(_WORD *)v157 = 2048;
    *(void *)&v157[2] = objc_msgSend_length(v14, v27, v28, v29, v30, v31);
    __int16 v158 = 2117;
    id v159 = v15;
    __int16 v160 = 2048;
    uint64_t v161 = objc_msgSend_length(v15, v32, v33, v34, v35, v36);
    _os_log_impl(&dword_1C492D000, v16, OS_LOG_TYPE_DEFAULT, "Synthesizer: Replacing drawing (numStrokes=%lu, numPts=%lu) with originalTranscription=\"%{sensitive}@\" (length=%lu) and replacementTranscription=\"%{sensitive}@\" (length=%lu)", buf, 0x3Eu);
  }

  replaceUnsupportedCharactersByTransliteration(v15, 1, buf);
  if (*(uint64_t *)v157 >= 1)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v42 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v42 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
    }
    *(_DWORD *)v151 = 138740227;
    uint64_t v152 = *(void *)buf;
    __int16 v153 = 2048;
    uint64_t v154 = *(void *)v157;
    _os_log_impl(&dword_1C492D000, v42, OS_LOG_TYPE_DEFAULT, "Synthesizer: replacementTranscription after sanitization (%{sensitive}@) contains %lu unsupported characters", v151, 0x16u);
    goto LABEL_9;
  }
LABEL_10:
  if (objc_msgSend_length(*(void **)buf, v37, v38, v39, v40, v41)
    && objc_msgSend_length(v14, v43, v44, v45, v46, v47)
    && objc_msgSend_pointCount(v13, v48, v49, v50, v51, v52))
  {
    uint64_t v148 = objc_msgSend_synthesisOptionsWithDictionary_(CHSynthesisRequestOptions, v53, (uint64_t)v149, v54, v55, v56);
    uint64_t v61 = objc_msgSend_sortedDrawingUsingStrokeMidPoint_(v13, v57, 0, v58, v59, v60);
    objc_msgSend_setStyleDrawing_(v148, v62, (uint64_t)v61, v63, v64, v65);

    objc_msgSend_setStyleContent_(v148, v66, (uint64_t)v14, v67, v68, v69);
    uint64_t v73 = CoreHandwriting::synthesis::CHDiffusionPipeline::run((uint64_t)self->_pipeline.__ptr_.__value_, *(void **)buf, v148, v150, (uint64_t)&CoreHandwriting::synthesis::CHDiffusionPipeline::DEFAULT_CONFIG);
    if (v73)
    {
      if (objc_msgSend_shouldAlignAlphaShapesForOriginalString_replacementString_(self, v70, (uint64_t)v14, *(uint64_t *)buf, v71, v72))
      {
        uint64_t v74 = [CHSynthesisResult alloc];
        __int16 v146 = objc_msgSend_content(v73, v75, v76, v77, v78, v79);
        id v145 = objc_msgSend_drawing(v73, v80, v81, v82, v83, v84);
        uint64_t v87 = objc_msgSend_alignAlphaShapes_original_allowAnisotropicScaling_(self, v85, (uint64_t)v145, (uint64_t)v13, 1, v86);
        uint64_t v93 = objc_msgSend_segmentContents(v73, v88, v89, v90, v91, v92);
        uint64_t v99 = objc_msgSend_segmentStrokeIndexes(v73, v94, v95, v96, v97, v98);
        uint64_t v105 = objc_msgSend_numberOfNotSynthesizedCharacters(v73, v100, v101, v102, v103, v104);
        uint64_t v107 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v74, v106, (uint64_t)v146, (uint64_t)v87, (uint64_t)v93, (uint64_t)v99, v105);

        uint64_t v73 = (void *)v107;
      }
      v108 = [CHSynthesisResult alloc];
      uint64_t v147 = objc_msgSend_content(v73, v109, v110, v111, v112, v113);
      v119 = objc_msgSend_drawing(v73, v114, v115, v116, v117, v118);
      uint64_t v123 = objc_msgSend_rescaleAndShiftSynthesizedDrawing_original_(self, v120, (uint64_t)v119, (uint64_t)v13, v121, v122);
      uint64_t v129 = objc_msgSend_segmentContents(v73, v124, v125, v126, v127, v128);
      uint64_t v135 = objc_msgSend_segmentStrokeIndexes(v73, v130, v131, v132, v133, v134);
      uint64_t v141 = objc_msgSend_numberOfNotSynthesizedCharacters(v73, v136, v137, v138, v139, v140);
      id v143 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v108, v142, (uint64_t)v147, (uint64_t)v123, (uint64_t)v129, (uint64_t)v135, v141);
    }
    else
    {
      id v143 = 0;
    }
  }
  else
  {
    id v143 = 0;
  }
  if (*(void *)&buf[8])
  {
    *(void *)&buf[16] = *(void *)&buf[8];
    operator delete(*(void **)&buf[8]);
  }

  return v143;
}

- (id)rescaleAndShiftSynthesizedDrawing:(id)a3 original:(id)a4
{
  id v5 = a3;
  objc_msgSend_bounds(a4, v6, v7, v8, v9, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  objc_msgSend_bounds(v5, v19, v20, v21, v22, v23);
  *(float *)&double v24 = sqrt(v16 * v16 + v18 * v18) / sqrt(v24 * v24 + v25 * v25);
  uint64_t v33 = objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v5, v28, v29, v30, v31, v32, (v12 - v26) / *(float *)&v24, (v14 - v27) / *(float *)&v24);

  return v33;
}

- (id)alignAlphaShapes:(id)a3 original:(id)a4 allowAnisotropicScaling:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  sub_1C4B36C28((double **)&v30, v7);
  sub_1C4B36C28((double **)&__p, v8);
  if (v30 != v31 && __p != v29)
  {
    sub_1C4B500B8((uint64_t)v34, (unint64_t *)&__p, (unint64_t *)&v30);
    memset(&v27, 0, sizeof(v27));
    CoreHandwriting::CPDAffineRegistration::run((CoreHandwriting::CPDAffineRegistration *)v34, &v27);
    sub_1C4B5343C(v34);
    CGAffineTransform transform = v27;
    memset(v34, 0, 48);
    CGAffineTransformDecompose((CGAffineTransformComponents *)v34, &transform);
    double v9 = *(double *)&v34[8];
    if (*(double *)v34 >= *(double *)&v34[8]) {
      double v10 = *(double *)v34;
    }
    else {
      double v10 = *(double *)&v34[8];
    }
    if (v5)
    {
      double v11 = v10 * 0.5;
      if (v10 * 0.5 >= *(double *)v34) {
        double v10 = v10 * 0.5;
      }
      else {
        double v10 = *(double *)v34;
      }
      if (v11 >= *(double *)&v34[8]) {
        double v9 = v11;
      }
    }
    else
    {
      double v9 = v10;
    }
    *(double *)uint64_t v34 = v10;
    *(double *)&v34[8] = v9;
    *(void *)&v34[16] = 0;
    CGAffineTransformComponents components = *(CGAffineTransformComponents *)v34;
    CGAffineTransformMakeWithComponents(&v27, &components);
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    double v13 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      CGFloat a = v27.a;
      CGFloat d = v27.d;
      *(_DWORD *)uint64_t v34 = 134219264;
      *(CGFloat *)&v34[4] = v27.a;
      *(_WORD *)&v34[12] = 2048;
      *(CGFloat *)&v34[14] = v27.b;
      *(_WORD *)&v34[22] = 2048;
      *(CGFloat *)&v34[24] = v27.c;
      *(_WORD *)&v34[32] = 2048;
      *(CGFloat *)&v34[34] = v27.d;
      *(_WORD *)&v34[42] = 2048;
      *(CGFloat *)&v34[44] = v27.tx;
      __int16 v35 = 2048;
      CGFloat ty = v27.ty;
      _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEBUG, "Synthesizer: alignAlphaShapes done. transform:(a=%1.2f, b=%1.2f, c=%1.2f, d=%1.2f, t=[%1.2f, %1.2f])", v34, 0x3Eu);
      double v16 = a;
      double v17 = d;
    }
    else
    {
      double v16 = v27.a;
      double v17 = v27.d;
    }

    if (v16 >= 0.0 && v17 >= 0.0)
    {
      CGAffineTransform v26 = v27;
      id v22 = (id)objc_msgSend_newDrawingWithAffineTransform_(v7, v18, (uint64_t)&v26, v19, v20, v21);
      uint64_t v23 = __p;
      if (!__p) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    if (qword_1EA3CA000 == -1)
    {
      double v25 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      double v25 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_36;
      }
    }
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_1C492D000, v25, OS_LOG_TYPE_DEBUG, "Synthesizer: alignAlphaShapes transformation is invalid. Dropping transform.", v34, 2u);
    goto LABEL_36;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  double v12 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t v34 = 134218240;
    *(void *)&v34[4] = (v31 - (unsigned char *)v30) >> 4;
    *(_WORD *)&v34[12] = 2048;
    *(void *)&v34[14] = (v29 - (unsigned char *)__p) >> 4;
    _os_log_impl(&dword_1C492D000, v12, OS_LOG_TYPE_ERROR, "Synthesizer: Got empty alpha shape (drawing alpha shape: %lu, original alpha shape: %lu). Dropping transform.", v34, 0x16u);
  }

LABEL_37:
  id v22 = v7;
  uint64_t v23 = __p;
  if (__p)
  {
LABEL_27:
    uint64_t v29 = v23;
    operator delete(v23);
  }
LABEL_28:
  if (v30)
  {
    uint64_t v31 = v30;
    operator delete(v30);
  }

  return v22;
}

- (BOOL)shouldAlignAlphaShapesForOriginalString:(id)a3 replacementString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_length(v5, v7, v8, v9, v10, v11);
  if (v12 >= objc_msgSend_length(v6, v13, v14, v15, v16, v17))
  {
    uint64_t v35 = objc_msgSend_length(v5, v18, v19, v20, v21, v22);
    uint64_t v34 = v35 - objc_msgSend_length(v6, v36, v37, v38, v39, v40);
  }
  else
  {
    uint64_t v23 = objc_msgSend_length(v5, v18, v19, v20, v21, v22);
    uint64_t v34 = objc_msgSend_length(v6, v24, v25, v26, v27, v28) - v23;
  }
  BOOL v42 = (unint64_t)objc_msgSend_length(v6, v29, v30, v31, v32, v33) > 5 && v34 < 2;

  return v42;
}

- (id)supportedCharactersForPersonalizedSynthesis
{
  if (objc_msgSend_isLoaded(self, a2, v2, v3, v4, v5)
    && (uint64_t v7 = *(void *)self->_pipeline.__ptr_.__value_) != 0)
  {
    id v8 = *(id *)(v7 + 112);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)stylePredictionResultForTranscription:(id)a3 drawing:(id)a4 shouldCancel:(id)a5
{
  uint64_t v5 = CoreHandwriting::synthesis::CHDiffusionPipeline::predictStyleEmbedding((CoreHandwriting::synthesis::CHDiffusionSynthesisModel **)self->_pipeline.__ptr_.__value_, a3, a4, a5);
  return v5;
}

- (void).cxx_destruct
{
  value = self->_pipeline.__ptr_.__value_;
  self->_pipeline.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v3 = *((void *)value + 1);
    *((void *)value + 1) = 0;
    if (v3) {
      (*(void (**)(uint64_t, SEL))(*(void *)v3 + 8))(v3, a2);
    }
    uint64_t v4 = *(void *)value;
    *(void *)value = 0;
    if (v4)
    {
      uint64_t v5 = sub_1C4B393E0(v4);
      MEMORY[0x1C8786460](v5, 0x10A0C409A4FACE1);
    }
    JUMPOUT(0x1C8786460);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end