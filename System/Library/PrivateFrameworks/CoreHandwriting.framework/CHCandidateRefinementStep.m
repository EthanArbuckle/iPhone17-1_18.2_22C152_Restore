@interface CHCandidateRefinementStep
- (CHCandidateRefinementStep)initWithShouldKeepOutOfPatternCandidates:(BOOL)a3 shouldKeepDuplicateTokenIDs:(BOOL)a4 shouldKeepOutOfLexiconAlternatives:(BOOL)a5 shouldKeepAlternativeLengths:(BOOL)a6 shouldKeepSubstrings:(BOOL)a7 shouldKeepOriginalSpelling:(BOOL)a8;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHCandidateRefinementStep

- (CHCandidateRefinementStep)initWithShouldKeepOutOfPatternCandidates:(BOOL)a3 shouldKeepDuplicateTokenIDs:(BOOL)a4 shouldKeepOutOfLexiconAlternatives:(BOOL)a5 shouldKeepAlternativeLengths:(BOOL)a6 shouldKeepSubstrings:(BOOL)a7 shouldKeepOriginalSpelling:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CHCandidateRefinementStep;
  result = [(CHCandidateRefinementStep *)&v15 init];
  if (result)
  {
    result->_shouldKeepOutOfPatternCandidates = a3;
    result->_shouldKeepDuplicateTokenIDs = a4;
    result->_shouldKeepOutOfLexiconAlternatives = a5;
    result->_shouldKeepAlternativeLengths = a6;
    result->_shouldKeepSubstrings = a7;
    result->_shouldKeepOriginalSpelling = a8;
  }
  return result;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  v97 = (id *)a3;
  id v94 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHCandidateRefinementStep is running", buf, 2u);
  }

  v12 = objc_msgSend_result(v97, v7, v8, v9, v10, v11);
  objc_msgSend_filterCandidatesWithOutOfPattern_duplicateTokenIDs_keepOutOfLexiconAlternatives_keepAlternativeLengths_keepSubstrings_shouldKeepOriginalSpelling_(v12, v13, self->_shouldKeepOutOfPatternCandidates, self->_shouldKeepDuplicateTokenIDs, self->_shouldKeepOutOfLexiconAlternatives, self->_shouldKeepAlternativeLengths, self->_shouldKeepSubstrings, self->_shouldKeepOriginalSpelling);

  v14 = objc_opt_class();
  if (objc_msgSend_shouldAdjustColumnsFromPostprocessingStepOptions_(v14, v15, (uint64_t)v94, v16, v17, v18))
  {
    v96 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21, v22, v23);
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    v29 = objc_msgSend_result(v97, v24, v25, v26, v27, v28);
    objc_msgSend_transcriptionPaths(v29, v30, v31, v32, v33, v34);
    id obj = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v100, (uint64_t)v105, 16, v36);
    if (v42)
    {
      uint64_t v43 = *(void *)v101;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v101 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = *(void *)(*((void *)&v100 + 1) + 8 * i);
          v46 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v37, v38, v39, v40, v41);
          v52 = objc_msgSend_result(v97, v47, v48, v49, v50, v51);
          v58 = objc_msgSend_result(v97, v53, v54, v55, v56, v57);
          uint64_t v64 = objc_msgSend_tokenColumnCount(v58, v59, v60, v61, v62, v63);
          v98[0] = MEMORY[0x1E4F143A8];
          v98[1] = 3221225472;
          v98[2] = sub_1C4C1191C;
          v98[3] = &unk_1E64E3150;
          id v65 = v46;
          id v99 = v65;
          objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v52, v66, v45, 0, v64, (uint64_t)v98);

          objc_msgSend_addObject_(v96, v67, (uint64_t)v65, v68, v69, v70);
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v100, (uint64_t)v105, 16, v41);
      }
      while (v42);
    }

    v76 = objc_msgSend_result(v97, v71, v72, v73, v74, v75);
    v82 = objc_msgSend_result(v97, v77, v78, v79, v80, v81);
    v88 = objc_msgSend_transcriptionPathScores(v82, v83, v84, v85, v86, v87);
    v92 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v76, v89, (uint64_t)v96, (uint64_t)v88, v90, v91);
    if (v97) {
      objc_storeStrong(v97 + 3, v92);
    }
  }
  return v97;
}

@end