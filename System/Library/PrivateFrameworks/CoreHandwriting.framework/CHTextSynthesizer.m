@interface CHTextSynthesizer
+ (id)diffusionModelHash;
+ (int64_t)maxNumberOfSynthesizedCharactersForSize:(CGSize)a3 withDecimalSeparator:(BOOL)a4;
- (BOOL)shouldAlwaysUseFastPathSynthesis;
- (CHTextSynthesizer)init;
- (CHTextSynthesizer)initWithStyleInventory:(id)a3;
- (id)drawingWithDesiredDistanceBetweenDigitCenters:(double)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6;
- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7;
- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8;
- (id)stylePredictionResultForTranscription:(id)a3 drawing:(id)a4 shouldCancel:(id)a5;
- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4;
- (id)supportedCharactersForPersonalizedSynthesis;
- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6;
@end

@implementation CHTextSynthesizer

+ (id)diffusionModelHash
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(CHDiffusionTextSynthesizer, sel_modelHash);
}

+ (int64_t)maxNumberOfSynthesizedCharactersForSize:(CGSize)a3 withDecimalSeparator:(BOOL)a4
{
  return vcvtmd_s64_f64(a3.width / a3.height * 3.0);
}

- (CHTextSynthesizer)init
{
  return (CHTextSynthesizer *)objc_msgSend_initWithStyleInventory_(self, a2, 0, v2, v3, v4);
}

- (CHTextSynthesizer)initWithStyleInventory:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHTextSynthesizer;
  v5 = [(CHTextSynthesizer *)&v16 init];
  if (v5)
  {
    v6 = objc_alloc_init(CHDiffusionTextSynthesizer);
    diffusionSynthesizer = v5->_diffusionSynthesizer;
    v5->_diffusionSynthesizer = v6;

    v8 = [CHFastPathTextSynthesizer alloc];
    uint64_t v13 = objc_msgSend_initWithStyleInventory_(v8, v9, (uint64_t)v4, v10, v11, v12);
    fastPathSynthesizer = v5->_fastPathSynthesizer;
    v5->_fastPathSynthesizer = (CHFastPathTextSynthesizer *)v13;
  }
  return v5;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_shouldAlwaysUseFastPathSynthesis(self, v8, v9, v10, v11, v12))
  {
    uint64_t v17 = 16;
  }
  else
  {
    v18 = objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)CHTextSynthesisOptionFastPath, v14, v15, v16);
    int v24 = objc_msgSend_BOOLValue(v18, v19, v20, v21, v22, v23);

    uint64_t v17 = 8;
    if (v24) {
      uint64_t v17 = 16;
    }
  }
  v25 = objc_msgSend_supportedCharacterIndexesForString_options_(*(void **)((char *)&self->super.isa + v17), v13, (uint64_t)v6, (uint64_t)v7, v15, v16);

  return v25;
}

- (BOOL)shouldAlwaysUseFastPathSynthesis
{
  id v6 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], a2, v2, v3, v4, v5);
  uint64_t v11 = objc_msgSend_dictionaryForKey_(v6, v7, @"com.apple.corehandwriting", v8, v9, v10);

  uint64_t v16 = objc_msgSend_objectForKey_(v11, v12, @"CHForceUseFastPathSynthesis", v13, v14, v15);
  char v22 = objc_msgSend_BOOLValue(v16, v17, v18, v19, v20, v21);

  return v22;
}

