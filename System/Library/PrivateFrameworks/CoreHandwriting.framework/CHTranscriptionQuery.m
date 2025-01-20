@interface CHTranscriptionQuery
- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)debugName;
@end

@implementation CHTranscriptionQuery

- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
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
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHTranscriptionQuery", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTranscriptionQuery\"", buf, 2u);
  }

  v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v26 = objc_msgSend_latestStrokeProvider(v20, v21, v22, v23, v24, v25);
  v30 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v27, (uint64_t)v10, (uint64_t)v26, v28, v29);

  v36 = objc_msgSend_recognitionSession(self, v31, v32, v33, v34, v35);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1C4B41154;
  v42[3] = &unk_1E64E41A8;
  id v43 = v8;
  os_signpost_id_t v44 = v12;
  id v37 = v8;
  v40 = objc_msgSend_contextualTextResultsForContextStrokes_completion_shouldCancel_(v36, v38, (uint64_t)v30, (uint64_t)v42, (uint64_t)v9, v39);

  return v40;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Transcription Query %p", v2, v3, v4, self);
}

@end