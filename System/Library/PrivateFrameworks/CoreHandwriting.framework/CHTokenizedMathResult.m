@interface CHTokenizedMathResult
+ (BOOL)areTokenRowsEquivalent:(id)a3 otherRow:(id)a4;
+ (BOOL)doesLatexContainEvaluationTrigger:(id)a3;
+ (BOOL)hasPartialRangeDataDetectorEntries:(id)a3;
+ (BOOL)isMathUnitConversionPatternForTextTranscription:(id)a3 locales:(id)a4;
+ (BOOL)isNonTextCandidateTextTranscription:(id)a3;
+ (BOOL)isPartialMathUnitConversionPatternForTextTranscription:(id)a3 locales:(id)a4;
+ (BOOL)isPatternedTextForTextTranscription:(id)a3 locales:(id)a4;
+ (BOOL)isTextTranscriptionInMathAlphabet:(id)a3;
+ (BOOL)isTranscriptionValidExpression:(id)a3 limitToCurrentLocale:(BOOL)a4;
+ (BOOL)isTranscriptionValidExpression:(id)a3 transcriptionPath:(id)a4 limitToCurrentLocale:(BOOL)a5;
+ (BOOL)isTrivialTextTranscriptionAvailableForLatex:(id)a3;
+ (BOOL)isVerticalMathEntryWithUnitForTextTranscription:(id)a3 locales:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (CHTokenizedMathResult)mathResultWithMergedColumns:(id)a3 columnRangesToMerge:(id)a4;
+ (CHTokenizedMathResult)mathResultWithReindexedTokens:(id)a3 originalStrokeIdentifiersOrdering:(id)a4 newStrokeIdentifiersOrdering:(id)a5;
+ (id)declaredVariableInLatexTranscription:(id)a3;
+ (id)simplifiedTextTranscriptionForLatex:(id)a3;
+ (id)textTranscriptionForLatex:(id)a3;
+ (id)updateStrokeIndexOffsetForSubResults:(id)a3 fromResult:(id)a4;
+ (int64_t)mergeTokenRow:(id)a3 intoUniqueRows:(id)a4;
- (BOOL)hasLowConfidence;
- (BOOL)hasValidColumns;
- (BOOL)hasValidPaths;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenizedMathResult:(id)a3;
- (BOOL)isEquivalentToTokenizedMathResult:(id)a3;
- (BOOL)isEvaluationExpected;
- (BOOL)isValid;
- (BOOL)transformNotationToInternal;
- (CGRect)bounds;
- (CHTokenizedMathResult)initWithBestPathTokens:(id)a3;
- (CHTokenizedMathResult)initWithBestPathTokens:(id)a3 isMinimalDrawingResult:(BOOL)a4;
- (CHTokenizedMathResult)initWithCoder:(id)a3;
- (CHTokenizedMathResult)initWithSegmentedBestPathTokens:(id)a3;
- (NSArray)symbolBounds;
- (NSArray)symbolStrokeIndexes;
- (NSArray)transcriptionPathScores;
- (NSArray)transcriptionPaths;
- (double)absoluteProbability;
- (double)averageTokenScoreForColumnRange:(_NSRange)a3;
- (double)baseCharacterHeight;
- (double)geometricMeanTokenScoreForColumnRange:(_NSRange)a3;
- (double)geometricMeanTokenScoreForColumnRange:(_NSRange)a3 transcriptionPath:(id)a4;
- (double)score;
- (double)scoreForColumnRange:(_NSRange)a3;
- (id)alternativeCandidatesLog;
- (id)debugDescription;
- (id)declaredVariable;
- (id)declaredVariablesWhileRecognized;
- (id)description;
- (id)evaluationWithVariables:(id)a3 caseSensitive:(BOOL)a4;
- (id)newResultWithScrubbedStrokes:(id)a3 scrubbedValueTokens:(id)a4 scrubbedValueStrokeIndexes:(id)a5 scrubbedValueDrawing:(id)a6;
- (id)parseTree;
- (id)preferredTranscription;
- (id)renderableLatexCandidatesForColumnIndex:(unint64_t)a3;
- (id)resultTransformedToOfficialNotationWithExplicitOperators:(BOOL)a3;
- (id)selectedTranscriptionPathIndex;
- (id)strokeIndexes;
- (id)strokeIndexesForColumnsInRange:(_NSRange)a3;
- (id)tokenAtLocation:(id *)a3;
- (id)tokenColumns;
- (id)tokenRowsAtColumnIndex:(int64_t)a3;
- (id)tokenizedMathResultByAppendingTokenizedMathResult:(id)a3;
- (id)tokensInTranscriptionPath:(id)a3 atColumnIndex:(int64_t)a4;
- (id)topTranscription;
- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4;
- (int64_t)tokenColumnCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateTokensInPreferredTranscriptionPathWithBlock:(id)a3;
- (void)enumerateTokensInTopTranscriptionPathWithBlock:(id)a3;
- (void)enumerateTokensInTranscriptionPath:(id)a3 columnRange:(_NSRange)a4 tokenProcessingBlock:(id)a5;
- (void)setDeclaredVariablesWhileRecognized:(id)a3;
- (void)setSelectedTranscriptionPathIndex:(id)a3;
@end

@implementation CHTokenizedMathResult

- (CHTokenizedMathResult)initWithBestPathTokens:(id)a3
{
  return (CHTokenizedMathResult *)objc_msgSend_initWithBestPathTokens_isMinimalDrawingResult_(self, a2, (uint64_t)a3, 0, v3, v4);
}

- (CHTokenizedMathResult)initWithBestPathTokens:(id)a3 isMinimalDrawingResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CHTokenizedMathResult;
  v7 = [(CHTokenizedResult *)&v27 initWithIsMinimalDrawingResult:v4];
  if (v7)
  {
    id v25 = 0;
    v26 = 0;
    sub_1C4A5C770((uint64_t)CHTokenizedMathResult, v6, &v26, &v25);
    v8 = v26;
    v9 = v26;
    id v10 = v25;
    id v11 = v25;
    objc_storeStrong((id *)&v7->_tokenColumns, v8);
    objc_storeStrong((id *)&v7->_transcriptionPaths, v10);
    v7->_baseCharacterHeight = -1.0;
    uint64_t v17 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v12, v13, v14, v15, v16);
    declaredVariablesWhileRecognized = v7->_declaredVariablesWhileRecognized;
    v7->_declaredVariablesWhileRecognized = (NSSet *)v17;

    sub_1C4A5C3B4((uint64_t)v7, v19, v20, v21, v22, v23);
  }

  return v7;
}

- (CHTokenizedMathResult)initWithSegmentedBestPathTokens:(id)a3
{
  v105 = self;
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v107 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7, v8);
  v106 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13);
  for (unint64_t i = 0; i < objc_msgSend_count(v3, v14, v15, v16, v17, v18, v105); ++i)
  {
    if (i)
    {
      id v25 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v20, v21, v22, v23, v24);
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      obunint64_t j = v106;
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v113, (uint64_t)v118, 16, v27);
      if (v32)
      {
        uint64_t v33 = *(void *)v114;
        do
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v114 != v33) {
              objc_enumerationMutation(obj);
            }
            unint64_t v35 = 0;
            v36 = *(void **)(*((void *)&v113 + 1) + 8 * v34);
            while (1)
            {
              v37 = objc_msgSend_objectAtIndexedSubscript_(v3, v28, i, v29, v30, v31);
              BOOL v43 = v35 < objc_msgSend_count(v37, v38, v39, v40, v41, v42);

              if (!v43) {
                break;
              }
              v44 = objc_msgSend_indexPathByAddingIndex_(v36, v28, v35, v29, v30, v31);
              objc_msgSend_addObject_(v25, v45, (uint64_t)v44, v46, v47, v48);

              ++v35;
            }
            ++v34;
          }
          while (v34 != v32);
          uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v113, (uint64_t)v118, 16, v31);
        }
        while (v32);
      }

      v106 = v25;
    }
    else
    {
      for (unint64_t j = 0; ; ++j)
      {
        v50 = objc_msgSend_objectAtIndexedSubscript_(v3, v20, 0, v22, v23, v24);
        BOOL v56 = j < objc_msgSend_count(v50, v51, v52, v53, v54, v55);

        if (!v56) {
          break;
        }
        v57 = objc_msgSend_indexPathWithIndex_(MEMORY[0x1E4F28D58], v14, j, v16, v17, v18);
        objc_msgSend_addObject_(v106, v58, (uint64_t)v57, v59, v60, v61);
      }
    }
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v62 = v106;
  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v109, (uint64_t)v117, 16, v64);
  if (v70)
  {
    uint64_t v71 = *(void *)v110;
    do
    {
      uint64_t v72 = 0;
      do
      {
        if (*(void *)v110 != v71) {
          objc_enumerationMutation(v62);
        }
        v73 = *(void **)(*((void *)&v109 + 1) + 8 * v72);
        v79 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v65, v66, v67, v68, v69);
        for (unint64_t k = 0; k < objc_msgSend_length(v73, v74, v75, v76, v77, v78); ++k)
        {
          uint64_t v85 = objc_msgSend_indexAtPosition_(v73, v81, k, v82, v83, v84);
          v90 = objc_msgSend_objectAtIndexedSubscript_(v3, v86, k, v87, v88, v89);
          v95 = objc_msgSend_objectAtIndexedSubscript_(v90, v91, v85, v92, v93, v94);
          objc_msgSend_addObjectsFromArray_(v79, v96, (uint64_t)v95, v97, v98, v99);
        }
        objc_msgSend_addObject_(v107, v81, (uint64_t)v79, v82, v83, v84);

        ++v72;
      }
      while (v72 != v70);
      uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v109, (uint64_t)v117, 16, v69);
    }
    while (v70);
  }

  isMinimalDrawingResult = (CHTokenizedMathResult *)objc_msgSend_initWithBestPathTokens_isMinimalDrawingResult_(v105, v100, (uint64_t)v107, 0, v101, v102);
  return isMinimalDrawingResult;
}

- (id)newResultWithScrubbedStrokes:(id)a3 scrubbedValueTokens:(id)a4 scrubbedValueStrokeIndexes:(id)a5 scrubbedValueDrawing:(id)a6
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  id v10 = a4;
  id v11 = a5;
  id v92 = a6;
  v90 = v11;
  uint64_t v17 = objc_msgSend_count(v10, v12, v13, v14, v15, v16);
  if (v17 != objc_msgSend_count(v11, v18, v19, v20, v21, v22))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v23 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v115 = objc_msgSend_count(v10, v24, v25, v26, v27, v28);
      __int16 v116 = 2048;
      uint64_t v117 = objc_msgSend_count(v11, v29, v30, v31, v32, v33);
      _os_log_impl(&dword_1C492D000, v23, OS_LOG_TYPE_FAULT, "Number of strings (%lu) doesn't match number of segments (%lu) of the provided scrubbed value.", buf, 0x16u);
    }
  }
  uint64_t v109 = 0;
  long long v110 = &v109;
  uint64_t v111 = 0x2020000000;
  char v112 = 1;
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x2020000000;
  char v108 = 0;
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  char v106 = 0;
  sub_1C4947518((uint64_t)buf);
  uint64_t Index = objc_msgSend_firstIndex(v91, v34, v35, v36, v37, v38);
  uint64_t v45 = objc_msgSend_strokeCount(v92, v40, v41, v42, v43, v44);
  v51 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v46, v47, v48, v49, v50);
  v57 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v52, v53, v54, v55, v56);
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3321888768;
  v93[2] = sub_1C4A5EB90;
  v93[3] = &unk_1F20137B8;
  v100 = &v109;
  id v89 = v91;
  id v94 = v89;
  uint64_t v101 = v107;
  id v58 = v10;
  id v95 = v58;
  id v59 = v90;
  id v96 = v59;
  uint64_t v103 = Index;
  id v60 = v92;
  id v97 = v60;
  sub_1C4A6C468((uint64_t)v104, (uint64_t)buf);
  id v61 = v57;
  id v98 = v61;
  id v62 = v51;
  id v99 = v62;
  uint64_t v102 = v105;
  v104[60] = v45;
  objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(self, v63, (uint64_t)v93, v64, v65, v66);
  if (*((unsigned char *)v110 + 24))
  {
    uint64_t v67 = self;
    uint64_t v68 = [CHTokenizedMathResult alloc];
    id v113 = v61;
    uint64_t v72 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v69, (uint64_t)&v113, 1, v70, v71);
    uint64_t v77 = objc_msgSend_initWithBestPathTokens_(v68, v73, (uint64_t)v72, v74, v75, v76);

    uint64_t v83 = objc_msgSend_declaredVariablesWhileRecognized(v67, v78, v79, v80, v81, v82);
    objc_msgSend_setDeclaredVariablesWhileRecognized_(v77, v84, (uint64_t)v83, v85, v86, v87);
  }
  else
  {
    uint64_t v77 = 0;
  }

  sub_1C4947180((uint64_t)v104);
  sub_1C4947180((uint64_t)buf);
  _Block_object_dispose(v105, 8);
  _Block_object_dispose(v107, 8);
  _Block_object_dispose(&v109, 8);

  return v77;
}

+ (BOOL)areTokenRowsEquivalent:(id)a3 otherRow:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v84 = a4;
  uint64_t v86 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v6, v7, v8, v9, v10, v5);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obunint64_t j = v5;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v91, (uint64_t)v96, 16, v12);
  if (v18)
  {
    uint64_t v19 = *(void *)v92;
    uint64_t v20 = &stru_1F20141C8;
    do
    {
      uint64_t v21 = 0;
      uint64_t v22 = v20;
      do
      {
        if (*(void *)v92 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v91 + 1) + 8 * v21);
        uint64_t v24 = objc_msgSend_string(v23, v13, v14, v15, v16, v17);
        objc_msgSend_stringByAppendingString_(v22, v25, (uint64_t)v24, v26, v27, v28);
        uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t v34 = objc_msgSend_strokeIndexes(v23, v29, v30, v31, v32, v33);
        objc_msgSend_addIndexes_(v86, v35, (uint64_t)v34, v36, v37, v38);

        ++v21;
        uint64_t v22 = v20;
      }
      while (v18 != v21);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v91, (uint64_t)v96, 16, v17);
    }
    while (v18);
  }
  else
  {
    uint64_t v20 = &stru_1F20141C8;
  }

  uint64_t v44 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v39, v40, v41, v42, v43);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v45 = v84;
  uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v87, (uint64_t)v95, 16, v47);
  if (v53)
  {
    uint64_t v54 = *(void *)v88;
    uint64_t v55 = &stru_1F20141C8;
    do
    {
      uint64_t v56 = 0;
      v57 = v55;
      do
      {
        if (*(void *)v88 != v54) {
          objc_enumerationMutation(v45);
        }
        id v58 = *(void **)(*((void *)&v87 + 1) + 8 * v56);
        id v59 = objc_msgSend_string(v58, v48, v49, v50, v51, v52);
        objc_msgSend_stringByAppendingString_(v57, v60, (uint64_t)v59, v61, v62, v63);
        uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t v69 = objc_msgSend_strokeIndexes(v58, v64, v65, v66, v67, v68);
        objc_msgSend_addIndexes_(v44, v70, (uint64_t)v69, v71, v72, v73);

        ++v56;
        v57 = v55;
      }
      while (v53 != v56);
      uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v87, (uint64_t)v95, 16, v52);
    }
    while (v53);
  }
  else
  {
    uint64_t v55 = &stru_1F20141C8;
  }

  if (objc_msgSend_isEqualToString_(v20, v74, (uint64_t)v55, v75, v76, v77)) {
    char isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v86, v78, (uint64_t)v44, v79, v80, v81);
  }
  else {
    char isEqualToIndexSet = 0;
  }

  return isEqualToIndexSet;
}

+ (int64_t)mergeTokenRow:(id)a3 intoUniqueRows:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = 0;
  for (unint64_t i = objc_msgSend_count(v6, v8, v9, v10, v11, v12); v7 < i; unint64_t i = objc_msgSend_count(v6, v18, v19, v20, v21, v22))
  {
    uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v6, v14, v7, v15, v16, v17);
    if (objc_msgSend_areTokenRowsEquivalent_otherRow_(CHTokenizedMathResult, v24, (uint64_t)v5, (uint64_t)v23, v25, v26))
    {
      uint64_t v32 = objc_msgSend_count(v23, v27, v28, v29, v30, v31);
      if (v32 != objc_msgSend_count(v5, v33, v34, v35, v36, v37)) {
        goto LABEL_16;
      }
      uint64_t v48 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40, v41, v42);
      for (unint64_t j = 0; j < objc_msgSend_count(v5, v43, v44, v45, v46, v47); ++j)
      {
        uint64_t v54 = objc_msgSend_objectAtIndexedSubscript_(v5, v50, j, v51, v52, v53);
        id v59 = objc_msgSend_objectAtIndexedSubscript_(v23, v55, j, v56, v57, v58);
        int isEquivalentToToken = objc_msgSend_isEquivalentToToken_(v54, v60, (uint64_t)v59, v61, v62, v63);

        if (!isEquivalentToToken)
        {

          goto LABEL_3;
        }
        uint64_t v69 = objc_msgSend_objectAtIndexedSubscript_(v5, v65, j, v66, v67, v68);
        objc_msgSend_score(v69, v70, v71, v72, v73, v74);
        double v76 = v75;
        uint64_t v81 = objc_msgSend_objectAtIndexedSubscript_(v23, v77, j, v78, v79, v80);
        objc_msgSend_score(v81, v82, v83, v84, v85, v86);
        double v88 = v87;

        if (v76 <= v88) {
          objc_msgSend_objectAtIndexedSubscript_(v23, v89, j, v90, v91, v92);
        }
        else {
        long long v93 = objc_msgSend_objectAtIndexedSubscript_(v5, v89, j, v90, v91, v92);
        }
        objc_msgSend_addObject_(v48, v94, (uint64_t)v93, v95, v96, v97);
      }
      if (v48)
      {
        objc_msgSend_setObject_atIndexedSubscript_(v6, v50, (uint64_t)v48, v7, v52, v53);

LABEL_16:
        if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_18;
        }
        break;
      }
    }
LABEL_3:

    ++v7;
  }
  objc_msgSend_addObject_(v6, v14, (uint64_t)v5, v15, v16, v17);
  unint64_t v7 = objc_msgSend_count(v6, v98, v99, v100, v101, v102) - 1;
LABEL_18:

  return v7;
}

- (CHTokenizedMathResult)initWithCoder:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)CHTokenizedMathResult;
  id v5 = [(CHTokenizedResult *)&v83 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v13 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v12, v8, 0);
    uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, @"tokenColumns", v15, v16);
    tokenColumns = v5->_tokenColumns;
    v5->_tokenColumns = (NSArray *)v17;

    uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v26 = objc_msgSend_setWithObjects_(v19, v22, v20, v23, v24, v25, v21, 0);
    uint64_t v30 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v26, @"transcriptionPaths", v28, v29);
    transcriptionPaths = v5->_transcriptionPaths;
    v5->_transcriptionPaths = (NSArray *)v30;

    uint64_t v32 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"selectedTranscriptionPathIndex", v34, v35);
    selectedTranscriptionPathuint64_t Index = v5->_selectedTranscriptionPathIndex;
    v5->_selectedTranscriptionPathuint64_t Index = (NSNumber *)v36;

    uint64_t v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    uint64_t v45 = objc_msgSend_setWithObjects_(v38, v41, v39, v42, v43, v44, v40, 0);
    uint64_t v49 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, @"declaredVariablesWhileRecognized", v47, v48);
    declaredVariablesWhileRecognized = v5->_declaredVariablesWhileRecognized;
    v5->_declaredVariablesWhileRecognized = (NSSet *)v49;

    v5->_baseCharacterHeight = -1.0;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    uint64_t v51 = v5->_tokenColumns;
    uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v79, (uint64_t)v84, 16, v53);
    if (v59)
    {
      uint64_t v60 = *(void *)v80;
      while (2)
      {
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v80 != v60) {
            objc_enumerationMutation(v51);
          }
          uint64_t v62 = objc_msgSend_tokenRows(*(void **)(*((void *)&v79 + 1) + 8 * i), v54, v55, v56, v57, v58);
          BOOL v68 = objc_msgSend_count(v62, v63, v64, v65, v66, v67) == 0;

          if (v68)
          {
            char v69 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v79, (uint64_t)v84, 16, v58);
        if (v59) {
          continue;
        }
        break;
      }
    }
    char v69 = 1;
