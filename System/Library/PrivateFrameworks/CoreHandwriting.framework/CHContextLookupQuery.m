@interface CHContextLookupQuery
- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)contextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)debugName;
- (id)structuredContextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)structuredContextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5;
@end

@implementation CHContextLookupQuery

- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4 shouldCancel:(id)a5
{
  double y = a3.y;
  double x = a3.x;
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
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHContextLookupQuery_atLocation", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_atLocation\"", buf, 2u);
  }

  v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4A0835C;
  v27[3] = &unk_1E64E2330;
  id v28 = v9;
  os_signpost_id_t v29 = v12;
  id v21 = v9;
  v25 = objc_msgSend_contextLookupResultsAtLocation_completion_shouldCancel_(v20, v22, (uint64_t)v27, (uint64_t)v10, v23, v24, x, y);

  return v25;
}

- (id)contextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v10 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  if (qword_1EA3CA000 == -1)
  {
    os_signpost_id_t v12 = (id)qword_1EA3C9FC8;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    os_signpost_id_t v12 = (id)qword_1EA3C9FC8;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CHContextLookupQuery_withPath", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v13 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_withPath\"", buf, 2u);
  }

  uint64_t v19 = objc_msgSend_recognitionSession(self, v14, v15, v16, v17, v18);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4A087DC;
  v25[3] = &unk_1E64E2358;
  id v26 = v8;
  os_signpost_id_t v27 = v11;
  id v20 = v8;
  uint64_t v23 = objc_msgSend_contextLookupResultsWithSelectionPath_completion_shouldCancel_(v19, v21, (uint64_t)a3, (uint64_t)v25, (uint64_t)v9, v22);

  return v23;
}

- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  os_signpost_id_t v11 = (id)qword_1EA3C9FC8;
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
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHContextLookupQuery_withSelectedStrokes", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_withSelectedStrokes\"", buf, 2u);
  }

  id v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4A08CD8;
  v27[3] = &unk_1E64E2380;
  id v29 = v9;
  os_signpost_id_t v30 = v12;
  id v28 = v8;
  id v21 = v9;
  id v22 = v8;
  v25 = objc_msgSend_contextLookupResultsWithSelectedStrokes_completion_shouldCancel_(v20, v23, (uint64_t)v22, (uint64_t)v27, (uint64_t)v10, v24);

  return v25;
}

- (id)structuredContextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v10 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  if (qword_1EA3CA000 == -1)
  {
    os_signpost_id_t v12 = (id)qword_1EA3C9FC8;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    os_signpost_id_t v12 = (id)qword_1EA3C9FC8;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CHContextLookupQuery_withPath", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v13 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_withPath\"", buf, 2u);
  }

  uint64_t v19 = objc_msgSend_recognitionSession(self, v14, v15, v16, v17, v18);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4A091D4;
  v25[3] = &unk_1E64E2380;
  id v26 = v8;
  os_signpost_id_t v27 = v11;
  void v25[4] = self;
  id v20 = v8;
  uint64_t v23 = objc_msgSend_contextLookupResultsWithSelectionPath_completion_shouldCancel_(v19, v21, (uint64_t)a3, (uint64_t)v25, (uint64_t)v9, v22);

  return v23;
}

- (id)structuredContextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  os_signpost_id_t v11 = (id)qword_1EA3C9FC8;
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
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHContextLookupQuery_withSelectedStrokes", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_withSelectedStrokes\"", buf, 2u);
  }

  id v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4A09764;
  v27[3] = &unk_1E64E23A8;
  void v27[4] = self;
  id v28 = v8;
  id v29 = v9;
  os_signpost_id_t v30 = v12;
  id v21 = v9;
  id v22 = v8;
  v25 = objc_msgSend_contextLookupResultsWithSelectedStrokes_completion_shouldCancel_(v20, v23, (uint64_t)v22, (uint64_t)v27, (uint64_t)v10, v24);

  return v25;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Context Lookup Query %p", v2, v3, v4, self);
}

@end