- (id)drawingWithDesiredDistanceBetweenDigitCenters:(double)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6
{
  id v9 = a4;
  id v105 = a5;
  id v103 = a6;
  objc_msgSend_bounds(v9, v10, v11, v12, v13, v14);
  double Height = CGRectGetHeight(v108);
  v106 = objc_alloc_init(CHDrawing);
  uint64_t v104 = objc_msgSend_count(v105, v16, v17, v18, v19, v20);
  if (v104 >= 1)
  {
    uint64_t v25 = 0;
    double v26 = Height * 0.05;
    double v27 = a3 * 0.5;
    unint64_t v28 = 0x8000000000000000;
    double v29 = 0.0;
    unint64_t v30 = 0x8000000000000000;
    double MidX = 0.0;
    do
    {
      v32 = objc_msgSend_objectAtIndexedSubscript_(v103, v21, v25, v22, v23, v24);
      v37 = objc_msgSend_drawingWithStrokesFromIndexSet_(v9, v33, (uint64_t)v32, v34, v35, v36);
      v42 = objc_msgSend_objectAtIndexedSubscript_(v105, v38, v25, v39, v40, v41);
      objc_msgSend_bounds(v106, v43, v44, v45, v46, v47);
      double MaxX = CGRectGetMaxX(v109);
      objc_msgSend_bounds(v37, v49, v50, v51, v52, v53);
      double MinX = CGRectGetMinX(v110);
      v60 = objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E4F28B88], v55, v56, v57, v58, v59);
      uint64_t v64 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v42, v61, (uint64_t)v60, 1, v62, v63);
      double v65 = v29 + MinX;

      if (!v64)
      {
        v73 = objc_msgSend_ch_mathDecimalSeparatorCharSet(MEMORY[0x1E4F28B88], v66, v67, v68, v69, v70);
        uint64_t v77 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v42, v74, (uint64_t)v73, 1, v75, v76);

        if (!v77) {
          goto LABEL_11;
        }
        if (v25 - 1 != v28) {
          goto LABEL_11;
        }
        uint64_t v67 = v25 + 1;
        if (v25 + 1 >= v104) {
          goto LABEL_11;
        }
        v78 = objc_msgSend_objectAtIndexedSubscript_(v105, v66, v67, v68, v69, v70);
        v84 = objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E4F28B88], v79, v80, v81, v82, v83);
        uint64_t v88 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v78, v85, (uint64_t)v84, 1, v86, v87);

        if (v88)
        {
          objc_msgSend_bounds(v37, v66, v67, v68, v69, v70);
          double v90 = MaxX + fmax(v27 + MidX - MaxX + v89 * -0.5, v26);
          unint64_t v30 = v25;
        }
        else
        {
LABEL_11:
          double v90 = v65;
        }
        goto LABEL_17;
      }
      if (v25 - 1 == v28)
      {
        objc_msgSend_bounds(v37, v66, v67, v68, v69, v70);
        double v72 = fmax(MidX + a3 - MaxX + v71 * -0.5, 0.0);
      }
      else
      {
        if (v25 - 2 != v28 || v25 - 1 != v30)
        {
          double v90 = v65;
          unint64_t v28 = v25;
          goto LABEL_17;
        }
        objc_msgSend_bounds(v37, v66, v67, v68, v69, v70);
        double v72 = fmax(v27 + MidX - MaxX + v91 * -0.5, v26);
      }
      double v90 = MaxX + v72;
      unint64_t v28 = v25;