LABEL_12:

    if (!v5->_tokenColumns) {
      goto LABEL_17;
    }
    char v75 = v69 ^ 1;
    if (!v5->_transcriptionPaths) {
      char v75 = 1;
    }
    if (v75)
    {
LABEL_17:
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      double v76 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v76, OS_LOG_TYPE_ERROR, "CHTokenizedMathResult decoding failed. Token columns and transcription paths are required to be nonnull when constructing a text result.", buf, 2u);
      }

      id v5 = 0;
    }
    else
    {
      sub_1C4A5C3B4((uint64_t)v5, v70, v71, v72, v73, v74);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CHTokenizedMathResult;
  [(CHTokenizedResult *)&v17 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_tokenColumns, @"tokenColumns", v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_transcriptionPaths, @"transcriptionPaths", v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_selectedTranscriptionPathIndex, @"selectedTranscriptionPathIndex", v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_declaredVariablesWhileRecognized, @"declaredVariablesWhileRecognized", v15, v16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v41.receiver = self;
  v41.super_class = (Class)CHTokenizedMathResult;
  id v3 = [(CHTokenizedResult *)&v41 description];
  uint64_t v9 = objc_msgSend_firstObject(self->_transcriptionPathScores, v4, v5, v6, v7, v8);
  objc_msgSend_floatValue(v9, v10, v11, v12, v13, v14);
  float v16 = v15;
  uint64_t v22 = objc_msgSend_strokeIndexes(self, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_debugDescription(v22, v23, v24, v25, v26, v27);
  uint64_t v34 = objc_msgSend_preferredTranscription(self, v29, v30, v31, v32, v33);
  uint64_t v39 = objc_msgSend_stringByAppendingFormat_(v3, v35, @" Score = %.2f, Strokes: %@ \n Latex: \"%@\"", v36, v37, v38, v16, v28, v34);

  return v39;
}

- (id)debugDescription
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_description(self, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_stringByAppendingString_(v7, v8, @"\nTranscription candidates:\n", v9, v10, v11);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v18 = objc_msgSend_transcriptionPaths(self, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v40, (uint64_t)v44, 16, v20);
  if (v26)
  {
    uint64_t v27 = *(void *)v41;
    do
    {
      uint64_t v28 = 0;
      uint64_t v29 = v12;
      do
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v18);
        }
        uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * v28);
        uint64_t v31 = objc_msgSend_tokenColumnCount(self, v21, v22, v23, v24, v25);
        uint64_t v34 = objc_msgSend_transcriptionWithPath_columnRange_(self, v32, v30, 0, v31, v33);
        uint64_t v12 = objc_msgSend_stringByAppendingFormat_(v29, v35, @"\n\"%@\"", v36, v37, v38, v34);

        ++v28;
        uint64_t v29 = v12;
      }
      while (v26 != v28);
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v40, (uint64_t)v44, 16, v25);
    }
    while (v26);
  }

  return v12;
}

- (id)tokenColumns
{
  return self->_tokenColumns;
}

- (int64_t)tokenColumnCount
{
  return objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
}

- (id)strokeIndexes
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], a2, v2, v3, v4, v5);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = self->_tokenColumns;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16, v10);
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v25 + 1) + 8 * i), v11, v12, v13, v14, v15, (void)v25);
        objc_msgSend_addIndexes_(v7, v20, (uint64_t)v19, v21, v22, v23);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16, v15);
    }
    while (v16);
  }

  return v7;
}

- (id)tokenRowsAtColumnIndex:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, a2, a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_mathTokenRows(v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)tokensInTranscriptionPath:(id)a3 atColumnIndex:(int64_t)a4
{
  uint64_t v8 = objc_msgSend_indexAtPosition_(a3, a2, a4, a4, v4, v5);
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v9, a4, v10, v11, v12);
  uint64_t v19 = objc_msgSend_mathTokenRows(v13, v14, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, v8, v21, v22, v23);

  return v24;
}

- (id)tokenAtLocation:(id *)a3
{
  uint64_t v7 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, a2, a3->var0, v3, v4, v5);
  uint64_t v13 = objc_msgSend_mathTokenRows(v7, v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(v13, v14, a3->var1, v15, v16, v17);
  uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3->var2, v20, v21, v22);

  return v23;
}

- (NSArray)symbolStrokeIndexes
{
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4A60804;
  v14[3] = &unk_1E64E0CD8;
  id v8 = v7;
  id v15 = v8;
  objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(self, v9, (uint64_t)v14, v10, v11, v12);

  return (NSArray *)v8;
}

- (NSArray)symbolBounds
{
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4A60938;
  v14[3] = &unk_1E64E0CD8;
  id v8 = v7;
  id v15 = v8;
  objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(self, v9, (uint64_t)v14, v10, v11, v12);

  return (NSArray *)v8;
}

- (double)score
{
  uint64_t v7 = objc_msgSend_tokenColumnCount(self, a2, v2, v3, v4, v5);
  MEMORY[0x1F4181798](self, sel_geometricMeanTokenScoreForColumnRange_, 0, v7, v8, v9);
  return result;
}

- (double)absoluteProbability
{
  uint64_t v7 = objc_msgSend_tokenColumnCount(self, a2, v2, v3, v4, v5);
  MEMORY[0x1F4181798](self, sel_scoreForColumnRange_, 0, v7, v8, v9);
  return result;
}

- (BOOL)hasLowConfidence
{
  if (qword_1EA3C9D50 != -1) {
    dispatch_once(&qword_1EA3C9D50, &unk_1F20137E8);
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  id v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x3FF0000000000000;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4A60C2C;
  v9[3] = &unk_1E64E2EC0;
  v9[4] = &v22;
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, a2, (uint64_t)v9, v2, v3, v4);
  double v6 = exp(v19[3] / (double)v23[3]);
  BOOL v7 = 1;
  if (!*((unsigned char *)v11 + 24) && v6 >= 0.35) {
    BOOL v7 = v15[3] < 0.001;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v7;
}

- (id)strokeIndexesForColumnsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v12 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], a2, a3.location, a3.length, v3, v4);
  if (location < location + length)
  {
    do
    {
      char v13 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v8, location, v9, v10, v11);
      uint64_t v19 = objc_msgSend_strokeIndexes(v13, v14, v15, v16, v17, v18);
      objc_msgSend_addIndexes_(v12, v20, (uint64_t)v19, v21, v22, v23);

      ++location;
      --length;
    }
    while (length);
  }
  return v12;
}

- (double)scoreForColumnRange:(_NSRange)a3
{
  ((void (*)(CHTokenizedMathResult *, char *, NSUInteger, NSUInteger))MEMORY[0x1F4181798])(self, sel_geometricMeanTokenScoreForColumnRange_, a3.location, a3.length);
  return result;
}

- (double)averageTokenScoreForColumnRange:(_NSRange)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  NSUInteger v42 = a3.location + a3.length;
  if (a3.location >= a3.location + a3.length)
  {
    double result = NAN;
  }
  else
  {
    NSUInteger location = a3.location;
    unint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      unint64_t v44 = v6;
      uint64_t v8 = objc_msgSend_tokenRowsAtColumnIndex_(self, a2, location, a3.length, v3, v4);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v9 = v8;
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v49, (uint64_t)v54, 16, v11);
      if (v12)
      {
        uint64_t v13 = *(void *)v50;
        double v14 = 0.0;
        uint64_t v15 = 1;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v50 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v18 = v17;
            uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v45, (uint64_t)v53, 16, v20);
            if (v26)
            {
              uint64_t v27 = *(void *)v46;
              double v28 = 0.0;
              do
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v46 != v27) {
                    objc_enumerationMutation(v18);
                  }
                  objc_msgSend_score(*(void **)(*((void *)&v45 + 1) + 8 * j), v21, v22, v23, v24, v25);
                  double v28 = v28 + v30;
                }
                uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v45, (uint64_t)v53, 16, v25);
              }
              while (v26);
            }
            else
            {
              double v28 = 0.0;
            }

            if (v28 / (double)(unint64_t)objc_msgSend_count(v18, v31, v32, v33, v34, v35) > v14 / (double)(unint64_t)v15)
            {
              uint64_t v15 = objc_msgSend_count(v18, v36, v37, v38, v39, v40);
              double v14 = v28;
            }
          }
          uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v36, (uint64_t)&v49, (uint64_t)v54, 16, v40);
        }
        while (v12);
      }
      else
      {
        double v14 = 0.0;
        uint64_t v15 = 1;
      }

      double v7 = v7 + v14;
      unint64_t v6 = v15 + v44;
      ++location;
    }
    while (location != v42);
    double result = v7 / (double)v6;
  }
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (double)geometricMeanTokenScoreForColumnRange:(_NSRange)a3
{
  objc_msgSend_geometricMeanTokenScoreForColumnRange_transcriptionPath_(self, a2, a3.location, a3.length, 0, v3);
  return result;
}

- (double)geometricMeanTokenScoreForColumnRange:(_NSRange)a3 transcriptionPath:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v84 = a4;
  NSUInteger v80 = location + length;
  if (location >= location + length)
  {
    double v76 = NAN;
  }
  else
  {
    unint64_t v10 = 0;
    double v11 = 0.0;
    do
    {
      uint64_t v16 = objc_msgSend_tokenRowsAtColumnIndex_(self, v6, location, v7, v8, v9);
      unint64_t v82 = v10;
      objc_super v83 = v16;
      if (v84
        && (unint64_t v17 = objc_msgSend_indexAtPosition_(v84, v12, location, v13, v14, v15),
            v17 < objc_msgSend_count(v16, v18, v19, v20, v21, v22)))
      {
        uint64_t v27 = objc_msgSend_indexAtPosition_(v84, v23, location, v24, v25, v26);
        uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v16, v28, v27, v29, v30, v31);
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v33 = v32;
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v93, (uint64_t)v99, 16, v35);
        if (v41)
        {
          uint64_t v42 = *(void *)v94;
          double v43 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v94 != v42) {
                objc_enumerationMutation(v33);
              }
              objc_msgSend_score(*(void **)(*((void *)&v93 + 1) + 8 * i), v36, v37, v38, v39, v40);
              double v43 = v43 + log(v45);
            }
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v93, (uint64_t)v99, 16, v40);
          }
          while (v41);
        }
        else
        {
          double v43 = 0.0;
        }

        uint64_t v50 = objc_msgSend_count(v33, v71, v72, v73, v74, v75);
      }
      else
      {
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v33 = v16;
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v46, (uint64_t)&v89, (uint64_t)v98, 16, v47);
        if (v48)
        {
          uint64_t v49 = *(void *)v90;
          uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
          double v43 = -3.40282347e38;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v90 != v49) {
                objc_enumerationMutation(v33);
              }
              long long v52 = *(void **)(*((void *)&v89 + 1) + 8 * j);
              long long v85 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              id v53 = v52;
              uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v85, (uint64_t)v97, 16, v55);
              if (v61)
              {
                uint64_t v62 = *(void *)v86;
                double v63 = 0.0;
                do
                {
                  for (uint64_t k = 0; k != v61; ++k)
                  {
                    if (*(void *)v86 != v62) {
                      objc_enumerationMutation(v53);
                    }
                    objc_msgSend_score(*(void **)(*((void *)&v85 + 1) + 8 * k), v56, v57, v58, v59, v60);
                    double v63 = v63 + log(v65);
                  }
                  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v85, (uint64_t)v97, 16, v60);
                }
                while (v61);
              }
              else
              {
                double v63 = 0.0;
              }

              if (v63 > v43)
              {
                uint64_t v50 = objc_msgSend_count(v53, v66, v67, v68, v69, v70);
                double v43 = v63;
              }
            }
            uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v66, (uint64_t)&v89, (uint64_t)v98, 16, v70);
          }
          while (v48);
        }
        else
        {
          uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
          double v43 = -3.40282347e38;
        }
      }

      double v11 = v11 + v43;
      unint64_t v10 = v50 + v82;
      ++location;
    }
    while (location != v80);
    double v76 = v11 / (double)v10;
  }
  double v77 = exp(v76);
  if (v77 <= 1.0) {
    double v78 = v77;
  }
  else {
    double v78 = 1.0;
  }

  return v78;
}

- (BOOL)hasValidPaths
{
  if (objc_msgSend_count(self->_transcriptionPaths, a2, v2, v3, v4, v5))
  {
    uint64_t v12 = objc_msgSend_count(self->_transcriptionPaths, v7, v8, v9, v10, v11);
    BOOL v18 = v12 == objc_msgSend_count(self->_transcriptionPathScores, v13, v14, v15, v16, v17);
    if (!objc_msgSend_count(self->_transcriptionPaths, v19, v20, v21, v22, v23)) {
      return v18;
    }
  }
  else
  {
    BOOL v18 = 0;
    if (!objc_msgSend_count(self->_transcriptionPaths, v7, v8, v9, v10, v11)) {
      return v18;
    }
  }
  if (!v18) {
    return v18;
  }
  uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v24, 0, v25, v26, v27);
  uint64_t v35 = objc_msgSend_length(v29, v30, v31, v32, v33, v34);
  uint64_t v41 = objc_msgSend_count(self->_tokenColumns, v36, v37, v38, v39, v40);

  objc_msgSend_count(self->_transcriptionPaths, v42, v43, v44, v45, v46);
  return v35 == v41;
}

- (BOOL)hasValidColumns
{
  uint64_t v7 = objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
  BOOL v8 = v7 != 0;
  if (objc_msgSend_count(self->_tokenColumns, v9, v10, v11, v12, v13)) {
    BOOL v18 = v7 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v14, 0, v15, v16, v17);
    uint64_t v25 = objc_msgSend_mathTokenRows(v19, v20, v21, v22, v23, v24);
    uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
    BOOL v8 = v31 != 0;

    uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v32, 0, v33, v34, v35);
    uint64_t v42 = objc_msgSend_mathTokenRows(v36, v37, v38, v39, v40, v41);
    uint64_t v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);

    if (v48) {
      BOOL v54 = v31 == 0;
    }
    else {
      BOOL v54 = 1;
    }
    if (!v54)
    {
      uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v49, 0, v51, v52, v53);
      uint64_t v61 = objc_msgSend_mathTokenRows(v55, v56, v57, v58, v59, v60);
      uint64_t v66 = objc_msgSend_objectAtIndexedSubscript_(v61, v62, 0, v63, v64, v65);
      BOOL v8 = objc_msgSend_count(v66, v67, v68, v69, v70, v71) != 0;

      double v76 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v72, 0, v73, v74, v75);
      unint64_t v82 = objc_msgSend_mathTokenRows(v76, v77, v78, v79, v80, v81);
      objc_msgSend_count(v82, v83, v84, v85, v86, v87);
    }
    objc_msgSend_count(self->_tokenColumns, v49, v50, v51, v52, v53);
  }
  return v8;
}

- (BOOL)isValid
{
  int hasValidColumns = objc_msgSend_hasValidColumns(self, a2, v2, v3, v4, v5);
  if (hasValidColumns)
  {
    LOBYTE(hasValidColumns) = MEMORY[0x1F4181798](self, sel_hasValidPaths, v8, v9, v10, v11);
  }
  return hasValidColumns;
}

- (void)setDeclaredVariablesWhileRecognized:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  if (self->_declaredVariablesWhileRecognized != v4)
  {
    uint64_t v12 = v4;
    uint64_t v10 = (NSSet *)objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    declaredVariablesWhileRecognized = self->_declaredVariablesWhileRecognized;
    self->_declaredVariablesWhileRecognized = v10;

    uint64_t v4 = v12;
  }
}

- (id)declaredVariablesWhileRecognized
{
  return self->_declaredVariablesWhileRecognized;
}

- (id)topTranscription
{
  uint64_t v7 = objc_msgSend_firstObject(self->_transcriptionPaths, a2, v2, v3, v4, v5);
  uint64_t v13 = v7;
  if (v7
    && (uint64_t v14 = objc_msgSend_length(v7, v8, v9, v10, v11, v12),
        objc_msgSend_transcriptionWithPath_columnRange_(self, v15, (uint64_t)v13, 0, v14, v16),
        (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    BOOL v18 = (__CFString *)v17;
  }
  else
  {

    BOOL v18 = &stru_1F20141C8;
  }
  return v18;
}

- (id)preferredTranscription
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = objc_msgSend_selectedTranscriptionPathIndex(self, a2, v2, v3, v4, v5);
  if (v12
    && (objc_msgSend_selectedTranscriptionPathIndex(self, v7, v8, v9, v10, v11),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = objc_msgSend_integerValue(v13, v14, v15, v16, v17, v18),
        v13,
        v12,
        v19))
  {
    uint64_t v20 = objc_msgSend_selectedTranscriptionPathIndex(self, v7, v8, v9, v10, v11);
    uint64_t v26 = objc_msgSend_integerValue(v20, v21, v22, v23, v24, v25);

    if (v26 < 1 || v26 >= (unint64_t)objc_msgSend_count(self->_transcriptionPaths, v27, v28, v29, v30, v31))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v47 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        int v48 = 134217984;
        uint64_t v49 = v26;
        _os_log_impl(&dword_1C492D000, v47, OS_LOG_TYPE_ERROR, "Invalid selected transcription path index %lu. Returning empty string.", (uint8_t *)&v48, 0xCu);
      }

      uint64_t v45 = &stru_1F20141C8;
    }
    else
    {
      uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v32, v26, v33, v34, v35);
      uint64_t v42 = objc_msgSend_length(v36, v37, v38, v39, v40, v41);
      objc_msgSend_transcriptionWithPath_columnRange_(self, v43, (uint64_t)v36, 0, v42, v44);
      uint64_t v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend_topTranscription(self, v7, v8, v9, v10, v11);
    uint64_t v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v45;
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C4A61D60;
  v22[3] = &unk_1E64E0CD8;
  id v14 = v13;
  id v23 = v14;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v15, (uint64_t)v7, location, length, (uint64_t)v22);
  uint64_t v20 = objc_msgSend_componentsJoinedByString_(v14, v16, @" ", v17, v18, v19);

  return v20;
}

- (void)setSelectedTranscriptionPathIndex:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v10 = v4;
  if (v4)
  {
    unint64_t v16 = objc_msgSend_integerValue(v4, v5, v6, v7, v8, v9);
    if ((v16 & 0x8000000000000000) != 0
      || v16 >= objc_msgSend_count(self->_transcriptionPaths, v11, v12, v13, v14, v15))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v21 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        uint64_t v27 = objc_msgSend_count(self->_transcriptionPaths, v22, v23, v24, v25, v26);
        int v31 = 134218240;
        unint64_t v32 = v16;
        __int16 v33 = 2048;
        uint64_t v34 = v27;
        _os_log_impl(&dword_1C492D000, v21, OS_LOG_TYPE_FAULT, "Invalid transcription path index %lu. Number of transcription path: %lu", (uint8_t *)&v31, 0x16u);
      }
    }
    objc_msgSend_numberWithInteger_(NSNumber, v17, v16, v18, v19, v20);
    uint64_t v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    selectedTranscriptionPathuint64_t Index = self->_selectedTranscriptionPathIndex;
    self->_selectedTranscriptionPathuint64_t Index = v28;
  }
  else
  {
    uint64_t v30 = self->_selectedTranscriptionPathIndex;
    self->_selectedTranscriptionPathuint64_t Index = 0;
  }
}

- (id)selectedTranscriptionPathIndex
{
  return self->_selectedTranscriptionPathIndex;
}

