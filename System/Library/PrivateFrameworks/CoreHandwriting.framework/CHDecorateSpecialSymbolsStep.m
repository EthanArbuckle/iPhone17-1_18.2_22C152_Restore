@interface CHDecorateSpecialSymbolsStep
- (CHDecorateSpecialSymbolsStep)init;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHDecorateSpecialSymbolsStep

- (CHDecorateSpecialSymbolsStep)init
{
  v15.receiver = self;
  v15.super_class = (Class)CHDecorateSpecialSymbolsStep;
  v6 = [(CHDecorateSpecialSymbolsStep *)&v15 init];
  if (v6)
  {
    v7 = objc_msgSend_componentsSeparatedByString_(@"€ £ ¥ ¢ ₺ ₴ ₽ ₩ °", v2, @" ", v3, v4, v5);
    uint64_t v12 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v8, (uint64_t)v7, v9, v10, v11);
    symbols = v6->_symbols;
    v6->_symbols = (NSSet *)v12;
  }
  return v6;
}

- (id)process:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v90 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v7 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEBUG, "CHDecorateSpecialSymbolsStep is running", buf, 2u);
  }

  v91 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  for (unint64_t i = 0; ; ++i)
  {
    v19 = objc_msgSend_result(v6, v13, v14, v15, v16, v17, v90);
    v25 = objc_msgSend_transcriptionPaths(v19, v20, v21, v22, v23, v24);
    unint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);

    if (i >= v31) {
      break;
    }
    v37 = objc_msgSend_result(v6, v32, v33, v34, v35, v36);
    v43 = objc_msgSend_transcriptionPaths(v37, v38, v39, v40, v41, v42);
    v48 = objc_msgSend_objectAtIndexedSubscript_(v43, v44, i, v45, v46, v47);

    v54 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v49, v50, v51, v52, v53);
    v60 = objc_msgSend_result(v6, v55, v56, v57, v58, v59);
    v66 = objc_msgSend_result(v6, v61, v62, v63, v64, v65);
    uint64_t v72 = objc_msgSend_tokenColumnCount(v66, v67, v68, v69, v70, v71);
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = sub_1C493AC64;
    v92[3] = &unk_1E64E0DC0;
    v92[4] = self;
    id v73 = v54;
    id v93 = v73;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v60, v74, (uint64_t)v48, 0, v72, (uint64_t)v92);

    objc_msgSend_addObject_(v91, v75, (uint64_t)v73, v76, v77, v78);
  }
  v79 = [CHTokenizedMathResult alloc];
  v84 = objc_msgSend_initWithBestPathTokens_(v79, v80, (uint64_t)v91, v81, v82, v83);
  objc_msgSend_setResult_(v6, v85, (uint64_t)v84, v86, v87, v88);

  return v6;
}

- (void).cxx_destruct
{
}

@end