@interface CHTextSynthesisQuery
- (BOOL)q_doesQueryResultDependOnDeclaredVariables;
- (NSNumber)styleControlStrength;
- (id)debugName;
- (id)refinedTokensForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)refinedTokensForSingleLineContextStrokes:(id)a3 transcription:(id)a4 completion:(id)a5 shouldCancel:(id)a6;
- (id)refinementOfContextStrokesWithTranscriptions:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)refinementOfSingleLineContextStrokes:(id)a3 transcription:(id)a4 completion:(id)a5 shouldCancel:(id)a6;
- (id)synthesizeTokensForString:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6;
- (id)synthesizeTokensForString:(id)a3 replacingStrokes:(id)a4 completion:(id)a5 shouldCancel:(id)a6;
- (void)setStyleControlStrength:(id)a3;
@end

@implementation CHTextSynthesisQuery

- (id)refinementOfContextStrokesWithTranscriptions:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v11 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  if (qword_1EA3CA000 == -1)
  {
    v13 = (id)qword_1EA3C9FC8;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v13 = (id)qword_1EA3C9FC8;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHTextSynthesisQuery_refineContext", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_refineContext\"", buf, 2u);
  }

  v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v26 = objc_msgSend_latestStrokeProvider(v20, v21, v22, v23, v24, v25);
  v30 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v27, (uint64_t)v8, (uint64_t)v26, v28, v29);

  v36 = objc_msgSend_recognitionSession(self, v31, v32, v33, v34, v35);
  styleControlStrength = self->_styleControlStrength;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1C495C7B4;
  v42[3] = &unk_1E64E1070;
  os_signpost_id_t v44 = v12;
  id v38 = v9;
  id v43 = v38;
  v40 = objc_msgSend_refinementOfContextStrokes_styleControlParameter_completion_shouldCancel_(v36, v39, (uint64_t)v30, (uint64_t)styleControlStrength, (uint64_t)v42, (uint64_t)v10);

  return v40;
}

- (id)refinedTokensForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v11 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  if (qword_1EA3CA000 == -1)
  {
    v13 = (id)qword_1EA3C9FC8;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v13 = (id)qword_1EA3C9FC8;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHTextSynthesisQuery_refinedTokens", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_refinedTokens\"", buf, 2u);
  }

  v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v26 = objc_msgSend_latestStrokeProvider(v20, v21, v22, v23, v24, v25);
  v30 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v27, (uint64_t)v8, (uint64_t)v26, v28, v29);

  v36 = objc_msgSend_recognitionSession(self, v31, v32, v33, v34, v35);
  styleControlStrength = self->_styleControlStrength;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1C495CC7C;
  v42[3] = &unk_1E64E1098;
  os_signpost_id_t v44 = v12;
  id v38 = v9;
  id v43 = v38;
  v40 = objc_msgSend_refinedTokensForContextStrokes_styleControlParameter_completion_shouldCancel_(v36, v39, (uint64_t)v30, (uint64_t)styleControlStrength, (uint64_t)v42, (uint64_t)v10);

  return v40;
}

- (id)refinementOfSingleLineContextStrokes:(id)a3 transcription:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v10 = a4;
  id v79 = a5;
  id v80 = a6;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v11 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  if (qword_1EA3CA000 == -1)
  {
    v13 = (id)qword_1EA3C9FC8;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v13 = (id)qword_1EA3C9FC8;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHTextSynthesisQuery_refineSingleLine", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_refineSingleLine\"", buf, 2u);
  }

  v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v26 = objc_msgSend_latestStrokeProvider(v20, v21, v22, v23, v24, v25);
  v30 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v27, (uint64_t)v81, (uint64_t)v26, v28, v29);

  if (qword_1EA3CA000 == -1)
  {
    v31 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  v31 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
LABEL_13:
    uint64_t v37 = objc_msgSend_length(v10, v32, v33, v34, v35, v36);
    uint64_t v43 = objc_msgSend_count(v81, v38, v39, v40, v41, v42);
    v49 = objc_msgSend_recognitionSession(self, v44, v45, v46, v47, v48);
    v55 = objc_msgSend_latestStrokeProvider(v49, v50, v51, v52, v53, v54);
    v61 = objc_msgSend_orderedStrokes(v55, v56, v57, v58, v59, v60);
    uint64_t v67 = objc_msgSend_count(v61, v62, v63, v64, v65, v66);
    *(_DWORD *)buf = 134218496;
    uint64_t v86 = v37;
    __int16 v87 = 2048;
    uint64_t v88 = v43;
    __int16 v89 = 2048;
    uint64_t v90 = v67;
    _os_log_impl(&dword_1C492D000, v31, OS_LOG_TYPE_DEBUG, "CHTextSynthesisQuery is running AutoRefine for transcription with length = %ld, strokes to replace = %ld, strokes in provider = %ld", buf, 0x20u);
  }