- (id)renderableLatexCandidatesForColumnIndex:(unint64_t)a3
{
  uint64_t v631 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_tokenColumnCount(self, a2, a3, v3, v4, v5) <= a3)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v13 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = objc_msgSend_tokenColumnCount(self, v14, v15, v16, v17, v18);
      _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_FAULT, "Column index %lu out of range. There is %lu columns in the result.", buf, 0x16u);
    }
  }
  if (qword_1EA3C9E30 != -1) {
    dispatch_once(&qword_1EA3C9E30, &unk_1F2011390);
  }
  v559 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  long long v625 = 0u;
  long long v626 = 0u;
  long long v623 = 0u;
  long long v624 = 0u;
  objc_msgSend_tokenRowsAtColumnIndex_(self, v19, a3, v20, v21, v22);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v560 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v623, (uint64_t)v630, 16, v24);
  if (v560)
  {
    uint64_t v558 = *(void *)v624;
    do
    {
      for (uint64_t i = 0; i != v560; ++i)
      {
        if (*(void *)v624 != v558) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void **)(*((void *)&v623 + 1) + 8 * i);
        v599 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
        long long v629 = 0u;
        memset(buf, 0, sizeof(buf));
        long long v621 = 0u;
        long long v622 = 0u;
        long long v619 = 0u;
        *(_OWORD *)v620 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        long long v618 = 0u;
        id v562 = v30;
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v562, v31, (uint64_t)&v616, (uint64_t)v627, 16, v32);
        if (v33)
        {
          uint64_t v39 = 0;
          uint64_t v40 = 0;
          v597 = 0;
          uint64_t v600 = 0;
          uint64_t v603 = 0;
          uint64_t v41 = 0;
          uint64_t v563 = 0;
          v564 = 0;
          uint64_t v42 = 0;
          uint64_t v566 = 0;
          v567 = 0;
          uint64_t v576 = 0;
          v578 = 0;
          uint64_t v570 = 0;
          v571 = 0;
          uint64_t v580 = 0;
          v582 = 0;
          v565 = 0;
          uint64_t v568 = 0;
          uint64_t v569 = 0;
          uint64_t v43 = 0;
          uint64_t v574 = 0;
          uint64_t v575 = 0;
          uint64_t v572 = 0;
          uint64_t v44 = 0;
          uint64_t v585 = *(void *)v617;
          uint64_t v588 = 0;
          while (1)
          {
            uint64_t v591 = v33;
            for (uint64_t j = 0; j != v591; ++j)
            {
              while (1)
              {
                uint64_t v594 = v43;
                uint64_t v605 = v41;
                uint64_t v607 = v39;
                if (*(void *)v617 != v585) {
                  objc_enumerationMutation(v562);
                }
                uint64_t v46 = *(void **)(*((void *)&v616 + 1) + 8 * j);
                uint64_t v47 = (void *)qword_1EA3C9DF0;
                int v48 = objc_msgSend_string(v46, v34, v35, v36, v37, v38);
                if (objc_msgSend_containsObject_(v47, v49, (uint64_t)v48, v50, v51, v52))
                {

                  break;
                }
                uint64_t v63 = (void *)qword_1EA3C9E00;
                uint64_t v64 = objc_msgSend_string(v46, v53, v54, v55, v56, v57);
                LODWORD(v63) = objc_msgSend_containsObject_(v63, v65, (uint64_t)v64, v66, v67, v68);

                if (v63) {
                  break;
                }
                uint64_t v84 = (void *)qword_1EA3C9E10;
                uint64_t v85 = objc_msgSend_string(v46, v58, v59, v60, v61, v62);
                long long v90 = objc_msgSend_objectForKeyedSubscript_(v84, v86, (uint64_t)v85, v87, v88, v89);
                BOOL v91 = v90 == 0;

                if (v91)
                {
                  if (objc_msgSend_count(v599, v92, v93, v94, v95, v96)) {
                    goto LABEL_50;
                  }
                  if (v576)
                  {
                    uint64_t v570 = v566;
                    v571 = v567;
                    v578 = v567;
                    uint64_t v580 = v566;
                    v582 = v567;
                    uint64_t v574 = v566;
                    if (objc_msgSend_count(*(void **)(*(void *)&v567[((unint64_t)(v576 + v566 - 1) >> 6) & 0x3FFFFFFFFFFFFF8]+ 8 * ((v576 + v566 - 1) & 0x1FF)), v155, v156, v157, v158, v159))
                    {
                      goto LABEL_50;
                    }
                  }
                  uint64_t v172 = qword_1EA3C9E18;
                  v173 = objc_msgSend_string(v46, v155, v156, v157, v158, v159);
                  LOBYTE(v172) = objc_msgSend_containsObject_((void *)v172, v174, (uint64_t)v173, v175, v176, v177);

                  uint64_t v39 = v607;
                  if ((v172 & 1) == 0)
                  {
LABEL_50:
                    v160 = v599;
                    if (v42)
                    {
                      v160 = *(void **)(*(void *)&v564[((unint64_t)(v42 + v563 - 1) >> 6) & 0x3FFFFFFFFFFFFF8]
                                      + 8 * ((v42 + v563 - 1) & 0x1FF));
                      uint64_t v566 = v563;
                      v567 = v564;
                      uint64_t v570 = v563;
                      v571 = v564;
                      v578 = v564;
                      uint64_t v580 = v563;
                      v582 = v564;
                      uint64_t v574 = v563;
                    }
                    id v161 = v160;
                    v167 = objc_msgSend_string(v46, v162, v163, v164, v165, v166);
                    objc_msgSend_addObject_(v161, v168, (uint64_t)v167, v169, v170, v171);

                    uint64_t v576 = v42;
                    uint64_t v588 = v42;
                    goto LABEL_53;
                  }
                  uint64_t v588 = v576;
                  uint64_t v41 = v605;
                  uint64_t v43 = v594;
                  if (v591 == ++j) {
                    goto LABEL_59;
                  }
                }
                else
                {
                  if (!v44) {
                    goto LABEL_47;
                  }
                  unint64_t v97 = v44 - 1 + v572;
                  unint64_t v98 = v97 >> 9;
                  uint64_t v99 = v97 & 0x1FF;
                  uint64_t v100 = *(void **)(*(void *)(v575 + 8 * (v97 >> 9)) + 8 * v99);
                  uint64_t v101 = (void *)qword_1EA3C9E10;
                  uint64_t v102 = objc_msgSend_string(v46, v92, v93, v94, v95, v96);
                  v107 = objc_msgSend_objectForKeyedSubscript_(v101, v103, (uint64_t)v102, v104, v105, v106);
                  LODWORD(v100) = objc_msgSend_isEqualToString_(v100, v108, (uint64_t)v107, v109, v110, v111);

                  if (v100)
                  {
                    uint64_t v112 = 8 * v98;
                    uint64_t v113 = 8 * v99;
                    id v573 = *(id *)(*(void *)(v575 + v112) + 8 * v99);
                    uint64_t v42 = v588 - 1;
                    unint64_t v114 = v588 - 1 + v574;
                    unint64_t v115 = v114 >> 9;
                    uint64_t v116 = v114 & 0x1FF;
                    id v577 = *(id *)(*(void *)&v582[8 * (v114 >> 9)] + 8 * v116);

                    uint64_t v117 = ((v594 - v568) << 6) - 1;
                    *((void *)&v629 + 1) = v44 - 1;
                    if (v594 == v568) {
                      uint64_t v117 = 0;
                    }
                    if ((unint64_t)(v117 - (v44 + v569) + 1) >= 0x400)
                    {
                      operator delete(*(void **)(v594 - 8));
                      v594 -= 8;
                      *(void *)&uint8_t buf[16] = v594;
                      uint64_t v603 = v594;
                    }

                    uint64_t v118 = ((v565 - v578) << 6) - 1;
                    *((void *)&v622 + 1) = v588 - 1;
                    if (v565 == v578) {
                      uint64_t v118 = 0;
                    }
                    if ((unint64_t)(v118 - (v588 + v580) + 1) >= 0x400)
                    {
                      operator delete(*((void **)v565 - 1));
                      v565 -= 8;
                      *(void *)&long long v621 = v565;
                      v597 = v565;
                    }
                    uint64_t v119 = v599;
                    if (v588 != 1)
                    {
                      uint64_t v119 = *(void **)(*(void *)&v571[((unint64_t)(v588 + v570 - 2) >> 6) & 0x3FFFFFFFFFFFFF8]
                                      + 8 * ((v588 + v570 - 2) & 0x1FF));
                      v578 = v571;
                      uint64_t v580 = v570;
                    }
                    id v120 = v119;
                    objc_msgSend_addObject_(v120, v121, (uint64_t)v573, v122, v123, v124);
                    objc_msgSend_addObjectsFromArray_(v120, v125, (uint64_t)v577, v126, v127, v128);
                    v134 = objc_msgSend_string(v46, v129, v130, v131, v132, v133);
                    objc_msgSend_addObject_(v120, v135, (uint64_t)v134, v136, v137, v138);

                    v582 = v578;
                    --v588;
                    uint64_t v575 = v568;
                    uint64_t v576 = v42;
                    uint64_t v572 = v569;
                    uint64_t v574 = v580;
                    --v44;
                  }
                  else
                  {
LABEL_47:
                    v139 = (void *)qword_1EA3C9DF8;
                    v140 = objc_msgSend_string(v46, v92, v93, v94, v95, v96);
                    LODWORD(v139) = objc_msgSend_containsObject_(v139, v141, (uint64_t)v140, v142, v143, v144);

                    if (v139)
                    {
                      objc_msgSend_addObject_(v599, v34, @"\\left.", v36, v37, v38);
                      v150 = objc_msgSend_string(v46, v145, v146, v147, v148, v149);
                      objc_msgSend_addObject_(v599, v151, (uint64_t)v150, v152, v153, v154);
                    }
                  }
LABEL_53:
                  uint64_t v41 = v605;
                  uint64_t v39 = v607;
                  uint64_t v43 = v594;
                  if (v591 == ++j) {
                    goto LABEL_59;
                  }
                }
              }
              uint64_t v74 = objc_msgSend_string(v46, v58, v59, v60, v61, v62);
              uint64_t v75 = v605;
              if (v603 == v605) {
                uint64_t v76 = 0;
              }
              else {
                uint64_t v76 = ((v603 - v605) << 6) - 1;
              }
              unint64_t v77 = v44 + v600;
              if (v76 == v44 + v600)
              {
                sub_1C4A6C788(buf);
                uint64_t v75 = *(void *)&buf[8];
                uint64_t v44 = *((void *)&v629 + 1);
                uint64_t v600 = v629;
                uint64_t v603 = *(void *)&buf[16];
                unint64_t v77 = *((void *)&v629 + 1) + v629;
              }
              uint64_t v78 = v75;
              *(void *)(*(void *)(v75 + ((v77 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v77 & 0x1FF)) = v74;
              *((void *)&v629 + 1) = ++v44;
              uint64_t v79 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v69, v70, v71, v72, v73);
              uint64_t v80 = v597;
              if (v597 == v40) {
                uint64_t v81 = 0;
              }
              else {
                uint64_t v81 = ((v597 - v40) << 6) - 1;
              }
              uint64_t v82 = v607;
              unint64_t v83 = v42 + v607;
              if (v81 == v42 + v607)
              {
                sub_1C4A6CE64(v620);
                uint64_t v40 = (char *)v620[1];
                uint64_t v80 = (char *)v621;
                uint64_t v42 = *((void *)&v622 + 1);
                uint64_t v82 = v622;
                unint64_t v83 = *((void *)&v622 + 1) + v622;
              }
              *(void *)(*(void *)&v40[(v83 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v83 & 0x1FF)) = v79;
              *((void *)&v622 + 1) = ++v42;
              uint64_t v563 = v82;
              v564 = v40;
              uint64_t v566 = v82;
              v567 = v40;
              uint64_t v576 = v42;
              v578 = v40;
              uint64_t v570 = v82;
              v571 = v40;
              uint64_t v580 = v82;
              v582 = v40;
              v597 = v80;
              v565 = v80;
              uint64_t v43 = v603;
              uint64_t v568 = v78;
              uint64_t v569 = v600;
              uint64_t v41 = v78;
              uint64_t v574 = v82;
              uint64_t v575 = v78;
              uint64_t v588 = v42;
              uint64_t v572 = v600;
              uint64_t v39 = v82;
            }
LABEL_59:
            uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v562, v34, (uint64_t)&v616, (uint64_t)v627, 16, v38);
            if (!v33)
            {

              if (v44)
              {
                uint64_t v183 = 0;
                uint64_t v184 = 1 - v42;
                uint64_t v185 = 1 - (v600 + v44);
                uint64_t v583 = v39 + v42 - 2;
                uint64_t v586 = v600 + v44 - 1;
                do
                {
                  uint64_t v589 = v185;
                  uint64_t v592 = v184;
                  uint64_t v186 = ((unint64_t)(v586 + v183) >> 6) & 0x3FFFFFFFFFFFFF8;
                  uint64_t v187 = v183;
                  uint64_t v188 = 8 * ((v586 + v183) & 0x1FF);
                  id v595 = *(id *)(*(void *)(v41 + v186) + v188);
                  uint64_t v189 = v42 + v187 - 1;
                  uint64_t v608 = v39;
                  __int16 v190 = v189 + v39;
                  unint64_t v191 = (unint64_t)(v189 + v39) >> 9;
                  uint64_t v192 = v190 & 0x1FF;
                  id v601 = *(id *)(*(void *)&v40[8 * v191] + 8 * v192);

                  *((void *)&v629 + 1) = v44 + v187 - 1;
                  uint64_t v193 = ((v603 - v41) << 6) - 1;
                  if (v603 == v41) {
                    uint64_t v193 = 0;
                  }
                  if ((unint64_t)(v193 + v589) >= 0x400)
                  {
                    operator delete(*(void **)(v603 - 8));
                    v603 -= 8;
                    *(void *)&uint8_t buf[16] = v603;
                  }

                  v194 = v597;
                  uint64_t v195 = ((v597 - v40) << 6) - 1;
                  *((void *)&v622 + 1) = v42 + v187 - 1;
                  if (v597 == v40) {
                    uint64_t v195 = 0;
                  }
                  if ((unint64_t)(v592 + v195 - v608) >= 0x400)
                  {
                    v194 = v597 - 8;
                    operator delete(*((void **)v597 - 1));
                    *(void *)&long long v621 = v597 - 8;
                  }
                  v196 = v599;
                  if (v42 + v187 != 1) {
                    v196 = *(void **)(*(void *)&v40[((unint64_t)(v583 + v187) >> 6) & 0x3FFFFFFFFFFFFF8]
                  }
                                    + 8 * ((v583 + v187) & 0x1FF));
                  id v197 = v196;
                  if (objc_msgSend_containsObject_((void *)qword_1EA3C9DF0, v198, (uint64_t)v595, v199, v200, v201))
                  {
                    objc_msgSend_addObject_(v197, v202, (uint64_t)v595, v203, v204, v205);
                    objc_msgSend_addObjectsFromArray_(v197, v206, (uint64_t)v601, v207, v208, v209);
                    objc_msgSend_addObject_(v197, v210, @"\\right.", v211, v212, v213);
                  }
                  if (objc_msgSend_isEqualToString_(v595, v202, @"{", v203, v204, v205))
                  {
                    objc_msgSend_addObject_(v197, v214, (uint64_t)v595, v215, v216, v217);
                    objc_msgSend_addObjectsFromArray_(v197, v218, (uint64_t)v601, v219, v220, v221);
                    objc_msgSend_addObject_(v197, v222, @"}", v223, v224, v225);
                  }
                  else
                  {
                    objc_msgSend_addObjectsFromArray_(v197, v214, (uint64_t)v601, v215, v216, v217);
                  }
                  v597 = v194;

                  uint64_t v183 = v187 - 1;
                  uint64_t v184 = v592 + 1;
                  uint64_t v185 = v589 + 1;
                  uint64_t v39 = v608;
                }
                while (v44 + v183);
              }
              goto LABEL_80;
            }
          }
        }

LABEL_80:
        v579 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v178, v179, v180, v181, v182);
        uint64_t v231 = 0;
        for (unint64_t k = 0; k < objc_msgSend_count(v599, v226, v227, v228, v229, v230); ++k)
        {
          if (!v231)
          {
            v238 = objc_msgSend_objectAtIndexedSubscript_(v599, v234, k, v235, v236, v237);
            int isEqualToString = objc_msgSend_isEqualToString_(v238, v239, @"&", v240, v241, v242);

            if (isEqualToString) {
              objc_msgSend_addIndex_(v579, v244, k, v245, v246, v247);
            }
            v248 = objc_msgSend_objectAtIndexedSubscript_(v599, v244, k, v245, v246, v247);
            int v253 = objc_msgSend_isEqualToString_(v248, v249, @"\\hline", v250, v251, v252);

            if (v253) {
              objc_msgSend_setObject_atIndexedSubscript_(v599, v234, @"-", k, v236, v237);
            }
          }
          v254 = objc_msgSend_objectAtIndexedSubscript_(v599, v234, k, v235, v236, v237);
          char v259 = objc_msgSend_isEqualToString_(v254, v255, @"\\begin{array}{lr}", v256, v257, v258);

          if (v259)
          {
            uint64_t v233 = 1;
          }
          else
          {
            v260 = objc_msgSend_objectAtIndexedSubscript_(v599, v226, k, v228, v229, v230);
            uint64_t v265 = objc_msgSend_isEqualToString_(v260, v261, @"\\end{array}", v262, v263, v264);

            uint64_t v233 = v265 << 63 >> 63;
          }
          v231 += v233;
        }
        objc_msgSend_removeObjectsAtIndexes_(v599, v234, (uint64_t)v579, v235, v236, v237);
        uint64_t v271 = 0;
        unint64_t v272 = 0;
        uint64_t v273 = -1;
        while (1)
        {
          uint64_t v274 = v272;
          uint64_t v275 = v271;
          if (v272 >= objc_msgSend_count(v599, v266, v267, v268, v269, v270)) {
            goto LABEL_100;
          }
          uint64_t v276 = objc_msgSend_count(v599, v266, v267, v268, v269, v270);
          v281 = objc_msgSend_objectAtIndexedSubscript_(v599, v277, v274, v278, v279, v280);
          char v286 = objc_msgSend_isEqualToString_(v281, v282, @"{", v283, v284, v285);
          char v291 = v273 + v276 >= 0 ? v286 : 0;
          if ((v291 & 1) == 0) {
            break;
          }
          v292 = objc_msgSend_objectAtIndexedSubscript_(v599, v287, v273 + v276, v288, v289, v290);
          char v297 = objc_msgSend_isEqualToString_(v292, v293, @"}", v294, v295, v296);

          unint64_t v272 = v274 + 1;
          uint64_t v271 = v275 + 2;
          --v273;
          if ((v297 & 1) == 0) {
            goto LABEL_100;
          }
        }

LABEL_100:
        if (v274)
        {
          uint64_t v298 = objc_msgSend_count(v599, v266, v267, v268, v269, v270);
          v302 = objc_msgSend_subarrayWithRange_(v599, v299, v274, v298 - v275, v300, v301);
          uint64_t v308 = objc_msgSend_mutableCopy(v302, v303, v304, v305, v306, v307);

          v599 = (void *)v308;
        }
        unint64_t v309 = 0;
        uint64_t v310 = 1;
        while (v309 < objc_msgSend_count(v599, v266, v267, v268, v269, v270))
        {
          v316 = objc_msgSend_objectAtIndexedSubscript_(v599, v311, v309, v313, v314, v315);
          v326 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C9E28, v317, (uint64_t)v316, v318, v319, v320);
          if (v326)
          {
            if (v309 == objc_msgSend_count(v599, v321, v322, v323, v324, v325) - 1)
            {

LABEL_112:
              v355 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C9E28, v321, (uint64_t)v316, v323, v324, v325);
              v356 = (void *)MEMORY[0x1E4F28D60];
              v361 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C9E28, v357, (uint64_t)v316, v358, v359, v360);
              uint64_t v367 = objc_msgSend_count(v361, v362, v363, v364, v365, v366);
              v371 = objc_msgSend_indexSetWithIndexesInRange_(v356, v368, v309 + 1, v367, v369, v370);
              objc_msgSend_insertObjects_atIndexes_(v599, v372, (uint64_t)v355, (uint64_t)v371, v373, v374);

              goto LABEL_117;
            }
            v331 = objc_msgSend_objectAtIndexedSubscript_(v599, v327, v309 + 1, v328, v329, v330);
            char v336 = objc_msgSend_isEqualToString_(v331, v332, @"{", v333, v334, v335);

            if ((v336 & 1) == 0) {
              goto LABEL_112;
            }
          }
          if (objc_msgSend_isEqualToString_(v316, v321, @"\\frac", v323, v324, v325))
          {
            unint64_t v342 = 0;
            for (unint64_t m = v310; m < objc_msgSend_count(v599, v337, v338, v339, v340, v341); ++m)
            {
              v349 = objc_msgSend_objectAtIndexedSubscript_(v599, v344, m, v346, v347, v348);
              unsigned int v354 = objc_msgSend_isEqualToString_(v349, v350, @"}", v351, v352, v353);

              v342 += v354;
            }
            if (v342 < 2)
            {
              uint64_t v375 = objc_msgSend_count(v599, v344, v345, v346, v347, v348);
              v380 = objc_msgSend_objectAtIndexedSubscript_(v599, v376, v375 - 1, v377, v378, v379);
              int v385 = objc_msgSend_isEqualToString_(v380, v381, @"}", v382, v383, v384);

              if (v385) {
                objc_msgSend_addObject_(v599, v386, @"{", v387, v388, v389);
              }
              objc_msgSend_addObject_(v599, v386, @"\\phantom{m}", v387, v388, v389);
              objc_msgSend_addObject_(v599, v390, @"}", v391, v392, v393);
            }
          }
