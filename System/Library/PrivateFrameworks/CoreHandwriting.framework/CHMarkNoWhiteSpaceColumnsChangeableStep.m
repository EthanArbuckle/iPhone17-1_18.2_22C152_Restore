@interface CHMarkNoWhiteSpaceColumnsChangeableStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHMarkNoWhiteSpaceColumnsChangeableStep

- (id)process:(id)a3 options:(id)a4
{
  id v4 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v49 = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHMarkNoWhiteSpaceColumnsChangeableStep is running", v49, 2u);
  }

  v11 = objc_msgSend_result(v4, v6, v7, v8, v9, v10);
  uint64_t v17 = objc_msgSend_tokenColumnCount(v11, v12, v13, v14, v15, v16);
  uint64_t v23 = 0;
  uint64_t v24 = v17 & ~(v17 >> 63);
  uint64_t v25 = v17 - 1;
  while (v24 != v23)
  {
    uint64_t v26 = objc_msgSend_transcriptionPaths(v11, v18, v19, v20, v21, v22);
    v32 = objc_msgSend_firstObject((void *)v26, v27, v28, v29, v30, v31);
    v36 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v11, v33, (uint64_t)v32, v25, v34, v35);
    v42 = objc_msgSend_firstObject(v36, v37, v38, v39, v40, v41);

    LOBYTE(v26) = objc_msgSend_properties(v42, v43, v44, v45, v46, v47);
    --v25;
    ++v23;
    if ((v26 & 0x20) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v23 = v24;
LABEL_10:
  objc_msgSend_setChangeableTokenColumnCount_(v11, v18, v23, v20, v21, v22);

  return v4;
}

@end