LABEL_17:
      double v29 = v29 + v90 - v65;
      v92 = objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v37, v66, v67, v68, v69, v70, v29, 0.0, 1.0);

      objc_msgSend_bounds(v92, v93, v94, v95, v96, v97);
      double MidX = CGRectGetMidX(v111);
      objc_msgSend_appendDrawing_(v106, v98, (uint64_t)v92, v99, v100, v101);

      ++v25;
    }
    while (v104 != v25);
  }

  return v106;
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  uint64_t v200 = *MEMORY[0x1E4F143B8];
  id v195 = a3;
  id v10 = a4;
  id v197 = a5;
  if (objc_msgSend_shouldAlwaysUseFastPathSynthesis(self, v11, v12, v13, v14, v15))
  {
    int v21 = 1;
  }
  else
  {
    uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v10, v16, (uint64_t)CHTextSynthesisOptionFastPath, v18, v19, v20);
    int v21 = objc_msgSend_BOOLValue(v22, v23, v24, v25, v26, v27);
  }
  if (((objc_msgSend_isLoaded(self->_diffusionSynthesizer, v16, v17, v18, v19, v20, v195) | v21) & 1) == 0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v44 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v44, OS_LOG_TYPE_FAULT, "CHTextSynthesizer isn't expected to get personalized synthesis requests if the diffusion model is not loaded.", buf, 2u);
    }
    uint64_t v41 = 0;
    goto LABEL_32;
  }
  if (!v21)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v45 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v45, OS_LOG_TYPE_DEFAULT, "Synthesizer: Use diffusion model to synthesize drawing", buf, 2u);
    }

    uint64_t v46 = v10;
    uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(v46, v47, (uint64_t)CHTextSynthesisOptionFastPathAsXZero, v48, v49, v50);
    int v57 = objc_msgSend_BOOLValue(v51, v52, v53, v54, v55, v56);

    if (!v57)
    {
      v43 = v46;
      goto LABEL_62;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v58 = (id)qword_1EA3C9FC8;
    os_signpost_id_t v59 = os_signpost_id_generate(v58);

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v60 = (id)qword_1EA3C9FC8;
    v61 = v60;
    unint64_t v62 = v59 - 1;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C492D000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "CHFastPathSynthesizeDrawing", "", buf, 2u);
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v63 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v63, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHFastPathSynthesizeDrawing\"", buf, 2u);
    }

    if (qword_1EA3CA000 == -1)
    {
      uint64_t v64 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_52;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v64 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
LABEL_52:

        v66 = objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_fastPathSynthesizer, v65, (uint64_t)v196, (uint64_t)v46, (uint64_t)v197, (uint64_t)a6);
        if (qword_1EA3CA000 == -1)
        {
          uint64_t v67 = (id)qword_1EA3C9FC8;
          if (v62 <= 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_54;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          uint64_t v67 = (id)qword_1EA3C9FC8;
          if (v62 <= 0xFFFFFFFFFFFFFFFDLL)
          {
LABEL_54:
            if (os_signpost_enabled(v67))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1C492D000, v67, OS_SIGNPOST_INTERVAL_END, v59, "CHFastPathSynthesizeDrawing", "", buf, 2u);
            }
          }
        }

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v68 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C492D000, v68, OS_LOG_TYPE_DEFAULT, "END \"CHFastPathSynthesizeDrawing\"", buf, 2u);
        }

        v43 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1CA60], v69, (uint64_t)v46, v70, v71, v72);
        v78 = objc_msgSend_drawing(v66, v73, v74, v75, v76, v77);
        uint64_t v83 = objc_msgSend_sortedDrawingUsingStrokeMidPoint_(v78, v79, 0, v80, v81, v82);
        objc_msgSend_setObject_forKeyedSubscript_(v43, v84, (uint64_t)v83, (uint64_t)CHTextSynthesisOptionXZeroDrawing, v85, v86);

LABEL_62:
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v87 = (id)qword_1EA3C9FC8;
        os_signpost_id_t v88 = os_signpost_id_generate(v87);

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        double v89 = (id)qword_1EA3C9FC8;
        double v90 = v89;
        unint64_t v91 = v88 - 1;
        if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v90, OS_SIGNPOST_INTERVAL_BEGIN, v88, "CHDiffusionSynthesizeDrawing", "", buf, 2u);
        }

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v92 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C492D000, v92, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHDiffusionSynthesizeDrawing\"", buf, 2u);
        }

        uint64_t v41 = objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_diffusionSynthesizer, v93, (uint64_t)v196, (uint64_t)v43, (uint64_t)v197, (uint64_t)a6);
        if (qword_1EA3CA000 == -1)
        {
          uint64_t v94 = (id)qword_1EA3C9FC8;
          if (v91 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_77;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          uint64_t v94 = (id)qword_1EA3C9FC8;
          if (v91 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_77;
          }
        }
        if (os_signpost_enabled(v94))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v94, OS_SIGNPOST_INTERVAL_END, v88, "CHDiffusionSynthesizeDrawing", "", buf, 2u);
        }