LABEL_117:

          ++v309;
          ++v310;
        }
        v584 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v311, v312, v313, v314, v315);
        unint64_t v602 = 0;
        uint64_t v604 = 0;
        v399 = 0;
        v606 = 0;
        v609 = 0;
        uint64_t v596 = 0;
        unint64_t v598 = 0;
        unint64_t v590 = 0;
        v593 = 0;
        v400 = 0;
        uint64_t v401 = 0;
        uint64_t v402 = 0;
        uint64_t v403 = 0;
        int v404 = 0;
        unint64_t v405 = 0;
        long long v614 = 0u;
        long long v615 = 0u;
        long long v612 = 0u;
        *(_OWORD *)v613 = 0u;
        *(_OWORD *)__p = 0u;
        long long v611 = 0u;
        while (v405 < objc_msgSend_count(v599, v394, v395, v396, v397, v398))
        {
          v410 = objc_msgSend_objectAtIndexedSubscript_(v599, v406, v405, v407, v408, v409);
          if (objc_msgSend_isEqualToString_(v410, v411, @"{", v412, v413, v414))
          {
            if (v405
              && (v420 = (void *)qword_1EA3C9E20,
                  objc_msgSend_objectAtIndexedSubscript_(v599, v415, v405 - 1, v417, v418, v419),
                  v421 = objc_claimAutoreleasedReturnValue(),
                  int v426 = objc_msgSend_containsObject_(v420, v422, (uint64_t)v421, v423, v424, v425),
                  v421,
                  ((v404 | v426) & 1) != 0))
            {
              objc_msgSend_objectAtIndexedSubscript_(v599, v415, v405 - 1, v417, v418, v419);
              v427 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v593 == v609) {
                uint64_t v428 = 0;
              }
              else {
                uint64_t v428 = (((char *)v593 - (char *)v609) << 6) - 1;
              }
              unint64_t v429 = v401 + v598;
              if (v428 == v401 + v598)
              {
                sub_1C4A6C788(v613);
                v430 = (void **)v613[1];
                v593 = (void **)v614;
                uint64_t v401 = *((void *)&v615 + 1);
                unint64_t v598 = v615;
                unint64_t v429 = *((void *)&v615 + 1) + v615;
LABEL_152:
                v609 = v430;
                (*(void **)((char *)v430 + ((v429 >> 6) & 0x3FFFFFFFFFFFFF8)))[v429 & 0x1FF] = v427;
                *((void *)&v615 + 1) = ++v401;
                uint64_t v460 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v415, v416, v417, v418, v419);
                if (v606 == v399) {
                  uint64_t v461 = 0;
                }
                else {
                  uint64_t v461 = (((char *)v606 - (char *)v399) << 6) - 1;
                }
                unint64_t v462 = v402 + v602;
                if (v461 == v402 + v602)
                {
                  sub_1C4A6CE64(__p);
                  v399 = (void **)__p[1];
                  v606 = (void **)v611;
                  uint64_t v402 = *((void *)&v612 + 1);
                  unint64_t v602 = v612;
                  unint64_t v462 = *((void *)&v612 + 1) + v612;
                }
                int v404 = 0;
                (*(void **)((char *)v399 + ((v462 >> 6) & 0x3FFFFFFFFFFFFF8)))[v462 & 0x1FF] = v460;
                *((void *)&v612 + 1) = ++v402;
                unint64_t v590 = v598;
                v400 = v609;
                uint64_t v596 = v401;
                uint64_t v403 = v401;
LABEL_158:
                uint64_t v604 = v402;
                goto LABEL_159;
              }
            }
            else
            {
              if (v593 == v609) {
                uint64_t v453 = 0;
              }
              else {
                uint64_t v453 = (((char *)v593 - (char *)v609) << 6) - 1;
              }
              unint64_t v429 = v401 + v598;
              if (v453 == v401 + v598)
              {
                sub_1C4A6C788(v613);
                v430 = (void **)v613[1];
                v593 = (void **)v614;
                uint64_t v401 = *((void *)&v615 + 1);
                unint64_t v598 = v615;
                unint64_t v429 = *((void *)&v615 + 1) + v615;
                v427 = @"*MISSING*";
                goto LABEL_152;
              }
              v427 = @"*MISSING*";
            }
            v430 = v609;
            goto LABEL_152;
          }
          if (!objc_msgSend_isEqualToString_(v410, v415, @"}", v417, v418, v419))
          {
            v454 = v584;
            if (v402) {
              v454 = (void *)(*(void **)((char *)v399 + (((v402 + v602 - 1) >> 6) & 0x3FFFFFFFFFFFFF8)))[(v402 + v602 - 1) & 0x1FF];
            }
            id v455 = v454;
            objc_msgSend_addObject_(v455, v456, (uint64_t)v410, v457, v458, v459);

            int v404 = 0;
            goto LABEL_158;
          }
          if (v596)
          {
            unint64_t v431 = v596 + v590 - 1;
            uint64_t v432 = (v431 >> 6) & 0x3FFFFFFFFFFFFF8;
            uint64_t v433 = 8 * (v431 & 0x1FF);
            id v587 = *(id *)(*(char **)((char *)v400 + v432) + v433);
            uint64_t v604 = v402 - 1;
            unint64_t v434 = v402 - 1 + v602;
            unint64_t v435 = v434 >> 9;
            uint64_t v436 = v434 & 0x1FF;
            id v581 = *((id *)v399[v434 >> 9] + v436);

            uint64_t v437 = (((char *)v593 - (char *)v400) << 6) - 1;
            if (v593 == v400) {
              uint64_t v437 = 0;
            }
            uint64_t v596 = v401 - 1;
            *((void *)&v615 + 1) = v401 - 1;
            if (v437 - (v401 + v590) + 1 >= 0x400)
            {
              operator delete(*--v593);
              *(void *)&long long v614 = v593;
            }

            uint64_t v438 = (((char *)v606 - (char *)v399) << 6) - 1;
            *((void *)&v612 + 1) = v402 - 1;
            if (v606 == v399) {
              uint64_t v438 = 0;
            }
            if (v438 - (v402 + v602) + 1 >= 0x400)
            {
              operator delete(*--v606);
              *(void *)&long long v611 = v606;
            }
            v439 = v584;
            if (v402 != 1) {
              v439 = (void *)(*(void **)((char *)v399 + (((v402 + v602 - 2) >> 6) & 0x3FFFFFFFFFFFFF8)))[(v402 + v602 - 2) & 0x1FF];
            }
            id v440 = v439;
            if (objc_msgSend_isEqualToString_(v587, v441, @"*MISSING*", v442, v443, v444))
            {
              objc_msgSend_addObjectsFromArray_(v440, v445, (uint64_t)v581, v446, v447, v448);
            }
            else
            {
              objc_msgSend_addObject_(v440, v445, @"{", v446, v447, v448);
              objc_msgSend_addObjectsFromArray_(v440, v463, (uint64_t)v581, v464, v465, v466);
              objc_msgSend_addObject_(v440, v467, @"}", v468, v469, v470);
            }
            if (objc_msgSend_isEqualToString_(v587, v449, @"\\frac", v450, v451, v452))
            {
              if (v405 != objc_msgSend_count(v599, v471, v472, v473, v474, v475) - 1)
              {
                unint64_t v480 = v405 + 1;
                v481 = objc_msgSend_objectAtIndexedSubscript_(v599, v476, v405 + 1, v477, v478, v479);
                char v486 = objc_msgSend_isEqualToString_(v481, v482, @"{", v483, v484, v485);

                if ((v486 & 1) == 0)
                {
                  objc_msgSend_addObject_(v440, v487, @"{", v488, v489, v490);
                  v495 = objc_msgSend_objectAtIndexedSubscript_(v599, v491, v405 + 1, v492, v493, v494);
                  objc_msgSend_addObject_(v440, v496, (uint64_t)v495, v497, v498, v499);

                  objc_msgSend_addObject_(v440, v500, @"}", v501, v502, v503);
                  unint64_t v405 = v480;
                }
              }

              int v404 = 1;
            }
            else
            {

              int v404 = 0;
            }
            uint64_t v403 = --v401;
            uint64_t v402 = v604;
          }
          else
          {
            uint64_t v596 = 0;
            uint64_t v403 = 0;
            int v404 = 0;
          }