LABEL_14:

  v73 = objc_msgSend_recognitionSession(self, v68, v69, v70, v71, v72);
  styleControlStrength = self->_styleControlStrength;
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = sub_1C495D27C;
  v82[3] = &unk_1E64E1098;
  os_signpost_id_t v84 = v12;
  id v75 = v79;
  id v83 = v75;
  v77 = objc_msgSend_refinedTokensForSingleLineContextStrokes_styleControlParameter_transcription_completion_shouldCancel_(v73, v76, (uint64_t)v30, (uint64_t)styleControlStrength, (uint64_t)v10, (uint64_t)v82, v80);

  return v77;
}

- (id)refinedTokensForSingleLineContextStrokes:(id)a3 transcription:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v16 = (id)qword_1EA3C9FC8;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v16 = (id)qword_1EA3C9FC8;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHTextSynthesisQuery_refinedTokensSingleLine", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v17 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_refinedTokensSingleLine\"", buf, 2u);
  }

  uint64_t v23 = objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  uint64_t v29 = objc_msgSend_latestStrokeProvider(v23, v24, v25, v26, v27, v28);
  uint64_t v33 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v30, (uint64_t)v10, (uint64_t)v29, v31, v32);

  uint64_t v39 = objc_msgSend_recognitionSession(self, v34, v35, v36, v37, v38);
  styleControlStrength = self->_styleControlStrength;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = sub_1C495D940;
  v45[3] = &unk_1E64E1098;
  os_signpost_id_t v47 = v15;
  id v41 = v12;
  id v46 = v41;
  uint64_t v43 = objc_msgSend_refinedTokensForSingleLineContextStrokes_styleControlParameter_transcription_completion_shouldCancel_(v39, v42, (uint64_t)v33, (uint64_t)styleControlStrength, (uint64_t)v11, (uint64_t)v45, v13);

  return v43;
}

- (id)synthesizeTokensForString:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v16 = (id)qword_1EA3C9FC8;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v16 = (id)qword_1EA3C9FC8;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHTextSynthesisQuery_synthesizeTokens", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v17 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_synthesizeTokens\"", buf, 2u);
  }

  uint64_t v23 = objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C495DD60;
  v29[3] = &unk_1E64E1098;
  os_signpost_id_t v31 = v15;
  id v24 = v12;
  id v30 = v24;
  uint64_t v27 = objc_msgSend_synthesizeTokensForString_point_completion_shouldCancel_(v23, v25, (uint64_t)v11, (uint64_t)v29, (uint64_t)v13, v26, x, y);

  return v27;
}

- (id)synthesizeTokensForString:(id)a3 replacingStrokes:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v16 = (id)qword_1EA3C9FC8;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v16 = (id)qword_1EA3C9FC8;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHTextSynthesisQuery_synthesizeTokensReplacing", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v17 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_synthesizeTokensReplacing\"", buf, 2u);
  }

  uint64_t v23 = objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  uint64_t v29 = objc_msgSend_latestStrokeProvider(v23, v24, v25, v26, v27, v28);
  uint64_t v33 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v30, (uint64_t)v11, (uint64_t)v29, v31, v32);

  uint64_t v39 = objc_msgSend_recognitionSession(self, v34, v35, v36, v37, v38);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1C495E20C;
  v44[3] = &unk_1E64E1098;
  os_signpost_id_t v46 = v15;
  id v40 = v12;
  id v45 = v40;
  uint64_t v42 = objc_msgSend_synthesizeTokensForString_replacingStrokes_completion_shouldCancel_(v39, v41, (uint64_t)v10, (uint64_t)v33, (uint64_t)v44, (uint64_t)v13);

  return v42;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CHTextSynthesisQuery %p", v2, v3, v4, self);
}

- (NSNumber)styleControlStrength
{
  return self->_styleControlStrength;
}

- (void)setStyleControlStrength:(id)a3
{
}

- (void).cxx_destruct
{
}

@end