LABEL_77:

        if (qword_1EA3CA000 == -1)
        {
          uint64_t v95 = (id)qword_1EA3C9F90[0];
          if (!os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
LABEL_80:

            objc_msgSend_resampleDrawing(v41, v96, v97, v98, v99, v100);
            goto LABEL_81;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          uint64_t v95 = (id)qword_1EA3C9F90[0];
          if (!os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_80;
          }
        }
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v95, OS_LOG_TYPE_DEFAULT, "END \"CHDiffusionSynthesizeDrawing\"", buf, 2u);
        goto LABEL_80;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v64, OS_LOG_TYPE_DEBUG, "Synthesizer: Use fast path to synthesize X0 drawing", buf, 2u);
    goto LABEL_52;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  unint64_t v28 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v29 = os_signpost_id_generate(v28);

  if (qword_1EA3CA000 == -1)
  {
    unint64_t v30 = (id)qword_1EA3C9FC8;
    unint64_t v31 = v29 - 1;
    if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    unint64_t v30 = (id)qword_1EA3C9FC8;
    unint64_t v31 = v29 - 1;
    if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_12;
    }
  }
  if (os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v29, "CHFastPathSynthesizeDrawing", "", buf, 2u);
  }
LABEL_12:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v32 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHFastPathSynthesizeDrawing\"", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v33 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    int isLoaded = objc_msgSend_isLoaded(self->_diffusionSynthesizer, v34, v35, v36, v37, v38);
    *(_DWORD *)buf = 67109120;
    int v199 = isLoaded;
    _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_DEFAULT, "Synthesizer: Use fast path to synthesize drawing, diffusionModel.isLoaded=%d", buf, 8u);
  }

  uint64_t v41 = objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_fastPathSynthesizer, v40, (uint64_t)v196, (uint64_t)v10, (uint64_t)v197, (uint64_t)a6);
  if (qword_1EA3CA000 == -1)
  {
    v42 = (id)qword_1EA3C9FC8;
    if (v31 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_24;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v42 = (id)qword_1EA3C9FC8;
    if (v31 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_24;
    }
  }
  if (os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v42, OS_SIGNPOST_INTERVAL_END, v29, "CHFastPathSynthesizeDrawing", "", buf, 2u);
  }
LABEL_24:

  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v43 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_81;
    }
    goto LABEL_26;
  }
  v43 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
LABEL_26:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v43, OS_LOG_TYPE_DEFAULT, "END \"CHFastPathSynthesizeDrawing\"", buf, 2u);
  }