LABEL_159:

          ++v405;
        }
        id v504 = v584;

        v509 = objc_msgSend_componentsJoinedByString_(v504, v505, @" ", v506, v507, v508);
        objc_msgSend_addObject_(v559, v510, (uint64_t)v509, v511, v512, v513);

        v514 = v606;
        v515 = v606;
        unint64_t v516 = (char *)v606 - (char *)v399;
        if (v606 == v399
          || (v517 = &v399[v602 >> 9],
              v518 = (id *)((char *)*v517 + 8 * (v602 & 0x1FF)),
              uint64_t v519 = *(uint64_t *)((char *)v399 + (((v604 + v602) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * ((v604 + v602) & 0x1FF),
              v515 = v399,
              v518 == (id *)v519))
        {
          if ((unint64_t)((char *)v606 - (char *)v515) < 0x11) {
            goto LABEL_179;
          }
          do
          {
LABEL_177:
            operator delete(*v515);
            __p[1] = ++v399;
            v516 -= 8;
            v515 = v399;
          }
          while (v516 > 0x10);
        }
        else
        {
          do
          {

            if ((char *)v518 - (unsigned char *)*v517 == 4096)
            {
              v520 = (id *)v517[1];
              ++v517;
              v518 = v520;
            }
            v514 = v606;
          }
          while (v518 != (id *)v519);
          v515 = v399;
          if ((unint64_t)((char *)v606 - (char *)v399) >= 0x11) {
            goto LABEL_177;
          }
LABEL_179:
          v399 = v515;
        }
        while (v399 != v514)
        {
          v521 = *v399++;
          operator delete(v521);
        }
        if (__p[0]) {
          operator delete(__p[0]);
        }
        v522 = v593;
        unint64_t v523 = (char *)v593 - (char *)v400;
        if (v593 == v400
          || (v524 = &v400[v590 >> 9],
              v525 = (id *)((char *)*v524 + 8 * (v590 & 0x1FF)),
              uint64_t v526 = *(uint64_t *)((char *)v400 + (((v403 + v590) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * ((v403 + v590) & 0x1FF),
              v522 = v400,
              v525 == (id *)v526))
        {
          v527 = v593;
          if ((unint64_t)((char *)v593 - (char *)v522) < 0x11) {
            goto LABEL_194;
          }
          do
          {
LABEL_192:
            operator delete(*v522);
            v613[1] = ++v400;
            v523 -= 8;
            v522 = v400;
          }
          while (v523 > 0x10);
        }
        else
        {
          do
          {

            if ((char *)v525 - (unsigned char *)*v524 == 4096)
            {
              v528 = (id *)v524[1];
              ++v524;
              v525 = v528;
            }
          }
          while (v525 != (id *)v526);
          v522 = v400;
          v527 = v593;
          if ((unint64_t)((char *)v593 - (char *)v400) >= 0x11) {
            goto LABEL_192;
          }
LABEL_194:
          v400 = v522;
        }
        while (v400 != v527)
        {
          v529 = *v400++;
          operator delete(v529);
        }
        if (v613[0]) {
          operator delete(v613[0]);
        }

        v530 = (void **)v620[1];
        v531 = (void **)v621;
        v532 = (void **)v620[1];
        unint64_t v533 = v621 - (unint64_t)v620[1];
        if ((void *)v621 == v620[1]
          || (v534 = (char *)v620[1] + 8 * ((unint64_t)v622 >> 9),
              v535 = (id *)(*v534 + 8 * (v622 & 0x1FF)),
              uint64_t v536 = *(void *)((char *)v620[1] + (((*((void *)&v622 + 1) + (void)v622) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * ((*((void *)&v622 + 1) + v622) & 0x1FF),
              v532 = (void **)v621,
              v535 == (id *)v536))
        {
          if ((unint64_t)((char *)v532 - (char *)v620[1]) < 0x11) {
            goto LABEL_209;
          }
          do
          {
LABEL_207:
            v538 = *v530++;
            operator delete(v538);
            v533 -= 8;
          }
          while (v533 > 0x10);
        }
        else
        {
          do
          {

            if ((id *)((char *)v535 - *v534) == (id *)4096)
            {
              v537 = (id *)v534[1];
              ++v534;
              v535 = v537;
            }
          }
          while (v535 != (id *)v536);
          v532 = v531;
          if ((unint64_t)((char *)v531 - (char *)v530) >= 0x11) {
            goto LABEL_207;
          }
LABEL_209:
          v531 = v532;
        }
        while (v530 != v531)
        {
          v539 = *v530++;
          operator delete(v539);
        }
        if (v620[0]) {
          operator delete(v620[0]);
        }
        v540 = *(void ***)&buf[8];
        v541 = *(void ***)&buf[16];
        v542 = *(void ***)&buf[8];
        unint64_t v543 = *(void *)&buf[16] - *(void *)&buf[8];
        if (*(void *)&buf[16] == *(void *)&buf[8]
          || (v544 = (void *)(*(void *)&buf[8] + 8 * ((unint64_t)v629 >> 9)),
              v545 = (id *)(*v544 + 8 * (v629 & 0x1FF)),
              uint64_t v546 = *(void *)(*(void *)&buf[8]
                               + (((*((void *)&v629 + 1) + (void)v629) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * ((*((void *)&v629 + 1) + v629) & 0x1FF),
              v542 = *(void ***)&buf[16],
              v545 == (id *)v546))
        {
          if ((unint64_t)v542 - *(void *)&buf[8] < 0x11) {
            goto LABEL_224;
          }
          do
          {
LABEL_222:
            v548 = *v540++;
            operator delete(v548);
            v543 -= 8;
          }
          while (v543 > 0x10);
        }
        else
        {
          do
          {

            if ((id *)((char *)v545 - *v544) == (id *)4096)
            {
              v547 = (id *)v544[1];
              ++v544;
              v545 = v547;
            }
          }
          while (v545 != (id *)v546);
          v542 = v541;
          if ((unint64_t)((char *)v541 - (char *)v540) >= 0x11) {
            goto LABEL_222;
          }
LABEL_224:
          v541 = v542;
        }
        while (v540 != v541)
        {
          v549 = *v540++;
          operator delete(v549);
        }
        if (*(void *)buf) {
          operator delete(*(void **)buf);
        }
      }
      uint64_t v560 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v623, (uint64_t)v630, 16, v29);
    }
    while (v560);
  }

  v555 = objc_msgSend_copy(v559, v550, v551, v552, v553, v554);
  return v555;
}

+ (id)textTranscriptionForLatex:(id)a3
{
  uint64_t v298 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1EA3C9E38 != -1) {
    dispatch_once(&qword_1EA3C9E38, &unk_1F2010B00);
  }
  long long v294 = 0u;
  long long v295 = 0u;
  long long v292 = 0u;
  long long v293 = 0u;
  id v4 = (id)qword_1EA3C9E48;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v292, (uint64_t)v297, 16, v6);
  if (v11)
  {
    uint64_t v12 = *(void *)v293;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v3;
      do
      {
        if (*(void *)v293 != v12) {
          objc_enumerationMutation(v4);
        }
        uint64_t v15 = *(void *)(*((void *)&v292 + 1) + 8 * v13);
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C9E48, v7, v15, v8, v9, v10);
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v14, v17, v15, (uint64_t)v16, v18, v19);
        id v3 = (id)objc_claimAutoreleasedReturnValue();

        ++v13;
        uint64_t v14 = v3;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v292, (uint64_t)v297, 16, v10);
    }
    while (v11);
  }

  uint64_t v25 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v20, v21, v22, v23, v24);
  v277 = objc_msgSend_componentsSeparatedByCharactersInSet_(v3, v26, (uint64_t)v25, v27, v28, v29);

  uint64_t v280 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v30, v31, v32, v33, v34);
  long long v290 = 0u;
  long long v291 = 0u;
  long long v288 = 0u;
  long long v289 = 0u;
  long long v286 = 0u;
  long long v287 = 0u;
  long long v282 = 0u;
  long long v283 = 0u;
  long long v284 = 0u;
  long long v285 = 0u;
  obuint64_t j = v277;
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v282, (uint64_t)v296, 16, v36);
  if (v41)
  {
    uint64_t v42 = *(void *)v283;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v283 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void **)(*((void *)&v282 + 1) + 8 * i);
        if (objc_msgSend_containsObject_((void *)qword_1EA3C9E40, v37, (uint64_t)v44, v38, v39, v40, v277))
        {
          uint64_t v50 = *((void *)&v289 + 1);
          uint64_t v51 = v290;
          uint64_t v52 = (((void)v290 - *((void *)&v289 + 1)) << 6) - 1;
          if ((void)v290 == *((void *)&v289 + 1)) {
            uint64_t v52 = 0;
          }
          if (v52 == *((void *)&v291 + 1) + (void)v291)
          {
            sub_1C4A6C788(&v289);
            uint64_t v50 = *((void *)&v289 + 1);
            uint64_t v51 = v290;
          }
          if (v51 == v50) {
            uint64_t v53 = 0;
          }
          else {
            uint64_t v53 = (void *)(*(void *)(v50 + (((*((void *)&v291 + 1) + (void)v291) >> 6) & 0x3FFFFFFFFFFFFF8))
          }
                           + 8 * ((*((void *)&v291 + 1) + v291) & 0x1FF));
          *uint64_t v53 = v44;
          ++*((void *)&v291 + 1);
          uint64_t v106 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v101, v102, v103, v104, v105);
          uint64_t v107 = *((void *)&v286 + 1);
          uint64_t v108 = (((void)v287 - *((void *)&v286 + 1)) << 6) - 1;
          if ((void)v287 == *((void *)&v286 + 1)) {
            uint64_t v108 = 0;
          }
          unint64_t v109 = *((void *)&v288 + 1) + v288;
          if (v108 == *((void *)&v288 + 1) + (void)v288)
          {
            sub_1C4A6CE64(&v286);
            uint64_t v107 = *((void *)&v286 + 1);
            unint64_t v109 = *((void *)&v288 + 1) + v288;
          }
          *(void *)(*(void *)(v107 + ((v109 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v109 & 0x1FF)) = v106;
          ++*((void *)&v288 + 1);
        }
        else
        {
          if (*((void *)&v291 + 1))
          {
            if ((objc_msgSend_isEqualToString_(v44, v45, @"}", v47, v48, v49) & 1) == 0
              && !objc_msgSend_isEqualToString_(v44, v54, @"]", v55, v56, v57))
            {
              id v132 = objc_retain(*(id *)(*(void *)(*((void *)&v286 + 1)
                                                   + (((unint64_t)(*((void *)&v288 + 1) + v288 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                                       + 8 * ((*((void *)&v288 + 1) + v288 - 1) & 0x1FF)));
              uint64_t v133 = symbolTextTransliteration((NSString *)v44);
              objc_msgSend_addObject_(v132, v134, (uint64_t)v133, v135, v136, v137);

              continue;
            }
            uint64_t v58 = *((void *)&v289 + 1);
            unint64_t v59 = *((void *)&v291 + 1) + v291 - 1;
            uint64_t v60 = (v59 >> 6) & 0x3FFFFFFFFFFFFF8;
            uint64_t v61 = 8 * (v59 & 0x1FF);
            id v62 = *(id *)(*(void *)(*((void *)&v289 + 1) + v60) + v61);

            uint64_t v63 = (((void)v290 - *((void *)&v289 + 1)) << 6) - 1;
            uint64_t v64 = *((void *)&v291 + 1);
            if ((void)v290 == *((void *)&v289 + 1)) {
              uint64_t v63 = 0;
            }
            --*((void *)&v291 + 1);
            if ((unint64_t)(v63 - (v64 + v291) + 1) >= 0x400)
            {
              operator delete(*(void **)(v290 - 8));
              *(void *)&long long v290 = v290 - 8;
            }
            uint64_t v65 = *((void *)&v286 + 1);
            unint64_t v66 = *((void *)&v288 + 1) + v288 - 1;
            uint64_t v67 = (v66 >> 6) & 0x3FFFFFFFFFFFFF8;
            uint64_t v68 = 8 * (v66 & 0x1FF);
            id v69 = *(id *)(*(void *)(*((void *)&v286 + 1) + v67) + v68);

            uint64_t v70 = (((void)v287 - *((void *)&v286 + 1)) << 6) - 1;
            uint64_t v71 = *((void *)&v288 + 1);
            if ((void)v287 == *((void *)&v286 + 1)) {
              uint64_t v70 = 0;
            }
            uint64_t v72 = --*((void *)&v288 + 1);
            if ((unint64_t)(v70 - (v71 + v288) + 1) >= 0x400)
            {
              operator delete(*(void **)(v287 - 8));
              uint64_t v72 = *((void *)&v288 + 1);
              *(void *)&long long v287 = v287 - 8;
            }
            uint64_t v73 = v280;
            if (v72) {
              uint64_t v73 = *(void **)(*(void *)(*((void *)&v286 + 1)
            }
                                         + (((unint64_t)(v72 + v288 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                             + 8 * ((v72 + v288 - 1) & 0x1FF));
            id v74 = v73;
            id v79 = v62;
            if (qword_1EA3C9DA8 != -1) {
              dispatch_once(&qword_1EA3C9DA8, &unk_1F20130F0);
            }
            uint64_t v80 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C9DB0, v75, (uint64_t)v79, v76, v77, v78);
            uint64_t v85 = v80;
            if (v80)
            {
              id v86 = v80;
            }
            else if (objc_msgSend_hasPrefix_(v79, v81, @"\\text{", v82, v83, v84) {
                   && objc_msgSend_hasSuffix_(v79, v122, @"}", v123, v124, v125))
            }
            {
              uint64_t v128 = objc_msgSend_length(v79, v122, v126, v127, v124, v125);
              objc_msgSend_substringWithRange_(v79, v129, 6, v128 - 7, v130, v131);
              id v86 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v79, v122, @"\\"", (uint64_t)&stru_1F20141C8, v124, v125);
              id v86 = (id)objc_claimAutoreleasedReturnValue();
            }
            uint64_t v148 = v86;

            objc_msgSend_addObject_(v74, v149, (uint64_t)v148, v150, v151, v152);
            id v161 = @"");
            if (objc_msgSend_isEqualToString_(v44, v153, @"]", v154, v155, v156))
            {
              if (objc_msgSend_isEqualToString_(v79, v157, @"\\sqrt", v158, v159, v160)) {
                id v161 = @"");
              }
              else {
                id v161 = &stru_1F20141C8;
              }
            }
            if (objc_msgSend_isEqualToString_(v79, v157, @",", v158, v159, v160)) {
              v162 = &stru_1F20141C8;
            }
            else {
              v162 = CFSTR("(");
            }
            if (sub_1C4A63BDC((uint64_t)a1, v69))
            {
              objc_msgSend_addObject_(v74, v163, (uint64_t)v162, v164, v165, v166);
              goto LABEL_71;
            }
            if (objc_msgSend_isEqualToString_(v79, v163, @"\\sqrt", v164, v165, v166)
              && objc_msgSend_isEqualToString_(v44, v179, @"]", v180, v181, v182))
            {
              objc_msgSend_addObject_(v74, v179, (uint64_t)v162, v180, v181, v182);
              goto LABEL_77;
            }
            if (objc_msgSend_isEqualToString_(v79, v179, @",", v180, v181, v182)
              && objc_msgSend_isEqualToString_(v44, v167, @"}", v168, v169, v170))
            {
LABEL_71:
              objc_msgSend_addObjectsFromArray_(v74, v167, (uint64_t)v69, v168, v169, v170);
              objc_msgSend_addObject_(v74, v171, (uint64_t)v161, v172, v173, v174);
            }
            else
            {
LABEL_77:
              objc_msgSend_addObjectsFromArray_(v74, v167, (uint64_t)v69, v168, v169, v170);
            }
            if (objc_msgSend_isEqualToString_(v79, v175, @"\\frac", v176, v177, v178))
            {
              uint64_t v188 = *((void *)&v289 + 1);
              uint64_t v189 = (((void)v290 - *((void *)&v289 + 1)) << 6) - 1;
              if ((void)v290 == *((void *)&v289 + 1)) {
                uint64_t v189 = 0;
              }
              unint64_t v190 = *((void *)&v291 + 1) + v291;
              if (v189 == *((void *)&v291 + 1) + (void)v291)
              {
                sub_1C4A6C788(&v289);
                uint64_t v188 = *((void *)&v289 + 1);
                unint64_t v190 = *((void *)&v291 + 1) + v291;
              }
              *(void *)(*(void *)(v188 + ((v190 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v190 & 0x1FF)) = @"/";
              ++*((void *)&v291 + 1);
              uint64_t v191 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v183, v184, v185, v186, v187);
              uint64_t v192 = *((void *)&v286 + 1);
              uint64_t v193 = (((void)v287 - *((void *)&v286 + 1)) << 6) - 1;
              if ((void)v287 == *((void *)&v286 + 1)) {
                uint64_t v193 = 0;
              }
              unint64_t v194 = *((void *)&v288 + 1) + v288;
              if (v193 == *((void *)&v288 + 1) + (void)v288) {
                goto LABEL_86;
              }
              goto LABEL_87;
            }
            if (objc_msgSend_isEqualToString_(v79, v183, @"\\sqrt", v185, v186, v187)
              && objc_msgSend_isEqualToString_(v44, v195, @"]", v196, v197, v198))
            {
              uint64_t v204 = *((void *)&v289 + 1);
              uint64_t v205 = (((void)v290 - *((void *)&v289 + 1)) << 6) - 1;
              if ((void)v290 == *((void *)&v289 + 1)) {
                uint64_t v205 = 0;
              }
              unint64_t v206 = *((void *)&v291 + 1) + v291;
              if (v205 == *((void *)&v291 + 1) + (void)v291)
              {
                sub_1C4A6C788(&v289);
                uint64_t v204 = *((void *)&v289 + 1);
                unint64_t v206 = *((void *)&v291 + 1) + v291;
              }
              *(void *)(*(void *)(v204 + ((v206 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v206 & 0x1FF)) = @",";
              ++*((void *)&v291 + 1);
              uint64_t v191 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v199, v200, v201, v202, v203);
              uint64_t v192 = *((void *)&v286 + 1);
              uint64_t v207 = (((void)v287 - *((void *)&v286 + 1)) << 6) - 1;
              if ((void)v287 == *((void *)&v286 + 1)) {
                uint64_t v207 = 0;
              }
              unint64_t v194 = *((void *)&v288 + 1) + v288;
              if (v207 == *((void *)&v288 + 1) + (void)v288)
              {
LABEL_86:
                sub_1C4A6CE64(&v286);
                uint64_t v192 = *((void *)&v286 + 1);
                unint64_t v194 = *((void *)&v288 + 1) + v288;
              }
LABEL_87:
              *(void *)(*(void *)(v192 + ((v194 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v194 & 0x1FF)) = v191;
              ++*((void *)&v288 + 1);
            }

            continue;
          }
          uint64_t v87 = objc_msgSend_lastObject(v280, v45, v46, v47, v48, v49);
          if (objc_msgSend_isEqualToString_(v87, v88, @"hline", v89, v90, v91))
          {
            int isEqualToString = objc_msgSend_isEqualToString_(v44, v92, @"&", v93, v94, v95);

            if (isEqualToString) {
              objc_msgSend_addObject_(v280, v97, @"\n", v98, v99, v100);
            }
          }
          else
          {
          }
          id v114 = v44;
          if (qword_1EA3C9DA8 != -1) {
            dispatch_once(&qword_1EA3C9DA8, &unk_1F20130F0);
          }
          unint64_t v115 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C9DB0, v110, (uint64_t)v114, v111, v112, v113);
          id v120 = v115;
          if (v115)
          {
            id v121 = v115;
          }
          else if (objc_msgSend_hasPrefix_(v114, v116, @"\\text{", v117, v118, v119) {
                 && objc_msgSend_hasSuffix_(v114, v138, @"}", v139, v140, v141))
          }
          {
            uint64_t v144 = objc_msgSend_length(v114, v138, v142, v143, v140, v141);
            objc_msgSend_substringWithRange_(v114, v145, 6, v144 - 7, v146, v147);
            id v121 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v114, v138, @"\\"", (uint64_t)&stru_1F20141C8, v140, v141);
            id v121 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v208 = v121;

          objc_msgSend_addObject_(v280, v209, (uint64_t)v208, v210, v211, v212);
        }
      }
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v282, (uint64_t)v296, 16, v40);
    }
    while (v41);
  }

  if (*((void *)&v291 + 1) | *((void *)&v288 + 1))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v217 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v217, OS_LOG_TYPE_ERROR, "Invalid latex encountered during text transliteration.", buf, 2u);
    }

    for (uint64_t j = *((void *)&v291 + 1); *((void *)&v291 + 1); uint64_t j = *((void *)&v291 + 1))
    {
      uint64_t v219 = *((void *)&v289 + 1);
      unint64_t v220 = j + v291 - 1;
      uint64_t v221 = (v220 >> 6) & 0x3FFFFFFFFFFFFF8;
      uint64_t v222 = 8 * (v220 & 0x1FF);
      uint64_t v223 = (NSString *)*(id *)(*(void *)(*((void *)&v289 + 1) + v221) + v222);

      uint64_t v224 = *((void *)&v291 + 1);
      if ((void)v290 == *((void *)&v289 + 1)) {
        uint64_t v225 = 0;
      }
      else {
        uint64_t v225 = (((void)v290 - *((void *)&v289 + 1)) << 6) - 1;
      }
      --*((void *)&v291 + 1);
      if ((unint64_t)(v225 - (v224 + v291) + 1) >= 0x400)
      {
        operator delete(*(void **)(v290 - 8));
        *(void *)&long long v290 = v290 - 8;
      }
      uint64_t v226 = *((void *)&v286 + 1);
      unint64_t v227 = *((void *)&v288 + 1) + v288 - 1;
      uint64_t v228 = (v227 >> 6) & 0x3FFFFFFFFFFFFF8;
      uint64_t v229 = 8 * (v227 & 0x1FF);
      id v230 = *(id *)(*(void *)(*((void *)&v286 + 1) + v228) + v229);

      uint64_t v231 = (((void)v287 - *((void *)&v286 + 1)) << 6) - 1;
      uint64_t v232 = *((void *)&v288 + 1);
      if ((void)v287 == *((void *)&v286 + 1)) {
        uint64_t v231 = 0;
      }
      --*((void *)&v288 + 1);
      if ((unint64_t)(v231 - (v232 + v288) + 1) >= 0x400)
      {
        operator delete(*(void **)(v287 - 8));
        *(void *)&long long v287 = v287 - 8;
      }
      uint64_t v233 = symbolTextTransliteration(v223);
      objc_msgSend_addObject_(v280, v234, (uint64_t)v233, v235, v236, v237);

      if (sub_1C4A63BDC((uint64_t)a1, v230))
      {
        objc_msgSend_addObject_(v280, v238, @"("), v239, v240, v241;
        objc_msgSend_addObjectsFromArray_(v280, v242, (uint64_t)v230, v243, v244, v245);
        objc_msgSend_addObject_(v280, v246, @""), v247, v248, v249);
      }
      else
      {
        objc_msgSend_addObjectsFromArray_(v280, v238, (uint64_t)v230, v239, v240, v241);
      }
      if (*((void *)&v291 + 1))
      {
        uint64_t v260 = objc_msgSend_copy(v280, v250, v251, v252, v253, v254);
        uint64_t v261 = *((void *)&v286 + 1);
        uint64_t v262 = (((void)v287 - *((void *)&v286 + 1)) << 6) - 1;
        if ((void)v287 == *((void *)&v286 + 1)) {
          uint64_t v262 = 0;
        }
        unint64_t v263 = *((void *)&v288 + 1) + v288;
        if (v262 == *((void *)&v288 + 1) + (void)v288)
        {
          sub_1C4A6CE64(&v286);
          uint64_t v261 = *((void *)&v286 + 1);
          unint64_t v263 = *((void *)&v288 + 1) + v288;
        }
        *(void *)(*(void *)(v261 + ((v263 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v263 & 0x1FF)) = v260;
        ++*((void *)&v288 + 1);
        objc_msgSend_removeAllObjects(v280, v255, v256, v257, v258, v259, v277);
      }
      else if (*((void *)&v288 + 1))
      {
        objc_msgSend_addObjectsFromArray_(v280, v250, *(void *)(*(void *)(*((void *)&v286 + 1)+ (((unint64_t)(*((void *)&v288 + 1) + v288 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * ((*((void *)&v288 + 1) + v288 - 1) & 0x1FF)), v252, v253, v254);
        objc_release(*(id *)(*(void *)(*((void *)&v286 + 1)
                                       + (((unint64_t)(*((void *)&v288 + 1) + v288 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                           + 8 * ((*((void *)&v288 + 1) + v288 - 1) & 0x1FF)));
        uint64_t v264 = (((void)v287 - *((void *)&v286 + 1)) << 6) - 1;
        uint64_t v265 = *((void *)&v288 + 1);
        if ((void)v287 == *((void *)&v286 + 1)) {
          uint64_t v264 = 0;
        }
        --*((void *)&v288 + 1);
        if ((unint64_t)(v264 - (v265 + v288) + 1) >= 0x400)
        {
          operator delete(*(void **)(v287 - 8));
          *(void *)&long long v287 = v287 - 8;
        }
      }
    }
    if (*((void *)&v288 + 1))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v266 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v266, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v266, OS_LOG_TYPE_FAULT, "Args stack not empty at the end of text transliteration", buf, 2u);
      }
    }
  }
  uint64_t v267 = objc_msgSend_componentsJoinedByString_(v280, v213, (uint64_t)&stru_1F20141C8, v214, v215, v216, v277);
  uint64_t v271 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v267, v268, @"\n", (uint64_t)&stru_1F20141C8, v269, v270);

  uint64_t v275 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v271, v272, @"hline", @"=", v273, v274);

  sub_1C494685C((uint64_t)&v286);
  sub_1C494685C((uint64_t)&v289);

  return v275;
}

+ (id)simplifiedTextTranscriptionForLatex:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (qword_1EA3C9E50 != -1) {
    dispatch_once(&qword_1EA3C9E50, &unk_1F2013808);
  }
  uint64_t v8 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v4, @"\\color{orange}{+}", @"+", v5, v6);

  objc_msgSend_textTranscriptionForLatex_(a1, v9, (uint64_t)v8, v10, v11, v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = (id)qword_1EA3C9E58;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v36, 16, v16);
  uint64_t v22 = v13;
  if (v21)
  {
    uint64_t v23 = *(void *)v33;
    uint64_t v22 = v13;
    do
    {
      uint64_t v24 = 0;
      uint64_t v25 = v22;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v14);
        }
        uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * v24);
        uint64_t v27 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C9E58, v17, v26, v18, v19, v20, (void)v32);
        uint64_t v22 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v25, v28, v26, (uint64_t)v27, v29, v30);

        ++v24;
        uint64_t v25 = v22;
      }
      while (v21 != v24);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v32, (uint64_t)v36, 16, v20);
    }
    while (v21);
  }

  return v22;
}

+ (BOOL)isTrivialTextTranscriptionAvailableForLatex:(id)a3
{
  id v7 = a3;
  if (qword_1EA3C9D58 != -1) {
    dispatch_once(&qword_1EA3C9D58, &unk_1F2013828);
  }
  uint64_t v8 = objc_msgSend_componentsSeparatedByString_(v7, v3, @" ", v4, v5, v6);
  BOOL v13 = objc_msgSend_indexOfObjectPassingTest_(v8, v9, (uint64_t)&unk_1F2013848, v10, v11, v12) == 0x7FFFFFFFFFFFFFFFLL;

  return v13;
}

+ (BOOL)isTextTranscriptionInMathAlphabet:(id)a3
{
  id v7 = a3;
  if (qword_1EA3C9E60 != -1) {
    dispatch_once(&qword_1EA3C9E60, &unk_1F2013868);
  }
  uint64_t v8 = objc_msgSend_stringByTrimmingCharactersInSet_(v7, v3, qword_1EA3C9E68, v4, v5, v6);
  BOOL v14 = objc_msgSend_length(v8, v9, v10, v11, v12, v13) == 0;

  return v14;
}

+ (BOOL)isPartialMathUnitConversionPatternForTextTranscription:(id)a3 locales:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_hasSuffix_(v5, v7, @"=", v8, v9, v10))
  {
    BOOL v14 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v11, @"=", (uint64_t)&stru_1F20141C8, v12, v13);

    uint64_t v19 = objc_msgSend_componentsSeparatedByString_(v14, v15, @" ", v16, v17, v18);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4A65F5C;
    block[3] = &unk_1E64E0D48;
    id v45 = v6;
    if (qword_1EA3C9E70 != -1) {
      dispatch_once(&qword_1EA3C9E70, block);
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v20 = v19;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v40, (uint64_t)v46, 16, v22);
    if (v28)
    {
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v20);
          }
          uint64_t v31 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          long long v32 = objc_msgSend_root((void *)qword_1EA3C9E78, v23, v24, v25, v26, v27, (void)v40);
          uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v32, v33, v31, v34, v35, v36);

          if (v37)
          {
            char isMatch = objc_msgSend_isMatch(v37, v23, v24, v25, v26, v27);

            if (isMatch)
            {
              LOBYTE(v28) = 1;
              goto LABEL_16;
            }
          }
        }
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v40, (uint64_t)v46, 16, v27);
      }
      while (v28);
    }
LABEL_16:

    id v5 = v14;
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  return v28;
}

+ (BOOL)isMathUnitConversionPatternForTextTranscription:(id)a3 locales:(id)a4
{
  id v5 = a3;
  if (objc_msgSend_isPartialMathUnitConversionPatternForTextTranscription_locales_(CHTokenizedMathResult, v6, (uint64_t)v5, (uint64_t)a4, v7, v8))
  {
    objc_msgSend_ch_currencyCharSet(MEMORY[0x1E4F28B88], v9, v10, v11, v12, v13);
    uint64_t v18 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    if (qword_1EA3C9E80 != -1) {
      dispatch_once(&qword_1EA3C9E80, &unk_1F2013888);
    }
    uint64_t v19 = objc_msgSend_componentsSeparatedByString_(v5, v14, @" ", v15, v16, v17);
    uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0, v21, v22, v23);
    if (isStringEntirelyFromSet((NSString *)v24, v18)
      && (unint64_t)objc_msgSend_count(v19, v25, v26, v27, v28, v29) >= 2)
    {
      uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v19, v25, 1, v27, v28, v29);

      uint64_t v24 = (void *)v30;
    }
    uint64_t v31 = (void *)qword_1EA3C9E88;
    uint64_t v32 = objc_msgSend_length(v24, v25, v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_firstMatchInString_options_range_(v31, v33, (uint64_t)v24, 0, 0, v32);
    long long v40 = v34;
    BOOL v51 = 0;
    if (v34)
    {
      if (!objc_msgSend_range(v34, v35, v36, v37, v38, v39))
      {
        objc_msgSend_range(v40, v41, v42, v43, v44, v45);
        if ((unint64_t)v50 <= objc_msgSend_length(v24, v50, v46, v47, v48, v49)) {
          BOOL v51 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v51 = 0;
  }

  return v51;
}

+ (BOOL)hasPartialRangeDataDetectorEntries:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7, v8))
  {
    BOOL v14 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v9, v10, v11, v12, v13);
    uint64_t v19 = objc_msgSend_stringByTrimmingCharactersInSet_(v3, v15, (uint64_t)v14, v16, v17, v18);
    uint64_t v24 = objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v20, (uint64_t)v19, v21, v22, v23);

    uint64_t v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
    id v60 = v30;
    BOOL v31 = doesStringContainDataDetectorEntries(v24, &v60);
    id v32 = v60;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v33 = v32;
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v56, (uint64_t)v61, 16, v35);
    if (v41)
    {
      uint64_t v42 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(v33);
          }
          uint64_t v44 = objc_msgSend_rangeValue(*(void **)(*((void *)&v56 + 1) + 8 * i), v36, v37, v38, v39, v40, (void)v56);
          uint64_t v46 = v45;
          uint64_t v51 = objc_msgSend_length(v24, v45, v47, v48, v49, v50);
          if (v44) {
            BOOL v52 = 0;
          }
          else {
            BOOL v52 = v46 == (const char *)v51;
          }
          if (v52)
          {
            char v53 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v56, (uint64_t)v61, 16, v40);
        if (v41) {
          continue;
        }
        break;
      }
    }
    char v53 = 1;
LABEL_15:

    BOOL v54 = v31 & v53;
  }
  else
  {
    BOOL v54 = 0;
  }

  return v54;
}

