@interface CHTextStrokeTransformationQuery
- (BOOL)q_doesQueryResultDependOnDeclaredVariables;
- (id)debugName;
- (id)strokePointTransformationsForContextStrokes:(id)a3 completionWithTelemetry:(id)a4 shouldCancel:(id)a5;
- (id)strokePointTransformationsForContextStrokes:(id)a3 parameters:(id)a4 completionWithTelemetry:(id)a5 shouldCancel:(id)a6;
@end

@implementation CHTextStrokeTransformationQuery

- (id)strokePointTransformationsForContextStrokes:(id)a3 completionWithTelemetry:(id)a4 shouldCancel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(CHTransformationParameters);
  objc_msgSend_setOrientationBehavior_(v11, v12, 2, v13, v14, v15);
  objc_msgSend_setAlignmentBehavior_(v11, v16, 1, v17, v18, v19);
  objc_msgSend_setLineSpaceBehavior_(v11, v20, 2, v21, v22, v23);
  v25 = objc_msgSend_strokePointTransformationsForContextStrokes_parameters_completionWithTelemetry_shouldCancel_(self, v24, (uint64_t)v10, (uint64_t)v11, (uint64_t)v9, (uint64_t)v8);

  return v25;
}

- (id)strokePointTransformationsForContextStrokes:(id)a3 parameters:(id)a4 completionWithTelemetry:(id)a5 shouldCancel:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v14 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  if (qword_1EA3CA000 == -1)
  {
    v16 = (id)qword_1EA3C9FC8;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v16 = (id)qword_1EA3C9FC8;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHTextStrokeTransformationQuery", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v17 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextStrokeTransformationQuery\"", buf, 2u);
  }

  uint64_t v23 = objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  v29 = objc_msgSend_latestStrokeProvider(v23, v24, v25, v26, v27, v28);
  v33 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v30, (uint64_t)v13, (uint64_t)v29, v31, v32);

  uint64_t v45 = MEMORY[0x1E4F143A8];
  uint64_t v46 = 3221225472;
  v47 = sub_1C49ED6EC;
  v48 = &unk_1E64E1F08;
  id v49 = v10;
  os_signpost_id_t v50 = v15;
  id v34 = v10;
  v35 = (void *)MEMORY[0x1C8786E90](&v45);
  v41 = objc_msgSend_recognitionSession(self, v36, v37, v38, v39, v40, v45, v46, v47, v48);
  v43 = objc_msgSend_strokePointTransformationsForContextStrokes_parameters_completionWithTelemetry_shouldCancel_(v41, v42, (uint64_t)v33, (uint64_t)v12, (uint64_t)v35, (uint64_t)v11);

  return v43;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CHTextStrokeTransformationQuery %p", v2, v3, v4, self);
}

@end