LABEL_81:

  CGRect v109 = objc_msgSend_objectForKeyedSubscript_(v10, v101, (uint64_t)CHTextSynthesisOptionFitHeight, v102, v103, v104);
  if (!v109
    || ((objc_msgSend_objectForKeyedSubscript_(v10, v105, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters, v106, v107, v108), (CGRect v110 = objc_claimAutoreleasedReturnValue()) != 0)? (v111 = v21): (v111 = 0), v110, v109, !v111))
  {
    v144 = objc_msgSend_objectForKeyedSubscript_(v10, v105, (uint64_t)CHTextSynthesisOptionFitWidth, v106, v107, v108);
    if (v144)
    {

LABEL_96:
      v159 = objc_msgSend_objectForKeyedSubscript_(v10, v149, (uint64_t)CHTextSynthesisOptionFitWidth, v150, v151, v152);
      if (v159)
      {
        v160 = objc_msgSend_objectForKeyedSubscript_(v10, v155, (uint64_t)CHTextSynthesisOptionFitWidth, v156, v157, v158);
        objc_msgSend_floatValue(v160, v161, v162, v163, v164, v165);
        float v167 = v166;

        double v168 = v167;
      }
      else
      {
        double v168 = -1.0;
      }

      v177 = objc_msgSend_objectForKeyedSubscript_(v10, v169, (uint64_t)CHTextSynthesisOptionFitHeight, v170, v171, v172);
      if (v177)
      {
        v178 = objc_msgSend_objectForKeyedSubscript_(v10, v173, (uint64_t)CHTextSynthesisOptionFitHeight, v174, v175, v176);
        objc_msgSend_floatValue(v178, v179, v180, v181, v182, v183);
        float v185 = v184;

        double v186 = v185;
      }
      else
      {
        double v186 = -1.0;
      }

      objc_msgSend_scaleDrawingWithWidth_height_desiredDistanceBetweenDigitCenters_(v41, v187, v188, v189, v190, v191, v168, v186, -1.0);
      goto LABEL_103;
    }
    v153 = objc_msgSend_objectForKeyedSubscript_(v10, v145, (uint64_t)CHTextSynthesisOptionFitHeight, v146, v147, v148);
    BOOL v154 = v153 == 0;

    if (!v154) {
      goto LABEL_96;
    }
    v193 = objc_msgSend_objectForKeyedSubscript_(v10, v149, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters, v150, v151, v152);
    BOOL v194 = v193 == 0;

    if (v194) {
      goto LABEL_103;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v44 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v44, OS_LOG_TYPE_ERROR, "Synthesizer: CHTextSynthesisOptionDistanceBetweenDigitsCenters option is set but not processed. Only valid in combination with CHTextSynthesisOptionFitHeight in FastPath mode.", buf, 2u);
    }
LABEL_32:

    goto LABEL_103;
  }
  v112 = objc_msgSend_objectForKeyedSubscript_(v10, v105, (uint64_t)CHTextSynthesisOptionFitWidth, v106, v107, v108);
  BOOL v113 = v112 == 0;

  if (!v113)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v118 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v118, OS_LOG_TYPE_ERROR, "Synthesizer: CHTextSynthesisOptionFitWidth option is ignored in CHTextSynthesisOptionDistanceBetweenDigitsCenters mode.", buf, 2u);
    }
  }
  v119 = objc_msgSend_objectForKeyedSubscript_(v10, v114, (uint64_t)CHTextSynthesisOptionFitHeight, v115, v116, v117);
  objc_msgSend_floatValue(v119, v120, v121, v122, v123, v124);
  float v126 = v125;

  v131 = objc_msgSend_objectForKeyedSubscript_(v10, v127, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters, v128, v129, v130);
  objc_msgSend_floatValue(v131, v132, v133, v134, v135, v136);
  float v138 = v137;

  objc_msgSend_scaleDrawingWithWidth_height_desiredDistanceBetweenDigitCenters_(v41, v139, v140, v141, v142, v143, -1.0, v126, v138);
LABEL_103:

  return v41;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (self->_diffusionSynthesizer)
  {
    uint64_t v32 = (uint64_t)v12;
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v16 = (id)qword_1EA3C9FC8;
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    if (qword_1EA3CA000 == -1)
    {
      uint64_t v18 = (id)qword_1EA3C9FC8;
      unint64_t v19 = v17 - 1;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v18 = (id)qword_1EA3C9FC8;
      unint64_t v19 = v17 - 1;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_8;
      }
    }
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C492D000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CHDiffusionRefineDrawing", "", buf, 2u);
    }