+ (BOOL)isPatternedTextForTextTranscription:(id)a3 locales:(id)a4
{
  uint64_t v5 = (NSString *)a3;
  id v6 = a4;
  if (objc_msgSend_isVerticalMathEntryWithUnitForTextTranscription_locales_(CHTokenizedMathResult, v7, (uint64_t)v5, (uint64_t)v6, v8, v9))char v10 = 0; {
  else
  }
    char v10 = isStringPatternedText(v5);

  return v10;
}

+ (BOOL)isVerticalMathEntryWithUnitForTextTranscription:(id)a3 locales:(id)a4
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4A668C0;
  block[3] = &unk_1E64E0D48;
  id v12 = v6;
  id v124 = v12;
  if (qword_1EA3C9EA0 != -1) {
    dispatch_once(&qword_1EA3C9EA0, block);
  }
  uint64_t v13 = (void *)qword_1EA3C9E98;
  uint64_t v14 = objc_msgSend_length(v5, v7, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_matchesInString_options_range_(v13, v15, (uint64_t)v5, 0, 0, v14);
  if (objc_msgSend_count(v16, v17, v18, v19, v20, v21)
    && (objc_msgSend_firstObject(v16, v22, v23, v24, v25, v26),
        uint64_t v27 = objc_claimAutoreleasedReturnValue(),
        BOOL v33 = objc_msgSend_range(v27, v28, v29, v30, v31, v32) == 0,
        v27,
        v33))
  {
    uint64_t v40 = objc_msgSend_firstObject(v16, v34, v35, v36, v37, v38);
    objc_msgSend_range(v40, v41, v42, v43, v44, v45);
    uint64_t v47 = v46;

    BOOL v52 = objc_msgSend_substringFromIndex_(v5, v48, v47, v49, v50, v51);
    long long v58 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v53, v54, v55, v56, v57);
    uint64_t v118 = objc_msgSend_stringByTrimmingCharactersInSet_(v52, v59, (uint64_t)v58, v60, v61, v62);

    uint64_t v68 = objc_msgSend_root((void *)qword_1EA3C9E90, v63, v64, v65, v66, v67);
    uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(v68, v69, (uint64_t)v118, v70, v71, v72);

    if (!objc_msgSend_length(v118, v74, v75, v76, v77, v78)
      || v73 && (objc_msgSend_isMatch(v73, v79, v80, v81, v82, v83) & 1) != 0
      || (objc_msgSend_containsString_(@"$€£¥¢₺₴₽₩", v79, (uint64_t)v118, v81, v82, v83) & 1) != 0)
    {
      BOOL v39 = 1;
    }
    else
    {
      uint64_t v116 = objc_msgSend_componentsSeparatedByString_(v118, v84, @"/", v85, v86, v87);
      if (objc_msgSend_count(v116, v88, v89, v90, v91, v92) == 2)
      {
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        obuint64_t j = v116;
        uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v93, (uint64_t)&v119, (uint64_t)v125, 16, v94);
        if (v100)
        {
          uint64_t v101 = *(void *)v120;
          while (2)
          {
            for (uint64_t i = 0; i != v100; ++i)
            {
              if (*(void *)v120 != v101) {
                objc_enumerationMutation(obj);
              }
              uint64_t v103 = *(void **)(*((void *)&v119 + 1) + 8 * i);
              uint64_t v104 = objc_msgSend_root((void *)qword_1EA3C9E90, v95, v96, v97, v98, v99);
              unint64_t v109 = objc_msgSend_objectForKeyedSubscript_(v104, v105, (uint64_t)v103, v106, v107, v108);

              uint64_t v73 = v109;
              if (objc_msgSend_length(v103, v110, v111, v112, v113, v114)
                && (!v109 || (objc_msgSend_isMatch(v109, v95, v96, v97, v98, v99) & 1) == 0))
              {
                BOOL v39 = 0;
                goto LABEL_26;
              }
            }
            uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v95, (uint64_t)&v119, (uint64_t)v125, 16, v99);
            if (v100) {
              continue;
            }
            break;
          }
        }
        BOOL v39 = 1;
LABEL_26:
      }
      else
      {
        BOOL v39 = 0;
      }
    }
  }
  else
  {
    BOOL v39 = 0;
  }

  return v39;
}

+ (BOOL)doesLatexContainEvaluationTrigger:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend_containsString_(v3, v4, @"=", v5, v6, v7) & 1) != 0
    || (objc_msgSend_containsString_(v3, v8, @"\\hline", v9, v10, v11) & 1) != 0)
  {

    return 1;
  }
  else
  {
    uint64_t v15 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E4F28FD8], v12, @"\\\\frac \\{ .+ \\} \\{ \\}", 0, 0, v13);
    uint64_t v21 = objc_msgSend_length(v3, v16, v17, v18, v19, v20);
    uint64_t v23 = objc_msgSend_matchesInString_options_range_(v15, v22, (uint64_t)v3, 0, 0, v21);
    BOOL v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28) != 0;

    return v29;
  }
}

+ (id)declaredVariableInLatexTranscription:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (qword_1EA3C9EA8 != -1) {
    dispatch_once(&qword_1EA3C9EA8, &unk_1F20138A8);
  }
  uint64_t v9 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v3, v4, v5, v6, v7);
  uint64_t v14 = objc_msgSend_componentsSeparatedByCharactersInSet_(v8, v10, (uint64_t)v9, v11, v12, v13);

  uint64_t v20 = objc_msgSend_string(MEMORY[0x1E4F28E78], v15, v16, v17, v18, v19);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v21 = v14;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v56, (uint64_t)v60, 16, v23);
  if (v29)
  {
    uint64_t v30 = *(void *)v57;
LABEL_5:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v57 != v30) {
        objc_enumerationMutation(v21);
      }
      uint64_t v32 = *(void **)(*((void *)&v56 + 1) + 8 * v31);
      if (objc_msgSend_length(v32, v24, v25, v26, v27, v28, (void)v56) != 1) {
        break;
      }
      uint64_t v38 = (void *)qword_1EA3C9EB0;
      uint64_t v39 = objc_msgSend_characterAtIndex_(v32, v33, 0, v35, v36, v37);
      if (!objc_msgSend_characterIsMember_(v38, v40, v39, v41, v42, v43)) {
        break;
      }
      objc_msgSend_appendString_(v20, v33, (uint64_t)v32, v35, v36, v37);
      if (v29 == ++v31)
      {
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v56, (uint64_t)v60, 16, v28);
        if (v29) {
          goto LABEL_5;
        }
        goto LABEL_16;
      }
    }
    if (!objc_msgSend_length(v20, v33, v34, v35, v36, v37)) {
      goto LABEL_16;
    }
    int isEqualToString = objc_msgSend_isEqualToString_(v32, v44, @"=", v45, v46, v47);

    if (isEqualToString)
    {
      uint64_t v54 = objc_msgSend_copy(v20, v49, v50, v51, v52, v53);
      goto LABEL_18;
    }
  }
  else
  {
LABEL_16:
  }
  uint64_t v54 = 0;
LABEL_18:

  return v54;
}

+ (BOOL)isNonTextCandidateTextTranscription:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v4, @" ", (uint64_t)&stru_1F20141C8, v5, v6);
  unint64_t v13 = objc_msgSend_length(v7, v8, v9, v10, v11, v12);

  if (v13 <= 1)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v14 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v73 = 138739971;
      id v74 = v3;
      _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEBUG, "CHTokenizedMathResult is nontext candidate due to single character transcription: %{sensitive}@", (uint8_t *)&v73, 0xCu);
    }
    goto LABEL_29;
  }
  if (!doesStringContainDataDetectorEntries(v3, 0))
  {
    id v21 = objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v15, v16, v17, v18, v19);
    uint64_t v14 = objc_msgSend_stringByTrimmingCharactersInSet_(v3, v22, (uint64_t)v21, v23, v24, v25);

    uint64_t v29 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v26, @" ", (uint64_t)&stru_1F20141C8, v27, v28);
    unint64_t v35 = objc_msgSend_length(v29, v30, v31, v32, v33, v34);

    BOOL v36 = isStringRepeatedSameCharacter((NSString *)v3);
    BOOL v47 = isStringAllCircleTextPatterns((NSString *)v3, v37, v38, v39, v40, v41)
       || isStringAllCircleTextPatterns((NSString *)&v14->isa, v42, v43, v44, v45, v46);
    BOOL v53 = isStringAllZerosInDigits((NSString *)v3) || isStringAllZerosInDigits((NSString *)&v14->isa);
    BOOL v59 = isStringAllSymbolCharacters((NSString *)v3, v48, v49, v50, v51, v52)
       || isStringAllSymbolCharacters((NSString *)&v14->isa, v54, v55, v56, v57, v58);
    if ((unint64_t)objc_msgSend_length(v3, v54, v55, v56, v57, v58) >= 3
      && (unint64_t)objc_msgSend_length(v14, v60, v61, v62, v63, v64) > 2)
    {
      BOOL v69 = 0;
    }
    else
    {
      uint64_t v65 = objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E4F28B88], v60, v61, v62, v63, v64);
      BOOL v69 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v3, v66, (uint64_t)v65, 0, v67, v68) == 1;
    }
    int v70 = v36 || v47 || v53;
    if (v35 < 2) {
      int v70 = 1;
    }
    if ((v70 | (v69 || v59)) != 1)
    {
      BOOL v20 = 0;
      goto LABEL_30;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v71 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
    {
      int v73 = 138739971;
      id v74 = v3;
      _os_log_impl(&dword_1C492D000, v71, OS_LOG_TYPE_DEBUG, "CHTokenizedMathResult is nontext candidate due to invalid patterns in transcription: %{sensitive}@", (uint8_t *)&v73, 0xCu);
    }

LABEL_29:
    BOOL v20 = 1;
LABEL_30:

    goto LABEL_31;
  }
  BOOL v20 = 0;
LABEL_31:

  return v20;
}

- (void)enumerateTokensInTopTranscriptionPathWithBlock:(id)a3
{
  id v17 = a3;
  uint64_t v9 = objc_msgSend_firstObject(self->_transcriptionPaths, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_tokenColumnCount(self, v10, v11, v12, v13, v14);
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v16, (uint64_t)v9, 0, v15, (uint64_t)v17);
}

- (void)enumerateTokensInPreferredTranscriptionPathWithBlock:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = objc_msgSend_firstObject(self->_transcriptionPaths, v5, v6, v7, v8, v9);
  selectedTranscriptionPathuint64_t Index = self->_selectedTranscriptionPathIndex;
  if (selectedTranscriptionPathIndex
    && objc_msgSend_integerValue(selectedTranscriptionPathIndex, v10, v11, v12, v13, v14))
  {
    uint64_t v22 = objc_msgSend_integerValue(self->_selectedTranscriptionPathIndex, v10, v11, v12, v13, v14);
    if (v22 < 1 || v22 >= (unint64_t)objc_msgSend_count(self->_transcriptionPaths, v17, v18, v19, v20, v21))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v28 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v31 = 134217984;
        uint64_t v32 = v22;
        _os_log_impl(&dword_1C492D000, v28, OS_LOG_TYPE_ERROR, "Invalid selected transcription path idnex %lu. Using top transcription path.", (uint8_t *)&v31, 0xCu);
      }
    }
    else
    {
      uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v23, v22, v24, v25, v26);

      uint64_t v15 = (void *)v27;
    }
  }
  uint64_t v29 = objc_msgSend_tokenColumnCount(self, v10, v11, v12, v13, v14);
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v30, (uint64_t)v15, 0, v29, (uint64_t)v4);
}

- (void)enumerateTokensInTranscriptionPath:(id)a3 columnRange:(_NSRange)a4 tokenProcessingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v90 = a3;
  uint64_t v13 = (void (**)(id, uint64_t, uint64_t, void *))a5;
  NSUInteger v14 = location + length;
  if (location < v14)
  {
    uint64_t v89 = 0;
    NSUInteger v87 = v14;
    uint64_t v88 = self;
    while (1)
    {
      uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v9, location, v10, v11, v12);
      uint64_t v91 = v15;
      if (location < objc_msgSend_length(v90, v16, v17, v18, v19, v20)) {
        break;
      }
      if (location >= objc_msgSend_length(v90, v21, v22, v23, v24, v25))
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v50 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        {
          uint64_t v67 = objc_msgSend_length(v90, v62, v63, v64, v65, v66);
          *(_DWORD *)buf = 134218240;
          NSUInteger v99 = location;
          __int16 v100 = 2048;
          uint64_t v101 = v67;
          _os_log_impl(&dword_1C492D000, v50, OS_LOG_TYPE_FAULT, "Trying to access index %ld outside of path of length %ld. Skipping.", buf, 0x16u);
        }
LABEL_24:

LABEL_25:
        uint64_t v15 = v91;
      }

      if (++location == v14) {
        goto LABEL_27;
      }
    }
    unint64_t v26 = objc_msgSend_indexAtPosition_(v90, v21, location, v23, v24, v25);
    uint64_t v32 = objc_msgSend_mathTokenRows(v15, v27, v28, v29, v30, v31);
    BOOL v38 = v26 < objc_msgSend_count(v32, v33, v34, v35, v36, v37);

    if (v38)
    {
      uint64_t v44 = objc_msgSend_mathTokenRows(v91, v39, v40, v41, v42, v43);
      uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(v44, v45, v26, v46, v47, v48);

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      uint64_t v50 = v49;
      uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v93, (uint64_t)v97, 16, v52);
      if (v53)
      {
        uint64_t v54 = 0;
        uint64_t v55 = *(void *)v94;
        uint64_t v56 = v89;
        do
        {
          uint64_t v57 = 0;
          uint64_t v58 = v56;
          do
          {
            if (*(void *)v94 != v55) {
              objc_enumerationMutation(v50);
            }
            uint64_t v59 = *(void *)(*((void *)&v93 + 1) + 8 * v57);
            v92[0] = location;
            v92[1] = v26;
            v92[2] = v54 + v57;
            v13[2](v13, v59, v58 + v57++, v92);
          }
          while (v53 != v57);
          uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v60, (uint64_t)&v93, (uint64_t)v97, 16, v61);
          v54 += v57;
          uint64_t v56 = v58 + v57;
        }
        while (v53);
        uint64_t v89 = v58 + v57;
        NSUInteger v14 = v87;
        self = v88;
      }

      goto LABEL_24;
    }
    uint64_t v68 = objc_msgSend_mathTokenRows(v91, v39, v40, v41, v42, v43);
    BOOL v74 = v26 < objc_msgSend_count(v68, v69, v70, v71, v72, v73);

    if (!v74)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v50 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        uint64_t v80 = objc_msgSend_mathTokenRows(v91, v75, v76, v77, v78, v79);
        uint64_t v86 = objc_msgSend_count(v80, v81, v82, v83, v84, v85);
        *(_DWORD *)buf = 134218240;
        NSUInteger v99 = v26;
        __int16 v100 = 2048;
        uint64_t v101 = v86;
        _os_log_impl(&dword_1C492D000, v50, OS_LOG_TYPE_FAULT, "Trying to access index %ld outside of available tokenRows of length %ld. Skipping.", buf, 0x16u);
      }
      goto LABEL_24;
    }
    goto LABEL_25;
  }
LABEL_27:
}

- (BOOL)isEquivalentToTokenizedMathResult:(id)a3
{
  uint64_t v9 = (CHTokenizedMathResult *)a3;
  if (self == v9)
  {
    char v39 = 1;
    goto LABEL_11;
  }
  uint64_t v10 = objc_msgSend_tokenColumns(self, v4, v5, v6, v7, v8);
  uint64_t v21 = objc_msgSend_tokenColumns(v9, v11, v12, v13, v14, v15);
  if (v10 == v21)
  {
  }
  else
  {
    uint64_t v22 = objc_msgSend_tokenColumns(self, v16, v17, v18, v19, v20);
    uint64_t v28 = objc_msgSend_tokenColumns(v9, v23, v24, v25, v26, v27);
    int isEqual = objc_msgSend_isEqual_(v22, v29, (uint64_t)v28, v30, v31, v32);

    if (!isEqual)
    {
      char v39 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v40 = objc_msgSend_transcriptionPaths(self, v34, v35, v36, v37, v38);
  uint64_t v51 = objc_msgSend_transcriptionPaths(v9, v41, v42, v43, v44, v45);
  if (v40 == v51)
  {
    char v39 = 1;
  }
  else
  {
    uint64_t v52 = objc_msgSend_transcriptionPaths(self, v46, v47, v48, v49, v50);
    uint64_t v58 = objc_msgSend_transcriptionPaths(v9, v53, v54, v55, v56, v57);
    char v39 = objc_msgSend_isEqual_(v52, v59, (uint64_t)v58, v60, v61, v62);
  }
LABEL_11:

  return v39;
}

- (BOOL)isEqualToTokenizedMathResult:(id)a3
{
  uint64_t v9 = (CHTokenizedMathResult *)a3;
  if (self == v9)
  {
    char v39 = 1;
  }
  else
  {
    uint64_t v10 = objc_msgSend_topTranscription(self, v4, v5, v6, v7, v8);
    uint64_t v21 = objc_msgSend_topTranscription(v9, v11, v12, v13, v14, v15);
    if (v10 == v21)
    {
    }
    else
    {
      uint64_t v22 = objc_msgSend_topTranscription(self, v16, v17, v18, v19, v20);
      uint64_t v28 = objc_msgSend_topTranscription(v9, v23, v24, v25, v26, v27);
      int isEqualToString = objc_msgSend_isEqualToString_(v22, v29, (uint64_t)v28, v30, v31, v32);

      if (!isEqualToString) {
        goto LABEL_13;
      }
    }
    uint64_t v40 = objc_msgSend_strokeIndexes(self, v34, v35, v36, v37, v38);
    uint64_t v51 = objc_msgSend_strokeIndexes(v9, v41, v42, v43, v44, v45);
    if (v40 == v51)
    {
    }
    else
    {
      uint64_t v52 = objc_msgSend_strokeIndexes(self, v46, v47, v48, v49, v50);
      uint64_t v58 = objc_msgSend_strokeIndexes(v9, v53, v54, v55, v56, v57);
      int isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v52, v59, (uint64_t)v58, v60, v61, v62);

      if (!isEqualToIndexSet)
      {
LABEL_13:
        char v39 = 0;
        goto LABEL_19;
      }
    }
    BOOL v69 = objc_msgSend_tokenColumns(self, v64, v65, v66, v67, v68);
    uint64_t v80 = objc_msgSend_tokenColumns(v9, v70, v71, v72, v73, v74);
    if (v69 == v80)
    {
    }
    else
    {
      uint64_t v81 = objc_msgSend_tokenColumns(self, v75, v76, v77, v78, v79);
      NSUInteger v87 = objc_msgSend_tokenColumns(v9, v82, v83, v84, v85, v86);
      int isEqual = objc_msgSend_isEqual_(v81, v88, (uint64_t)v87, v89, v90, v91);

      if (!isEqual) {
        goto LABEL_13;
      }
    }
    uint64_t v98 = objc_msgSend_selectedTranscriptionPathIndex(self, v93, v94, v95, v96, v97);
    unint64_t v109 = objc_msgSend_selectedTranscriptionPathIndex(v9, v99, v100, v101, v102, v103);
    if (v98 == v109)
    {
      char v39 = 1;
    }
    else
    {
      uint64_t v110 = objc_msgSend_selectedTranscriptionPathIndex(self, v104, v105, v106, v107, v108);
      uint64_t v116 = objc_msgSend_selectedTranscriptionPathIndex(v9, v111, v112, v113, v114, v115);
      char v39 = objc_msgSend_isEqual_(v110, v117, (uint64_t)v116, v118, v119, v120);
    }
  }
LABEL_19:

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToTokenizedMathResult = objc_msgSend_isEqualToTokenizedMathResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedMathResult;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v7 = objc_msgSend_hash(self->_tokenColumns, a2, v2, v3, v4, v5);
  return objc_msgSend_hash(self->_transcriptionPaths, v8, v9, v10, v11, v12) ^ v7;
}

- (id)parseTree
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!self->_didAttemptParsing)
  {
    self->_didAttemptParsing = 1;
    pathForResource("latex_grammar.txt", 0, (UInt8 *)v41);
    uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v3, (uint64_t)v41, v4, v5, v6);
    uint64_t v8 = [CHGrammar alloc];
    uint64_t v13 = objc_msgSend_initWithFile_(v8, v9, (uint64_t)v7, v10, v11, v12);
    uint64_t v14 = [CHLatexParser alloc];
    uint64_t v18 = objc_msgSend_initWithGrammar_parseNormalizedLatex_(v14, v15, (uint64_t)v13, 1, v16, v17);
    uint64_t v24 = objc_msgSend_preferredTranscription(self, v19, v20, v21, v22, v23);
    id v40 = 0;
    uint64_t v28 = objc_msgSend_parseLatex_outCorrectedLatex_(v18, v25, (uint64_t)v24, (uint64_t)&v40, v26, v27);
    uint64_t v29 = (NSString *)v40;
    objc_msgSend_firstObject(v28, v30, v31, v32, v33, v34);
    uint64_t v35 = (CHLatexParseTree *)objc_claimAutoreleasedReturnValue();
    parseTree = self->_parseTree;
    self->_parseTree = v35;

    correctedLatex = self->_correctedLatex;
    self->_correctedLatex = v29;
  }
  uint64_t v38 = self->_parseTree;
  return v38;
}

