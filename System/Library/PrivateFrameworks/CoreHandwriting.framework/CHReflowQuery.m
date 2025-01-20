@interface CHReflowQuery
- (BOOL)q_doesQueryResultDependOnDeclaredVariables;
- (id)debugName;
- (id)reflowableTextTokensForInitialStrokes:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6;
@end

@implementation CHReflowQuery

- (id)reflowableTextTokensForInitialStrokes:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6
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
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHReflowQuery", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v17 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHReflowQuery\"", buf, 2u);
  }

  v23 = objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  v29 = objc_msgSend_latestStrokeProvider(v23, v24, v25, v26, v27, v28);
  v33 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v30, (uint64_t)v11, (uint64_t)v29, v31, v32);

  v39 = objc_msgSend_recognitionSession(self, v34, v35, v36, v37, v38);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1C4B94100;
  v46[3] = &unk_1E64E4828;
  id v48 = v12;
  os_signpost_id_t v49 = v15;
  double v50 = x;
  double v51 = y;
  id v47 = v11;
  id v40 = v12;
  id v41 = v11;
  v44 = objc_msgSend_reflowableTextLinesForContextStrokes_point_completion_shouldCancel_(v39, v42, (uint64_t)v33, (uint64_t)v46, (uint64_t)v13, v43, x, y);

  return v44;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CHReflowQuery %p", v2, v3, v4, self);
}

@end