LABEL_8:

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v20 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_1C492D000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHDiffusionRefineDrawing\"", v35, 2u);
    }

    id v12 = (id)v32;
    uint64_t v22 = objc_msgSend_refineDrawing_transcription_options_shouldCancel_error_(self->_diffusionSynthesizer, v21, v32, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, a7);
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v23 = (id)qword_1EA3C9FC8;
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v23 = (id)qword_1EA3C9FC8;
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_14:
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)uint64_t v34 = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v23, OS_SIGNPOST_INTERVAL_END, v17, "CHDiffusionRefineDrawing", "", v34, 2u);
        }
      }
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v24 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_DEFAULT, "END \"CHDiffusionRefineDrawing\"", v33, 2u);
    }

    objc_msgSend_resampleDrawing(v22, v25, v26, v27, v28, v29);
    goto LABEL_26;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  unint64_t v30 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v37 = 0;
    _os_log_impl(&dword_1C492D000, v30, OS_LOG_TYPE_ERROR, "Synthesizer: Currently no diffusion synthesizer available for refinement.", v37, 2u);
  }

  uint64_t v22 = 0;
LABEL_26:

  return v22;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v36 = a6;
  id v17 = a7;
  if (self->_diffusionSynthesizer)
  {
    uint64_t v35 = (uint64_t)v14;
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v18 = (id)qword_1EA3C9FC8;
    os_signpost_id_t v19 = os_signpost_id_generate(v18);

    uint64_t v20 = (uint64_t)v16;
    if (qword_1EA3CA000 == -1)
    {
      int v21 = (id)qword_1EA3C9FC8;
      unint64_t v22 = v19 - 1;
      if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      int v21 = (id)qword_1EA3C9FC8;
      unint64_t v22 = v19 - 1;
      if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_8;
      }
    }
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C492D000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "CHDiffusionReplaceDrawing", "", buf, 2u);
    }
LABEL_8:

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v23 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_1C492D000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHDiffusionReplaceDrawing\"", v39, 2u);
    }

    id v14 = (id)v35;
    uint64_t v25 = objc_msgSend_replaceDrawing_originalTranscription_replacementTranscription_options_shouldCancel_error_(self->_diffusionSynthesizer, v24, v35, (uint64_t)v15, v20, (uint64_t)v36, v17, a8);
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v26 = (id)qword_1EA3C9FC8;
      if (v22 <= 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v26 = (id)qword_1EA3C9FC8;
      if (v22 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_14:
        if (os_signpost_enabled(v26))
        {
          *(_WORD *)uint64_t v38 = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v26, OS_SIGNPOST_INTERVAL_END, v19, "CHDiffusionReplaceDrawing", "", v38, 2u);
        }
      }
    }

    id v16 = (id)v20;
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v27 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_1C492D000, v27, OS_LOG_TYPE_DEFAULT, "END \"CHDiffusionReplaceDrawing\"", v37, 2u);
    }

    objc_msgSend_resampleDrawing(v25, v28, v29, v30, v31, v32);
    goto LABEL_26;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v33 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v41 = 0;
    _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_ERROR, "Synthesizer: Diffusion synthesizer is not available to generate a replacement drawing.", v41, 2u);
  }

  uint64_t v25 = 0;
LABEL_26:

  return v25;
}

- (id)supportedCharactersForPersonalizedSynthesis
{
  return (id)((uint64_t (*)(CHDiffusionTextSynthesizer *, char *))MEMORY[0x1F4181798])(self->_diffusionSynthesizer, sel_supportedCharactersForPersonalizedSynthesis);
}

- (id)stylePredictionResultForTranscription:(id)a3 drawing:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = a5;
  diffusionSynthesizer = self->_diffusionSynthesizer;
  if (diffusionSynthesizer)
  {
    id v14 = objc_msgSend_stylePredictionResultForTranscription_drawing_shouldCancel_(diffusionSynthesizer, v10, (uint64_t)v8, (uint64_t)v9, (uint64_t)v12, v11);
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    id v15 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_ERROR, "Synthesizer: Diffusion synthesizer is not available to predict the style for a sample.", v17, 2u);
    }

    id v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleInventory, 0);
  objc_storeStrong((id *)&self->_fastPathSynthesizer, 0);
  objc_storeStrong((id *)&self->_diffusionSynthesizer, 0);
}

@end