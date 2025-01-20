@interface CHMathPostprocessingStep
- (id)process:(id)a3 options:(id)a4;
- (id)retrieveAllPathTokens:(id)a3;
- (id)retrievePathTokens:(id)a3 atPathIndex:(int64_t)a4;
@end

@implementation CHMathPostprocessingStep

- (id)process:(id)a3 options:(id)a4
{
  id v4 = a3;
  return v4;
}

- (id)retrievePathTokens:(id)a3 atPathIndex:(int64_t)a4
{
  id v5 = a3;
  v11 = objc_msgSend_result(v5, v6, v7, v8, v9, v10);
  v17 = objc_msgSend_transcriptionPaths(v11, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_objectAtIndexedSubscript_(v17, v18, a4, v19, v20, v21);

  v28 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v23, v24, v25, v26, v27);
  v34 = objc_msgSend_result(v5, v29, v30, v31, v32, v33);
  v40 = objc_msgSend_result(v5, v35, v36, v37, v38, v39);
  uint64_t v46 = objc_msgSend_tokenColumnCount(v40, v41, v42, v43, v44, v45);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1C4936084;
  v50[3] = &unk_1E64E0CD8;
  id v47 = v28;
  id v51 = v47;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v34, v48, (uint64_t)v22, 0, v46, (uint64_t)v50);

  return v47;
}

- (id)retrieveAllPathTokens:(id)a3
{
  id v4 = a3;
  uint64_t v15 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  for (unint64_t i = 0; ; ++i)
  {
    v17 = objc_msgSend_result(v4, v10, v11, v12, v13, v14);
    v23 = objc_msgSend_transcriptionPaths(v17, v18, v19, v20, v21, v22);
    unint64_t v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);

    if (i >= v29) {
      break;
    }
    uint64_t v33 = objc_msgSend_retrievePathTokens_atPathIndex_(self, v30, (uint64_t)v4, i, v31, v32);
    objc_msgSend_addObject_(v15, v34, (uint64_t)v33, v35, v36, v37);
  }
  return v15;
}

@end