- (id)evaluationWithVariables:(id)a3 caseSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = objc_msgSend_parseTree(self, v7, v8, v9, v10, v11);
  objc_msgSend_inputRange(v12, v13, v14, v15, v16, v17);
  uint64_t v19 = v18;
  uint64_t v24 = objc_msgSend_length(self->_correctedLatex, v18, v20, v21, v22, v23);

  if (v19 == (const char *)v24)
  {
    uint64_t v30 = objc_msgSend_parseTree(self, v25, v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_evaluationWithVariables_caseSensitive_(v30, v31, (uint64_t)v6, v4, v32, v33);
  }
  else
  {
    uint64_t v34 = 0;
  }

  return v34;
}

- (id)declaredVariable
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = sub_1C4A682A4;
  v63[3] = &unk_1E64E0CD8;
  id v8 = v7;
  id v64 = v8;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, v9, (uint64_t)v63, v10, v11, v12);
  uint64_t v18 = objc_msgSend_string(MEMORY[0x1E4F28E78], v13, v14, v15, v16, v17);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v19 = v8;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v59, (uint64_t)v65, 16, v21);
  if (v27)
  {
    uint64_t v28 = *(void *)v60;
LABEL_3:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v60 != v28) {
        objc_enumerationMutation(v19);
      }
      uint64_t v30 = *(void **)(*((void *)&v59 + 1) + 8 * v29);
      if ((objc_msgSend_properties(v30, v22, v23, v24, v25, v26, (void)v59) & 0x10) == 0) {
        break;
      }
      uint64_t v36 = objc_msgSend_string(v30, v31, v32, v33, v34, v35);
      objc_msgSend_appendString_(v18, v37, (uint64_t)v36, v38, v39, v40);

      if (v27 == ++v29)
      {
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v59, (uint64_t)v65, 16, v26);
        if (v27) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    if (!objc_msgSend_length(v18, v31, v32, v33, v34, v35)) {
      goto LABEL_13;
    }
    uint64_t v46 = objc_msgSend_string(v30, v41, v42, v43, v44, v45);
    int isEqualToString = objc_msgSend_isEqualToString_(v46, v47, @"=", v48, v49, v50);

    if (isEqualToString)
    {
      uint64_t v57 = objc_msgSend_copy(v18, v52, v53, v54, v55, v56);
      goto LABEL_15;
    }
  }
  else
  {
LABEL_13:
  }
  uint64_t v57 = 0;
LABEL_15:

  return v57;
}

- (BOOL)isEvaluationExpected
{
  id v6 = objc_msgSend_preferredTranscription(self, a2, v2, v3, v4, v5);
  if ((objc_msgSend_hasSuffix_(v6, v7, @"=", v8, v9, v10) & 1) != 0
    || (objc_msgSend_hasSuffix_(v6, v11, @"\\hline", v12, v13, v14) & 1) != 0)
  {

    return 1;
  }
  else
  {
    char hasSuffix = objc_msgSend_hasSuffix_(v6, v16, @"\\hline \\end{array}", v17, v18, v19);

    return hasSuffix;
  }
}

- (id)alternativeCandidatesLog
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  long long v93 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = self->_tokenColumns;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v106, (uint64_t)v112, 16, v7);
  if (v13)
  {
    uint64_t v96 = *(void *)v107;
    do
    {
      uint64_t v97 = 0;
      uint64_t v95 = v13;
      do
      {
        if (*(void *)v107 != v96) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v106 + 1) + 8 * v97);
        uint64_t v15 = objc_msgSend_tokenRows(v14, v8, v9, v10, v11, v12);
        BOOL v21 = (unint64_t)objc_msgSend_count(v15, v16, v17, v18, v19, v20) > 1;

        if (v21)
        {
          uint64_t v22 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          uint64_t v28 = objc_msgSend_mathTokenRows(v14, v23, v24, v25, v26, v27);
          uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v102, (uint64_t)v111, 16, v30);
          if (v31)
          {
            uint64_t v32 = *(void *)v103;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v103 != v32) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v34 = *(void **)(*((void *)&v102 + 1) + 8 * i);
                long long v98 = 0u;
                long long v99 = 0u;
                long long v100 = 0u;
                long long v101 = 0u;
                id v35 = v34;
                uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v98, (uint64_t)v110, 16, v37);
                if (v43)
                {
                  uint64_t v44 = *(void *)v99;
                  double v45 = 1.0;
                  do
                  {
                    for (uint64_t j = 0; j != v43; ++j)
                    {
                      if (*(void *)v99 != v44) {
                        objc_enumerationMutation(v35);
                      }
                      objc_msgSend_score(*(void **)(*((void *)&v98 + 1) + 8 * j), v38, v39, v40, v41, v42);
                      double v45 = v45 * v47;
                    }
                    uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v98, (uint64_t)v110, 16, v42);
                  }
                  while (v43);
                }
                else
                {
                  double v45 = 1.0;
                }

                uint64_t v52 = objc_msgSend_stringWithFormat_(NSString, v48, @"%.3f", v49, v50, v51, *(void *)&v45);
                objc_msgSend_addObject_(v22, v53, (uint64_t)v52, v54, v55, v56);
              }
              uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v57, (uint64_t)&v102, (uint64_t)v111, 16, v58);
            }
            while (v31);
          }

          long long v59 = NSString;
          id v64 = objc_msgSend_componentsJoinedByString_(v22, v60, @", ", v61, v62, v63);
          BOOL v69 = objc_msgSend_stringWithFormat_(v59, v65, @"[%@]", v66, v67, v68, v64);
          objc_msgSend_addObject_(v93, v70, (uint64_t)v69, v71, v72, v73);
        }
        ++v97;
      }
      while (v97 != v95);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v106, (uint64_t)v112, 16, v12);
    }
    while (v13);
  }

  uint64_t v74 = NSString;
  uint64_t v80 = objc_msgSend_count(v93, v75, v76, v77, v78, v79);
  uint64_t v85 = objc_msgSend_componentsJoinedByString_(v93, v81, @",", v82, v83, v84);
  uint64_t v90 = objc_msgSend_stringWithFormat_(v74, v86, @"Math result %p has %lu subexpressions with alternative candidates having these scores: %@", v87, v88, v89, self, v80, v85);

  return v90;
}

- (double)baseCharacterHeight
{
  double result = self->_baseCharacterHeight;
  if (result >= 0.0) {
    return result;
  }
  objc_msgSend_bounds(self, a2, v2, v3, v4, v5);
  double v9 = v8;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x6012000000;
  v37[3] = sub_1C4A68AA0;
  v37[4] = sub_1C4A68AE0;
  v37[5] = &unk_1C4CB5C62;
  memset(v38, 0, sizeof(v38));
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x4812000000;
  uint64_t v31 = sub_1C4A68AE8;
  uint64_t v32 = sub_1C4A68B0C;
  uint64_t v33 = &unk_1C4CB5C62;
  id v35 = 0;
  uint64_t v36 = 0;
  __p = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_1C4A68B24;
  v26[4] = sub_1C4A68B34;
  uint64_t v27 = &stru_1F20141C8;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4A68B3C;
  v25[3] = &unk_1E64E2EC0;
  v25[4] = v26;
  v25[5] = v39;
  v25[6] = v37;
  v25[7] = &v28;
  objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(self, v10, (uint64_t)v25, v11, v12, v13);
  uint64_t v15 = (double *)v29[6];
  uint64_t v14 = (double *)v29[7];
  uint64_t v16 = (char *)v14 - (char *)v15;
  if (v14 != v15)
  {
    uint64_t v17 = v16 >> 3;
    unint64_t v18 = v16 - 8;
    if (v18 >= 8)
    {
      uint64_t v21 = (v18 >> 3) + 1;
      uint64_t v20 = &v15[v21 & 0x3FFFFFFFFFFFFFFELL];
      uint64_t v22 = v15 + 1;
      double v19 = 0.0;
      uint64_t v23 = v21 & 0x3FFFFFFFFFFFFFFELL;
      do
      {
        double v19 = v19 + *(v22 - 1) + *v22;
        v22 += 2;
        v23 -= 2;
      }
      while (v23);
      if (v21 == (v21 & 0x3FFFFFFFFFFFFFFELL)) {
        goto LABEL_9;
      }
    }
    else
    {
      double v19 = 0.0;
      uint64_t v20 = (double *)v29[6];
    }
    do
    {
      double v24 = *v20++;
      double v19 = v19 + v24;
    }
    while (v20 != v14);
LABEL_9:
    double v9 = v19 / (double)(unint64_t)v17;
  }
  self->_baseCharacterHeight = v9;
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(&v28, 8);
  if (__p)
  {
    id v35 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v37, 8);
  sub_1C494685C((uint64_t)v38);
  _Block_object_dispose(v39, 8);
  return self->_baseCharacterHeight;
}

- (BOOL)transformNotationToInternal
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v54 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v52 = 88;
  obuint64_t j = self->_transcriptionPaths;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v61, (uint64_t)v69, 16, v8);
  if (v14)
  {
    uint64_t v15 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v62 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_length(v17, v9, v10, v11, v12, v13, v52);
        uint64_t v21 = objc_msgSend_transcriptionWithPath_columnRange_(self, v19, (uint64_t)v17, 0, v18, v20);
        char v26 = objc_msgSend_containsString_(v21, v22, @"\\begin{array}{lr}", v23, v24, v25);
        uint64_t v32 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v27, v28, v29, v30, v31);
        uint64_t v38 = objc_msgSend_length(v17, v33, v34, v35, v36, v37);
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = sub_1C4A6933C;
        v57[3] = &unk_1E64E2F08;
        char v60 = v26;
        long long v59 = &v65;
        id v39 = v32;
        id v58 = v39;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v40, (uint64_t)v17, 0, v38, (uint64_t)v57);
        objc_msgSend_addObject_(v54, v41, (uint64_t)v39, v42, v43, v44);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v61, (uint64_t)v69, 16, v13);
    }
    while (v14);
  }

  if (*((unsigned char *)v66 + 24))
  {
    id v55 = 0;
    uint64_t v56 = 0;
    sub_1C4A5C770((uint64_t)CHTokenizedMathResult, v54, &v56, &v55);
    double v45 = v56;
    uint64_t v46 = (objc_class *)v55;
    tokenColumns = self->_tokenColumns;
    self->_tokenColumns = (NSArray *)v45;
    uint64_t v48 = v45;

    uint64_t v49 = *(Class *)((char *)&self->super.super.isa + v52);
    *(Class *)((char *)&self->super.super.isa + v52) = v46;

    BOOL v50 = *((unsigned char *)v66 + 24) != 0;
  }
  else
  {
    BOOL v50 = 0;
  }

  _Block_object_dispose(&v65, 8);
  return v50;
}

- (id)resultTransformedToOfficialNotationWithExplicitOperators:(BOOL)a3
{
  uint64_t v166 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, v3, v4, v5);
  if (!objc_msgSend_count(self->_transcriptionPaths, v7, v8, v9, v10, v11)) {
    goto LABEL_17;
  }
  uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v12, 0, v13, v14, v15);
  uint64_t v22 = objc_msgSend_length(v16, v17, v18, v19, v20, v21);
  uint64_t v25 = objc_msgSend_transcriptionWithPath_columnRange_(self, v23, (uint64_t)v16, 0, v22, v24);
  int v30 = objc_msgSend_containsString_(v25, v26, @"\\hline", v27, v28, v29);
  uint64_t v41 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v31, v32, v33, v34, v35);
  if (v30)
  {
    uint64_t v42 = [CHTokenizedMathResultToken alloc];
    uint64_t v48 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v43, v44, v45, v46, v47);
    uint64_t v51 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v42, v49, @"\\begin{array}{lr}", (uint64_t)v48, 1, v50, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    objc_msgSend_addObject_(v41, v52, (uint64_t)v51, v53, v54, v55);
  }
  uint64_t v180 = 0;
  uint64_t v181 = &v180;
  uint64_t v182 = 0x2020000000;
  char v183 = 1;
  uint64_t v176 = 0;
  uint64_t v177 = &v176;
  uint64_t v178 = 0x2020000000;
  char v179 = 1;
  uint64_t v56 = objc_msgSend_length(v16, v36, v37, v38, v39, v40);
  uint64_t v167 = MEMORY[0x1E4F143A8];
  uint64_t v168 = 3221225472;
  uint64_t v169 = sub_1C4A69B84;
  uint64_t v170 = &unk_1E64E2F30;
  char v174 = v30;
  id v57 = v41;
  id v171 = v57;
  uint64_t v172 = &v180;
  uint64_t v173 = &v176;
  BOOL v175 = a3;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v58, (uint64_t)v16, 0, v56, (uint64_t)&v167);
  if (v30)
  {
    long long v63 = [CHTokenizedMathResultToken alloc];
    BOOL v69 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v64, v65, v66, v67, v68);
    uint64_t v72 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v63, v70, @"\\end{array}", (uint64_t)v69, 1, v71, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    objc_msgSend_addObject_(v57, v73, (uint64_t)v72, v74, v75, v76);
  }
  objc_msgSend_addObject_(v166, v59, (uint64_t)v57, v60, v61, v62);

  _Block_object_dispose(&v176, 8);
  _Block_object_dispose(&v180, 8);

  for (unint64_t i = 1; ; ++i)
  {
    if (i >= objc_msgSend_count(self->_transcriptionPaths, v77, v78, v79, v80, v81))
    {
      if ((v30 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
    uint64_t v87 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v83, i, v84, v85, v86);
    uint64_t v93 = objc_msgSend_length(v87, v88, v89, v90, v91, v92);
    uint64_t v96 = objc_msgSend_transcriptionWithPath_columnRange_(self, v94, (uint64_t)v87, 0, v93, v95);
    int v106 = objc_msgSend_containsString_(v96, v97, @"\\hline", v98, v99, v100);
    if ((v30 ^ v106)) {
      break;
    }
    uint64_t v112 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v101, v102, v103, v104, v105);
    if (v106)
    {
      uint64_t v113 = [CHTokenizedMathResultToken alloc];
      uint64_t v119 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v114, v115, v116, v117, v118);
      long long v122 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v113, v120, @"\\begin{array}{lr}", (uint64_t)v119, 1, v121, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      objc_msgSend_addObject_(v112, v123, (uint64_t)v122, v124, v125, v126);
    }
    uint64_t v180 = 0;
    uint64_t v181 = &v180;
    uint64_t v182 = 0x2020000000;
    char v183 = 1;
    uint64_t v176 = 0;
    uint64_t v177 = &v176;
    uint64_t v178 = 0x2020000000;
    char v179 = 1;
    uint64_t v127 = objc_msgSend_length(v87, v107, v108, v109, v110, v111);
    uint64_t v167 = MEMORY[0x1E4F143A8];
    uint64_t v168 = 3221225472;
    uint64_t v169 = sub_1C4A69B84;
    uint64_t v170 = &unk_1E64E2F30;
    char v174 = v106;
    id v128 = v112;
    id v171 = v128;
    uint64_t v172 = &v180;
    uint64_t v173 = &v176;
    BOOL v175 = a3;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v129, (uint64_t)v87, 0, v127, (uint64_t)&v167);
    if (v106)
    {
      v134 = [CHTokenizedMathResultToken alloc];
      uint64_t v140 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v135, v136, v137, v138, v139);
      uint64_t v143 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v134, v141, @"\\end{array}", (uint64_t)v140, 1, v142, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      objc_msgSend_addObject_(v128, v144, (uint64_t)v143, v145, v146, v147);
    }
    objc_msgSend_addObject_(v166, v130, (uint64_t)v128, v131, v132, v133);
    v30 |= v106;

    _Block_object_dispose(&v176, 8);
    _Block_object_dispose(&v180, 8);
  }
  if (v30)
  {
LABEL_15:
    uint64_t v148 = [CHTokenizedMathResult alloc];
    uint64_t v153 = objc_msgSend_initWithBestPathTokens_(v148, v149, (uint64_t)v166, v150, v151, v152);
    uint64_t v159 = objc_msgSend_declaredVariablesWhileRecognized(self, v154, v155, v156, v157, v158);
    objc_msgSend_setDeclaredVariablesWhileRecognized_(v153, v160, (uint64_t)v159, v161, v162, v163);

    goto LABEL_18;
  }
LABEL_17:
  uint64_t v153 = 0;
LABEL_18:

  return v153;
}

+ (CHTokenizedMathResult)mathResultWithReindexedTokens:(id)a3 originalStrokeIdentifiersOrdering:(id)a4 newStrokeIdentifiersOrdering:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v60 = a4;
  id v61 = a5;
  uint64_t v62 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  objc_msgSend_transcriptionPaths(v7, v13, v14, v15, v16, v17);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v67, (uint64_t)v71, 16, v19);
  if (v25)
  {
    uint64_t v26 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v68 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v29 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v20, v21, v22, v23, v24);
        uint64_t v35 = objc_msgSend_tokenColumnCount(v7, v30, v31, v32, v33, v34);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = sub_1C4A6A32C;
        v63[3] = &unk_1E64E2F80;
        id v64 = v60;
        id v65 = v61;
        id v36 = v29;
        id v66 = v36;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v7, v37, v28, 0, v35, (uint64_t)v63);
        objc_msgSend_addObject_(v62, v38, (uint64_t)v36, v39, v40, v41);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v67, (uint64_t)v71, 16, v24);
    }
    while (v25);
  }

  uint64_t v42 = [CHTokenizedMathResult alloc];
  uint64_t v47 = objc_msgSend_initWithBestPathTokens_(v42, v43, (uint64_t)v62, v44, v45, v46);
  uint64_t v53 = objc_msgSend_declaredVariablesWhileRecognized(v7, v48, v49, v50, v51, v52);
  objc_msgSend_setDeclaredVariablesWhileRecognized_(v47, v54, (uint64_t)v53, v55, v56, v57);

  return (CHTokenizedMathResult *)v47;
}

+ (CHTokenizedMathResult)mathResultWithMergedColumns:(id)a3 columnRangesToMerge:(id)a4
{
  uint64_t v310 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v296 = a4;
  uint64_t v301 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  uint64_t v21 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15);
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v23 = objc_msgSend_transcriptionPaths(v5, v16, v17, v18, v19, v20);
    unint64_t v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);

    if (i >= v29) {
      break;
    }
    id v30 = objc_alloc_init(MEMORY[0x1E4F28D58]);
    objc_msgSend_addObject_(v21, v31, (uint64_t)v30, v32, v33, v34);
  }
  long long v306 = 0u;
  long long v307 = 0u;
  long long v304 = 0u;
  long long v305 = 0u;
  obuint64_t j = v296;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v304, (uint64_t)v309, 16, v36);
  if (v37)
  {
    unint64_t v43 = 0;
    uint64_t v298 = *(void *)v305;
    uint64_t v299 = v37;
    do
    {
      for (uint64_t j = 0; j != v299; ++j)
      {
        if (*(void *)v305 != v298) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = objc_msgSend_rangeValue(*(void **)(*((void *)&v304 + 1) + 8 * j), v38, v39, v40, v41, v42);
        uint64_t v50 = v45;
        for (unint64_t k = v44; v43 < k; ++v43)
        {
          uint64_t v113 = objc_msgSend_tokenColumns(v5, v45, v46, v47, v48, v49);
          uint64_t v118 = objc_msgSend_objectAtIndexedSubscript_(v113, v114, v43, v115, v116, v117);
          objc_msgSend_addObject_(v301, v119, (uint64_t)v118, v120, v121, v122);

          for (unint64_t m = 0; ; ++m)
          {
            v129 = objc_msgSend_transcriptionPaths(v5, v123, v124, v125, v126, v127);
            BOOL v135 = m < objc_msgSend_count(v129, v130, v131, v132, v133, v134);

            if (!v135) {
              break;
            }
            uint64_t v136 = objc_msgSend_transcriptionPaths(v5, v45, v46, v47, v48, v49);
            uint64_t v141 = objc_msgSend_objectAtIndexedSubscript_(v136, v137, m, v138, v139, v140);
            uint64_t v146 = objc_msgSend_indexAtPosition_(v141, v142, v43, v143, v144, v145);

            uint64_t v151 = objc_msgSend_objectAtIndexedSubscript_(v21, v147, m, v148, v149, v150);
            uint64_t v156 = objc_msgSend_indexPathByAddingIndex_(v151, v152, v146, v153, v154, v155);
            objc_msgSend_setObject_atIndexedSubscript_(v21, v157, (uint64_t)v156, m, v158, v159);
          }
        }
        v303 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v45, v46, v47, v48, v49);
        unint64_t v56 = 0;
        v43 += (unint64_t)v50;
        while (1)
        {
          uint64_t v57 = objc_msgSend_transcriptionPaths(v5, v51, v52, v53, v54, v55);
          BOOL v63 = v56 < objc_msgSend_count(v57, v58, v59, v60, v61, v62);

          if (!v63) {
            break;
          }
          uint64_t v74 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v64, v65, v66, v67, v68);
          uint64_t v75 = k;
          if (k < v43)
          {
            do
            {
              uint64_t v76 = objc_msgSend_transcriptionPaths(v5, v69, v70, v71, v72, v73);
              uint64_t v81 = objc_msgSend_objectAtIndexedSubscript_(v76, v77, v56, v78, v79, v80);
              uint64_t v86 = objc_msgSend_indexAtPosition_(v81, v82, v75, v83, v84, v85);

              uint64_t v92 = objc_msgSend_tokenColumns(v5, v87, v88, v89, v90, v91);
              uint64_t v97 = objc_msgSend_objectAtIndexedSubscript_(v92, v93, v75, v94, v95, v96);
              uint64_t v103 = objc_msgSend_mathTokenRows(v97, v98, v99, v100, v101, v102);
              uint64_t v108 = objc_msgSend_objectAtIndexedSubscript_(v103, v104, v86, v105, v106, v107);
              objc_msgSend_addObjectsFromArray_(v74, v109, (uint64_t)v108, v110, v111, v112);

              ++v75;
            }
            while (v43 != v75);
          }
          objc_msgSend_addObject_(v303, v69, (uint64_t)v74, v71, v72, v73);

          ++v56;
        }
        uint64_t v165 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v64, v65, v66, v67, v68);
        for (unint64_t n = 0; n < objc_msgSend_count(v303, v160, v161, v162, v163, v164); ++n)
        {
          id v171 = objc_msgSend_objectAtIndexedSubscript_(v303, v167, n, v168, v169, v170);
          uint64_t v175 = objc_msgSend_mergeTokenRow_intoUniqueRows_(CHTokenizedMathResult, v172, (uint64_t)v171, (uint64_t)v165, v173, v174);
          uint64_t v180 = objc_msgSend_objectAtIndexedSubscript_(v21, v176, n, v177, v178, v179);
          uint64_t v185 = objc_msgSend_indexPathByAddingIndex_(v180, v181, v175, v182, v183, v184);
          objc_msgSend_setObject_atIndexedSubscript_(v21, v186, (uint64_t)v185, n, v187, v188);
        }
        uint64_t v189 = [CHTokenizedResultColumn alloc];
        unint64_t v194 = objc_msgSend_initWithTokenRows_(v189, v190, (uint64_t)v165, v191, v192, v193);
        objc_msgSend_addObject_(v301, v195, (uint64_t)v194, v196, v197, v198);
      }
      uint64_t v299 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v304, (uint64_t)v309, 16, v42);
    }
    while (v299);
  }
  else
  {
    unint64_t v43 = 0;
  }

  while ((uint64_t)v43 < objc_msgSend_tokenColumnCount(v5, v199, v200, v201, v202, v203))
  {
    uint64_t v209 = objc_msgSend_tokenColumns(v5, v204, v205, v206, v207, v208);
    uint64_t v214 = objc_msgSend_objectAtIndexedSubscript_(v209, v210, v43, v211, v212, v213);
    objc_msgSend_addObject_(v301, v215, (uint64_t)v214, v216, v217, v218);

    for (iunint64_t i = 0; ; ++ii)
    {
      uint64_t v225 = objc_msgSend_transcriptionPaths(v5, v219, v220, v221, v222, v223);
      BOOL v231 = ii < objc_msgSend_count(v225, v226, v227, v228, v229, v230);

      if (!v231) {
        break;
      }
      uint64_t v232 = objc_msgSend_transcriptionPaths(v5, v199, v200, v201, v202, v203);
      uint64_t v237 = objc_msgSend_objectAtIndexedSubscript_(v232, v233, ii, v234, v235, v236);
      uint64_t v242 = objc_msgSend_indexAtPosition_(v237, v238, v43, v239, v240, v241);

      uint64_t v247 = objc_msgSend_objectAtIndexedSubscript_(v21, v243, ii, v244, v245, v246);
      uint64_t v252 = objc_msgSend_indexPathByAddingIndex_(v247, v248, v242, v249, v250, v251);
      objc_msgSend_setObject_atIndexedSubscript_(v21, v253, (uint64_t)v252, ii, v254, v255);
    }
    ++v43;
  }
  uint64_t v256 = [CHTokenizedMathResult alloc];
  id v257 = v301;
  id v258 = v21;
  if (v256)
  {
    v308.receiver = v256;
    v308.super_class = (Class)CHTokenizedMathResult;
    uint64_t v256 = objc_msgSendSuper2(&v308, sel_initWithIsMinimalDrawingResult_, 0);
    if (v256)
    {
      uint64_t v264 = objc_msgSend_copy(v257, v259, v260, v261, v262, v263);
      tokenColumns = v256->_tokenColumns;
      v256->_tokenColumns = (NSArray *)v264;

      uint64_t v271 = objc_msgSend_copy(v258, v266, v267, v268, v269, v270);
      transcriptionPaths = v256->_transcriptionPaths;
      v256->_transcriptionPaths = (NSArray *)v271;

      v256->_baseCharacterHeight = -1.0;
      uint64_t v278 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v273, v274, v275, v276, v277);
      declaredVariablesWhileRecognized = v256->_declaredVariablesWhileRecognized;
      v256->_declaredVariablesWhileRecognized = (NSSet *)v278;

      sub_1C4A5C3B4((uint64_t)v256, v280, v281, v282, v283, v284);
    }
  }

  long long v290 = objc_msgSend_declaredVariablesWhileRecognized(v5, v285, v286, v287, v288, v289);
  objc_msgSend_setDeclaredVariablesWhileRecognized_(v256, v291, (uint64_t)v290, v292, v293, v294);

  return v256;
}

+ (id)updateStrokeIndexOffsetForSubResults:(id)a3 fromResult:(id)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v94 = a4;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10, v5);
  id v92 = (id)objc_claimAutoreleasedReturnValue();
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = v5;
  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v106, (uint64_t)v111, 16, v12);
  if (v93)
  {
    uint64_t v91 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v93; ++i)
      {
        if (*(void *)v107 != v91) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        uint64_t v95 = objc_msgSend_strokeIndexes(v18, v13, v14, v15, v16, v17);
        uint64_t v24 = objc_msgSend_strokeIndexes(v94, v19, v20, v21, v22, v23);
        uint64_t v98 = objc_msgSend_mutableCopy(v24, v25, v26, v27, v28, v29);

        objc_msgSend_removeIndexes_(v98, v30, (uint64_t)v95, v31, v32, v33);
        uint64_t v97 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v34, v35, v36, v37, v38);
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        uint64_t v44 = objc_msgSend_transcriptionPaths(v18, v39, v40, v41, v42, v43);
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v102, (uint64_t)v110, 16, v46);
        if (v52)
        {
          uint64_t v53 = *(void *)v103;
          do
          {
            for (uint64_t j = 0; j != v52; ++j)
            {
              if (*(void *)v103 != v53) {
                objc_enumerationMutation(v44);
              }
              uint64_t v55 = *(void *)(*((void *)&v102 + 1) + 8 * j);
              unint64_t v56 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v47, v48, v49, v50, v51);
              uint64_t v62 = objc_msgSend_tokenColumnCount(v18, v57, v58, v59, v60, v61);
              v99[0] = MEMORY[0x1E4F143A8];
              v99[1] = 3221225472;
              v99[2] = sub_1C4A6B2A0;
              v99[3] = &unk_1E64E0DC0;
              id v100 = v98;
              id v63 = v56;
              id v101 = v63;
              objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v18, v64, v55, 0, v62, (uint64_t)v99);
              objc_msgSend_addObject_(v97, v65, (uint64_t)v63, v66, v67, v68);
            }
            uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v102, (uint64_t)v110, 16, v51);
          }
          while (v52);
        }

        long long v69 = [CHTokenizedMathResult alloc];
        uint64_t v74 = objc_msgSend_initWithBestPathTokens_(v69, v70, (uint64_t)v97, v71, v72, v73);
        uint64_t v80 = objc_msgSend_declaredVariablesWhileRecognized(v94, v75, v76, v77, v78, v79);
        objc_msgSend_setDeclaredVariablesWhileRecognized_(v74, v81, (uint64_t)v80, v82, v83, v84);

        objc_msgSend_addObject_(v92, v85, (uint64_t)v74, v86, v87, v88);
      }
      uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v106, (uint64_t)v111, 16, v17);
    }
    while (v93);
  }

  return v92;
}

+ (BOOL)isTranscriptionValidExpression:(id)a3 limitToCurrentLocale:(BOOL)a4
{
  BOOL v130 = a4;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v129 = a3;
  objc_msgSend_string(MEMORY[0x1E4F28E78], v4, v5, v6, v7, v8);
  uint64_t v134 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v131 = objc_msgSend_string(MEMORY[0x1E4F28E78], v9, v10, v11, v12, v13);
  uint64_t v133 = objc_msgSend_string(MEMORY[0x1E4F28E78], v14, v15, v16, v17, v18);
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  obuint64_t j = v129;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v135, (uint64_t)v139, 16, v20);
  if (!v26)
  {
    char v29 = 1;
    goto LABEL_38;
  }
  int v27 = 0;
  uint64_t v28 = *(void *)v136;
  char v29 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v136 != v28) {
        objc_enumerationMutation(obj);
      }
      uint64_t v31 = *(void **)(*((void *)&v135 + 1) + 8 * i);
      __int16 v32 = objc_msgSend_properties(v31, v21, v22, v23, v24, v25);
      char v38 = objc_msgSend_properties(v31, v33, v34, v35, v36, v37);
      char v44 = objc_msgSend_properties(v31, v39, v40, v41, v42, v43);
      if ((objc_msgSend_properties(v31, v45, v46, v47, v48, v49) & 0x10) != 0)
      {
        BOOL v55 = 1;
        if ((v44 & 6) != 0) {
          goto LABEL_19;
        }
LABEL_8:
        if ((v32 & 0x2000) != 0) {
          int v56 = v27;
        }
        else {
          int v56 = 0;
        }
        if ((v38 & 0xC0) != 0) {
          int v27 = 2 * ((v27 - 1) < 2);
        }
        else {
          int v27 = v56;
        }
        if (!objc_msgSend_length(v134, v50, v51, v52, v53, v54))
        {
LABEL_25:
          if (v55)
          {
            id v63 = objc_msgSend_string(v31, v57, v58, v59, v60, v61);
            objc_msgSend_appendString_(v131, v72, (uint64_t)v63, v73, v74, v75);
          }
          else
          {
            if (objc_msgSend_length(v131, v57, v58, v59, v60, v61))
            {
              if (objc_msgSend_length(v133, v76, v77, v78, v79, v80)
                || (objc_msgSend_string(v31, v81, v82, v83, v84, v85),
                    uint64_t v86 = objc_claimAutoreleasedReturnValue(),
                    char isEqualToString = objc_msgSend_isEqualToString_(v86, v87, @"=", v88, v89, v90),
                    v86,
                    id v92 = @"y",
                    (isEqualToString & 1) == 0))
              {
                id v92 = @" 1";
              }
              objc_msgSend_appendString_(v133, v81, (uint64_t)v92, v83, v84, v85);
              objc_msgSend_setString_(v131, v93, (uint64_t)&stru_1F20141C8, v94, v95, v96);
            }
            id v63 = objc_msgSend_string(v31, v76, v77, v78, v79, v80);
            objc_msgSend_appendFormat_(v133, v97, @" %@", v98, v99, v100, v63);
          }
          goto LABEL_33;
        }
        if (v130)
        {
          if (v29)
          {
            objc_msgSend_currentLocale(MEMORY[0x1E4F1CA20], v57, v58, v59, v60, v61);
            uint64_t v62 = (NSLocale *)objc_claimAutoreleasedReturnValue();
            char v29 = isStringNumberForLocale(v134, v62);

LABEL_24:
            objc_msgSend_setString_(v134, v57, (uint64_t)&stru_1F20141C8, v59, v60, v61);
            objc_msgSend_appendString_(v133, v68, @" 1", v69, v70, v71);
            goto LABEL_25;
          }
        }
        else if (v29)
        {
          char v29 = isStringNumber(v134);
          goto LABEL_24;
        }
        char v29 = 0;
        goto LABEL_24;
      }
      BOOL v55 = objc_msgSend_properties(v31, v50, v51, v52, v53, v54) == 0;
      if ((v44 & 6) == 0) {
        goto LABEL_8;
      }
LABEL_19:
      if (v27 == 2)
      {
        isLatexTranscriptionValidExpressiounint64_t n = 0;
        long long v102 = obj;
        goto LABEL_49;
      }
      id v63 = objc_msgSend_string(v31, v50, v51, v52, v53, v54);
      objc_msgSend_appendString_(v134, v64, (uint64_t)v63, v65, v66, v67);
      int v27 = 1;
LABEL_33:
    }
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v135, (uint64_t)v139, 16, v25);
    if (v26) {
      continue;
    }
    break;
  }
LABEL_38:

  if (objc_msgSend_length(v134, v103, v104, v105, v106, v107))
  {
    objc_msgSend_appendString_(v133, v108, @" 1", v110, v111, v112);
    if (v130)
    {
      if (v29)
      {
        objc_msgSend_currentLocale(MEMORY[0x1E4F1CA20], v108, v109, v110, v111, v112);
        uint64_t v113 = (NSLocale *)objc_claimAutoreleasedReturnValue();
        char v29 = isStringNumberForLocale(v134, v113);

        goto LABEL_45;
      }
LABEL_44:
      char v29 = 0;
    }
    else
    {
      if ((v29 & 1) == 0) {
        goto LABEL_44;
      }
      char v29 = isStringNumber(v134);
    }
  }
LABEL_45:
  if (objc_msgSend_length(v131, v108, v109, v110, v111, v112)) {
    objc_msgSend_appendString_(v133, v114, @" 1", v116, v117, v118);
  }
  if (v29)
  {
    long long v102 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v114, v115, v116, v117, v118);
    uint64_t v123 = objc_msgSend_stringByTrimmingCharactersInSet_(v133, v119, (uint64_t)v102, v120, v121, v122);
    isLatexTranscriptionValidExpressiounint64_t n = objc_msgSend_isLatexTranscriptionValidExpression_(CHCalculateWrapper, v124, (uint64_t)v123, v125, v126, v127);

LABEL_49:
  }
  else
  {
    isLatexTranscriptionValidExpressiounint64_t n = 0;
  }

  return isLatexTranscriptionValidExpression;
}

+ (BOOL)isTranscriptionValidExpression:(id)a3 transcriptionPath:(id)a4 limitToCurrentLocale:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v15, v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_tokenColumnCount(v7, v21, v22, v23, v24, v25);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_1C4A6BCB8;
  v55[3] = &unk_1E64E0DC0;
  id v27 = v14;
  id v56 = v27;
  id v28 = v20;
  id v57 = v28;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v7, v29, (uint64_t)v8, 0, v26, (uint64_t)v55);
  uint64_t v35 = objc_msgSend_copy(v28, v30, v31, v32, v33, v34);
  objc_msgSend_addObject_(v27, v36, (uint64_t)v35, v37, v38, v39);

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v40 = v27;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v51, (uint64_t)v58, 16, v42);
  if (v46)
  {
    uint64_t v47 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v52 != v47) {
          objc_enumerationMutation(v40);
        }
        if ((objc_msgSend_isTranscriptionValidExpression_limitToCurrentLocale_(CHTokenizedMathResult, v43, *(void *)(*((void *)&v51 + 1) + 8 * i), v5, v44, v45) & 1) == 0)
        {
          BOOL v49 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v51, (uint64_t)v58, 16, v45);
      if (v46) {
        continue;
      }
      break;
    }
  }
  BOOL v49 = 1;
LABEL_11:

  return v49;
}

- (id)tokenizedMathResultByAppendingTokenizedMathResult:(id)a3
{
  id v4 = a3;
  uint64_t v133 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_strokeIndexes(self, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_count(v15, v16, v17, v18, v19, v20);

  unint64_t v22 = 0;
  objc_msgSend_transcriptionPaths(self, v23, v24, v25, v26, v27, v138);
  while (1)
    uint64_t v33 = {;
    unint64_t v39 = objc_msgSend_count(v33, v34, v35, v36, v37, v38);

    if (v22 >= v39) {
      break;
    }
    uint64_t v45 = objc_msgSend_transcriptionPaths(self, v40, v41, v42, v43, v44);
    uint64_t v132 = objc_msgSend_objectAtIndexedSubscript_(v45, v46, v22, v47, v48, v49);

    uint64_t v131 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v50, v51, v52, v53, v54);
    unint64_t v130 = v22;
    uint64_t v60 = objc_msgSend_tokenColumnCount(self, v55, v56, v57, v58, v59);
    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v138[0] = sub_1C4A6C1BC;
    v138[1] = &unk_1E64E0CD8;
    id v61 = v131;
    id v139 = v61;
    uint64_t v62 = self;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v63, (uint64_t)v132, 0, v60, (uint64_t)v137);
    for (unint64_t i = 0; ; ++i)
    {
      uint64_t v70 = objc_msgSend_transcriptionPaths(v4, v64, v65, v66, v67, v68);
      unint64_t v76 = objc_msgSend_count(v70, v71, v72, v73, v74, v75);

      if (i >= v76) {
        break;
      }
      uint64_t v82 = objc_msgSend_transcriptionPaths(v4, v77, v78, v79, v80, v81);
      uint64_t v87 = objc_msgSend_objectAtIndexedSubscript_(v82, v83, i, v84, v85, v86);

      uint64_t v93 = objc_msgSend_mutableCopy(v61, v88, v89, v90, v91, v92);
      uint64_t v99 = objc_msgSend_tokenColumnCount(v4, v94, v95, v96, v97, v98);
      v134[0] = MEMORY[0x1E4F143A8];
      v134[1] = 3221225472;
      v134[2] = sub_1C4A6C1C8;
      v134[3] = &unk_1E64E2FD0;
      uint64_t v136 = v21;
      id v100 = v93;
      id v135 = v100;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v4, v101, (uint64_t)v87, 0, v99, (uint64_t)v134);
      uint64_t v107 = objc_msgSend_copy(v100, v102, v103, v104, v105, v106);
      objc_msgSend_addObject_(v133, v108, (uint64_t)v107, v109, v110, v111);
    }
    unint64_t v22 = v130 + 1;
    self = v62;
    objc_msgSend_transcriptionPaths(v62, v28, v29, v30, v31, v32, v129);
  }
  uint64_t v112 = [CHTokenizedMathResult alloc];
  uint64_t v117 = objc_msgSend_initWithBestPathTokens_(v112, v113, (uint64_t)v133, v114, v115, v116);
  uint64_t v123 = objc_msgSend_declaredVariablesWhileRecognized(self, v118, v119, v120, v121, v122);
  objc_msgSend_setDeclaredVariablesWhileRecognized_(v117, v124, (uint64_t)v123, v125, v126, v127);

  return v117;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)transcriptionPaths
{
  return self->_transcriptionPaths;
}

- (NSArray)transcriptionPathScores
{
  return self->_transcriptionPathScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptionPathScores, 0);
  objc_storeStrong((id *)&self->_transcriptionPaths, 0);
  objc_storeStrong((id *)&self->_declaredVariablesWhileRecognized, 0);
  objc_storeStrong((id *)&self->_selectedTranscriptionPathIndex, 0);
  objc_storeStrong((id *)&self->_correctedLatex, 0);
  objc_storeStrong((id *)&self->_parseTree, 0);
  objc_storeStrong((id *)&self->_tokenColumns, 0);
}

@end