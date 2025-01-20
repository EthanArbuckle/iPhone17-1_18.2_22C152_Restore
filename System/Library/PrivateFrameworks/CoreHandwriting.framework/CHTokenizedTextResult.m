@interface CHTokenizedTextResult
+ (BOOL)areTokenRowsEquivalent:(id)a3 otherRow:(id)a4;
+ (BOOL)isTextTranscriptionUnitConversion:(id)a3 locales:(id)a4;
+ (BOOL)isTextTranscriptionVariableAssignment:(id)a3 outVariable:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (CGPath)newBaselinePathForTokens:(id)a3 strokeIdentifiers:(id)a4 strokeProvider:(id)a5;
+ (CHTokenizedTextResult)tokenizedTextResultWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 defaultTokenScores:(double)a8;
+ (CHTokenizedTextResult)tokenizedTextResultWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 defaultTokenScores:(double)a8 originalBounds:(CGRect)a9 principalLines:(id *)a10;
+ (id)compressResult:(id)a3 atColumnIndexes:(id)a4;
+ (id)extendedToken:(id)a3 withStrokeIndexSet:(id)a4 alignmentScore:(double)a5 bounds:(CGRect)a6;
+ (id)loadFromFile:(id)a3;
+ (id)resultRestoringRawPathInResult:(id)a3;
+ (id)resultsBySwapping:(id)a3 swappableColumns:(id)a4 locales:(id)a5 topLocaleIndex:(int64_t)a6 topLocale:(id)a7;
+ (id)swappableColumnIndexesInResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5 swappableIndex:(int64_t)a6 shouldReverseSwappableColumns:(BOOL)a7;
+ (id)tokenizedTextResultFromResults:(id)a3 shouldPerformStrictFiltering:(BOOL)a4 doesTopLocaleRequireSpecialHandling:(BOOL)a5 hasSwap:(BOOL)a6;
+ (int64_t)mergeTokenRow:(id)a3 intoUniqueRows:(id)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)languageFitnessForLocale:(id)a3 recognitionMode:(int)a4;
- (BOOL)hasTextReplacementsInColumnRange:(_NSRange)a3;
- (BOOL)hasTokenAtLocation:(id *)a3;
- (BOOL)hasValidColumns;
- (BOOL)hasValidPaths;
- (BOOL)hasValidPrincipalLinesForPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenizedTextResult:(id)a3;
- (BOOL)isNonTextCandidateTranscriptionWithStrictFiltering:(BOOL)a3;
- (BOOL)isPathOriginal:(id)a3;
- (BOOL)isSingleTokenResult;
- (BOOL)isValid;
- (BOOL)shouldFilterOutStringForToken:(id)a3 isGibberish:(BOOL *)a4 shouldPerformStrictFiltering:(BOOL)a5;
- (BOOL)shouldFilterSingleCharacterResult;
- (BOOL)shouldFilterSingleTokenResult;
- (BOOL)transcriptionPathsHaveSameSegmentation:(id)a3 otherPath:(id)a4;
- (CHTokenizedTextResult)init;
- (CHTokenizedTextResult)initWithBestPathTokens:(id)a3 pathProbabilities:(id)a4 trailingSeparator:(id)a5 recognizerGenerationIdentifier:(int64_t)a6;
- (CHTokenizedTextResult)initWithBestPathTokens:(id)a3 pathProbabilities:(id)a4 trailingSeparator:(id)a5 recognizerGenerationIdentifier:(int64_t)a6 changeableColumnCount:(int64_t)a7;
- (CHTokenizedTextResult)initWithCoder:(id)a3;
- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 recognizerGenerationIdentifier:(int64_t)a6;
- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 recognizerGenerationIdentifier:(int64_t)a6 isMinimalDrawingResult:(BOOL)a7 baseWritingDirection:(int)a8;
- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7;
- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 changeableColumnCount:(int64_t)a8;
- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 changeableColumnCount:(int64_t)a8 isMinimalDrawingResult:(BOOL)a9 baseWritingDirection:(int)a10;
- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 changeableColumnCount:(int64_t)a8 isMinimalDrawingResult:(BOOL)a9 baseWritingDirection:(int)a10 originalTokens:(id)a11;
- (NSArray)originalTokens;
- (NSArray)transcriptionPathScores;
- (NSArray)transcriptionPaths;
- (NSString)rawTranscription;
- (NSString)recognizerDebugDescription;
- (NSString)topModelTranscription;
- (NSString)topTranscription;
- (NSString)trailingSeparator;
- (double)averageTokenRecognitionScoreForColumnRange:(_NSRange)a3;
- (double)heuristicTextScoreForColumnRange:(_NSRange)a3;
- (double)score;
- (id)changeableColumnCountUpdatedResultWithHistory:(id)a3 phraseLexicon:(_LXLexicon *)a4 maxPhraseLength:(int64_t)a5;
- (id)commonTopStrokeSetsWithResult:(id)a3 shouldReverseOtherColumns:(BOOL)a4;
- (id)description;
- (id)descriptionWithSensitiveInformation:(BOOL)a3;
- (id)inputStrokeIdentifiers;
- (id)lastTokenStrokeIndexes;
- (id)locale;
- (id)modifiedResultWithBestPathTokens:(id)a3 pathProbabilities:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)phraseCaseCorrectedResultWithHistory:(id)a3 phraseLexicon:(_LXLexicon *)a4 maxPhraseLength:(int64_t)a5;
- (id)precedingSeparatorForRawTranscriptionPath;
- (id)precedingSeparatorForToken:(id)a3;
- (id)precedingSeparatorForTopTranscriptionPath;
- (id)rawTranscriptionPath;
- (id)strokeIndexSetsInPath:(id)a3 columnRange:(_NSRange)a4;
- (id)strokeIndexes;
- (id)strokeIndexesForColumnsInRange:(_NSRange)a3;
- (id)subResultWithColumnRange:(_NSRange)a3;
- (id)textRecognitionResultArray;
- (id)textRecognitionResultArrayGivenHistory:(id)a3;
- (id)tokenAtLocation:(id *)a3;
- (id)tokenColumns;
- (id)tokenRowsAtColumnIndex:(int64_t)a3;
- (id)tokenizedResultWithFilteredPaths:(double)a3;
- (id)tokenizedTextResultByAppendingTokenizedTextResult:(id)a3;
- (id)tokensAlignedWithStrokes:(id)a3 transcriptionPath:(id)a4 strokeProvider:(id)a5;
- (id)tokensFromTranscriptionPath:(id)a3 characterRange:(_NSRange)a4;
- (id)tokensInTranscriptionPath:(id)a3 atColumnIndex:(int64_t)a4;
- (id)topModelTranscriptionPath;
- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5;
- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 allowPrecedingSeparator:(BOOL)a6;
- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 excludeGibberish:(BOOL)a6 allowPrecedingSeparator:(BOOL)a7 rejectionRate:(double *)a8 tokenProcessingBlock:(id)a9;
- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 excludeGibberish:(BOOL)a6 rejectionRate:(double *)a7 tokenProcessingBlock:(id)a8;
- (int)baseWritingDirection;
- (int64_t)changeableTokenColumnCount;
- (int64_t)inLexiconTokenCountInTranscriptionPath:(id)a3;
- (int64_t)precedingLineBreaks;
- (int64_t)recognizerGenerationIdentifier;
- (int64_t)tokenColumnCount;
- (int64_t)tokenCountInTranscriptionPath:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateTokensInTopTranscriptionPathWithBlock:(id)a3;
- (void)enumerateTokensInTranscriptionPath:(id)a3 columnRange:(_NSRange)a4 tokenProcessingBlock:(id)a5;
- (void)setInputStrokeIdentifiers:(id)a3;
- (void)setLocale:(id)a3;
- (void)setOriginalTokens:(id)a3;
@end

@implementation CHTokenizedTextResult

- (CHTokenizedTextResult)init
{
  return (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(self, a2, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], @" ", 1, 0);
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 changeableColumnCount:(int64_t)a8 isMinimalDrawingResult:(BOOL)a9 baseWritingDirection:(int)a10 originalTokens:(id)a11
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = v101;
  uint64_t v27 = objc_msgSend_count(v18, v22, v23, v24, v25, v26);
  if (v27 != objc_msgSend_count(v19, v28, v29, v30, v31, v32))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v33 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v97 = objc_msgSend_count(v18, v34, v35, v36, v37, v38);
      __int16 v98 = 2048;
      uint64_t v99 = objc_msgSend_count(v19, v39, v40, v41, v42, v43);
      _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_FAULT, "transcriptionPaths count (%ld) != scores count (%ld)", buf, 0x16u);
    }
  }
  v95.receiver = self;
  v95.super_class = (Class)CHTokenizedTextResult;
  v49 = [(CHTokenizedResult *)&v95 initWithIsMinimalDrawingResult:a9];
  if (v49)
  {
    uint64_t v50 = objc_msgSend_copy(v17, v44, v45, v46, v47, v48);
    tokenColumns = v49->_tokenColumns;
    v49->_tokenColumns = (NSArray *)v50;

    uint64_t v57 = objc_msgSend_copy(v18, v52, v53, v54, v55, v56);
    transcriptionPaths = v49->_transcriptionPaths;
    v49->_transcriptionPaths = (NSArray *)v57;

    uint64_t v64 = objc_msgSend_copy(v19, v59, v60, v61, v62, v63);
    transcriptionPathScores = v49->_transcriptionPathScores;
    v49->_transcriptionPathScores = (NSArray *)v64;

    v49->_recognizerGenerationIdentifier = a7;
    v49->_changeableCount = a8;
    uint64_t v71 = objc_msgSend_copy(v20, v66, v67, v68, v69, v70);
    trailingSeparator = v49->_trailingSeparator;
    v49->_trailingSeparator = (NSString *)v71;

    *(void *)&v49->_baseWritingDirection = a11;
    if (v21)
    {
      uint64_t v78 = objc_msgSend_copy(v21, v73, v74, v75, v76, v77);
      originalTokens = v49->_originalTokens;
      v49->_originalTokens = (NSArray *)v78;
    }
    else
    {
      v80 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v73, v74, v75, v76, v77);
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = sub_1C4A801F0;
      v93[3] = &unk_1E64E3150;
      originalTokens = v80;
      v94 = originalTokens;
      objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v49, v81, (uint64_t)v93, v82, v83, v84);
      uint64_t v90 = objc_msgSend_copy(originalTokens, v85, v86, v87, v88, v89);
      v91 = v49->_originalTokens;
      v49->_originalTokens = (NSArray *)v90;
    }
  }

  return v49;
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 changeableColumnCount:(int64_t)a8 isMinimalDrawingResult:(BOOL)a9 baseWritingDirection:(int)a10
{
  return (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_originalTokens_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, a9, 0, 0);
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 changeableColumnCount:(int64_t)a8
{
  char v9 = 0;
  return (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_originalTokens_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, v9, 0, 0);
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  BOOL v21 = objc_msgSend_count(v12, v16, v17, v18, v19, v20) != 0;
  uint64_t v23 = (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(self, v22, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, a7, v21);

  return v23;
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 recognizerGenerationIdentifier:(int64_t)a6
{
  return (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, @" ", a6);
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 recognizerGenerationIdentifier:(int64_t)a6 isMinimalDrawingResult:(BOOL)a7 baseWritingDirection:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  BOOL v22 = objc_msgSend_count(v14, v17, v18, v19, v20, v21) != 0;
  BOOL v26 = a7;
  isMinimalDrawingResult_baseWritingDirection = (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_(self, v23, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, @" ", a6, v22, v26, v8);

  return isMinimalDrawingResult_baseWritingDirection;
}

- (CHTokenizedTextResult)initWithBestPathTokens:(id)a3 pathProbabilities:(id)a4 trailingSeparator:(id)a5 recognizerGenerationIdentifier:(int64_t)a6
{
  return (CHTokenizedTextResult *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, -1);
}

- (CHTokenizedTextResult)initWithBestPathTokens:(id)a3 pathProbabilities:(id)a4 trailingSeparator:(id)a5 recognizerGenerationIdentifier:(int64_t)a6 changeableColumnCount:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v39 = 0;
  id v40 = 0;
  id v38 = 0;
  sub_1C4A80668((uint64_t)CHTokenizedTextResult, v12, v13, &v40, &v39, &v38);
  id v15 = v40;
  id v16 = v39;
  id v17 = v38;
  if (objc_msgSend_count(v15, v18, v19, v20, v21, v22))
  {
    if (a7 < 1)
    {
      uint64_t v33 = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(self, v23, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v14, a6);
    }
    else
    {
      if (objc_msgSend_count(v15, v23, v24, v25, v26, v27) <= (unint64_t)a7) {
        a7 = objc_msgSend_count(v15, v28, v29, v30, v31, v32);
      }
      uint64_t v33 = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(self, v28, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v14, a6, a7);
    }
    uint64_t v35 = (CHTokenizedTextResult *)v33;
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v34 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_ERROR, "Trying to initialize tokenized text result with no columns. Returning nil instead.", v37, 2u);
    }

    uint64_t v35 = 0;
  }

  return v35;
}

- (id)modifiedResultWithBestPathTokens:(id)a3 pathProbabilities:(id)a4
{
  id v76 = 0;
  id v77 = 0;
  id v75 = 0;
  sub_1C4A80668((uint64_t)CHTokenizedTextResult, a3, a4, &v77, &v76, &v75);
  id v5 = v77;
  id v6 = v76;
  id v7 = v75;
  if (objc_msgSend_count(v5, v8, v9, v10, v11, v12))
  {
    uint64_t v74 = (uint64_t)v6;
    unint64_t v18 = objc_msgSend_changeableTokenColumnCount(self, v13, v14, v15, v16, v17);
    if (v18 >= objc_msgSend_count(v5, v19, v20, v21, v22, v23)) {
      uint64_t v29 = objc_msgSend_count(v5, v24, v25, v26, v27, v28);
    }
    else {
      uint64_t v29 = objc_msgSend_changeableTokenColumnCount(self, v24, v25, v26, v27, v28);
    }
    uint64_t v31 = v29;
    id v32 = objc_alloc((Class)objc_opt_class());
    id v38 = objc_msgSend_trailingSeparator(self, v33, v34, v35, v36, v37);
    uint64_t v44 = objc_msgSend_recognizerGenerationIdentifier(self, v39, v40, v41, v42, v43);
    char isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v45, v46, v47, v48, v49);
    uint64_t v56 = objc_msgSend_baseWritingDirection(self, v51, v52, v53, v54, v55);
    uint64_t v62 = objc_msgSend_originalTokens(self, v57, v58, v59, v60, v61);
    char v73 = isMinimalDrawingResult;
    id v6 = (id)v74;
    isMinimalDrawingResult_baseWritingDirection_originalTokens = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_originalTokens_(v32, v63, (uint64_t)v5, v74, (uint64_t)v7, (uint64_t)v38, v44, v31, v73, v56, v62);

    objc_msgSend_setInputStrokeIdentifiers_(isMinimalDrawingResult_baseWritingDirection_originalTokens, v64, (uint64_t)self->_inputStrokeIdentifiers, v65, v66, v67);
    objc_msgSend_setLocale_(isMinimalDrawingResult_baseWritingDirection_originalTokens, v68, (uint64_t)self->_locale, v69, v70, v71);
  }
  else
  {
    isMinimalDrawingResult_baseWritingDirection_originalTokens = 0;
  }

  return isMinimalDrawingResult_baseWritingDirection_originalTokens;
}

- (CHTokenizedTextResult)initWithCoder:(id)a3
{
  v150[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v147.receiver = self;
  v147.super_class = (Class)CHTokenizedTextResult;
  id v5 = [(CHTokenizedResult *)&v147 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = objc_opt_class();
    objc_msgSend_setClass_forClassName_(v6, v8, v7, @"CHTokenizedTextResultColumn", v9, v10);
    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    unint64_t v18 = objc_msgSend_setWithObjects_(v11, v14, v12, v15, v16, v17, v13, 0);
    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, @"tokenColumns", v20, v21);
    tokenColumns = v5->_tokenColumns;
    v5->_tokenColumns = (NSArray *)v22;

    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v31 = objc_msgSend_setWithObjects_(v24, v27, v25, v28, v29, v30, v26, 0);
    uint64_t v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v31, @"transcriptionPaths", v33, v34);
    transcriptionPaths = v5->_transcriptionPaths;
    v5->_transcriptionPaths = (NSArray *)v35;

    uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v44 = objc_msgSend_setWithObjects_(v37, v40, v38, v41, v42, v43, v39, 0);
    uint64_t v48 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v45, (uint64_t)v44, @"transcriptionPathScores", v46, v47);
    transcriptionPathScores = v5->_transcriptionPathScores;
    v5->_transcriptionPathScores = (NSArray *)v48;

    v5->_recognizerGenerationIdentifier = objc_msgSend_decodeIntegerForKey_(v4, v50, @"recognizerGenerationIdentifier", v51, v52, v53);
    v5->_changeableCount = objc_msgSend_decodeIntegerForKey_(v4, v54, @"changeableTokenColumns", v55, v56, v57);
    uint64_t v58 = objc_opt_class();
    uint64_t v62 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, @"trailingSeparator", v60, v61);
    trailingSeparator = v5->_trailingSeparator;
    v5->_trailingSeparator = (NSString *)v62;

    *(void *)&v5->_baseWritingDirection = objc_msgSend_decodeIntegerForKey_(v4, v64, @"baseWritingDirection", v65, v66, v67);
    v5->_precedingLineBreaks = objc_msgSend_decodeIntegerForKey_(v4, v68, @"precedingLineBreaks", v69, v70, v71);
    v72 = (void *)MEMORY[0x1E4F1CAD0];
    v150[0] = objc_opt_class();
    v150[1] = objc_opt_class();
    id v76 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v73, (uint64_t)v150, 2, v74, v75);
    v81 = objc_msgSend_setWithArray_(v72, v77, (uint64_t)v76, v78, v79, v80);
    uint64_t v85 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v82, (uint64_t)v81, @"inputStrokeIdentifiers", v83, v84);
    inputStrokeIdentifiers = v5->_inputStrokeIdentifiers;
    v5->_inputStrokeIdentifiers = (NSArray *)v85;

    uint64_t v87 = objc_opt_class();
    uint64_t v91 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, @"locale", v89, v90);
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v91;

    v93 = (void *)MEMORY[0x1E4F1CAD0];
    v149[0] = objc_opt_class();
    v149[1] = objc_opt_class();
    uint64_t v97 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v94, (uint64_t)v149, 2, v95, v96);
    v102 = objc_msgSend_setWithArray_(v93, v98, (uint64_t)v97, v99, v100, v101);
    uint64_t v106 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v103, (uint64_t)v102, @"originalTokens", v104, v105);
    originalTokens = v5->_originalTokens;
    v5->_originalTokens = (NSArray *)v106;

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    v108 = v5->_tokenColumns;
    uint64_t v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v109, (uint64_t)&v143, (uint64_t)v148, 16, v110);
    if (v116)
    {
      uint64_t v117 = *(void *)v144;
      while (2)
      {
        for (uint64_t i = 0; i != v116; ++i)
        {
          if (*(void *)v144 != v117) {
            objc_enumerationMutation(v108);
          }
          v119 = objc_msgSend_tokenRows(*(void **)(*((void *)&v143 + 1) + 8 * i), v111, v112, v113, v114, v115);
          BOOL v125 = objc_msgSend_count(v119, v120, v121, v122, v123, v124) == 0;

          if (v125)
          {
            char v126 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v111, (uint64_t)&v143, (uint64_t)v148, 16, v115);
        if (v116) {
          continue;
        }
        break;
      }
    }
    char v126 = 1;
LABEL_12:

    if (!v5->_tokenColumns
      || (v132 = v5->_transcriptionPaths) == 0
      || !v5->_transcriptionPathScores
      || ((uint64_t v133 = objc_msgSend_count(v132, v127, v128, v129, v130, v131),
           v133 == objc_msgSend_count(v5->_transcriptionPathScores, v134, v135, v136, v137, v138))
        ? (char v139 = v126)
        : (char v139 = 0),
          (v139 & 1) == 0))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v140 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v140, OS_LOG_TYPE_ERROR, "CHTokenizedTextResult decoding failed. Token columns, transcription paths, and scores are required to be nonnull and equal in size when constructing a text result", buf, 2u);
      }

      id v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CHTokenizedTextResult;
  [(CHTokenizedResult *)&v38 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_tokenColumns, @"tokenColumns", v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_transcriptionPaths, @"transcriptionPaths", v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_transcriptionPathScores, @"transcriptionPathScores", v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_trailingSeparator, @"trailingSeparator", v15, v16);
  objc_msgSend_encodeInteger_forKey_(v4, v17, self->_recognizerGenerationIdentifier, @"recognizerGenerationIdentifier", v18, v19);
  objc_msgSend_encodeInteger_forKey_(v4, v20, self->_precedingLineBreaks, @"precedingLineBreaks", v21, v22);
  objc_msgSend_encodeInteger_forKey_(v4, v23, self->_changeableCount, @"changeableTokenColumns", v24, v25);
  objc_msgSend_encodeInteger_forKey_(v4, v26, *(void *)&self->_baseWritingDirection, @"baseWritingDirection", v27, v28);
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)self->_inputStrokeIdentifiers, @"inputStrokeIdentifiers", v30, v31);
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)self->_locale, @"locale", v33, v34);
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)self->_originalTokens, @"originalTokens", v36, v37);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHMutableTokenizedTextResult alloc];
  tokenColumns = self->_tokenColumns;
  transcriptionPaths = self->_transcriptionPaths;
  transcriptionPathScores = self->_transcriptionPathScores;
  trailingSeparator = self->_trailingSeparator;
  int64_t recognizerGenerationIdentifier = self->_recognizerGenerationIdentifier;
  int64_t changeableCount = self->_changeableCount;
  char isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v11, v12, v13, v14, v15);
  isMinimalDrawingResult_baseWritingDirection_originalTokens = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_originalTokens_(v4, v16, (uint64_t)tokenColumns, (uint64_t)transcriptionPaths, (uint64_t)transcriptionPathScores, (uint64_t)trailingSeparator, recognizerGenerationIdentifier, changeableCount, isMinimalDrawingResult, *(void *)&self->_baseWritingDirection, self->_originalTokens);
  objc_msgSend_setPrecedingLineBreaks_(isMinimalDrawingResult_baseWritingDirection_originalTokens, v18, self->_precedingLineBreaks, v19, v20, v21);
  objc_msgSend_setInputStrokeIdentifiers_(isMinimalDrawingResult_baseWritingDirection_originalTokens, v22, (uint64_t)self->_inputStrokeIdentifiers, v23, v24, v25);
  objc_msgSend_setLocale_(isMinimalDrawingResult_baseWritingDirection_originalTokens, v26, (uint64_t)self->_locale, v27, v28, v29);
  return isMinimalDrawingResult_baseWritingDirection_originalTokens;
}

- (id)descriptionWithSensitiveInformation:(BOOL)a3
{
  BOOL v6 = a3;
  uint64_t v8 = objc_msgSend_tokenColumns(self, a2, a3, v3, v4, v5);
  uint64_t v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);

  if (v14 == 1) {
    uint64_t v20 = @"column";
  }
  else {
    uint64_t v20 = @"columns";
  }
  uint64_t v21 = objc_msgSend_tokenColumns(self, v15, v16, v17, v18, v19);
  v127 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v21, v22, @", ", (uint64_t)&unk_1F2012D50, v23, v24);

  uint64_t v30 = objc_msgSend_transcriptionPaths(self, v25, v26, v27, v28, v29);
  uint64_t v36 = objc_msgSend_count(v30, v31, v32, v33, v34, v35);

  if (v36 == 1) {
    uint64_t v42 = @"transcriptionPath";
  }
  else {
    uint64_t v42 = @"transcriptionPaths";
  }
  uint64_t v43 = objc_msgSend_transcriptionPaths(self, v37, v38, v39, v40, v41);
  uint64_t v47 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v43, v44, @",\n", (uint64_t)&unk_1F20138C8, v45, v46);

  if (v6)
  {
    uint64_t v53 = objc_msgSend_tokenColumns(self, v48, v49, v50, v51, v52);
    uint64_t v57 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v53, v54, @",\n", (uint64_t)&unk_1F20138E8, v55, v56);

    v129.receiver = self;
    v129.super_class = (Class)CHTokenizedTextResult;
    uint64_t v58 = [(CHTokenizedResult *)&v129 description];
    uint64_t v64 = objc_msgSend_tokenColumns(self, v59, v60, v61, v62, v63);
    uint64_t v70 = objc_msgSend_count(v64, v65, v66, v67, v68, v69);
    uint64_t v76 = objc_msgSend_changeableTokenColumnCount(self, v71, v72, v73, v74, v75);
    uint64_t v82 = objc_msgSend_transcriptionPaths(self, v77, v78, v79, v80, v81);
    uint64_t v88 = objc_msgSend_count(v82, v83, v84, v85, v86, v87);
    v93 = objc_msgSend_stringByAppendingFormat_(v58, v89, @" %ld (%ld changeable) %@ [%@], %ld %@ \n%@ \n%@", v90, v91, v92, v70, v76, v20, v127, v88, v42, v47, v57);
  }
  else
  {
    v128.receiver = self;
    v128.super_class = (Class)CHTokenizedTextResult;
    uint64_t v57 = [(CHTokenizedResult *)&v128 description];
    uint64_t v58 = objc_msgSend_tokenColumns(self, v94, v95, v96, v97, v98);
    uint64_t v104 = objc_msgSend_count(v58, v99, v100, v101, v102, v103);
    uint64_t v110 = objc_msgSend_changeableTokenColumnCount(self, v105, v106, v107, v108, v109);
    uint64_t v64 = objc_msgSend_transcriptionPaths(self, v111, v112, v113, v114, v115);
    uint64_t v121 = objc_msgSend_count(v64, v116, v117, v118, v119, v120);
    v93 = objc_msgSend_stringByAppendingFormat_(v57, v122, @" %ld (%ld changeable) %@ [%@], %ld %@ \n%@", v123, v124, v125, v104, v110, v20, v127, v121, v42, v47);
  }

  return v93;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithSensitiveInformation_(self, a2, 1, v2, v3, v4);
}

- (void)setInputStrokeIdentifiers:(id)a3
{
}

- (id)inputStrokeIdentifiers
{
  return self->_inputStrokeIdentifiers;
}

- (void)setLocale:(id)a3
{
}

- (id)locale
{
  return self->_locale;
}

- (id)tokenColumns
{
  return self->_tokenColumns;
}

- (int64_t)tokenColumnCount
{
  BOOL v6 = objc_msgSend_tokenColumns(self, a2, v2, v3, v4, v5);
  int64_t v12 = objc_msgSend_count(v6, v7, v8, v9, v10, v11);

  return v12;
}

- (int64_t)changeableTokenColumnCount
{
  return self->_changeableCount;
}

- (BOOL)isSingleTokenResult
{
  if (objc_msgSend_tokenColumnCount(self, a2, v2, v3, v4, v5) > 1) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_firstObject(self->_transcriptionPaths, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_tokenCountInTranscriptionPath_(self, v14, (uint64_t)v13, v15, v16, v17);

  return v18 == 1;
}

- (BOOL)shouldFilterSingleCharacterResult
{
  if (qword_1EA3C9EB8 != -1)
  {
    dispatch_once(&qword_1EA3C9EB8, &unk_1F2013908);
    int64_t v12 = objc_msgSend_locale(self, v20, v21, v22, v23, v24);
    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v19 = &stru_1F20141C8;
    goto LABEL_6;
  }
  int64_t v12 = objc_msgSend_locale(self, a2, v2, v3, v4, v5);
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = objc_msgSend_locale(self, v7, v8, v9, v10, v11);
  objc_msgSend_languageCode(v13, v14, v15, v16, v17, v18);
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  if (objc_msgSend_isSingleTokenResult(self, v25, v26, v27, v28, v29)
    && (objc_msgSend_containsObject_((void *)qword_1EA3C9EC0, v30, (uint64_t)v19, v31, v32, v33) & 1) == 0)
  {
    uint64_t v40 = objc_msgSend_topTranscription(self, v34, v35, v36, v37, v38);
    BOOL v46 = (unint64_t)objc_msgSend_length(v40, v41, v42, v43, v44, v45) < 2;

    return v46;
  }
  else
  {

    return 0;
  }
}

- (BOOL)shouldFilterSingleTokenResult
{
  if (!objc_msgSend_isSingleTokenResult(self, a2, v2, v3, v4, v5)) {
    return 0;
  }
  int64_t v12 = objc_msgSend_topTranscription(self, v7, v8, v9, v10, v11);
  unint64_t v18 = objc_msgSend_length(v12, v13, v14, v15, v16, v17);

  if (v18 > 4) {
    return 0;
  }
  uint64_t v24 = objc_msgSend_topTranscription(self, v19, v20, v21, v22, v23);
  uint64_t v30 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v25, v26, v27, v28, v29);
  if (objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v24, v31, (uint64_t)v30, 0, v32, v33) == 1)
  {
    BOOL v39 = 1;
  }
  else
  {
    uint64_t v40 = objc_msgSend_topTranscription(self, v34, v35, v36, v37, v38);
    BOOL v46 = objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E4F28B88], v41, v42, v43, v44, v45);
    BOOL v39 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v40, v47, (uint64_t)v46, 0, v48, v49) == 1;
  }
  uint64_t v55 = objc_msgSend_tokenColumnCount(self, v50, v51, v52, v53, v54);
  objc_msgSend_averageTokenRecognitionScoreForColumnRange_(self, v56, 0, v55, v57, v58);
  double v60 = v59;
  uint64_t v66 = objc_msgSend_firstObject(self->_transcriptionPaths, v61, v62, v63, v64, v65);
  uint64_t v71 = objc_msgSend_inLexiconTokenCountInTranscriptionPath_(self, v67, (uint64_t)v66, v68, v69, v70);

  BOOL v72 = v60 >= 0.85 || v71 == 1;
  return !v72 || v39;
}

- (int64_t)tokenCountInTranscriptionPath:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v10 = objc_msgSend_tokenColumnCount(self, v5, v6, v7, v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4A833CC;
  v14[3] = &unk_1E64E31B8;
  v14[4] = &v15;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v11, (uint64_t)v4, 0, v10, (uint64_t)v14);
  int64_t v12 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (int)baseWritingDirection
{
  return *(void *)&self->_baseWritingDirection;
}

- (double)score
{
  uint64_t v6 = objc_msgSend_firstObject(self->_transcriptionPathScores, a2, v2, v3, v4, v5);
  objc_msgSend_floatValue(v6, v7, v8, v9, v10, v11);
  double v13 = v12;

  return v13;
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
  uint64_t v7 = objc_msgSend_tokenColumns(self, a2, a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, a3, v9, v10, v11);

  uint64_t v18 = objc_msgSend_textTokenRows(v12, v13, v14, v15, v16, v17);

  return v18;
}

- (id)tokensInTranscriptionPath:(id)a3 atColumnIndex:(int64_t)a4
{
  uint64_t v8 = objc_msgSend_indexAtPosition_(a3, a2, a4, a4, v4, v5);
  uint64_t v14 = objc_msgSend_tokenColumns(self, v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v14, v15, a4, v16, v17, v18);

  long long v25 = objc_msgSend_textTokenRows(v19, v20, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v25, v26, v8, v27, v28, v29);

  return v30;
}

- (BOOL)hasTokenAtLocation:(id *)a3
{
  unint64_t var0 = a3->var0;
  if (var0 >= objc_msgSend_count(self->_tokenColumns, a2, (uint64_t)a3, v3, v4, v5)) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v9, a3->var0, v10, v11, v12);
  unint64_t var1 = a3->var1;
  uint64_t v20 = objc_msgSend_textTokenRows(v13, v15, v16, v17, v18, v19);
  unint64_t v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);

  if (var1 >= v26)
  {
    BOOL v44 = 0;
  }
  else
  {
    uint64_t v32 = objc_msgSend_textTokenRows(v13, v27, v28, v29, v30, v31);
    uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v32, v33, a3->var1, v34, v35, v36);

    unint64_t var2 = a3->var2;
    BOOL v44 = var2 < objc_msgSend_count(v37, v39, v40, v41, v42, v43);
  }
  return v44;
}

- (id)tokenAtLocation:(id *)a3
{
  uint64_t v7 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, a2, a3->var0, v3, v4, v5);
  uint64_t v13 = objc_msgSend_textTokenRows(v7, v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(v13, v14, a3->var1, v15, v16, v17);
  uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3->var2, v20, v21, v22);

  return v23;
}

- (int64_t)recognizerGenerationIdentifier
{
  return self->_recognizerGenerationIdentifier;
}

- (int64_t)precedingLineBreaks
{
  return self->_precedingLineBreaks;
}

- (NSString)recognizerDebugDescription
{
  unint64_t v6 = objc_msgSend_recognizerGenerationIdentifier(self, a2, v2, v3, v4, v5);
  if (v6 > 2) {
    return (NSString *)&stru_1F20141C8;
  }
  else {
    return &off_1E64E3580[v6]->isa;
  }
}

- (double)heuristicTextScoreForColumnRange:(_NSRange)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A83A40;
  v7[3] = &unk_1E64E31E0;
  _NSRange v8 = a3;
  v7[4] = &v9;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, a2, (uint64_t)v7, a3.length, v3, v4);
  double v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (double)averageTokenRecognitionScoreForColumnRange:(_NSRange)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (a3.location >= a3.location + a3.length)
  {
    double result = NAN;
  }
  else
  {
    unint64_t v5 = 0;
    double v6 = 0.0;
    NSUInteger v58 = a3.location + a3.length;
    double v59 = self;
    do
    {
      unint64_t v60 = v5;
      NSUInteger location = a3.location;
      uint64_t v7 = objc_msgSend_tokenRowsAtColumnIndex_(self, a2, a3.location, a3.length, v3, v4);
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id obj = v7;
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v69, (uint64_t)v74, 16, v9);
      if (v10)
      {
        uint64_t v63 = *(void *)v70;
        double v11 = 0.0;
        unint64_t v12 = 1;
        do
        {
          uint64_t v13 = 0;
          uint64_t v64 = v10;
          do
          {
            if (*(void *)v70 != v63) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v69 + 1) + 8 * v13);
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v15 = v14;
            unint64_t v18 = 0;
            uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v65, (uint64_t)v73, 16, v17);
            if (v24)
            {
              uint64_t v25 = *(void *)v66;
              double v26 = 0.0;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v66 != v25) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v28 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                  objc_msgSend_recognitionScore(v28, v19, v20, v21, v22, v23);
                  double v30 = v29;
                  uint64_t v36 = objc_msgSend_string(v28, v31, v32, v33, v34, v35);
                  uint64_t v42 = objc_msgSend_length(v36, v37, v38, v39, v40, v41);

                  uint64_t v48 = objc_msgSend_string(v28, v43, v44, v45, v46, v47);
                  uint64_t v54 = objc_msgSend_length(v48, v49, v50, v51, v52, v53);

                  double v26 = v26 + v30 * (double)(unint64_t)v42;
                  v18 += v54;
                }
                uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v19, (uint64_t)&v65, (uint64_t)v73, 16, v23);
              }
              while (v24);
            }
            else
            {
              double v26 = 0.0;
            }

            if (v26 / (double)v18 > v11 / (double)v12)
            {
              double v11 = v26;
              unint64_t v12 = v18;
            }
            ++v13;
          }
          while (v13 != v64);
          uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v69, (uint64_t)v74, 16, v56);
        }
        while (v10);
      }
      else
      {
        double v11 = 0.0;
        unint64_t v12 = 1;
      }

      double v6 = v6 + v11;
      unint64_t v5 = v12 + v60;
      a3.NSUInteger location = location + 1;
      self = v59;
    }
    while (location + 1 != v58);
    double result = v6 / (double)v5;
  }
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (BOOL)hasTextReplacementsInColumnRange:(_NSRange)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A83E70;
  v7[3] = &unk_1E64E31E0;
  _NSRange v8 = a3;
  v7[4] = &v9;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, a2, (uint64_t)v7, a3.length, v3, v4);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (NSString)topTranscription
{
  uint64_t v7 = objc_msgSend_transcriptionPaths(self, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);

  if (!v13
    || (uint64_t v19 = objc_msgSend_length(v13, v14, v15, v16, v17, v18),
        objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v20, (uint64_t)v13, 0, v19, 0),
        (uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v21 = &stru_1F20141C8;
  }

  return (NSString *)v21;
}

- (id)rawTranscriptionPath
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v56 = objc_alloc_init(MEMORY[0x1E4F28D58]);
    unint64_t v6 = 0;
    *(void *)&long long v7 = 134217984;
    long long v55 = v7;
    while (v6 < objc_msgSend_count(*(void **)(a1 + 32), v1, v2, v3, v4, v5, v55))
    {
      double v59 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v8, v6, v9, v10, v11);
      unint64_t v17 = 0;
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v19 = -1;
      unint64_t v58 = v6;
      while (1)
      {
        uint64_t v20 = objc_msgSend_textTokenRows(v59, v12, v13, v14, v15, v16);
        BOOL v26 = v17 < objc_msgSend_count(v20, v21, v22, v23, v24, v25);

        if (!v26) {
          break;
        }
        uint64_t v32 = objc_msgSend_textTokenRows(v59, v27, v28, v29, v30, v31);
        uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v32, v33, v17, v34, v35, v36);

        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v38 = v37;
        unint64_t v41 = 0;
        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v60, (uint64_t)v66, 16, v40);
        if (v47)
        {
          uint64_t v48 = *(void *)v61;
          char isTopOriginal = 1;
          do
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v61 != v48) {
                objc_enumerationMutation(v38);
              }
              uint64_t v51 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              if (isTopOriginal) {
                char isTopOriginal = objc_msgSend_isTopOriginal(*(void **)(*((void *)&v60 + 1) + 8 * i), v42, v43, v44, v45, v46);
              }
              else {
                char isTopOriginal = 0;
              }
              v41 += objc_msgSend_inputSourceModifiersCount(v51, v42, v43, v44, v45, v46);
            }
            uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v42, (uint64_t)&v60, (uint64_t)v66, 16, v46);
          }
          while (v47);
        }
        else
        {
          char isTopOriginal = 1;
        }

        unint64_t v6 = v58;
        if ((isTopOriginal & (v41 < v19)) != 0)
        {
          unint64_t v19 = v41;
          uint64_t v18 = v17;
        }

        ++v17;
      }
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v52 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v55;
          unint64_t v65 = v6;
          _os_log_impl(&dword_1C492D000, v52, OS_LOG_TYPE_FAULT, "Original token not found in column %ld", buf, 0xCu);
        }
      }
      uint64_t v53 = objc_msgSend_indexPathByAddingIndex_(v56, v27, v18, v29, v30, v31);

      ++v6;
      id v56 = (id)v53;
    }
  }
  else
  {
    id v56 = 0;
  }
  return v56;
}

- (NSString)rawTranscription
{
  uint64_t v7 = objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
  _NSRange v8 = -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)self);
  uint64_t v10 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v9, (uint64_t)v8, 0, v7, 0);
  if (v10) {
    uint64_t v11 = (__CFString *)v10;
  }
  else {
    uint64_t v11 = &stru_1F20141C8;
  }

  return (NSString *)v11;
}

- (id)topModelTranscriptionPath
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28D58]);
    unint64_t v7 = 0;
    *(void *)&long long v8 = 134219008;
    long long v83 = v8;
    while (1)
    {
      uint64_t v84 = v6;
      if (v7 >= objc_msgSend_count(*(void **)(a1 + 32), v1, v2, v3, v4, v5, v83)) {
        break;
      }
      unint64_t v86 = v7;
      uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v9, v7, v10, v11, v12);
      unint64_t v19 = 0;
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      double v21 = 0.0;
      unint64_t v22 = 64;
      while (1)
      {
        uint64_t v23 = objc_msgSend_textTokenRows(v18, v13, v14, v15, v16, v17);
        BOOL v29 = v19 < objc_msgSend_count(v23, v24, v25, v26, v27, v28);

        if (!v29) {
          break;
        }
        uint64_t v35 = objc_msgSend_textTokenRows(v18, v30, v31, v32, v33, v34);
        uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(v35, v36, v19, v37, v38, v39);

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v41 = v40;
        unint64_t v44 = 0;
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v87, (uint64_t)v101, 16, v43);
        if (v50)
        {
          uint64_t v51 = *(void *)v88;
          double v52 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v88 != v51) {
                objc_enumerationMutation(v41);
              }
              uint64_t v54 = *(void **)(*((void *)&v87 + 1) + 8 * i);
              objc_msgSend_modelScore(v54, v45, v46, v47, v48, v49);
              double v52 = v52 + v60;
              v44 += objc_msgSend_inputSourceModifiersCount(v54, v55, v56, v57, v58, v59);
            }
            uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v45, (uint64_t)&v87, (uint64_t)v101, 16, v49);
          }
          while (v50);
        }
        else
        {
          double v52 = 0.0;
        }

        uint64_t v66 = objc_msgSend_count(v41, v61, v62, v63, v64, v65);
        double v67 = v52 / (double)(unint64_t)v66;
        if (!v19 || v67 > v21 || (v67 == v21 ? (BOOL v68 = v44 >= v22) : (BOOL v68 = 1), !v68))
        {
          unint64_t v22 = v44;
          double v21 = v52 / (double)(unint64_t)v66;
          uint64_t v20 = v19;
        }

        ++v19;
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        long long v69 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
        {
          uint64_t v75 = objc_msgSend_textTokenRows(v18, v70, v71, v72, v73, v74);
          uint64_t v81 = objc_msgSend_count(v75, v76, v77, v78, v79, v80);
          *(_DWORD *)buf = v83;
          unint64_t v92 = v86;
          __int16 v93 = 2048;
          uint64_t v94 = v81;
          __int16 v95 = 2048;
          double v96 = v21;
          __int16 v97 = 2048;
          uint64_t v98 = 0x7FFFFFFFFFFFFFFFLL;
          __int16 v99 = 2048;
          unint64_t v100 = v22;
          _os_log_impl(&dword_1C492D000, v69, OS_LOG_TYPE_FAULT, "Best token not found in column %ld, rows in column = %ld, bestRowModelScore = %.2f, bestRowIndex = %ld, bestInputSourcesCount = %ld", buf, 0x34u);
        }
      }
      objc_msgSend_indexPathByAddingIndex_(v84, v30, v20, v32, v33, v34);
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      unint64_t v7 = v86 + 1;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (NSString)topModelTranscription
{
  uint64_t v7 = objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
  long long v8 = -[CHTokenizedTextResult topModelTranscriptionPath]_0((uint64_t)self);
  uint64_t v10 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v9, (uint64_t)v8, 0, v7, 0);
  if (v10) {
    uint64_t v11 = (__CFString *)v10;
  }
  else {
    uint64_t v11 = &stru_1F20141C8;
  }

  return (NSString *)v11;
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5
{
  uint64_t v5 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_allowPrecedingSeparator_rejectionRate_tokenProcessingBlock_(self, a2, (uint64_t)a3, a4.location, a4.length, a5, a5, 0, 0, 0);
  return v5;
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 allowPrecedingSeparator:(BOOL)a6
{
  id v6 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_allowPrecedingSeparator_rejectionRate_tokenProcessingBlock_(self, a2, (uint64_t)a3, a4.location, a4.length, a5, a5, a6, 0, 0);
  return v6;
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 excludeGibberish:(BOOL)a6 rejectionRate:(double *)a7 tokenProcessingBlock:(id)a8
{
  long long v8 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_allowPrecedingSeparator_rejectionRate_tokenProcessingBlock_(self, a2, (uint64_t)a3, a4.location, a4.length, a5, a6, 0, a7, a8);
  return v8;
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 excludeGibberish:(BOOL)a6 allowPrecedingSeparator:(BOOL)a7 rejectionRate:(double *)a8 tokenProcessingBlock:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v15 = a3;
  id v16 = a9;
  unint64_t v22 = objc_msgSend_string(MEMORY[0x1E4F28E78], v17, v18, v19, v20, v21);
  uint64_t v67 = 0;
  BOOL v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x4012000000;
  uint64_t v59 = sub_1C4A84BB4;
  double v60 = nullsub_32;
  long long v61 = &unk_1C4CB5C62;
  long long v62 = xmmword_1C4C3B320;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  char v55 = 0;
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  uint64_t v42 = sub_1C4A84BC4;
  uint64_t v43 = &unk_1E64E3208;
  BOOL v51 = a5;
  BOOL v52 = a6;
  uint64_t v47 = &v63;
  uint64_t v48 = v54;
  unint64_t v44 = self;
  BOOL v53 = a7;
  id v23 = v22;
  id v45 = v23;
  uint64_t v49 = &v67;
  id v24 = v16;
  id v46 = v24;
  uint64_t v50 = &v56;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v25, (uint64_t)v15, location, length, (uint64_t)&v40);
  uint64_t v30 = v57 + 6;
  uint64_t v29 = v57[6];
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    *uint64_t v30 = 0;
    v30[1] = 0;
  }
  else
  {
    uint64_t v31 = v57[7];
  }
  uint64_t v37 = objc_msgSend_substringWithRange_(v23, v26, v29, v31, v27, v28, a8, v40, v41, v42, v43, v44);
  if (a8)
  {
    if (objc_msgSend_length(v23, v32, v33, v34, v35, v36)) {
      double v38 = (double)v68[3] / (double)v64[3];
    }
    else {
      double v38 = 0.0;
    }
    *a8 = v38;
  }

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);

  return v37;
}

- (BOOL)shouldFilterOutStringForToken:(id)a3 isGibberish:(BOOL *)a4 shouldPerformStrictFiltering:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v14 = v8;
  if (self->_recognizerGenerationIdentifier != 1)
  {
    if ((objc_msgSend_properties(v8, v9, v10, v11, v12, v13) & 0x10) != 0)
    {
      LOBYTE(v80) = 1;
    }
    else
    {
      objc_msgSend_combinedScore(v14, v74, v75, v76, v77, v78);
      LOBYTE(v80) = v79 < 0.4;
    }
    BOOL v71 = (objc_msgSend_properties(v14, v74, v75, v76, v77, v78) & 4) == 0 && sub_1C4A852CC((uint64_t)self, v14, v5);
    goto LABEL_32;
  }
  if (qword_1EA3C9ED0 != -1) {
    dispatch_once(&qword_1EA3C9ED0, &unk_1F2013928);
  }
  unint64_t v15 = objc_msgSend_properties(v14, v9, v10, v11, v12, v13);
  uint64_t v21 = objc_msgSend_string(v14, v16, v17, v18, v19, v20);
  unint64_t v27 = objc_msgSend_length(v21, v22, v23, v24, v25, v26);

  double v33 = 1.0;
  if (v27 <= 2)
  {
    uint64_t v34 = objc_msgSend_string(v14, v28, v29, v30, v31, v32);
    uint64_t v39 = objc_msgSend_rangeOfCharacterFromSet_(v34, v35, qword_1EA3C9ED8, v36, v37, v38);

    if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
      double v33 = 1.5;
    }
    else {
      double v33 = 2.0;
    }
  }
  objc_msgSend_recognitionScore(v14, v28, v29, v30, v31, v32);
  double v41 = v40;
  if ((objc_msgSend_properties(v14, v42, v43, v44, v45, v46) & 4) == 0)
  {
    BOOL v52 = objc_msgSend_string(v14, v47, v48, v49, v50, v51);
    char v58 = objc_msgSend_properties(v14, v53, v54, v55, v56, v57);
    uint64_t v63 = objc_msgSend_stringByTrimmingCharactersInSet_(v52, v59, qword_1EA3C9EC8, v60, v61, v62);
    uint64_t v69 = objc_msgSend_length(v63, v64, v65, v66, v67, v68);

    BOOL v70 = sub_1C4A852CC((uint64_t)self, v14, v5);
    BOOL v71 = v70;
    if ((v58 & 8) == 0 || v69)
    {
      BOOL v73 = 0;
      BOOL v72 = 0;
      if ((v58 & 8) != 0 && v69)
      {
        BOOL v73 = 0;
        BOOL v72 = v41 > v33 * 0.8;
      }
    }
    else
    {
      BOOL v72 = 0;
      BOOL v73 = v41 > v33 * 0.4;
    }
    int v82 = (v58 & 8) == 0 || v70;
    if (v82 == 1)
    {
      BOOL v83 = v41 > v33 * 0.1;
      if (!v73)
      {
LABEL_27:
        int v81 = v72 || v83;
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      BOOL v83 = 0;
      if (!v73) {
        goto LABEL_27;
      }
    }
    int v81 = 1;
    goto LABEL_30;
  }
  BOOL v71 = 0;
  int v81 = v41 > v33 * 0.8;
LABEL_31:
  int v80 = v81 | (v15 >> 4) & 1;
LABEL_32:
  if (a4) {
    *a4 = v71;
  }

  return v80;
}

- (int64_t)inLexiconTokenCountInTranscriptionPath:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v10 = objc_msgSend_tokenColumnCount(self, v5, v6, v7, v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4A856A0;
  v14[3] = &unk_1E64E31B8;
  v14[4] = &v15;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v11, (uint64_t)v4, 0, v10, (uint64_t)v14);
  int64_t v12 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (BOOL)isNonTextCandidateTranscriptionWithStrictFiltering:(BOOL)a3
{
  BOOL v106 = a3;
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_topTranscription(self, a2, a3, v3, v4, v5);
  uint64_t v13 = objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v8, v9, v10, v11, v12);
  objc_msgSend_stringByTrimmingCharactersInSet_(v7, v14, (uint64_t)v13, v15, v16, v17);
  uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();

  BOOL v19 = isStringRepeatedSameCharacter((NSString *)v7) || isStringRepeatedSameCharacter(v18);
  BOOL v25 = isStringAllZerosInDigits((NSString *)v7) || isStringAllZerosInDigits(v18);
  BOOL v31 = isStringAllCircleTextPatterns((NSString *)v7, v20, v21, v22, v23, v24)
     || isStringAllCircleTextPatterns(v18, v26, v27, v28, v29, v30);
  BOOL v37 = isStringAllSymbolCharacters((NSString *)v7, v26, v27, v28, v29, v30)
     || isStringAllSymbolCharacters(v18, v32, v33, v34, v35, v36);
  if (objc_msgSend_shouldFilterSingleCharacterResult(self, v32, v33, v34, v35, v36))
  {
    char shouldFilterSingleTokenResult = 1;
    if (!v106) {
      goto LABEL_21;
    }
  }
  else
  {
    char shouldFilterSingleTokenResult = objc_msgSend_shouldFilterSingleTokenResult(self, v38, v39, v40, v41, v42);
    if (!v106) {
      goto LABEL_21;
    }
  }
  if ((unint64_t)objc_msgSend_length(v18, v38, v39, v40, v41, v42) > 4)
  {
LABEL_21:
    BOOL v53 = 0;
    if ((shouldFilterSingleTokenResult & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  uint64_t v44 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v38, v39, v40, v41, v42);
  uint64_t v105 = v18;
  if (objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v18, v45, (uint64_t)v44, 0, v46, v47) == 1)
  {
    BOOL v53 = 1;

    if ((shouldFilterSingleTokenResult & 1) == 0) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v64 = objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E4F28B88], v48, v49, v50, v51, v52);
    BOOL v53 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v105, v65, (uint64_t)v64, 0, v66, v67) == 1;

    uint64_t v18 = v105;
    if ((shouldFilterSingleTokenResult & 1) == 0)
    {
LABEL_22:
      uint64_t v54 = objc_msgSend_length(v18, v38, v39, v40, v41, v42);
      int v55 = v31 || v25 || v19;
      if (v54 == 1) {
        int v55 = 1;
      }
      if ((v55 | (v53 || v37)) == 1) {
        goto LABEL_25;
      }
      if (doesStringContainDataDetectorEntries(v7, 0))
      {
        BOOL v57 = 0;
        goto LABEL_30;
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v128 = 0x2020000000;
      char v129 = 0;
      uint64_t v121 = 0;
      uint64_t v122 = &v121;
      uint64_t v123 = 0x2020000000;
      uint64_t v124 = 0;
      uint64_t v117 = 0;
      uint64_t v118 = &v117;
      uint64_t v119 = 0x2020000000;
      uint64_t v120 = 0;
      uint64_t v113 = 0;
      uint64_t v114 = &v113;
      uint64_t v115 = 0x2020000000;
      uint64_t v116 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = &v109;
      uint64_t v111 = 0x2020000000;
      uint64_t v112 = 0;
      uint64_t v68 = objc_msgSend_transcriptionPaths(self, v59, v60, v61, v62, v63);
      uint64_t v74 = objc_msgSend_firstObject(v68, v69, v70, v71, v72, v73);

      uint64_t v80 = objc_msgSend_tokenColumnCount(self, v75, v76, v77, v78, v79);
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = sub_1C4A85D74;
      v107[3] = &unk_1E64E3230;
      v107[4] = self;
      v107[5] = &v109;
      BOOL v108 = v106;
      v107[6] = &buf;
      v107[7] = &v121;
      v107[8] = &v117;
      v107[9] = &v113;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v81, (uint64_t)v74, 0, v80, (uint64_t)v107);
      uint64_t v87 = v110[3];
      BOOL v88 = v87 >= 1 && (double)v122[3] / (double)v87 > 0.6;
      uint64_t v89 = v118[3];
      uint64_t v90 = objc_msgSend_tokenColumnCount(self, v82, v83, v84, v85, v86);
      objc_msgSend_averageTokenRecognitionScoreForColumnRange_(self, v91, 0, v90, v92, v93);
      uint64_t v100 = v110[3];
      if (v100 < 1)
      {
        BOOL v101 = 0;
      }
      else
      {
        BOOL v101 = v99 < 0.85 && (double)v114[3] / (double)v100 >= 0.5;
        if (v100 == 1 && v99 < 0.85)
        {
          if ((unint64_t)objc_msgSend_length(v7, v94, v95, v96, v97, v98) < 3) {
            goto LABEL_58;
          }
          uint64_t v102 = v118[3];
          if (v102 == 1 || !v106)
          {
            if (v102 != 1) {
              goto LABEL_57;
            }
LABEL_58:
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            uint64_t v104 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t v125 = 138739971;
              char v126 = v7;
              _os_log_impl(&dword_1C492D000, v104, OS_LOG_TYPE_DEBUG, "CHTokenizedTextResult is nontext candidate due to invalid invalid or out of lexicon tokens in transcription: %{sensitive}@.", v125, 0xCu);
            }

            BOOL v57 = 1;
            goto LABEL_63;
          }
LABEL_51:
          if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
            char v103 = 1;
          }
          else {
            char v103 = v88;
          }
          if ((v103 & 1) == 0 && v87 != v89 && !v101) {
            goto LABEL_57;
          }
          goto LABEL_58;
        }
      }
      if (!v106)
      {
LABEL_57:
        BOOL v57 = 0;
LABEL_63:

        _Block_object_dispose(&v109, 8);
        _Block_object_dispose(&v113, 8);
        _Block_object_dispose(&v117, 8);
        _Block_object_dispose(&v121, 8);
        _Block_object_dispose(&buf, 8);
        goto LABEL_30;
      }
      goto LABEL_51;
    }
  }
LABEL_25:
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v56 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138739971;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C492D000, v56, OS_LOG_TYPE_DEBUG, "CHTokenizedTextResult is nontext candidate due to invalid patterns in topTranscription: %{sensitive}@.", (uint8_t *)&buf, 0xCu);
  }

  BOOL v57 = 1;
LABEL_30:

  return v57;
}

- (BOOL)isPathOriginal:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v10 = objc_msgSend_tokenColumnCount(self, v5, v6, v7, v8, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4A86014;
  v13[3] = &unk_1E64E31B8;
  v13[4] = &v14;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v11, (uint64_t)v4, 0, v10, (uint64_t)v13);
  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

- (BOOL)hasValidPrincipalLinesForPath:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v10 = objc_msgSend_tokenColumnCount(self, v5, v6, v7, v8, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4A8617C;
  v13[3] = &unk_1E64E31B8;
  v13[4] = &v14;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v11, (uint64_t)v4, 0, v10, (uint64_t)v13);
  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

- (BOOL)transcriptionPathsHaveSameSegmentation:(id)a3 otherPath:(id)a4
{
  uint64_t v110 = self;
  id v5 = a3;
  id v111 = a4;
  uint64_t v11 = objc_msgSend_length(v5, v6, v7, v8, v9, v10);
  if (v11 == objc_msgSend_length(v111, v12, v13, v14, v15, v16))
  {
    for (unint64_t i = 0; i < objc_msgSend_length(v5, v17, v18, v19, v20, v21, v110); ++i)
    {
      uint64_t v27 = objc_msgSend_tokenRowsAtColumnIndex_(v110, v23, i, v24, v25, v26);
      uint64_t v32 = objc_msgSend_indexAtPosition_(v5, v28, i, v29, v30, v31);
      uint64_t v37 = objc_msgSend_indexAtPosition_(v111, v33, i, v34, v35, v36);
      uint64_t v42 = objc_msgSend_objectAtIndexedSubscript_(v27, v38, v32, v39, v40, v41);
      uint64_t v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);
      BOOL v53 = objc_msgSend_objectAtIndexedSubscript_(v27, v49, v37, v50, v51, v52);
      uint64_t v59 = objc_msgSend_count(v53, v54, v55, v56, v57, v58);

      if (v48 != v59)
      {
LABEL_10:

        goto LABEL_11;
      }
      unint64_t v64 = 0;
      while (1)
      {
        uint64_t v65 = objc_msgSend_objectAtIndexedSubscript_(v27, v60, v32, v61, v62, v63);
        unint64_t v71 = objc_msgSend_count(v65, v66, v67, v68, v69, v70);

        if (v64 >= v71) {
          break;
        }
        uint64_t v76 = objc_msgSend_objectAtIndexedSubscript_(v27, v72, v32, v73, v74, v75);
        int v81 = objc_msgSend_objectAtIndexedSubscript_(v76, v77, v64, v78, v79, v80);
        uint64_t v87 = objc_msgSend_strokeIndexes(v81, v82, v83, v84, v85, v86);

        uint64_t v92 = objc_msgSend_objectAtIndexedSubscript_(v27, v88, v37, v89, v90, v91);
        uint64_t v97 = objc_msgSend_objectAtIndexedSubscript_(v92, v93, v64, v94, v95, v96);
        char v103 = objc_msgSend_strokeIndexes((void *)v97, v98, v99, v100, v101, v102);

        LOBYTE(v97) = objc_msgSend_isEqualToIndexSet_(v87, v104, (uint64_t)v103, v105, v106, v107);
        ++v64;
        if ((v97 & 1) == 0) {
          goto LABEL_10;
        }
      }
    }
    BOOL v108 = 1;
  }
  else
  {
LABEL_11:
    BOOL v108 = 0;
  }

  return v108;
}

- (id)precedingSeparatorForTopTranscriptionPath
{
  uint64_t v7 = objc_msgSend_transcriptionPaths(self, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);

  if (v13)
  {
    uint64_t v18 = objc_msgSend_indexAtPosition_(v13, v14, 0, v15, v16, v17);
    uint64_t v24 = objc_msgSend_tokenColumns(self, v19, v20, v21, v22, v23);
    uint64_t v30 = objc_msgSend_firstObject(v24, v25, v26, v27, v28, v29);

    uint64_t v36 = objc_msgSend_textTokenRows(v30, v31, v32, v33, v34, v35);
    uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(v36, v37, v18, v38, v39, v40);

    uint64_t v47 = objc_msgSend_firstObject(v41, v42, v43, v44, v45, v46);
    objc_msgSend_precedingSeparatorForToken_(self, v48, (uint64_t)v47, v49, v50, v51);
    uint64_t v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v52 = &stru_1F20141C8;
  }

  return v52;
}

- (id)precedingSeparatorForRawTranscriptionPath
{
  uint64_t v3 = -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)self);
  if (objc_msgSend_length(v3, v4, v5, v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_indexAtPosition_(v3, v9, 0, v10, v11, v12);
    uint64_t v19 = objc_msgSend_tokenColumns(self, v14, v15, v16, v17, v18);
    uint64_t v25 = objc_msgSend_firstObject(v19, v20, v21, v22, v23, v24);

    uint64_t v31 = objc_msgSend_textTokenRows(v25, v26, v27, v28, v29, v30);
    uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(v31, v32, v13, v33, v34, v35);

    uint64_t v42 = objc_msgSend_firstObject(v36, v37, v38, v39, v40, v41);
    objc_msgSend_precedingSeparatorForToken_(self, v43, (uint64_t)v42, v44, v45, v46);
    uint64_t v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v47 = &stru_1F20141C8;
  }

  return v47;
}

- (id)precedingSeparatorForToken:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_precedingLineBreaks(self, v5, v6, v7, v8, v9) >= 1)
  {
    uint64_t v15 = objc_msgSend_tokenColumns(self, v10, v11, v12, v13, v14);
    uint64_t v21 = objc_msgSend_firstObject(v15, v16, v17, v18, v19, v20);

    if (objc_msgSend_containsStartingTokenEquivalentToToken_(v21, v22, (uint64_t)v4, v23, v24, v25))
    {
      uint64_t v31 = objc_msgSend_precedingLineBreaks(self, v26, v27, v28, v29, v30);
      objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(&stru_1F20141C8, v32, v31, @"\n", 0, v33);
      uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v34) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  if ((objc_msgSend_properties(v4, v10, v11, v12, v13, v14) & 0x20) != 0) {
    uint64_t v34 = @" ";
  }
  else {
    uint64_t v34 = &stru_1F20141C8;
  }
LABEL_9:

  return v34;
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
      uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v8, location, v9, v10, v11);
      uint64_t v19 = objc_msgSend_strokeIndexes(v13, v14, v15, v16, v17, v18);
      objc_msgSend_addIndexes_(v12, v20, (uint64_t)v19, v21, v22, v23);

      ++location;
      --length;
    }
    while (length);
  }
  return v12;
}

- (id)strokeIndexSetsInPath:(id)a3 columnRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v16 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  if (location < location + length)
  {
    do
    {
      uint64_t v17 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(self, v13, (uint64_t)v7, location, v14, v15);
      uint64_t v18 = sub_1C4A86A34((uint64_t)CHTokenizedTextResult, v17);
      objc_msgSend_addObjectsFromArray_(v16, v19, (uint64_t)v18, v20, v21, v22);

      ++location;
      --length;
    }
    while (length);
  }

  return v16;
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
    uint64_t v25 = objc_msgSend_textTokenRows(v19, v20, v21, v22, v23, v24);
    uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
    BOOL v8 = v31 != 0;

    uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v32, 0, v33, v34, v35);
    uint64_t v42 = objc_msgSend_textTokenRows(v36, v37, v38, v39, v40, v41);
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
      uint64_t v61 = objc_msgSend_textTokenRows(v55, v56, v57, v58, v59, v60);
      uint64_t v66 = objc_msgSend_objectAtIndexedSubscript_(v61, v62, 0, v63, v64, v65);
      BOOL v8 = objc_msgSend_count(v66, v67, v68, v69, v70, v71) != 0;

      uint64_t v76 = objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v72, 0, v73, v74, v75);
      int v82 = objc_msgSend_textTokenRows(v76, v77, v78, v79, v80, v81);
      objc_msgSend_count(v82, v83, v84, v85, v86, v87);
    }
    objc_msgSend_count(self->_tokenColumns, v49, v50, v51, v52, v53);
  }
  return v8;
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

- (BOOL)isValid
{
  int hasValidColumns = objc_msgSend_hasValidColumns(self, a2, v2, v3, v4, v5);
  if (hasValidColumns)
  {
    LOBYTE(hasValidColumns) = MEMORY[0x1F4181798](self, sel_hasValidPaths, v8, v9, v10, v11);
  }
  return hasValidColumns;
}

- (id)tokensFromTranscriptionPath:(id)a3 characterRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend_tokenColumnCount(self, v14, v15, v16, v17, v18);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1C4A87294;
  v23[3] = &unk_1E64E3258;
  uint64_t v25 = v28;
  NSUInteger v26 = location;
  NSUInteger v27 = length;
  id v20 = v13;
  id v24 = v20;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v21, (uint64_t)v7, 0, v19, (uint64_t)v23);

  _Block_object_dispose(v28, 8);
  return v20;
}

- (id)tokensAlignedWithStrokes:(id)a3 transcriptionPath:(id)a4 strokeProvider:(id)a5
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v122 = a5;
  uint64_t v15 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_tokenColumnCount(self, v16, v17, v18, v19, v20);
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = sub_1C4A87C00;
  v136[3] = &unk_1E64E3150;
  uint64_t v22 = v15;
  uint64_t v137 = v22;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v23, (uint64_t)v9, 0, v21, (uint64_t)v136);
  if (v8)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_msgSend_inputStrokeIdentifiers(self, v24, v25, v26, v27, v28);
    uint64_t v121 = objc_msgSend_setWithArray_(v29, v31, (uint64_t)v30, v32, v33, v34);

    uint64_t v39 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], v35, (uint64_t)v8, v36, v37, v38);
    objc_msgSend_intersectSet_(v39, v40, (uint64_t)v121, v41, v42, v43);
    if (objc_msgSend_count(v39, v44, v45, v46, v47, v48))
    {
      uint64_t v120 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v49, v50, v51, v52, v53);
      uint64_t v59 = objc_msgSend_inputStrokeIdentifiers(self, v54, v55, v56, v57, v58);
      v133[0] = MEMORY[0x1E4F143A8];
      v133[1] = 3221225472;
      v133[2] = sub_1C4A87C0C;
      v133[3] = &unk_1E64E32A8;
      id v134 = v39;
      id v60 = v120;
      id v135 = v60;
      objc_msgSend_enumerateObjectsUsingBlock_(v59, v61, (uint64_t)v133, v62, v63, v64);

      uint64_t v70 = objc_msgSend_originalTokens(self, v65, v66, v67, v68, v69);
      BOOL v71 = sub_1C4A873D4((uint64_t)CHTokenizedTextResult, v60, v70);

      if (((!v71 | sub_1C4A873D4((uint64_t)CHTokenizedTextResult, v60, v22)) & 1) == 0)
      {
        v132[0] = 0;
        v132[1] = v132;
        v132[2] = 0x2020000000;
        v132[3] = 0;
        uint64_t v77 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v72, v73, v74, v75, v76);
        v129[0] = MEMORY[0x1E4F143A8];
        v129[1] = 3221225472;
        v129[2] = sub_1C4A87CB4;
        v129[3] = &unk_1E64E32D0;
        uint64_t v131 = v132;
        v129[4] = self;
        id v78 = v77;
        id v130 = v78;
        objc_msgSend_enumerateObjectsUsingBlock_(v22, v79, (uint64_t)v129, v80, v81, v82);
        uint64_t v88 = objc_msgSend_count(v78, v83, v84, v85, v86, v87);
        if (v88 == objc_msgSend_count(v22, v89, v90, v91, v92, v93))
        {
          uint64_t v99 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v94, v95, v96, v97, v98);
          v123[0] = MEMORY[0x1E4F143A8];
          v123[1] = 3221225472;
          v123[2] = sub_1C4A88064;
          v123[3] = &unk_1E64E3320;
          id v124 = v60;
          id v100 = v99;
          id v125 = v100;
          id v126 = v78;
          v127 = self;
          id v128 = v122;
          objc_msgSend_enumerateObjectsUsingBlock_(v22, v101, (uint64_t)v123, v102, v103, v104);
          uint64_t v105 = v100;

          uint64_t v22 = v105;
        }
        else
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v105 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
          {
            uint64_t v111 = objc_msgSend_count(v78, v106, v107, v108, v109, v110);
            uint64_t v117 = objc_msgSend_count(v22, v112, v113, v114, v115, v116);
            *(_DWORD *)long long buf = 134218240;
            uint64_t v139 = v111;
            __int16 v140 = 2048;
            uint64_t v141 = v117;
            _os_log_impl(&dword_1C492D000, v105, OS_LOG_TYPE_FAULT, "The number of elements between tokensToOriginalTokenIndexes (%ld) and mutableTokensArray (%ld) is not matching", buf, 0x16u);
          }
        }

        _Block_object_dispose(v132, 8);
      }
    }
  }
  uint64_t v118 = objc_msgSend_copy(v22, v24, v25, v26, v27, v28);

  return v118;
}

- (id)tokenizedResultWithFilteredPaths:(double)a3
{
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v10 = objc_msgSend_firstObject(self->_transcriptionPaths, a2, v3, v4, v5, v6);
  uint64_t v15 = objc_msgSend_arrayWithObject_(v9, v11, (uint64_t)v10, v12, v13, v14);

  uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v22 = objc_msgSend_firstObject(self->_transcriptionPathScores, v17, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_arrayWithObject_(v16, v23, (uint64_t)v22, v24, v25, v26);

  uint64_t v33 = objc_msgSend_firstObject(self->_transcriptionPathScores, v28, v29, v30, v31, v32);
  objc_msgSend_doubleValue(v33, v34, v35, v36, v37, v38);
  double v40 = v39;

  double v46 = v40 * a3;
  for (unint64_t i = 1; i < objc_msgSend_count(self->_transcriptionPathScores, v41, v42, v43, v44, v45); ++i)
  {
    uint64_t v52 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPathScores, v48, i, v49, v50, v51);
    objc_msgSend_doubleValue(v52, v53, v54, v55, v56, v57);
    double v59 = v58;

    if (v59 <= v46) {
      break;
    }
    uint64_t v64 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v60, i, v61, v62, v63);
    objc_msgSend_addObject_(v15, v65, (uint64_t)v64, v66, v67, v68);

    uint64_t v73 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPathScores, v69, i, v70, v71, v72);
    objc_msgSend_addObject_(v27, v74, (uint64_t)v73, v75, v76, v77);
  }
  id v78 = [CHMutableTokenizedTextResult alloc];
  tokenColumns = self->_tokenColumns;
  trailingSeparator = self->_trailingSeparator;
  int64_t recognizerGenerationIdentifier = self->_recognizerGenerationIdentifier;
  int64_t changeableCount = self->_changeableCount;
  char isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v83, v84, v85, v86, v87);
  isMinimalDrawingResult_baseWritingDirection = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_(v78, v88, (uint64_t)tokenColumns, (uint64_t)v15, (uint64_t)v27, (uint64_t)trailingSeparator, recognizerGenerationIdentifier, changeableCount, isMinimalDrawingResult, *(void *)&self->_baseWritingDirection);
  uint64_t v95 = objc_msgSend_count(v27, v90, v91, v92, v93, v94);
  objc_msgSend_trimTokensToTranscriptionPathCount_(isMinimalDrawingResult_baseWritingDirection, v96, v95, v97, v98, v99);

  return isMinimalDrawingResult_baseWritingDirection;
}

+ (id)resultRestoringRawPathInResult:(id)a3
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v9 = objc_msgSend_tokenColumns(v3, v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_indexesOfObjectsPassingTest_(v9, v10, (uint64_t)&unk_1F2013948, v11, v12, v13);

  v153 = v14;
  if (objc_msgSend_count(v14, v15, v16, v17, v18, v19))
  {
    uint64_t v25 = objc_msgSend_mutableCopy(v3, v20, v21, v22, v23, v24);
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v32 = objc_msgSend_tokenColumns(v25, v27, v28, v29, v30, v31);
    uint64_t v37 = objc_msgSend_arrayWithArray_(v26, v33, (uint64_t)v32, v34, v35, v36);

    v163[0] = MEMORY[0x1E4F143A8];
    v163[1] = 3221225472;
    v163[2] = sub_1C4A8924C;
    v163[3] = &unk_1E64E29C8;
    id v164 = v3;
    id v38 = v37;
    id v165 = v38;
    objc_msgSend_enumerateIndexesUsingBlock_(v14, v39, (uint64_t)v163, v40, v41, v42);
    objc_msgSend_setTokenColumns_(v25, v43, (uint64_t)v38, v44, v45, v46);
  }
  else
  {
    uint64_t v25 = 0;
  }
  if (v25) {
    uint64_t v47 = v25;
  }
  else {
    uint64_t v47 = v3;
  }
  id v48 = v47;

  uint64_t v49 = -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v48);
  uint64_t v55 = objc_msgSend_transcriptionPaths(v48, v50, v51, v52, v53, v54);
  uint64_t v60 = objc_msgSend_indexOfObjectIdenticalTo_(v55, v56, (uint64_t)v49, v57, v58, v59);

  if (v60 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v66 = 0;
LABEL_9:
    if (v66 < objc_msgSend_tokenColumnCount(v48, v61, v62, v63, v64, v65))
    {
      uint64_t v67 = objc_msgSend_indexAtPosition_(v49, v61, v66, v63, v64, v65);
      long long v161 = 0u;
      long long v162 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      uint64_t v73 = objc_msgSend_transcriptionPaths(v48, v68, v69, v70, v71, v72);
      uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v159, (uint64_t)v166, 16, v75);
      if (v80)
      {
        uint64_t v81 = *(void *)v160;
        while (2)
        {
          for (uint64_t i = 0; i != v80; ++i)
          {
            if (*(void *)v160 != v81) {
              objc_enumerationMutation(v73);
            }
            if (objc_msgSend_indexAtPosition_(*(void **)(*((void *)&v159 + 1) + 8 * i), v76, v66, v77, v78, v79) == v67)
            {

              ++v66;
              goto LABEL_9;
            }
          }
          uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v76, (uint64_t)&v159, (uint64_t)v166, 16, v79);
          if (v80) {
            continue;
          }
          break;
        }
      }

      if (!v25) {
        uint64_t v25 = objc_msgSend_mutableCopy(v3, v83, v84, v85, v86, v87);
      }
      uint64_t v88 = objc_msgSend_transcriptionPaths(v25, v83, v84, v85, v86, v87);
      uint64_t v94 = objc_msgSend_mutableCopy(v88, v89, v90, v91, v92, v93);

      id v100 = objc_msgSend_transcriptionPathScores(v25, v95, v96, v97, v98, v99);
      uint64_t v106 = objc_msgSend_mutableCopy(v100, v101, v102, v103, v104, v105);

      objc_msgSend_addObject_(v94, v107, (uint64_t)v49, v108, v109, v110);
      uint64_t v155 = 0;
      v156 = (double *)&v155;
      uint64_t v157 = 0x2020000000;
      uint64_t v158 = 0x3FF0000000000000;
      uint64_t v116 = objc_msgSend_tokenColumnCount(v25, v111, v112, v113, v114, v115);
      v154[0] = MEMORY[0x1E4F143A8];
      v154[1] = 3221225472;
      v154[2] = sub_1C4A896A8;
      v154[3] = &unk_1E64E31B8;
      v154[4] = &v155;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v25, v117, (uint64_t)v49, 0, v116, (uint64_t)v154);
      uint64_t v123 = objc_msgSend_numberWithDouble_(NSNumber, v118, v119, v120, v121, v122, v156[3]);
      objc_msgSend_addObject_(v106, v124, (uint64_t)v123, v125, v126, v127);

      objc_msgSend_setTranscriptionPaths_scores_(v25, v128, (uint64_t)v94, (uint64_t)v106, v129, v130);
      _Block_object_dispose(&v155, 8);
    }
  }
  if (v25)
  {
    uint64_t v131 = objc_msgSend_copy(v25, v61, v62, v63, v64, v65);

    uint64_t v137 = objc_msgSend_inputStrokeIdentifiers(v48, v132, v133, v134, v135, v136);
    objc_msgSend_setInputStrokeIdentifiers_(v131, v138, (uint64_t)v137, v139, v140, v141);

    objc_super v147 = objc_msgSend_locale(v48, v142, v143, v144, v145, v146);
    objc_msgSend_setLocale_(v131, v148, (uint64_t)v147, v149, v150, v151);
  }
  else
  {
    uint64_t v131 = v3;
  }

  return v131;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)languageFitnessForLocale:(id)a3 recognitionMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v12 = objc_msgSend_transcriptionPaths(self, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_firstObject(v12, v13, v14, v15, v16, v17);

  if (!v18)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v19 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_FAULT, "Error: Tokenized text result without any transcription path encountered when computing language fitness.", buf, 2u);
    }
  }
  id v20 = v18;
  id v21 = v6;
  if (!self)
  {
    double v31 = 0.0;
    goto LABEL_21;
  }
  uint64_t v22 = objc_opt_class();
  double v31 = -10.0;
  if (objc_msgSend_isLocaleSupported_withMode_(v22, v23, (uint64_t)v21, v4, v24, v25))
  {
    if (self->_recognizerGenerationIdentifier != 1)
    {
      double v31 = sub_1C4A8A650(self, v20);
      goto LABEL_21;
    }
    uint64_t v122 = 0;
    uint64_t v123 = (double *)&v122;
    uint64_t v124 = 0x2020000000;
    uint64_t v125 = 0;
    uint64_t v118 = 0;
    uint64_t v119 = &v118;
    uint64_t v120 = 0x2020000000;
    uint64_t v121 = 0;
    uint64_t v32 = objc_msgSend_languageCode(v21, v26, v27, v28, v29, v30);
    if (objc_msgSend_hasPrefix_(v32, v33, @"zh", v34, v35, v36))
    {
    }
    else
    {
      uint64_t v46 = objc_msgSend_languageCode(v21, v37, v38, v39, v40, v41);
      int hasPrefix = objc_msgSend_hasPrefix_(v46, v47, @"yue", v48, v49, v50);

      if (!hasPrefix)
      {
        char v60 = 0;
        uint64_t v59 = 0;
        goto LABEL_16;
      }
    }
    uint64_t v53 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v42, @"en_US", v43, v44, v45);
    uint64_t v59 = objc_msgSend_exemplarCharacterSet(v53, v54, v55, v56, v57, v58);

    char v60 = 1;
LABEL_16:
    uint64_t v114 = 0;
    uint64_t v115 = (double *)&v114;
    uint64_t v116 = 0x2020000000;
    uint64_t v117 = 0;
    uint64_t v110 = 0;
    uint64_t v111 = &v110;
    uint64_t v112 = 0x2020000000;
    uint64_t v113 = 0;
    v108[0] = 0;
    v108[1] = v108;
    v108[2] = 0x2020000000;
    char v109 = 0;
    uint64_t v104 = 0;
    uint64_t v105 = &v104;
    uint64_t v106 = 0x2020000000;
    uint64_t v107 = 0;
    uint64_t v61 = objc_msgSend_length(v20, v42, v52, v43, v44, v45);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v92 = 3221225472;
    uint64_t v93 = sub_1C4A8A820;
    uint64_t v94 = &unk_1E64E33D8;
    id v95 = v21;
    id v62 = v59;
    id v96 = v62;
    uint64_t v97 = &v122;
    char v103 = v60;
    uint64_t v98 = &v114;
    uint64_t v99 = v108;
    id v100 = &v110;
    uint64_t v101 = &v104;
    uint64_t v102 = &v118;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v63, (uint64_t)v20, 0, v61, (uint64_t)buf);
    uint64_t v64 = v123;
    double v65 = v123[3] / (double)v119[3];
    v123[3] = v65;
    uint64_t v66 = v111[3];
    if (v66 >= 1)
    {
      double v65 = v65 - v115[3] / (double)v66;
      v64[3] = v65;
    }
    uint64_t v67 = v105[3];
    BOOL v68 = v67 <= 1;
    uint64_t v69 = v67 - 1;
    if (!v68)
    {
      double v65 = v65 + pow((double)v69, 1.6) * -0.25;
      v64[3] = v65;
    }
    double v31 = 1.0 / (exp((v65 + 3.0) * -0.5) + 1.0);

    _Block_object_dispose(&v104, 8);
    _Block_object_dispose(v108, 8);
    _Block_object_dispose(&v110, 8);
    _Block_object_dispose(&v114, 8);

    _Block_object_dispose(&v118, 8);
    _Block_object_dispose(&v122, 8);
  }
LABEL_21:

  uint64_t v75 = objc_msgSend_transcriptionPathScores(self, v70, v71, v72, v73, v74);
  uint64_t v81 = objc_msgSend_firstObject(v75, v76, v77, v78, v79, v80);
  objc_msgSend_doubleValue(v81, v82, v83, v84, v85, v86);
  double v88 = v87;

  double v89 = v31;
  double v90 = v88;
  result.unint64_t var1 = v90;
  result.unint64_t var0 = v89;
  return result;
}

- (id)lastTokenStrokeIndexes
{
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_1C4A8B18C;
  uint64_t v36 = sub_1C4A8B19C;
  id v37 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v8 = objc_msgSend_transcriptionPaths(self, v3, v4, v5, v6, v7);
  uint64_t v14 = objc_msgSend_firstObject(v8, v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_tokenColumnCount(self, v15, v16, v17, v18, v19);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4A8B1A4;
  v31[3] = &unk_1E64E3400;
  v31[4] = self;
  v31[5] = &v32;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v21, (uint64_t)v14, v20 - 1, 1, (uint64_t)v31);

  if (!objc_msgSend_count((void *)v33[5], v22, v23, v24, v25, v26))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v27 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_1C492D000, v27, OS_LOG_TYPE_FAULT, "Found empty stroke index set for the last character segment.", v30, 2u);
    }
  }
  id v28 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v28;
}

+ (BOOL)isTextTranscriptionUnitConversion:(id)a3 locales:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_hasSuffix_(v5, v7, @"=", v8, v9, v10)) {
    char isTextTranscriptionUnitConversion_locales = objc_msgSend_isTextTranscriptionUnitConversion_locales_(CHCalculateWrapper, v11, (uint64_t)v5, (uint64_t)v6, v12, v13);
  }
  else {
    char isTextTranscriptionUnitConversion_locales = 0;
  }

  return isTextTranscriptionUnitConversion_locales;
}

+ (BOOL)isTextTranscriptionVariableAssignment:(id)a3 outVariable:(id *)a4
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (a4) {
    *a4 = 0;
  }
  unint64_t v11 = 0x1E4F28000uLL;
  uint64_t v12 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v5, v6, v7, v8, v9);
  uint64_t v17 = objc_msgSend_stringByTrimmingCharactersInSet_(v10, v13, (uint64_t)v12, v14, v15, v16);

  if (!objc_msgSend_length(v17, v18, v19, v20, v21, v22)
    || (objc_msgSend_hasSuffix_(v10, v23, @"=", v24, v25, v26) & 1) != 0
    || (uint64_t v34 = objc_msgSend_rangeOfString_(v17, v27, @"=", v28, v29, v30), v34 == 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v35 = 0;
  }
  else
  {
    id v37 = v31;
    uint64_t v38 = objc_msgSend_substringWithRange_(v17, v31, 0, v34, v32, v33);
    uint64_t v44 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v39, v40, v41, v42, v43);
    uint64_t v49 = objc_msgSend_stringByTrimmingCharactersInSet_(v38, v45, (uint64_t)v44, v46, v47, v48);

    id v186 = v49;
    uint64_t v55 = objc_msgSend_length(v17, v50, v51, v52, v53, v54);
    uint64_t v59 = objc_msgSend_substringWithRange_(v17, v56, (uint64_t)&v37[v34], v55 - (void)&v37[v34], v57, v58);
    double v65 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v60, v61, v62, v63, v64);
    v188 = objc_msgSend_stringByTrimmingCharactersInSet_(v59, v66, (uint64_t)v65, v67, v68, v69);

    if (objc_msgSend_length(v49, v70, v71, v72, v73, v74) && objc_msgSend_length(v188, v75, v76, v77, v78, v79))
    {
      v189 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v80, v81, v82, v83, v84);
      double v90 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v85, v86, v87, v88, v89);
      id v95 = objc_msgSend_componentsSeparatedByCharactersInSet_(v49, v91, (uint64_t)v90, v92, v93, v94);

      v184 = v95;
      if ((unint64_t)objc_msgSend_count(v95, v96, v97, v98, v99, v100) <= 1)
      {
        long long v203 = 0u;
        long long v204 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        id obj = v95;
        uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v101, (uint64_t)&v201, (uint64_t)v207, 16, v102);
        if (v106)
        {
          uint64_t v107 = *(void *)v202;
          while (2)
          {
            for (uint64_t i = 0; i != v106; ++i)
            {
              if (*(void *)v202 != v107) {
                objc_enumerationMutation(obj);
              }
              char v109 = *(void **)(*((void *)&v201 + 1) + 8 * i);
              uint64_t v110 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v109, v103, (uint64_t)v189, 0, v104, v105);
              if (v110 != objc_msgSend_length(v109, v111, v112, v113, v114, v115))
              {
                BOOL v35 = 0;
                goto LABEL_51;
              }
            }
            uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v103, (uint64_t)&v201, (uint64_t)v207, 16, v105);
            if (v106) {
              continue;
            }
            break;
          }
        }

        uint64_t v121 = objc_msgSend_ch_mathOperatorSet(MEMORY[0x1E4F28B88], v116, v117, v118, v119, v120);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4A8BB10;
        block[3] = &unk_1E64E11E0;
        id v185 = v189;
        id v199 = v185;
        id obj = v121;
        id v200 = obj;
        if (qword_1EA3C9F28 != -1) {
          dispatch_once(&qword_1EA3C9F28, block);
        }
        objc_msgSend_componentsSeparatedByCharactersInSet_(v188, v122, (uint64_t)obj, v123, v124, v125);
        long long v196 = 0u;
        long long v197 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id v182 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v182, v126, (uint64_t)&v194, (uint64_t)v206, 16, v127);
        if (v133)
        {
          uint64_t v134 = *(void *)v195;
          uint64_t v180 = *(void *)v195;
          do
          {
            uint64_t v135 = 0;
            do
            {
              if (*(void *)v195 != v134) {
                objc_enumerationMutation(v182);
              }
              uint64_t v136 = *(void **)(*((void *)&v194 + 1) + 8 * v135);
              uint64_t v137 = objc_msgSend_whitespaceCharacterSet(*(void **)(v11 + 2952), v128, v129, v130, v131, v132);
              uint64_t v181 = v135;
              v183 = objc_msgSend_stringByTrimmingCharactersInSet_(v136, v138, (uint64_t)v137, v139, v140, v141);

              if (objc_msgSend_length(v183, v142, v143, v144, v145, v146))
              {
                v152 = objc_msgSend_whitespaceCharacterSet(*(void **)(v11 + 2952), v147, v148, v149, v150, v151);
                uint64_t v157 = objc_msgSend_componentsSeparatedByCharactersInSet_(v183, v153, (uint64_t)v152, v154, v155, v156);

                long long v192 = 0u;
                long long v193 = 0u;
                long long v190 = 0u;
                long long v191 = 0u;
                id v158 = v157;
                long long v159 = v158;
                uint64_t v165 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v160, (uint64_t)&v190, (uint64_t)v205, 16, v161);
                if (v165)
                {
                  uint64_t v179 = v133;
                  uint64_t v166 = 0;
                  uint64_t v167 = *(void *)v191;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v165; ++j)
                    {
                      if (*(void *)v191 != v167) {
                        objc_enumerationMutation(v158);
                      }
                      v169 = *(void **)(*((void *)&v190 + 1) + 8 * j);
                      uint64_t v170 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v169, v162, qword_1EA3C9F20, 0, v163, v164);
                      if (v170 != objc_msgSend_length(v169, v171, v172, v173, v174, v175))
                      {

LABEL_49:
                        BOOL v35 = 0;
                        goto LABEL_50;
                      }
                      id v158 = v159;
                      if (objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v169, v176, (uint64_t)v185, 0, v177, v178))
                      {
                        ++v166;
                      }
                    }
                    uint64_t v165 = objc_msgSend_countByEnumeratingWithState_objects_count_(v159, v162, (uint64_t)&v190, (uint64_t)v205, 16, v164);
                    if (v165) {
                      continue;
                    }
                    break;
                  }

                  uint64_t v133 = v179;
                  uint64_t v134 = v180;
                  unint64_t v11 = 0x1E4F28000;

                  if (v166 >= 2) {
                    goto LABEL_49;
                  }
                }
                else
                {

                  uint64_t v134 = v180;
                  unint64_t v11 = 0x1E4F28000;
                }
              }

              uint64_t v135 = v181 + 1;
            }
            while (v181 + 1 != v133);
            uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v182, v128, (uint64_t)&v194, (uint64_t)v206, 16, v132);
          }
          while (v133);
        }

        if (a4) {
          *a4 = v186;
        }
        BOOL v35 = 1;
LABEL_50:

LABEL_51:
      }
      else
      {
        BOOL v35 = 0;
      }
    }
    else
    {
      BOOL v35 = 0;
    }
  }
  return v35;
}

- (id)textRecognitionResultArrayGivenHistory:(id)a3
{
  id v304 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = objc_msgSend_transcriptionPaths(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_count(v10, v11, v12, v13, v14, v15);
  objc_msgSend_arrayWithCapacity_(v4, v17, v16, v18, v19, v20);
  id v303 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v26 = 0;
  v302 = v319;
  unint64_t v27 = 0x1E4F28000;
  v317 = self;
  while (1)
  {
    uint64_t v29 = objc_msgSend_transcriptionPaths(self, v21, v22, v23, v24, v25);
    unint64_t v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

    if (v26 >= v35) {
      break;
    }
    uint64_t v312 = v26;
    if (self)
    {
      uint64_t v41 = objc_msgSend_transcriptionPaths(self, v36, v37, v38, v39, v40);
      uint64_t v46 = objc_msgSend_objectAtIndexedSubscript_(v41, v42, v26, v43, v44, v45);

      uint64_t v52 = objc_msgSend_length(v46, v47, v48, v49, v50, v51);
      uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPathScores, v53, v26, v54, v55, v56);
      objc_msgSend_doubleValue(v57, v58, v59, v60, v61, v62);
      double v64 = v63;
      v52 *= 2;

      uint64_t v69 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v65, v52, v66, v67, v68);
      uint64_t v74 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v70, v52, v71, v72, v73);
      uint64_t v79 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v75, v52, v76, v77, v78);
      uint64_t v84 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v80, v52, v81, v82, v83);
      v310 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v85, v52, v86, v87, v88);
      v308 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v89, v52, v90, v91, v92);
      uint64_t v97 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v93, v52, v94, v95, v96);
      v306 = objc_msgSend_indexSet(*(void **)(v27 + 3680), v98, v99, v100, v101, v102);
      v305 = objc_msgSend_indexSet(*(void **)(v27 + 3680), v103, v104, v105, v106, v107);
      v315 = v46;
      uint64_t v113 = objc_msgSend_tokenColumns(v317, v108, v109, v110, v111, v112);
      uint64_t v119 = objc_msgSend_count(v113, v114, v115, v116, v117, v118);

      uint64_t v332 = MEMORY[0x1E4F143A8];
      uint64_t v333 = 3221225472;
      uint64_t v334 = (uint64_t)sub_1C4A8C8B8;
      v335 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E64E3450;
      uint64_t v120 = v74;
      v336 = v120;
      id v121 = v69;
      id v337 = v121;
      id v122 = v79;
      id v338 = v122;
      id v123 = v84;
      id v339 = v123;
      id v124 = v310;
      id v340 = v124;
      id v125 = v308;
      id v341 = v125;
      id v126 = v97;
      id v342 = v126;
      id v127 = v306;
      id v343 = v127;
      id v128 = v305;
      id v344 = v128;
      uint64_t v130 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_rejectionRate_tokenProcessingBlock_(v317, v129, (uint64_t)v315, 0, v119, 0, 0, 0, &v332);
      uint64_t v131 = [CHTextRecognitionResult alloc];
      v313 = v121;
      LOBYTE(v301) = 0;
      isTextReplacement = objc_msgSend_initWithString_score_wordRanges_wordIDs_wordRecognitionScores_wordCombinedScores_wordStrokeSets_wordLexicalEntries_wordPatternEntries_rareWordIndexes_inappropriateWordIndexes_isTextReplacement_(v131, v132, (uint64_t)v130, (uint64_t)v121, (uint64_t)v120, (uint64_t)v122, v123, v124, v64, v125, v126, v127, v128, v301, v302);
    }
    else
    {
      isTextReplacement = 0;
    }
    self = v317;
    if (objc_msgSend_length(v304, v36, v37, v38, v39, v40))
    {
      uint64_t v139 = objc_msgSend_transcriptionPaths(v317, v134, v135, v136, v137, v138);
      uint64_t v144 = objc_msgSend_objectAtIndexedSubscript_(v139, v140, v312, v141, v142, v143);

      v316 = v144;
      uint64_t v150 = objc_msgSend_length(v144, v145, v146, v147, v148, v149);
      uint64_t v332 = 0;
      uint64_t v333 = (uint64_t)&v332;
      uint64_t v334 = 0x3032000000;
      v335 = sub_1C4A8B18C;
      v336 = sub_1C4A8B19C;
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v151, 2 * v150, v152, v153, v154);
      id v337 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v326 = 0;
      v327 = &v326;
      uint64_t v328 = 0x3032000000;
      v329 = sub_1C4A8B18C;
      v330 = sub_1C4A8B19C;
      v331 = &stru_1F20141C8;
      uint64_t v320 = 0;
      v321 = &v320;
      uint64_t v322 = 0x3032000000;
      v323 = sub_1C4A8B18C;
      v324 = sub_1C4A8B19C;
      uint64_t v155 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v161 = objc_msgSend_wordRanges(isTextReplacement, v156, v157, v158, v159, v160);
      uint64_t v167 = objc_msgSend_count(v161, v162, v163, v164, v165, v166);
      objc_msgSend_arrayWithCapacity_(v155, v168, v167, v169, v170, v171);
      id v325 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v177 = objc_msgSend_tokenColumns(v317, v172, v173, v174, v175, v176);
      uint64_t v183 = objc_msgSend_count(v177, v178, v179, v180, v181, v182);
      v318[0] = MEMORY[0x1E4F143A8];
      v318[1] = 3221225472;
      v319[0] = sub_1C4A8C76C;
      v319[1] = &unk_1E64E3428;
      v319[2] = v317;
      v319[3] = &v332;
      v319[4] = &v326;
      v319[5] = &v320;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v317, v184, (uint64_t)v316, 0, v183, (uint64_t)v318);

      id v185 = (void *)v327[5];
      long long v191 = objc_msgSend_string(isTextReplacement, v186, v187, v188, v189, v190);
      v314 = objc_msgSend_stringByAppendingString_(v185, v192, (uint64_t)v191, v193, v194, v195);

      id v201 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v202 = 0;
      for (unint64_t i = 0; ; ++i)
      {
        long long v204 = objc_msgSend_wordRanges(isTextReplacement, v196, v197, v198, v199, v200);
        unint64_t v210 = objc_msgSend_count(v204, v205, v206, v207, v208, v209);

        if (i >= v210) {
          break;
        }
        v216 = objc_msgSend_wordRanges(isTextReplacement, v211, v212, v213, v214, v215);
        v221 = objc_msgSend_objectAtIndex_(v216, v217, i, v218, v219, v220);

        v226 = objc_msgSend_objectAtIndex_((void *)v321[5], v222, i, v223, v224, v225);
        objc_msgSend_rangeValue(v221, v227, v228, v229, v230, v231);
        uint64_t v237 = (uint64_t)&v232[objc_msgSend_length(v226, v232, v233, v234, v235, v236)];
        v241 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v238, v202, v237, v239, v240);
        objc_msgSend_addObject_(v201, v242, (uint64_t)v241, v243, v244, v245);
        v202 += v237;
      }
      v246 = [CHTextRecognitionResult alloc];
      objc_msgSend_score(isTextReplacement, v247, v248, v249, v250, v251);
      double v253 = v252;
      v311 = objc_msgSend_wordIDs(isTextReplacement, v254, v255, v256, v257, v258);
      uint64_t v264 = objc_msgSend_wordRecognitionScores(isTextReplacement, v259, v260, v261, v262, v263);
      uint64_t v265 = *(void *)(v333 + 40);
      v309 = objc_msgSend_wordStrokeSets(isTextReplacement, v266, v267, v268, v269, v270);
      v307 = (void *)v264;
      v276 = objc_msgSend_wordLexicalEntries(isTextReplacement, v271, v272, v273, v274, v275);
      v282 = objc_msgSend_wordPatternEntries(isTextReplacement, v277, v278, v279, v280, v281);
      v288 = objc_msgSend_rareWordIndexes(isTextReplacement, v283, v284, v285, v286, v287);
      v294 = objc_msgSend_inappropriateWordIndexes(isTextReplacement, v289, v290, v291, v292, v293);
      LOBYTE(v301) = 0;
      uint64_t v28 = objc_msgSend_initWithString_score_wordRanges_wordIDs_wordRecognitionScores_wordCombinedScores_wordStrokeSets_wordLexicalEntries_wordPatternEntries_rareWordIndexes_inappropriateWordIndexes_isTextReplacement_(v246, v295, (uint64_t)v314, (uint64_t)v201, (uint64_t)v311, (uint64_t)v307, v265, v309, v253, v276, v282, v288, v294, v301);

      objc_msgSend_addObject_(v303, v296, (uint64_t)v28, v297, v298, v299);
      _Block_object_dispose(&v320, 8);

      _Block_object_dispose(&v326, 8);
      _Block_object_dispose(&v332, 8);

      self = v317;
    }
    else
    {
      objc_msgSend_addObject_(v303, v134, (uint64_t)isTextReplacement, v136, v137, v138);
      uint64_t v28 = isTextReplacement;
    }

    unint64_t v26 = v312 + 1;
    unint64_t v27 = 0x1E4F28000uLL;
  }

  return v303;
}

- (id)textRecognitionResultArray
{
  return (id)objc_msgSend_textRecognitionResultArrayGivenHistory_(self, a2, 0, v2, v3, v4);
}

- (void)enumerateTokensInTopTranscriptionPathWithBlock:(id)a3
{
  id v17 = a3;
  uint64_t v9 = objc_msgSend_firstObject(self->_transcriptionPaths, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_tokenColumnCount(self, v10, v11, v12, v13, v14);
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v16, (uint64_t)v9, 0, v15, (uint64_t)v17);
}

- (void)enumerateTokensInTranscriptionPath:(id)a3 columnRange:(_NSRange)a4 tokenProcessingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  uint64_t v13 = (void (**)(id, uint64_t, uint64_t, void *))a5;
  NSUInteger v14 = location + length;
  if (location < v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &qword_1EA3CA000;
    NSUInteger v93 = v14;
    do
    {
      id v17 = objc_msgSend_tokenColumns(self, v8, v9, v10, v11, v12);
      uint64_t v96 = objc_msgSend_objectAtIndexedSubscript_(v17, v18, location, v19, v20, v21);

      if (location >= objc_msgSend_length(v95, v22, v23, v24, v25, v26))
      {
        if (location >= objc_msgSend_length(v95, v27, v28, v29, v30, v31))
        {
          if (*v16 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v56 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
          {
            uint64_t v73 = objc_msgSend_length(v95, v68, v69, v70, v71, v72);
            *(_DWORD *)long long buf = 134218240;
            NSUInteger v104 = location;
            __int16 v105 = 2048;
            uint64_t v106 = v73;
            _os_log_impl(&dword_1C492D000, v56, OS_LOG_TYPE_FAULT, "Trying to access index %ld outside of path of length %ld. Skipping.", buf, 0x16u);
          }
          goto LABEL_24;
        }
      }
      else
      {
        unint64_t v32 = objc_msgSend_indexAtPosition_(v95, v27, location, v29, v30, v31);
        uint64_t v38 = objc_msgSend_textTokenRows(v96, v33, v34, v35, v36, v37);
        BOOL v44 = v32 < objc_msgSend_count(v38, v39, v40, v41, v42, v43);

        if (v44)
        {
          uint64_t v50 = objc_msgSend_textTokenRows(v96, v45, v46, v47, v48, v49);
          uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v50, v51, v32, v52, v53, v54);

          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          uint64_t v56 = v55;
          uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v98, (uint64_t)v102, 16, v58);
          if (v59)
          {
            uint64_t v60 = 0;
            uint64_t v61 = *(void *)v99;
            uint64_t v62 = v15;
            do
            {
              uint64_t v63 = 0;
              uint64_t v64 = v62;
              do
              {
                if (*(void *)v99 != v61) {
                  objc_enumerationMutation(v56);
                }
                uint64_t v65 = *(void *)(*((void *)&v98 + 1) + 8 * v63);
                v97[0] = location;
                v97[1] = v32;
                v97[2] = v60 + v63;
                v13[2](v13, v65, v64 + v63++, v97);
              }
              while (v59 != v63);
              uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v66, (uint64_t)&v98, (uint64_t)v102, 16, v67);
              v60 += v63;
              uint64_t v62 = v64 + v63;
            }
            while (v59);
            uint64_t v15 = v64 + v63;
            NSUInteger v14 = v93;
            uint64_t v16 = &qword_1EA3CA000;
          }

LABEL_24:
          goto LABEL_25;
        }
        uint64_t v74 = objc_msgSend_textTokenRows(v96, v45, v46, v47, v48, v49);
        BOOL v80 = v32 < objc_msgSend_count(v74, v75, v76, v77, v78, v79);

        if (!v80)
        {
          if (*v16 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v56 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
          {
            uint64_t v86 = objc_msgSend_textTokenRows(v96, v81, v82, v83, v84, v85);
            uint64_t v92 = objc_msgSend_count(v86, v87, v88, v89, v90, v91);
            *(_DWORD *)long long buf = 134218240;
            NSUInteger v104 = v32;
            __int16 v105 = 2048;
            uint64_t v106 = v92;
            _os_log_impl(&dword_1C492D000, v56, OS_LOG_TYPE_FAULT, "Trying to access index %ld outside of available tokenRows of length %ld. Skipping.", buf, 0x16u);
          }
          goto LABEL_24;
        }
      }
LABEL_25:

      ++location;
    }
    while (location != v14);
  }
}

- (BOOL)isEqualToTokenizedTextResult:(id)a3
{
  uint64_t v4 = (CHTokenizedTextResult *)a3;
  uint64_t v10 = v4;
  if (self == v4)
  {
    char isEqualToArray = 1;
    goto LABEL_14;
  }
  transcriptionPaths = self->_transcriptionPaths;
  objc_msgSend_transcriptionPaths(v4, v5, v6, v7, v8, v9);
  id v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (transcriptionPaths != v17)
  {
    uint64_t v18 = self->_transcriptionPaths;
    uint64_t v19 = objc_msgSend_transcriptionPaths(v10, v12, v13, v14, v15, v16);
    LODWORD(v18) = objc_msgSend_isEqualToArray_(v18, v20, (uint64_t)v19, v21, v22, v23);

    if (!v18) {
      goto LABEL_11;
    }
    transcriptionPathScores = self->_transcriptionPathScores;
    uint64_t v29 = (uint64_t)v10->_transcriptionPathScores;
    if (transcriptionPathScores == (NSArray *)v29) {
      goto LABEL_9;
    }
LABEL_8:
    if (objc_msgSend_isEqualToArray_(transcriptionPathScores, v24, v29, v25, v26, v27)) {
      goto LABEL_9;
    }
LABEL_11:
    char isEqualToArray = 0;
    goto LABEL_14;
  }

  transcriptionPathScores = self->_transcriptionPathScores;
  uint64_t v29 = (uint64_t)v10->_transcriptionPathScores;
  if (transcriptionPathScores != (NSArray *)v29) {
    goto LABEL_8;
  }
LABEL_9:
  tokenColumns = self->_tokenColumns;
  objc_msgSend_tokenColumns(v10, v24, v29, v25, v26, v27);
  uint64_t v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (tokenColumns == v37)
  {
    char isEqualToArray = 1;
  }
  else
  {
    uint64_t v38 = self->_tokenColumns;
    uint64_t v39 = objc_msgSend_tokenColumns(v10, v32, v33, v34, v35, v36);
    char isEqualToArray = objc_msgSend_isEqualToArray_(v38, v40, (uint64_t)v39, v41, v42, v43);
  }
LABEL_14:

  return isEqualToArray;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToTokenizedTextResult = objc_msgSend_isEqualToTokenizedTextResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedTextResult;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v7 = objc_msgSend_hash(self->_tokenColumns, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_hash(self->_transcriptionPaths, v8, v9, v10, v11, v12);
  return v13 ^ v7 ^ objc_msgSend_hash(self->_transcriptionPathScores, v14, v15, v16, v17, v18);
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v6 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);

  return v11;
}

+ (CHTokenizedTextResult)tokenizedTextResultWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 defaultTokenScores:(double)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = *MEMORY[0x1E4F1DB20];
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v22 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v23 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  v27[0] = *MEMORY[0x1E4F1DAD8];
  v27[1] = v23;
  v27[2] = v27[0];
  v27[3] = v23;
  v27[4] = v27[0];
  v27[5] = v23;
  v27[6] = v27[0];
  v27[7] = v23;
  v27[8] = v27[0];
  v27[9] = v23;
  v27[10] = v27[0];
  v27[11] = v23;
  v27[12] = v27[0];
  v27[13] = v23;
  v27[14] = v27[0];
  v27[15] = v23;
  uint64_t v25 = objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_originalBounds_principalLines_(v19, v24, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, a7, v27, x, y, width, height, a8, v20, v21, v22);

  return (CHTokenizedTextResult *)v25;
}

+ (CHTokenizedTextResult)tokenizedTextResultWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 defaultTokenScores:(double)a8 originalBounds:(CGRect)a9 principalLines:(id *)a10
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v87[1] = *MEMORY[0x1E4F143B8];
  id v84 = a3;
  id v18 = a4;
  id v83 = a6;
  uint64_t v19 = [CHTokenizedTextResultToken alloc];
  uint64_t v24 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v20, (uint64_t)&stru_1F20141C8, v21, v22, v23);
  uint64_t v30 = objc_msgSend_count(v18, v25, v26, v27, v28, v29);
  CGPoint var1 = a10->var2.var1;
  v85[4] = a10->var2.var0;
  v85[5] = var1;
  CGPoint v32 = a10->var3.var1;
  v85[6] = a10->var3.var0;
  v85[7] = v32;
  CGPoint v33 = a10->var0.var1;
  v85[0] = a10->var0.var0;
  v85[1] = v33;
  CGPoint v34 = a10->var1.var1;
  v85[2] = a10->var1.var0;
  v85[3] = v34;
  uint64_t v36 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v19, v35, (uint64_t)v84, (uint64_t)v18, 0, 4, v24, 4, a8, a8, a8, a8, x, y, width, height, v30, *(void *)&a9.origin.x, *(void *)&a9.origin.y,
                  *(void *)&a9.size.width,
                  *(void *)&a9.size.height,
                  v85);

  uint64_t v37 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v42 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v38, (uint64_t)v36, v39, v40, v41, 0);
  uint64_t v47 = objc_msgSend_arrayWithObjects_(v37, v43, (uint64_t)v42, v44, v45, v46, 0);

  uint64_t v48 = [CHTokenizedResultColumn alloc];
  uint64_t v53 = objc_msgSend_initWithTokenRows_(v48, v49, (uint64_t)v47, v50, v51, v52);
  uint64_t v58 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v54, (uint64_t)v53, v55, v56, v57, 0);
  uint64_t v63 = objc_msgSend_indexPathWithIndex_(MEMORY[0x1E4F28D58], v59, 0, v60, v61, v62);
  v87[0] = v63;
  uint64_t v67 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v64, (uint64_t)v87, 1, v65, v66);

  uint64_t v73 = objc_msgSend_numberWithDouble_(NSNumber, v68, v69, v70, v71, v72, a8);
  uint64_t v86 = v73;
  uint64_t v77 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v74, (uint64_t)&v86, 1, v75, v76);

  uint64_t v78 = [CHTokenizedTextResult alloc];
  BOOL v80 = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(v78, v79, (uint64_t)v58, (uint64_t)v67, (uint64_t)v77, (uint64_t)v83, a7);

  return (CHTokenizedTextResult *)v80;
}

+ (BOOL)areTokenRowsEquivalent:(id)a3 otherRow:(id)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v96 = a4;
  long long v98 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v6, v7, v8, v9, v10, v5);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obj = v5;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v103, (uint64_t)v108, 16, v12);
  if (v18)
  {
    uint64_t v19 = *(void *)v104;
    uint64_t v20 = &stru_1F20141C8;
    do
    {
      uint64_t v21 = 0;
      uint64_t v22 = v20;
      do
      {
        if (*(void *)v104 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v103 + 1) + 8 * v21);
        if ((objc_msgSend_properties(v23, v13, v14, v15, v16, v17) & 0x20) != 0)
        {
          uint64_t v29 = objc_msgSend_stringByAppendingString_(v22, v24, @" ", v26, v27, v28);

          uint64_t v22 = (void *)v29;
        }
        uint64_t v30 = objc_msgSend_string(v23, v24, v25, v26, v27, v28);
        objc_msgSend_stringByAppendingString_(v22, v31, (uint64_t)v30, v32, v33, v34);
        uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t v40 = objc_msgSend_strokeIndexes(v23, v35, v36, v37, v38, v39);
        objc_msgSend_addIndexes_(v98, v41, (uint64_t)v40, v42, v43, v44);

        ++v21;
        uint64_t v22 = v20;
      }
      while (v18 != v21);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v103, (uint64_t)v108, 16, v17);
    }
    while (v18);
  }
  else
  {
    uint64_t v20 = &stru_1F20141C8;
  }

  uint64_t v50 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v45, v46, v47, v48, v49);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v51 = v96;
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v99, (uint64_t)v107, 16, v53);
  if (v59)
  {
    uint64_t v60 = *(void *)v100;
    uint64_t v61 = &stru_1F20141C8;
    do
    {
      uint64_t v62 = 0;
      uint64_t v63 = v61;
      do
      {
        if (*(void *)v100 != v60) {
          objc_enumerationMutation(v51);
        }
        uint64_t v64 = *(void **)(*((void *)&v99 + 1) + 8 * v62);
        if ((objc_msgSend_properties(v64, v54, v55, v56, v57, v58) & 0x20) != 0)
        {
          uint64_t v70 = objc_msgSend_stringByAppendingString_(v63, v65, @" ", v67, v68, v69);

          uint64_t v63 = (void *)v70;
        }
        uint64_t v71 = objc_msgSend_string(v64, v65, v66, v67, v68, v69);
        objc_msgSend_stringByAppendingString_(v63, v72, (uint64_t)v71, v73, v74, v75);
        uint64_t v61 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t v81 = objc_msgSend_strokeIndexes(v64, v76, v77, v78, v79, v80);
        objc_msgSend_addIndexes_(v50, v82, (uint64_t)v81, v83, v84, v85);

        ++v62;
        uint64_t v63 = v61;
      }
      while (v59 != v62);
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v99, (uint64_t)v107, 16, v58);
    }
    while (v59);
  }
  else
  {
    uint64_t v61 = &stru_1F20141C8;
  }

  if (objc_msgSend_isEqualToString_(v20, v86, (uint64_t)v61, v87, v88, v89)) {
    char isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v98, v90, (uint64_t)v50, v91, v92, v93);
  }
  else {
    char isEqualToIndexSet = 0;
  }

  return isEqualToIndexSet;
}

+ (int64_t)mergeTokenRow:(id)a3 intoUniqueRows:(id)a4
{
  uint64_t v307 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v291 = a4;
  id obj = v5;
  if (objc_msgSend_count(v5, v6, v7, v8, v9, v10))
  {
    uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v5, v11, 0, v13, v14, v15);
    char isTopOriginal = objc_msgSend_isTopOriginal(v16, v17, v18, v19, v20, v21);

    unint64_t v27 = 1;
    while (v27 < objc_msgSend_count(obj, v22, v23, v24, v25, v26))
    {
      uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(obj, v11, v27, v13, v14, v15);
      int v34 = objc_msgSend_isTopOriginal(v28, v29, v30, v31, v32, v33);
      int v35 = isTopOriginal & 1;
      isTopOriginal &= v34;

      ++v27;
      if (v35 != v34)
      {
        uint64_t v297 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v22, v23, v24, v25, v26);
        long long v304 = 0u;
        long long v305 = 0u;
        long long v302 = 0u;
        long long v303 = 0u;
        id obja = obj;
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v36, (uint64_t)&v302, (uint64_t)v306, 16, v37);
        if (v38)
        {
          uint64_t v296 = *(void *)v303;
          do
          {
            uint64_t v298 = v38;
            for (uint64_t i = 0; i != v298; ++i)
            {
              if (*(void *)v303 != v296) {
                objc_enumerationMutation(obja);
              }
              uint64_t v45 = *(void **)(*((void *)&v302 + 1) + 8 * i);
              if (objc_msgSend_isTopOriginal(v45, v39, v40, v41, v42, v43))
              {
                id v51 = objc_msgSend_string(v45, v46, v47, v48, v49, v50);
                uint64_t v57 = objc_msgSend_strokeIndexes(v45, v52, v53, v54, v55, v56);
                uint64_t v63 = objc_msgSend_wordID(v45, v58, v59, v60, v61, v62);
                objc_msgSend_modelScore(v45, v64, v65, v66, v67, v68);
                double v70 = v69;
                objc_msgSend_recognitionScore(v45, v71, v72, v73, v74, v75);
                double v77 = v76;
                objc_msgSend_combinedScore(v45, v78, v79, v80, v81, v82);
                double v84 = v83;
                objc_msgSend_alignmentScore(v45, v85, v86, v87, v88, v89);
                double v91 = v90;
                uint64_t v97 = objc_msgSend_properties(v45, v92, v93, v94, v95, v96);
                long long v103 = objc_msgSend_recognizerSourceLocale(v45, v98, v99, v100, v101, v102);
                double v292 = v91;
                double v293 = v84;
                double v294 = v77;
                double v295 = v70;
                uint64_t v109 = objc_msgSend_inputSources(v45, v104, v105, v106, v107, v108);
                uint64_t v115 = objc_msgSend_substrokeCount(v45, v110, v111, v112, v113, v114);
                objc_msgSend_bounds(v45, v116, v117, v118, v119, v120);
                double v122 = v121;
                double v124 = v123;
                double v126 = v125;
                double v128 = v127;
                objc_msgSend_originalBounds(v45, v129, v130, v131, v132, v133);
                uint64_t v140 = v139;
                uint64_t v142 = v141;
                uint64_t v144 = v143;
                uint64_t v146 = v145;
                if (v45) {
                  objc_msgSend_principalLines(v45, v134, v135, v136, v137, v138);
                }
                else {
                  memset(v301, 0, sizeof(v301));
                }
                objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v134, (uint64_t)v51, (uint64_t)v57, v63, v97, v103, v109, v295, v294, v293, v292, v122, v124, v126, v128, v115, v140, v142,
                  v144,
                  v146,
                uint64_t v147 = v301);

                objc_msgSend_addObject_(v297, v148, (uint64_t)v147, v149, v150, v151);
              }
              else
              {
                objc_msgSend_addObject_(v297, v46, (uint64_t)v45, v48, v49, v50);
              }
            }
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v39, (uint64_t)&v302, (uint64_t)v306, 16, v43);
          }
          while (v38);
        }

        id obj = v297;
        break;
      }
    }
  }
  else
  {
    char isTopOriginal = 1;
  }
  for (unint64_t j = 0; ; ++j)
  {
    if (j >= objc_msgSend_count(v291, v11, v12, v13, v14, v15)) {
      goto LABEL_51;
    }
    uint64_t v157 = objc_msgSend_objectAtIndexedSubscript_(v291, v153, j, v154, v155, v156);
    if (!objc_msgSend_areTokenRowsEquivalent_otherRow_(CHTokenizedTextResult, v158, (uint64_t)obj, (uint64_t)v157, v159, v160))goto LABEL_22; {
    uint64_t v166 = objc_msgSend_count(v157, v161, v162, v163, v164, v165);
    }
    if (v166 == objc_msgSend_count(obj, v167, v168, v169, v170, v171)) {
      break;
    }
    if ((isTopOriginal & 1) == 0)
    {
      if (j != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_50;
      }
LABEL_22:

      continue;
    }
    uint64_t v182 = sub_1C4A8DBCC((uint64_t)CHTokenizedTextResult, v157);
    objc_msgSend_setObject_atIndexedSubscript_(v291, v276, (uint64_t)v182, j, v277, v278);
LABEL_43:

LABEL_45:
    if (((j != 0x7FFFFFFFFFFFFFFFLL) & isTopOriginal) == 1)
    {
      uint64_t v279 = objc_msgSend_objectAtIndexedSubscript_(v291, v184, j, v185, v186, v187);
      uint64_t v280 = sub_1C4A8DBCC((uint64_t)CHTokenizedTextResult, v279);
      objc_msgSend_setObject_atIndexedSubscript_(v291, v281, (uint64_t)v280, j, v282, v283);

      goto LABEL_52;
    }

    if (j != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_52;
    }
  }
  uint64_t v182 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v172, v173, v174, v175, v176);
  for (unint64_t k = 0; k < objc_msgSend_count(obj, v177, v178, v179, v180, v181); ++k)
  {
    uint64_t v188 = objc_msgSend_objectAtIndexedSubscript_(obj, v184, k, v185, v186, v187);
    uint64_t v193 = objc_msgSend_objectAtIndexedSubscript_(v157, v189, k, v190, v191, v192);
    int isEquivalentToToken = objc_msgSend_isEquivalentToToken_(v188, v194, (uint64_t)v193, v195, v196, v197);

    if (!isEquivalentToToken) {
      goto LABEL_43;
    }
    long long v203 = objc_msgSend_objectAtIndexedSubscript_(obj, v199, k, v200, v201, v202);
    int v209 = objc_msgSend_isTopOriginal(v203, v204, v205, v206, v207, v208);

    uint64_t v214 = objc_msgSend_objectAtIndexedSubscript_(obj, v210, k, v211, v212, v213);
    int hasValidPrincipalLines = objc_msgSend_hasValidPrincipalLines(v214, v215, v216, v217, v218, v219);

    uint64_t v225 = objc_msgSend_objectAtIndexedSubscript_(v157, v221, k, v222, v223, v224);
    int v231 = objc_msgSend_isTopOriginal(v225, v226, v227, v228, v229, v230);

    uint64_t v236 = objc_msgSend_objectAtIndexedSubscript_(v157, v232, k, v233, v234, v235);
    int v242 = objc_msgSend_hasValidPrincipalLines(v236, v237, v238, v239, v240, v241);

    if (v209 != v231)
    {
      if (v209) {
        goto LABEL_32;
      }
LABEL_38:
      objc_msgSend_objectAtIndexedSubscript_(v157, v243, k, v244, v245, v246);
      goto LABEL_33;
    }
    double v252 = objc_msgSend_objectAtIndexedSubscript_(obj, v243, k, v244, v245, v246);
    objc_msgSend_combinedScore(v252, v253, v254, v255, v256, v257);
    double v259 = v258;
    uint64_t v264 = objc_msgSend_objectAtIndexedSubscript_(v157, v260, k, v261, v262, v263);
    objc_msgSend_combinedScore(v264, v265, v266, v267, v268, v269);
    BOOL v271 = v259 > v270;

    if (!v271)
    {
      if ((hasValidPrincipalLines ^ 1 | v242)) {
        goto LABEL_38;
      }
LABEL_32:
      objc_msgSend_objectAtIndexedSubscript_(obj, v243, k, v244, v245, v246);
      v247 = LABEL_33:;
      objc_msgSend_addObject_(v182, v248, (uint64_t)v247, v249, v250, v251);
      goto LABEL_40;
    }
    v247 = objc_msgSend_objectAtIndexedSubscript_(obj, v243, k, v244, v245, v246);
    objc_msgSend_addObject_(v182, v272, (uint64_t)v247, v273, v274, v275);
LABEL_40:
  }
  if (!v182) {
    goto LABEL_45;
  }
  objc_msgSend_setObject_atIndexedSubscript_(v291, v184, (uint64_t)v182, j, v186, v187);

LABEL_50:
  if (j == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_51:
    objc_msgSend_addObject_(v291, v153, (uint64_t)obj, v154, v155, v156);
    unint64_t j = objc_msgSend_count(v291, v284, v285, v286, v287, v288) - 1;
  }
LABEL_52:

  return j;
}

+ (id)extendedToken:(id)a3 withStrokeIndexSet:(id)a4 alignmentScore:(double)a5 bounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v12 = a3;
  id v13 = a4;
  id v14 = objc_alloc(MEMORY[0x1E4F28E60]);
  uint64_t v20 = objc_msgSend_strokeIndexes(v12, v15, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_initWithIndexSet_(v14, v21, (uint64_t)v20, v22, v23, v24);

  objc_msgSend_addIndexes_(v25, v26, (uint64_t)v13, v27, v28, v29);
  uint64_t v30 = [CHTokenizedTextResultToken alloc];
  uint64_t v36 = objc_msgSend_string(v12, v31, v32, v33, v34, v35);
  uint64_t v42 = objc_msgSend_wordID(v12, v37, v38, v39, v40, v41);
  objc_msgSend_modelScore(v12, v43, v44, v45, v46, v47);
  double v49 = v48;
  objc_msgSend_recognitionScore(v12, v50, v51, v52, v53, v54);
  double v56 = v55;
  objc_msgSend_combinedScore(v12, v57, v58, v59, v60, v61);
  double v63 = v62;
  uint64_t v69 = objc_msgSend_properties(v12, v64, v65, v66, v67, v68);
  uint64_t v75 = objc_msgSend_recognizerSourceLocale(v12, v70, v71, v72, v73, v74);
  uint64_t v81 = objc_msgSend_inputSources(v12, v76, v77, v78, v79, v80);
  uint64_t v87 = objc_msgSend_count(v25, v82, v83, v84, v85, v86);
  uint64_t v89 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v30, v88, (uint64_t)v36, (uint64_t)v25, v42, v69, v75, v81, v49, v56, v63, a5, x, y, width, height, v87);

  return v89;
}

- (id)phraseCaseCorrectedResultWithHistory:(id)a3 phraseLexicon:(_LXLexicon *)a4 maxPhraseLength:(int64_t)a5
{
  uint64_t v405 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (__CFString *)a3;
  if (!objc_msgSend_tokenColumnCount(self, v9, v10, v11, v12, v13) || !self->_transcriptionPaths)
  {
    v349 = v8;
    uint64_t v89 = self;
    goto LABEL_52;
  }
  if (!v8) {
    uint64_t v8 = &stru_1F20141C8;
  }
  v349 = v8;
  uint64_t v19 = objc_msgSend_precedingSeparatorForTopTranscriptionPath(self, v14, v15, v16, v17, v18);
  v348 = objc_msgSend_stringByAppendingString_(v8, v20, (uint64_t)v19, v21, v22, v23);

  uint64_t v29 = objc_msgSend_topTranscription(self, v24, v25, v26, v27, v28);
  objc_msgSend_stringByAppendingString_(v348, v30, (uint64_t)v29, v31, v32, v33);
  v347 = (NSString *)objc_claimAutoreleasedReturnValue();
  v352 = self;

  NSUInteger v39 = objc_msgSend_length(v8, v34, v35, v36, v37, v38);
  NSUInteger v45 = objc_msgSend_length(v8, v40, v41, v42, v43, v44);
  uint64_t v51 = objc_msgSend_length(v347, v46, v47, v48, v49, v50);
  uint64_t v57 = objc_msgSend_length(v349, v52, v53, v54, v55, v56);
  uint64_t v403 = 0x7FFFFFFFFFFFFFFFLL;
  double v63 = objc_msgSend_firstObject(v352->_transcriptionPaths, v58, v59, v60, v61, v62);
  uint64_t v69 = objc_msgSend_tokenColumnCount(v352, v64, v65, v66, v67, v68);
  id v341 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v352, v70, (uint64_t)v63, 0, v69 - 1, 0);

  uint64_t v76 = objc_msgSend_length(v348, v71, v72, v73, v74, v75);
  uint64_t v82 = objc_msgSend_length(v341, v77, v78, v79, v80, v81);
  if (a4)
  {
    v408.NSUInteger length = v51 - v57;
    v407.NSUInteger location = 0;
    v407.NSUInteger length = v39;
    v408.NSUInteger location = v45;
    uint64_t v88 = phraseMatchingCandidates(v347, a4, v407, v408, a5, v82 + v76, &v403);
  }
  else
  {
    uint64_t v88 = 0;
  }
  id v343 = v88;
  uint64_t v90 = objc_msgSend_count(v88, v83, v84, v85, v86, v87);
  uint64_t v91 = v90;
  BOOL v92 = v90 != 0;
  if (v403 != 0x7FFFFFFFFFFFFFFFLL || v90)
  {
    id v340 = -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v352);
    long long v98 = objc_msgSend_transcriptionPaths(v352, v93, v94, v95, v96, v97);
    uint64_t v103 = objc_msgSend_indexOfObjectIdenticalTo_(v98, v99, (uint64_t)v340, v100, v101, v102);

    uint64_t v394 = 0;
    v395 = &v394;
    uint64_t v396 = 0x4812000000;
    v397 = sub_1C4A8F8C8;
    v398 = sub_1C4A8F8EC;
    v399 = &unk_1C4CB5C62;
    unint64_t v113 = objc_msgSend_length(v340, v104, v105, v106, v107, v108);
    __p = 0;
    v401 = 0;
    v402 = 0;
    if (v113)
    {
      if (v113 >> 61) {
        sub_1C494A220();
      }
      uint64_t v114 = (char *)operator new(8 * v113);
      __p = v114;
      v402 = &v114[8 * v113];
      bzero(v114, 8 * v113);
      v401 = &v114[8 * v113];
    }
    objc_msgSend_getIndexes_(v340, v109, v395[6], v110, v111, v112);
    uint64_t v390 = 0;
    v391 = &v390;
    uint64_t v392 = 0x2020000000;
    uint64_t v393 = 0;
    uint64_t v386 = 0;
    v387 = &v386;
    uint64_t v388 = 0x2020000000;
    uint64_t v389 = -1;
    uint64_t v380 = 0;
    v381 = &v380;
    uint64_t v382 = 0x3032000000;
    v383 = sub_1C4A8B18C;
    v384 = sub_1C4A8B19C;
    id v385 = 0;
    uint64_t v376 = 0;
    v377 = &v376;
    uint64_t v378 = 0x2020000000;
    uint64_t v379 = 0x7FFFFFFFFFFFFFFFLL;
    if (v91)
    {
      uint64_t v120 = objc_msgSend_mutableCopy(v352->_transcriptionPaths, v115, v116, v117, v118, v119);
      v346 = objc_msgSend_mutableCopy(v352->_transcriptionPathScores, v121, v122, v123, v124, v125);
      double v126 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v132 = objc_msgSend_count(v352->_tokenColumns, v127, v128, v129, v130, v131);
      objc_msgSend_arrayWithCapacity_(v126, v133, v132, v134, v135, v136);
      id v342 = (void *)v120;
      v350 = unint64_t v137 = 0;
      while (v137 < objc_msgSend_count(v352->_tokenColumns, v138, v139, v140, v141, v142))
      {
        uint64_t v148 = objc_msgSend_objectAtIndexedSubscript_(v352->_tokenColumns, v143, v137, v145, v146, v147);
        uint64_t v154 = objc_msgSend_mutableCopy(v148, v149, v150, v151, v152, v153);
        objc_msgSend_addObject_(v350, v155, (uint64_t)v154, v156, v157, v158);

        ++v137;
      }
      uint64_t v159 = objc_msgSend_allKeys(v343, v143, v144, v145, v146, v147);
      id v344 = objc_msgSend_sortedArrayUsingSelector_(v159, v160, (uint64_t)sel_compare_, v161, v162, v163);

      uint64_t v168 = objc_msgSend_objectAtIndexedSubscript_(v344, v164, v391[3], v165, v166, v167);
      uint64_t v174 = objc_msgSend_integerValue(v168, v169, v170, v171, v172, v173);
      v387[3] = v174;

      uint64_t v179 = objc_msgSend_numberWithInteger_(NSNumber, v175, v387[3], v176, v177, v178);
      uint64_t v184 = objc_msgSend_objectForKey_(v343, v180, (uint64_t)v179, v181, v182, v183);
      uint64_t v185 = (void *)v381[5];
      v381[5] = v184;

      if (objc_msgSend_hasPrefix_((void *)v381[5], v186, @" ", v187, v188, v189))
      {
        uint64_t v194 = objc_msgSend_substringFromIndex_((void *)v381[5], v190, 1, v191, v192, v193);
        uint64_t v195 = (void *)v381[5];
        v381[5] = v194;

        ++v387[3];
      }
      uint64_t v196 = v350;
      uint64_t v197 = v344;
    }
    else
    {
      id v342 = 0;
      v346 = 0;
      uint64_t v196 = 0;
      uint64_t v197 = 0;
    }
    v375[0] = 0;
    v375[1] = v375;
    v375[2] = 0x2020000000;
    v375[3] = 0;
    v362[0] = MEMORY[0x1E4F143A8];
    v362[1] = 3221225472;
    v362[2] = sub_1C4A8F904;
    v362[3] = &unk_1E64E3478;
    v367 = v375;
    uint64_t v198 = v349;
    uint64_t v373 = v403;
    v363 = v198;
    v368 = &v376;
    v369 = &v386;
    BOOL v374 = v92;
    v370 = &v380;
    id v351 = v196;
    id v364 = v351;
    v371 = &v394;
    v372 = &v390;
    id v345 = v197;
    id v365 = v345;
    id v366 = v343;
    uint64_t v199 = v352;
    objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v352, v200, (uint64_t)v362, v201, v202, v203);
    int v209 = v342;
    if (v91)
    {
      uint64_t v213 = objc_msgSend_indexPathWithIndexes_length_(MEMORY[0x1E4F28D58], v204, v395[6], (v395[7] - v395[6]) >> 3, v207, v208);
      if (v103 && v103 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend_setObject_atIndexedSubscript_(v342, v210, (uint64_t)v213, v103, v211, v212);
      }
      else
      {
        if (v103 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v214 = 1;
          objc_msgSend_insertObject_atIndex_(v342, v210, (uint64_t)v213, 1, v211, v212);
        }
        else
        {
          uint64_t v214 = v103 + 1;
          objc_msgSend_insertObject_atIndex_(v342, v210, (uint64_t)v213, v103 + 1, v211, v212);
        }
        uint64_t v220 = objc_msgSend_transcriptionPathScores(v352, v215, v216, v217, v218, v219);
        v226 = objc_msgSend_firstObject(v220, v221, v222, v223, v224, v225);
        objc_msgSend_insertObject_atIndex_(v346, v227, (uint64_t)v226, v214, v228, v229);

        int v209 = v342;
      }
      id v230 = v351;
      id v338 = v209;
      id v339 = v346;

      uint64_t v199 = v352;
      if (v377[3] == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_34;
      }
    }
    else
    {
      objc_msgSend_tokenColumns(v352, v204, v205, v206, v207, v208);
      id v230 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v236 = objc_msgSend_transcriptionPaths(v352, v231, v232, v233, v234, v235);
      objc_msgSend_transcriptionPathScores(v352, v237, v238, v239, v240, v241);
      id v339 = (id)objc_claimAutoreleasedReturnValue();
      id v338 = (id)v236;
      if (v377[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_34:
        uint64_t v249 = 1;
        uint64_t v247 = (uint64_t)v338;
        goto LABEL_35;
      }
    }
    uint64_t v247 = (uint64_t)v338;
    uint64_t v248 = objc_msgSend_count(v230, v242, v243, v244, v245, v246);
    uint64_t v249 = v248 - v377[3];
LABEL_35:
    if (v249 <= v199->_changeableCount) {
      uint64_t changeableCount = v199->_changeableCount;
    }
    else {
      uint64_t changeableCount = v249;
    }
    uint64_t v251 = [CHTokenizedTextResult alloc];
    uint64_t v257 = objc_msgSend_trailingSeparator(v199, v252, v253, v254, v255, v256);
    uint64_t v263 = objc_msgSend_recognizerGenerationIdentifier(v199, v258, v259, v260, v261, v262);
    v355 = (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v251, v264, (uint64_t)v230, v247, (uint64_t)v339, (uint64_t)v257, v263, changeableCount);
    id v337 = v230;

    if (v91)
    {
      v354 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v265, v266, v267, v268, v269);
      long long v360 = 0u;
      long long v361 = 0u;
      long long v358 = 0u;
      long long v359 = 0u;
      uint64_t v275 = objc_msgSend_transcriptionPaths(v355, v270, v271, v272, v273, v274);
      id obj = v275;
      uint64_t v283 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v276, (uint64_t)&v358, (uint64_t)v404, 16, v277);
      if (v283)
      {
        uint64_t v284 = *(void *)v359;
        do
        {
          for (uint64_t i = 0; i != v283; ++i)
          {
            if (*(void *)v359 != v284) {
              objc_enumerationMutation(obj);
            }
            uint64_t v286 = *(void *)(*((void *)&v358 + 1) + 8 * i);
            uint64_t v287 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v278, v279, v280, v281, v282);
            uint64_t v293 = objc_msgSend_tokenColumnCount(v355, v288, v289, v290, v291, v292);
            v356[0] = MEMORY[0x1E4F143A8];
            v356[1] = 3221225472;
            v356[2] = sub_1C4A90114;
            v356[3] = &unk_1E64E3150;
            id v294 = v287;
            id v357 = v294;
            objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v355, v295, v286, 0, v293, (uint64_t)v356);
            objc_msgSend_addObject_(v354, v296, (uint64_t)v294, v297, v298, v299);
          }
          uint64_t v275 = obj;
          uint64_t v283 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v278, (uint64_t)&v358, (uint64_t)v404, 16, v282);
        }
        while (v283);
      }

      v300 = [CHMutableTokenizedTextResult alloc];
      v306 = objc_msgSend_transcriptionPathScores(v355, v301, v302, v303, v304, v305);
      uint64_t v312 = objc_msgSend_trailingSeparator(v355, v307, v308, v309, v310, v311);
      uint64_t v318 = objc_msgSend_recognizerGenerationIdentifier(v355, v313, v314, v315, v316, v317);
      uint64_t v324 = objc_msgSend_changeableTokenColumnCount(v355, v319, v320, v321, v322, v323);
      uint64_t v89 = (CHTokenizedTextResult *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v300, v325, (uint64_t)v354, (uint64_t)v306, (uint64_t)v312, v318, v324);

      v331 = objc_msgSend_originalTokens(v352, v326, v327, v328, v329, v330);
      objc_msgSend_setOriginalTokens_(v89, v332, (uint64_t)v331, v333, v334, v335);
    }
    else
    {
      uint64_t v89 = v355;
    }

    _Block_object_dispose(v375, 8);
    _Block_object_dispose(&v376, 8);
    _Block_object_dispose(&v380, 8);

    _Block_object_dispose(&v386, 8);
    _Block_object_dispose(&v390, 8);

    _Block_object_dispose(&v394, 8);
    if (__p)
    {
      v401 = (char *)__p;
      operator delete(__p);
    }

    goto LABEL_51;
  }
  uint64_t v89 = v352;
LABEL_51:

LABEL_52:
  return v89;
}

- (id)changeableColumnCountUpdatedResultWithHistory:(id)a3 phraseLexicon:(_LXLexicon *)a4 maxPhraseLength:(int64_t)a5
{
  uint64_t v8 = (__CFString *)a3;
  uint64_t v9 = self;
  if (objc_msgSend_tokenColumnCount(v9, v10, v11, v12, v13, v14) && a4 && a5 && v9->_transcriptionPaths)
  {
    if (!v8) {
      uint64_t v8 = &stru_1F20141C8;
    }
    uint64_t v20 = objc_msgSend_precedingSeparatorForTopTranscriptionPath(v9, v15, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_stringByAppendingString_(v8, v21, (uint64_t)v20, v22, v23, v24);

    uint64_t v124 = v25;
    uint64_t v31 = objc_msgSend_topTranscription(v9, v26, v27, v28, v29, v30);
    objc_msgSend_stringByAppendingString_(v25, v32, (uint64_t)v31, v33, v34, v35);
    uint64_t v125 = (NSString *)objc_claimAutoreleasedReturnValue();

    NSUInteger v41 = objc_msgSend_length(v8, v36, v37, v38, v39, v40);
    NSUInteger v47 = objc_msgSend_length(v8, v42, v43, v44, v45, v46);
    uint64_t v53 = objc_msgSend_length(v125, v48, v49, v50, v51, v52);
    uint64_t v59 = objc_msgSend_length(v8, v54, v55, v56, v57, v58);
    uint64_t v136 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v65 = objc_msgSend_firstObject(v9->_transcriptionPaths, v60, v61, v62, v63, v64);
    uint64_t v71 = objc_msgSend_tokenColumnCount(v9, v66, v67, v68, v69, v70);
    uint64_t v73 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v9, v72, (uint64_t)v65, 0, v71 - 1, 0);

    uint64_t v79 = objc_msgSend_length(v124, v74, v75, v76, v77, v78);
    uint64_t v85 = objc_msgSend_length(v73, v80, v81, v82, v83, v84);
    v139.NSUInteger length = v53 - v59;
    v138.NSUInteger location = 0;
    v138.NSUInteger length = v41;
    v139.NSUInteger location = v47;
    id v86 = phraseMatchingCandidates(v125, a4, v138, v139, a5, v85 + v79, &v136);
    if (v136 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v132 = 0;
      uint64_t v133 = &v132;
      uint64_t v134 = 0x2020000000;
      uint64_t v135 = 0x7FFFFFFFFFFFFFFFLL;
      v131[0] = 0;
      v131[1] = v131;
      v131[2] = 0x2020000000;
      v131[3] = 0;
      v126[0] = MEMORY[0x1E4F143A8];
      v126[1] = 3221225472;
      v126[2] = sub_1C4A90570;
      v126[3] = &unk_1E64E34A0;
      uint64_t v128 = v131;
      uint64_t v129 = &v132;
      uint64_t v130 = v136;
      double v127 = v8;
      objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v9, v87, (uint64_t)v126, v88, v89, v90);
      if (v133[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v96 = 1;
      }
      else
      {
        uint64_t v98 = objc_msgSend_tokenColumnCount(v9, v91, v92, v93, v94, v95);
        uint64_t v96 = v98 - v133[3];
      }
      if (objc_msgSend_changeableTokenColumnCount(v9, v91, v92, v93, v94, v95) > v96) {
        uint64_t v96 = objc_msgSend_changeableTokenColumnCount(v9, v99, v100, v101, v102, v103);
      }
      if (v96 != objc_msgSend_changeableTokenColumnCount(v9, v99, v100, v101, v102, v103))
      {
        uint64_t v109 = objc_msgSend_mutableCopy(v9, v104, v105, v106, v107, v108);
        objc_msgSend_setChangeableTokenColumnCount_(v109, v110, v96, v111, v112, v113);
        uint64_t v114 = v109;

        objc_msgSend_setInputStrokeIdentifiers_(v114, v115, (uint64_t)v9->_inputStrokeIdentifiers, v116, v117, v118);
        objc_msgSend_setLocale_(v114, v119, (uint64_t)v9->_locale, v120, v121, v122);

        uint64_t v9 = v114;
      }

      _Block_object_dispose(v131, 8);
      _Block_object_dispose(&v132, 8);
    }
    uint64_t v97 = v9;
  }
  else
  {
    uint64_t v97 = v9;
  }

  return v97;
}

+ (id)tokenizedTextResultFromResults:(id)a3 shouldPerformStrictFiltering:(BOOL)a4 doesTopLocaleRequireSpecialHandling:(BOOL)a5 hasSwap:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  v350[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (objc_msgSend_count(v9, v10, v11, v12, v13, v14))
  {
    uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v9, v15, 0, v16, v17, v18);
    uint64_t v25 = objc_msgSend_strokeIndexes(v19, v20, v21, v22, v23, v24);

    v346[0] = MEMORY[0x1E4F143A8];
    v346[1] = 3221225472;
    v346[2] = sub_1C4A911A8;
    v346[3] = &unk_1E64E34C8;
    id v327 = v25;
    id v347 = v327;
    uint64_t v30 = objc_msgSend_indexesOfObjectsPassingTest_(v9, v26, (uint64_t)v346, v27, v28, v29);
    uint64_t v328 = objc_msgSend_objectsAtIndexes_(v9, v31, (uint64_t)v30, v32, v33, v34);

    if (objc_msgSend_count(v328, v35, v36, v37, v38, v39) == 1 || v8)
    {
      v331 = objc_msgSend_firstObject(v328, v40, v41, v42, v43, v44);
      uint64_t v61 = objc_msgSend_copy(v331, v62, v63, v64, v65, v66);
    }
    else
    {
      v331 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v40, v41, v42, v43, v44);
      uint64_t v330 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v45, v46, v47, v48, v49);
      if (v6)
      {
        uint64_t v329 = 0;
        if ((unint64_t)objc_msgSend_count(v328, v50, v51, v52, v53, v54) >= 2 && v7)
        {
          uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v328, v50, 1, v52, v53, v54);
          uint64_t v329 = objc_msgSend_rawTranscription(v55, v56, v57, v58, v59, v60);
        }
      }
      else
      {
        uint64_t v329 = 0;
      }
      unint64_t v68 = 0;
      int v332 = v7 && v6;
      double v69 = 1.0;
      while (v68 < objc_msgSend_count(v328, v50, v51, v52, v53, v54))
      {
        id v337 = objc_msgSend_objectAtIndexedSubscript_(v328, v70, v68, v71, v72, v73);
        uint64_t v79 = objc_msgSend_transcriptionPaths(v337, v74, v75, v76, v77, v78);
        uint64_t v85 = objc_msgSend_firstObject(v79, v80, v81, v82, v83, v84);
        double v86 = sub_1C4A8A650(v337, v85);

        if (objc_msgSend_count(v331, v87, v88, v89, v90, v91))
        {
          if (v86 < fmax(v69 * 0.8, 0.5))
          {

            break;
          }
        }
        else
        {
          double v69 = v86;
        }
        uint64_t v97 = objc_msgSend_transcriptionPaths(v337, v92, v93, v94, v95, v96);
        uint64_t v334 = objc_msgSend_firstObject(v97, v98, v99, v100, v101, v102);

        for (unint64_t i = 0; ; ++i)
        {
          uint64_t v108 = objc_msgSend_transcriptionPaths(v337, v103, v104, v105, v106, v107);
          BOOL v114 = i < objc_msgSend_count(v108, v109, v110, v111, v112, v113);

          if (!v114) {
            break;
          }
          uint64_t v120 = objc_msgSend_transcriptionPaths(v337, v115, v116, v117, v118, v119);
          uint64_t v125 = objc_msgSend_objectAtIndexedSubscript_(v120, v121, i, v122, v123, v124);

          v336 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v126, v127, v128, v129, v130);
          uint64_t v136 = objc_msgSend_transcriptionPaths(v337, v131, v132, v133, v134, v135);
          uint64_t v141 = objc_msgSend_objectAtIndexedSubscript_(v136, v137, i, v138, v139, v140);
          uint64_t v147 = objc_msgSend_length(v141, v142, v143, v144, v145, v146);
          uint64_t v333 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v337, v148, (uint64_t)v125, 0, v147, 0);

          if (!v332) {
            goto LABEL_40;
          }
          char isEqualToString = 0;
          if (!v68 && i == 1) {
            char isEqualToString = objc_msgSend_isEqualToString_(v329, v149, (uint64_t)v333, v151, v152, v153);
          }
          if (((v68 | i) == 0) | isEqualToString & 1) {
            goto LABEL_40;
          }
          uint64_t v155 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], v149, v150, v151, v152, v153);
          v350[0] = v155;
          uint64_t v161 = objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v156, v157, v158, v159, v160);
          v350[1] = v161;
          uint64_t v167 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v162, v163, v164, v165, v166);
          v350[2] = v167;
          uint64_t v173 = objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E4F28B88], v168, v169, v170, v171, v172);
          v350[3] = v173;
          uint64_t v177 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v174, (uint64_t)v350, 4, v175, v176);
          uint64_t v182 = objc_msgSend_ch_hasCharactersFromSets_(v333, v178, (uint64_t)v177, v179, v180, v181);

          long long v344 = 0u;
          long long v345 = 0u;
          long long v342 = 0u;
          long long v343 = 0u;
          id v183 = v182;
          uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v183, v184, (uint64_t)&v342, (uint64_t)v349, 16, v185);
          if (!v191)
          {

LABEL_40:
            unint64_t v195 = 0;
            if (v68) {
              BOOL v196 = i == 0;
            }
            else {
              BOOL v196 = 1;
            }
            int v197 = v196;
            while (2)
            {
              if (v195 >= objc_msgSend_length(v125, v149, v150, v151, v152, v153))
              {
                objc_msgSend_addObject_(v331, v198, (uint64_t)v336, v199, v200, v201);
                uint64_t v277 = objc_msgSend_transcriptionPathScores(v337, v272, v273, v274, v275, v276);
                uint64_t v282 = objc_msgSend_objectAtIndexedSubscript_(v277, v278, i, v279, v280, v281);
                objc_msgSend_addObject_(v330, v283, (uint64_t)v282, v284, v285, v286);

                goto LABEL_64;
              }
              uint64_t v202 = objc_msgSend_indexAtPosition_(v125, v198, v195, v199, v200, v201);
              uint64_t v208 = objc_msgSend_tokenColumns(v337, v203, v204, v205, v206, v207);
              uint64_t v213 = objc_msgSend_objectAtIndexedSubscript_(v208, v209, v195, v210, v211, v212);
              uint64_t v219 = objc_msgSend_textTokenRows(v213, v214, v215, v216, v217, v218);
              uint64_t v224 = objc_msgSend_objectAtIndexedSubscript_(v219, v220, v202, v221, v222, v223);

              if (v197)
              {
                objc_msgSend_addObjectsFromArray_(v336, v225, (uint64_t)v224, v226, v227, v228);
LABEL_62:

                ++v195;
                continue;
              }
              break;
            }
            long long v340 = 0u;
            long long v341 = 0u;
            long long v338 = 0u;
            long long v339 = 0u;
            id v229 = v224;
            uint64_t v237 = objc_msgSend_countByEnumeratingWithState_objects_count_(v229, v230, (uint64_t)&v338, (uint64_t)v348, 16, v231);
            if (v237)
            {
              uint64_t v238 = *(void *)v339;
              char isTopOriginal = 1;
              do
              {
                for (uint64_t j = 0; j != v237; ++j)
                {
                  while (1)
                  {
                    if (*(void *)v339 != v238) {
                      objc_enumerationMutation(v229);
                    }
                    if (isTopOriginal) {
                      break;
                    }
                    char isTopOriginal = 0;
                    if (v237 == ++j) {
                      goto LABEL_57;
                    }
                  }
                  char isTopOriginal = objc_msgSend_isTopOriginal(*(void **)(*((void *)&v338 + 1) + 8 * j), v232, v233, v234, v235, v236);
                }
LABEL_57:
                uint64_t v237 = objc_msgSend_countByEnumeratingWithState_objects_count_(v229, v232, (uint64_t)&v338, (uint64_t)v348, 16, v236);
              }
              while (v237);

              if ((isTopOriginal & 1) == 0)
              {
                uint64_t v246 = objc_msgSend_tokenColumns(v337, v241, v242, v243, v244, v245);
                uint64_t v251 = objc_msgSend_objectAtIndexedSubscript_(v246, v247, v195, v248, v249, v250);
                uint64_t v257 = objc_msgSend_textTokenRows(v251, v252, v253, v254, v255, v256);
                uint64_t v262 = objc_msgSend_indexAtPosition_(v334, v258, v195, v259, v260, v261);
                uint64_t v267 = objc_msgSend_objectAtIndexedSubscript_(v257, v263, v262, v264, v265, v266);
                objc_msgSend_addObjectsFromArray_(v336, v268, (uint64_t)v267, v269, v270, v271);

                goto LABEL_62;
              }
            }
            else
            {
            }
            objc_msgSend_addObjectsFromArray_(v336, v241, (uint64_t)v229, v243, v244, v245);
            goto LABEL_62;
          }
          int v192 = 0;
          uint64_t v193 = *(void *)v343;
          do
          {
            for (uint64_t k = 0; k != v191; ++k)
            {
              if (*(void *)v343 != v193) {
                objc_enumerationMutation(v183);
              }
              if ((int)objc_msgSend_intValue(*(void **)(*((void *)&v342 + 1) + 8 * k), v186, v187, v188, v189, v190) > 0) {
                ++v192;
              }
            }
            uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v183, v186, (uint64_t)&v342, (uint64_t)v349, 16, v190);
          }
          while (v191);

          if (v192 < 2) {
            goto LABEL_40;
          }
LABEL_64:
        }
        ++v68;
      }
      uint64_t v287 = [CHTokenizedTextResult alloc];
      uint64_t v292 = objc_msgSend_objectAtIndexedSubscript_(v328, v288, 0, v289, v290, v291);
      uint64_t v298 = objc_msgSend_trailingSeparator(v292, v293, v294, v295, v296, v297);
      uint64_t v303 = objc_msgSend_objectAtIndexedSubscript_(v328, v299, 0, v300, v301, v302);
      uint64_t v309 = objc_msgSend_recognizerGenerationIdentifier(v303, v304, v305, v306, v307, v308);
      uint64_t v314 = objc_msgSend_objectAtIndexedSubscript_(v328, v310, 0, v311, v312, v313);
      uint64_t v320 = objc_msgSend_changeableTokenColumnCount(v314, v315, v316, v317, v318, v319);
      uint64_t v322 = objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v287, v321, (uint64_t)v331, (uint64_t)v330, (uint64_t)v298, v309, v320);

      uint64_t v61 = objc_msgSend_resultRestoringRawPathInResult_(CHTokenizedTextResult, v323, (uint64_t)v322, v324, v325, v326);
    }
    id v9 = v328;
  }
  else
  {
    uint64_t v61 = 0;
  }

  return v61;
}

+ (id)swappableColumnIndexesInResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5 swappableIndex:(int64_t)a6 shouldReverseSwappableColumns:(BOOL)a7
{
  BOOL v7 = a7;
  v671[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v647 = a4;
  int64_t v650 = a5;
  v645 = v11;
  v658 = objc_msgSend_objectAtIndexedSubscript_(v11, v12, a5, v13, v14, v15);
  objc_msgSend_objectAtIndexedSubscript_(v11, v16, a6, v17, v18, v19);
  v661 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v651 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v20, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_transcriptionPaths(v658, v25, v26, v27, v28, v29);
  if (objc_msgSend_count(v30, v31, v32, v33, v34, v35))
  {
    uint64_t v41 = objc_msgSend_transcriptionPaths(v661, v36, v37, v38, v39, v40);
    uint64_t v47 = objc_msgSend_count(v41, v42, v43, v44, v45, v46);

    if (v47)
    {
      uint64_t v53 = objc_msgSend_objectAtIndexedSubscript_(v647, v48, v650, v50, v51, v52);
      char isSupportedCyrillicScriptLocale_withMode = objc_msgSend_isSupportedCyrillicScriptLocale_withMode_(CHRecognizerConfiguration, v54, (uint64_t)v53, 4, v55, v56);

      uint64_t v61 = objc_msgSend_objectAtIndexedSubscript_(v647, v57, v650, v58, v59, v60);
      int isSupportedLatinScriptLocale_withMode = objc_msgSend_isSupportedLatinScriptLocale_withMode_(CHRecognizerConfiguration, v62, (uint64_t)v61, 4, v63, v64);

      if (qword_1EA3C9F40 != -1) {
        dispatch_once(&qword_1EA3C9F40, &unk_1F20139C8);
      }
      v660 = objc_msgSend_commonTopStrokeSetsWithResult_shouldReverseOtherColumns_(v658, v65, (uint64_t)v661, v7, v66, v67);
      v659 = objc_msgSend_tokenColumns(v661, v68, v69, v70, v71, v72);
      int64_t v646 = a6;
      if (v7)
      {
        uint64_t v78 = objc_msgSend_tokenColumns(v661, v73, v74, v75, v76, v77);
        uint64_t v84 = objc_msgSend_reverseObjectEnumerator(v78, v79, v80, v81, v82, v83);
        uint64_t v90 = objc_msgSend_allObjects(v84, v85, v86, v87, v88, v89);

        v659 = (void *)v90;
      }
      v655 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v73, v74, v75, v76, v77);
      v656 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v91, (uint64_t)&unk_1F203E658, v92, v93, v94);
      v652 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v95, (uint64_t)&unk_1F203E658, v96, v97, v98);
      v657 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v99, (uint64_t)&unk_1F203E658, v100, v101, v102);
      v653 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v103, (uint64_t)&unk_1F203E658, v104, v105, v106);
      if (v660)
      {
        unint64_t v112 = 0;
        unint64_t v113 = 0;
        while (1)
        {
          uint64_t v115 = objc_msgSend_tokenColumns(v658, v107, v108, v109, v110, v111);
          unint64_t v121 = objc_msgSend_count(v115, v116, v117, v118, v119, v120);

          if (v112 >= v121) {
            break;
          }
          uint64_t v127 = objc_msgSend_tokenColumns(v658, v122, v123, v124, v125, v126);
          uint64_t v132 = objc_msgSend_objectAtIndexedSubscript_(v127, v128, v112, v129, v130, v131);
          uint64_t v138 = objc_msgSend_strokeIndexes(v132, v133, v134, v135, v136, v137);
          objc_msgSend_addIndexes_(v655, v139, (uint64_t)v138, v140, v141, v142);

          uint64_t v147 = objc_msgSend_objectAtIndexedSubscript_(v660, v143, v113, v144, v145, v146);
          LODWORD(v132) = objc_msgSend_isEqualToIndexSet_(v655, v148, (uint64_t)v147, v149, v150, v151);

          if (v132)
          {
            uint64_t v152 = objc_msgSend_lastObject(v657, v107, v108, v109, v110, v111);
            LODWORD(i) = objc_msgSend_intValue(v152, v153, v154, v155, v156, v157);

            uint64_t v168 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v158, v159, v160, v161, v162);
            for (uint64_t i = (int)i; ; ++i)
            {
              if (i >= objc_msgSend_tokenColumnCount(v661, v163, v164, v165, v166, v167))
              {
                uint64_t v114 = (uint64_t)v655;
                goto LABEL_10;
              }
              uint64_t v174 = objc_msgSend_objectAtIndexedSubscript_(v659, v170, i, v171, v172, v173);
              uint64_t v180 = objc_msgSend_strokeIndexes(v174, v175, v176, v177, v178, v179);
              objc_msgSend_addIndexes_(v168, v181, (uint64_t)v180, v182, v183, v184);

              uint64_t v189 = objc_msgSend_objectAtIndexedSubscript_(v660, v185, v113, v186, v187, v188);
              LODWORD(v180) = objc_msgSend_isEqualToIndexSet_(v168, v190, (uint64_t)v189, v191, v192, v193);

              if (v180) {
                break;
              }
            }
            uint64_t v194 = NSNumber;
            unint64_t v195 = objc_msgSend_objectAtIndexedSubscript_(v656, v163, v113, v165, v166, v167);
            int v201 = objc_msgSend_intValue(v195, v196, v197, v198, v199, v200);
            uint64_t v206 = objc_msgSend_numberWithInteger_(v194, v202, v112 + 1 - v201, v203, v204, v205);
            objc_msgSend_setObject_atIndexedSubscript_(v652, v207, (uint64_t)v206, v113, v208, v209);

            uint64_t v210 = NSNumber;
            uint64_t v215 = objc_msgSend_objectAtIndexedSubscript_(v657, v211, v113, v212, v213, v214);
            int v221 = objc_msgSend_intValue(v215, v216, v217, v218, v219, v220);
            uint64_t v226 = objc_msgSend_numberWithInteger_(v210, v222, i - v221 + 1, v223, v224, v225);
            objc_msgSend_setObject_atIndexedSubscript_(v653, v227, (uint64_t)v226, v113, v228, v229);

            uint64_t v114 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v230, v231, v232, v233, v234);

            if (v113 < objc_msgSend_count(v660, v235, v236, v237, v238, v239) - 1)
            {
              uint64_t v245 = NSNumber;
              uint64_t v246 = objc_msgSend_lastObject(v656, v240, v241, v242, v243, v244);
              int v252 = objc_msgSend_intValue(v246, v247, v248, v249, v250, v251);
              double v258 = objc_msgSend_lastObject(v652, v253, v254, v255, v256, v257);
              int v264 = objc_msgSend_intValue(v258, v259, v260, v261, v262, v263);
              uint64_t v269 = objc_msgSend_numberWithInt_(v245, v265, (v264 + v252), v266, v267, v268);
              objc_msgSend_addObject_(v656, v270, (uint64_t)v269, v271, v272, v273);

              objc_msgSend_addObject_(v652, v274, (uint64_t)&unk_1F203E658, v275, v276, v277);
              uint64_t v278 = NSNumber;
              uint64_t v284 = objc_msgSend_lastObject(v657, v279, v280, v281, v282, v283);
              LODWORD(v269) = objc_msgSend_intValue(v284, v285, v286, v287, v288, v289);
              uint64_t v295 = objc_msgSend_lastObject(v653, v290, v291, v292, v293, v294);
              int v301 = objc_msgSend_intValue(v295, v296, v297, v298, v299, v300);
              uint64_t v306 = objc_msgSend_numberWithInt_(v278, v302, (v301 + v269), v303, v304, v305);
              objc_msgSend_addObject_(v657, v307, (uint64_t)v306, v308, v309, v310);

              objc_msgSend_addObject_(v653, v311, (uint64_t)&unk_1F203E658, v312, v313, v314);
              ++v113;
            }
LABEL_10:

            v655 = (void *)v114;
          }
          ++v112;
        }
      }
      else
      {
        v401 = NSNumber;
        uint64_t v402 = objc_msgSend_tokenColumnCount(v658, v107, v108, v109, v110, v111);
        _NSRange v407 = objc_msgSend_numberWithInteger_(v401, v403, v402, v404, v405, v406);
        objc_msgSend_setObject_atIndexedSubscript_(v652, v408, (uint64_t)v407, 0, v409, v410);

        v411 = NSNumber;
        uint64_t v417 = objc_msgSend_tokenColumnCount(v661, v412, v413, v414, v415, v416);
        v422 = objc_msgSend_numberWithInteger_(v411, v418, v417, v419, v420, v421);
        objc_msgSend_setObject_atIndexedSubscript_(v653, v423, (uint64_t)v422, 0, v424, v425);
      }
      if (v7)
      {
        for (unint64_t j = 0; j < objc_msgSend_count(v657, v122, v123, v124, v125, v126); ++j)
        {
          v427 = NSNumber;
          uint64_t v428 = objc_msgSend_tokenColumnCount(v661, v122, v123, v124, v125, v126);
          v433 = objc_msgSend_objectAtIndexedSubscript_(v657, v429, j, v430, v431, v432);
          uint64_t v439 = objc_msgSend_integerValue(v433, v434, v435, v436, v437, v438);
          v444 = objc_msgSend_objectAtIndexedSubscript_(v653, v440, j, v441, v442, v443);
          uint64_t v450 = objc_msgSend_integerValue(v444, v445, v446, v447, v448, v449);
          v455 = objc_msgSend_numberWithInteger_(v427, v451, v428 - (v439 + v450), v452, v453, v454);
          objc_msgSend_setObject_atIndexedSubscript_(v657, v456, (uint64_t)v455, j, v457, v458);
        }
      }
      unint64_t v459 = 0;
      v643 = v663;
      v644 = v665;
      for (uint64_t k = &stru_1F20141C8; ; uint64_t k = v641)
      {
        if (v459 >= objc_msgSend_count(v656, v122, v123, v124, v125, v126))
        {
          id v400 = v651;

          goto LABEL_75;
        }
        v464 = objc_msgSend_objectAtIndexedSubscript_(v656, v460, v459, v461, v462, v463);
        int v470 = objc_msgSend_intValue(v464, v465, v466, v467, v468, v469);
        v475 = objc_msgSend_objectAtIndexedSubscript_(v652, v471, v459, v472, v473, v474);
        int v481 = objc_msgSend_intValue(v475, v476, v477, v478, v479, v480);

        v486 = objc_msgSend_objectAtIndexedSubscript_(v657, v482, v459, v483, v484, v485);
        int v492 = objc_msgSend_intValue(v486, v487, v488, v489, v490, v491);
        v497 = objc_msgSend_objectAtIndexedSubscript_(v653, v493, v459, v494, v495, v496);
        int v503 = objc_msgSend_intValue(v497, v498, v499, v500, v501, v502);

        v509 = objc_msgSend_transcriptionPaths(v658, v504, v505, v506, v507, v508);
        v514 = objc_msgSend_objectAtIndexedSubscript_(v509, v510, 0, v511, v512, v513);
        uint64_t v515 = v481;
        v517 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v658, v516, (uint64_t)v514, v470, v481, 0);

        v523 = objc_msgSend_transcriptionPaths(v661, v518, v519, v520, v521, v522);
        v528 = objc_msgSend_objectAtIndexedSubscript_(v523, v524, 0, v525, v526, v527);
        uint64_t v529 = v503;
        v531 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v661, v530, (uint64_t)v528, v492, v503, 0);

        LODWORD(v528) = objc_msgSend_isEqualToString_(v517, v532, (uint64_t)v531, v533, v534, v535);
        LODWORD(v523) = objc_msgSend_hasTextReplacementsInColumnRange_(v658, v536, v470, v515, v537, v538);
        if ((v528 | v523 | objc_msgSend_hasTextReplacementsInColumnRange_(v661, v539, v492, v503, v540, v541)))goto LABEL_71; {
        if (isSupportedLatinScriptLocale_withMode)
        }
        {
          if (v658)
          {
            v546 = -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v658);
            uint64_t v548 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v658, v547, (uint64_t)v546, v470, v515, 0);
            if (v548) {
              v549 = (__CFString *)v548;
            }
            else {
              v549 = &stru_1F20141C8;
            }

            uint64_t v554 = objc_msgSend_caseInsensitiveCompare_(v549, v550, (uint64_t)v517, v551, v552, v553);
          }
          else
          {
            v549 = 0;
            uint64_t v554 = objc_msgSend_caseInsensitiveCompare_(0, v542, (uint64_t)v517, v543, v544, v545);
          }
          uint64_t v559 = v554;
          uint64_t v560 = objc_msgSend_caseInsensitiveCompare_(v549, v555, (uint64_t)v531, v556, v557, v558);
          if (v559)
          {
            if (!v560)
            {
              *(void *)long long buf = 0;
              *(void *)&uint8_t buf[8] = buf;
              *(void *)&uint8_t buf[16] = 0x2020000000;
              char v669 = 1;
              v566 = objc_msgSend_transcriptionPaths(v661, v561, v562, v563, v564, v565);
              v571 = objc_msgSend_objectAtIndexedSubscript_(v566, v567, 0, v568, v569, v570);
              v664[0] = MEMORY[0x1E4F143A8];
              v664[1] = 3221225472;
              v665[0] = sub_1C4A928E4;
              v665[1] = &unk_1E64E31B8;
              v665[2] = buf;
              objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v661, v572, (uint64_t)v571, v492, v529, (uint64_t)v664);

              LODWORD(v571) = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
              _Block_object_dispose(buf, 8);
              if (v571)
              {

LABEL_64:
                v591 = objc_msgSend_numberWithInteger_(NSNumber, v542, v646, v543, v544, v545);
                v667[0] = v591;
                v596 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v592, v470, v593, v594, v595);
                v667[1] = v596;
                v601 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v597, v515, v598, v599, v600);
                v667[2] = v601;
                v606 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v602, v492, v603, v604, v605);
                v667[3] = v606;
                v611 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v607, v529, v608, v609, v610);
                v667[4] = v611;
                v615 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v612, (uint64_t)v667, 5, v613, v614);
                objc_msgSend_addObject_(v651, v616, (uint64_t)v615, v617, v618, v619);

                v620 = v531;
                goto LABEL_72;
              }
            }
          }
          if (!isStringEntirelyFromSet(&v549->isa, (NSCharacterSet *)qword_1EA3C9F30)) {
            goto LABEL_58;
          }
          *(void *)long long buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x2020000000;
          char v669 = 1;
          v573 = -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v658);
          v662[0] = MEMORY[0x1E4F143A8];
          v662[1] = 3221225472;
          v663[0] = sub_1C4A92954;
          v663[1] = &unk_1E64E31B8;
          v663[2] = buf;
          objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v658, v574, (uint64_t)v573, v470, v515, (uint64_t)v662);

          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            _Block_object_dispose(buf, 8);
LABEL_58:

            goto LABEL_71;
          }
          v621 = v661;
          if (v661)
          {
            v622 = -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v661);
            uint64_t v624 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v661, v623, (uint64_t)v622, v492, v529, 0);
            if (v624) {
              v621 = (__CFString *)v624;
            }
            else {
              v621 = &stru_1F20141C8;
            }
          }
          BOOL v625 = objc_msgSend_compare_options_(v549, v575, (uint64_t)v621, 129, v576, v577) == 0;

          _Block_object_dispose(buf, 8);
          if (v625) {
            goto LABEL_64;
          }
        }
        else if (isSupportedCyrillicScriptLocale_withMode)
        {
          if (objc_msgSend_shouldSwapCyrillicTopResult_topRange_englishResult_englishRange_prevousGroupTopString_(CHRecognizerConfiguration, v542, (uint64_t)v658, v470, v515, (uint64_t)v661, v492, v503, k, v643, v644))goto LABEL_64; {
        }
          }
        else
        {
          BOOL v578 = isStringEntirelyFromSet((NSString *)v517, (NSCharacterSet *)qword_1EA3C9F38);
          if ((unint64_t)objc_msgSend_length(v517, v579, v580, v581, v582, v583) >= 2)
          {
            unint64_t v585 = objc_msgSend_length(v517, v542, v584, v543, v544, v545);
            objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v517, v586, 0, v587, v588, v589);
            if (v585 > (unint64_t)v542 && v578) {
              goto LABEL_64;
            }
          }
        }
LABEL_71:
        v591 = objc_msgSend_numberWithInteger_(NSNumber, v542, v650, v543, v544, v545);
        v666[0] = v591;
        v596 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v626, v470, v627, v628, v629);
        v666[1] = v596;
        v601 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v630, v515, v631, v632, v633);
        v666[2] = v601;
        v666[3] = &unk_1F203E658;
        v666[4] = &unk_1F203E658;
        v606 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v634, (uint64_t)v666, 5, v635, v636);
        objc_msgSend_addObject_(v651, v637, (uint64_t)v606, v638, v639, v640);
        v620 = v517;
LABEL_72:

        v641 = v620;
        ++v459;
      }
    }
  }
  else
  {
  }
  uint64_t v315 = objc_msgSend_transcriptionPaths(v658, v48, v49, v50, v51, v52);
  uint64_t v321 = objc_msgSend_count(v315, v316, v317, v318, v319, v320);

  if (!v321)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    id v327 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v327, OS_LOG_TYPE_FAULT))
    {
      uint64_t v333 = objc_msgSend_strokeIndexes(v658, v328, v329, v330, v331, v332);
      *(_DWORD *)long long buf = 134218240;
      *(void *)&uint8_t buf[4] = objc_msgSend_count(v333, v334, v335, v336, v337, v338);
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = objc_msgSend_tokenColumnCount(v658, v339, v340, v341, v342, v343);
      _os_log_impl(&dword_1C492D000, v327, OS_LOG_TYPE_FAULT, "rdar://114127212 topResult has no transcription path. Stroke Count = %lu Column Count = %lu", buf, 0x16u);
    }
  }
  long long v344 = objc_msgSend_transcriptionPaths(v661, v322, v323, v324, v325, v326);
  BOOL v350 = objc_msgSend_count(v344, v345, v346, v347, v348, v349) == 0;

  if (v350)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v355 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v355, OS_LOG_TYPE_FAULT))
    {
      long long v361 = objc_msgSend_strokeIndexes(v661, v356, v357, v358, v359, v360);
      uint64_t v367 = objc_msgSend_count(v361, v362, v363, v364, v365, v366);
      uint64_t v373 = objc_msgSend_tokenColumnCount(v661, v368, v369, v370, v371, v372);
      *(_DWORD *)long long buf = 134218240;
      *(void *)&uint8_t buf[4] = v367;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v373;
      _os_log_impl(&dword_1C492D000, v355, OS_LOG_TYPE_FAULT, "rdar://114127212 englishResult has no transcription path. Stroke Count = %lu Column Count = %lu", buf, 0x16u);
    }
  }
  v660 = objc_msgSend_numberWithInteger_(NSNumber, v351, v650, v352, v353, v354);
  v670[0] = v660;
  v670[1] = &unk_1F203E658;
  BOOL v374 = NSNumber;
  v659 = objc_msgSend_objectAtIndexedSubscript_(v645, v375, v650, v376, v377, v378);
  v655 = objc_msgSend_tokenColumns(v659, v379, v380, v381, v382, v383);
  uint64_t v389 = objc_msgSend_count(v655, v384, v385, v386, v387, v388);
  v656 = objc_msgSend_numberWithUnsignedInteger_(v374, v390, v389, v391, v392, v393);
  v670[2] = v656;
  v670[3] = &unk_1F203E658;
  v670[4] = &unk_1F203E658;
  v652 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v394, (uint64_t)v670, 5, v395, v396);
  v671[0] = v652;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v397, (uint64_t)v671, 1, v398, v399);
  id v400 = (id)objc_claimAutoreleasedReturnValue();
LABEL_75:

  return v400;
}

+ (id)compressResult:(id)a3 atColumnIndexes:(id)a4
{
  uint64_t v337 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v326 = a4;
  uint64_t v329 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_tokenColumns(v5, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_firstObject(v22, v23, v24, v25, v26, v27);
  objc_msgSend_addObject_(v329, v29, (uint64_t)v28, v30, v31, v32);

  long long v334 = 0u;
  long long v335 = 0u;
  long long v332 = 0u;
  long long v333 = 0u;
  uint64_t v38 = objc_msgSend_transcriptionPaths(v5, v33, v34, v35, v36, v37);
  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v332, (uint64_t)v336, 16, v40);
  if (v45)
  {
    uint64_t v46 = *(void *)v333;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v333 != v46) {
          objc_enumerationMutation(v38);
        }
        uint64_t v48 = (void *)MEMORY[0x1E4F28D58];
        uint64_t v49 = objc_msgSend_indexAtPosition_(*(void **)(*((void *)&v332 + 1) + 8 * i), v41, 0, v42, v43, v44);
        uint64_t v54 = objc_msgSend_indexPathWithIndex_(v48, v50, v49, v51, v52, v53);
        objc_msgSend_addObject_(v16, v55, (uint64_t)v54, v56, v57, v58);
      }
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v332, (uint64_t)v336, 16, v44);
    }
    while (v45);
  }

  uint64_t v327 = objc_msgSend_changeableTokenColumnCount(v5, v59, v60, v61, v62, v63);
  uint64_t v325 = objc_msgSend_tokenColumnCount(v5, v64, v65, v66, v67, v68) - v327;
  for (uint64_t j = 1; j < objc_msgSend_tokenColumnCount(v5, v69, v70, v71, v72, v73, v325); ++j)
  {
    uint64_t v80 = objc_msgSend_tokenColumns(v5, v75, v76, v77, v78, v79);
    uint64_t v328 = objc_msgSend_objectAtIndexedSubscript_(v80, v81, j, v82, v83, v84);

    uint64_t v89 = objc_msgSend_objectAtIndexedSubscript_(v326, v85, j, v86, v87, v88);
    int v95 = objc_msgSend_BOOLValue(v89, v90, v91, v92, v93, v94);

    if (v95)
    {
      uint64_t v330 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v96, v97, v98, v99, v100);
      for (unint64_t k = 0; k < objc_msgSend_count(v16, v101, v102, v103, v104, v105); ++k)
      {
        uint64_t v111 = objc_msgSend_objectAtIndexedSubscript_(v16, v107, k, v108, v109, v110);
        uint64_t v117 = objc_msgSend_length(v111, v112, v113, v114, v115, v116);

        uint64_t v122 = objc_msgSend_objectAtIndexedSubscript_(v16, v118, k, v119, v120, v121);
        uint64_t v127 = objc_msgSend_indexAtPosition_(v122, v123, v117 - 1, v124, v125, v126);

        uint64_t v133 = objc_msgSend_transcriptionPaths(v5, v128, v129, v130, v131, v132);
        uint64_t v138 = objc_msgSend_objectAtIndexedSubscript_(v133, v134, k, v135, v136, v137);
        uint64_t v143 = objc_msgSend_indexAtPosition_(v138, v139, j, v140, v141, v142);

        uint64_t v149 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v144, v145, v146, v147, v148);
        uint64_t v155 = objc_msgSend_lastObject(v329, v150, v151, v152, v153, v154);
        uint64_t v161 = objc_msgSend_textTokenRows(v155, v156, v157, v158, v159, v160);
        uint64_t v166 = objc_msgSend_objectAtIndexedSubscript_(v161, v162, v127, v163, v164, v165);
        objc_msgSend_addObjectsFromArray_(v149, v167, (uint64_t)v166, v168, v169, v170);

        uint64_t v176 = objc_msgSend_tokenColumns(v5, v171, v172, v173, v174, v175);
        uint64_t v181 = objc_msgSend_objectAtIndexedSubscript_(v176, v177, j, v178, v179, v180);
        uint64_t v187 = objc_msgSend_textTokenRows(v181, v182, v183, v184, v185, v186);
        uint64_t v192 = objc_msgSend_objectAtIndexedSubscript_(v187, v188, v143, v189, v190, v191);
        objc_msgSend_addObjectsFromArray_(v149, v193, (uint64_t)v192, v194, v195, v196);

        uint64_t v197 = objc_opt_class();
        uint64_t v205 = objc_msgSend_mergeTokenRow_intoUniqueRows_(v197, v198, (uint64_t)v149, (uint64_t)v330, v199, v200);
        if (v205 != v127)
        {
          uint64_t v206 = objc_msgSend_objectAtIndexedSubscript_(v16, v201, k, v202, v203, v204);
          uint64_t v212 = objc_msgSend_indexPathByRemovingLastIndex(v206, v207, v208, v209, v210, v211);

          uint64_t v217 = objc_msgSend_indexPathByAddingIndex_(v212, v213, v205, v214, v215, v216);
          objc_msgSend_setObject_atIndexedSubscript_(v16, v218, (uint64_t)v217, k, v219, v220);
        }
      }
      uint64_t v256 = [CHTokenizedResultColumn alloc];
      uint64_t v261 = objc_msgSend_initWithTokenRows_(v256, v257, (uint64_t)v330, v258, v259, v260);
      uint64_t v267 = objc_msgSend_count(v329, v262, v263, v264, v265, v266);
      objc_msgSend_setObject_atIndexedSubscript_(v329, v268, (uint64_t)v261, v267 - 1, v269, v270);

      v327 -= j > v325;
    }
    else
    {
      objc_msgSend_addObject_(v329, v96, (uint64_t)v328, v98, v99, v100);
      for (unint64_t m = 0; m < objc_msgSend_count(v16, v221, v222, v223, v224, v225); ++m)
      {
        uint64_t v232 = objc_msgSend_transcriptionPaths(v5, v227, v228, v229, v230, v231);
        uint64_t v237 = objc_msgSend_objectAtIndexedSubscript_(v232, v233, m, v234, v235, v236);
        uint64_t v242 = objc_msgSend_indexAtPosition_(v237, v238, j, v239, v240, v241);

        uint64_t v247 = objc_msgSend_objectAtIndexedSubscript_(v16, v243, m, v244, v245, v246);
        int v252 = objc_msgSend_indexPathByAddingIndex_(v247, v248, v242, v249, v250, v251);
        objc_msgSend_setObject_atIndexedSubscript_(v16, v253, (uint64_t)v252, m, v254, v255);
      }
    }
  }
  unint64_t v271 = objc_msgSend_count(v329, v75, v76, v77, v78, v79);
  if (v271 >= objc_msgSend_tokenColumnCount(v5, v272, v273, v274, v275, v276))
  {
    uint64_t v303 = 0;
  }
  else
  {
    if (!objc_msgSend_count(v329, v277, v278, v279, v280, v281))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v282 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v282, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C492D000, v282, OS_LOG_TYPE_FAULT, "compressResult removed all columns.", buf, 2u);
      }
    }
    uint64_t v283 = [CHMutableTokenizedTextResult alloc];
    uint64_t v289 = objc_msgSend_transcriptionPathScores(v5, v284, v285, v286, v287, v288);
    uint64_t v295 = objc_msgSend_trailingSeparator(v5, v290, v291, v292, v293, v294);
    uint64_t v301 = objc_msgSend_recognizerGenerationIdentifier(v5, v296, v297, v298, v299, v300);
    uint64_t v303 = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v283, v302, (uint64_t)v329, (uint64_t)v16, (uint64_t)v289, (uint64_t)v295, v301, v327);

    uint64_t v309 = objc_msgSend_inputStrokeIdentifiers(v5, v304, v305, v306, v307, v308);
    objc_msgSend_setInputStrokeIdentifiers_(v303, v310, (uint64_t)v309, v311, v312, v313);

    uint64_t v319 = objc_msgSend_locale(v5, v314, v315, v316, v317, v318);
    objc_msgSend_setLocale_(v303, v320, (uint64_t)v319, v321, v322, v323);
  }
  return v303;
}

- (id)subResultWithColumnRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = objc_msgSend_transcriptionPaths(self, a2, a3.location, a3.length, v3, v4);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1C4A933D4;
  v30[3] = &unk_1E64E34E8;
  v30[4] = location;
  v30[5] = length;
  uint64_t v13 = objc_msgSend_ch_mappedArrayWithBlock_(v8, v9, (uint64_t)v30, v10, v11, v12);

  uint64_t v14 = [CHMutableTokenizedTextResult alloc];
  uint64_t v18 = objc_msgSend_subarrayWithRange_(self->_tokenColumns, v15, location, length, v16, v17);
  transcriptionPathScores = self->_transcriptionPathScores;
  int64_t recognizerGenerationIdentifier = self->_recognizerGenerationIdentifier;
  uint64_t isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v21, v22, v23, v24, v25);
  isMinimalDrawingResult_baseWritingDirection = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_recognizerGenerationIdentifier_isMinimalDrawingResult_baseWritingDirection_(v14, v27, (uint64_t)v18, (uint64_t)v13, (uint64_t)transcriptionPathScores, recognizerGenerationIdentifier, isMinimalDrawingResult, *(void *)&self->_baseWritingDirection);

  return isMinimalDrawingResult_baseWritingDirection;
}

+ (CGPath)newBaselinePathForTokens:(id)a3 strokeIdentifiers:(id)a4 strokeProvider:(id)a5
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v149 = a4;
  id v150 = a5;
  uint64_t v13 = objc_msgSend_count(v149, v8, v9, v10, v11, v12);
  if (v13 != objc_msgSend_count(v7, v14, v15, v16, v17, v18))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v24 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_FAULT, "There needs to be an array of stroke identifiers for each token.", buf, 2u);
    }
  }
  unint64_t v25 = 0;
  __p = 0;
  uint64_t v157 = 0;
  unint64_t v158 = 0;
  while (v25 < objc_msgSend_count(v7, v19, v20, v21, v22, v23))
  {
    uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v149, v26, v25, v27, v28, v29);
    uint64_t v34 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v31, (uint64_t)v30, (uint64_t)v150, v32, v33);

    objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v35, (uint64_t)v34, v36, v37, v38);
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    uint64_t v51 = objc_msgSend_objectAtIndexedSubscript_(v7, v47, v25, v48, v49, v50);
    uint64_t v57 = v51;
    if (v51)
    {
      objc_msgSend_principalLines(v51, v52, v53, v54, v55, v56);
      double v58 = *((double *)&v160 + 1);
      double v59 = *(double *)&v160;
      long long v152 = v161;
    }
    else
    {
      long long v164 = 0u;
      long long v165 = 0u;
      long long v163 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      long long v160 = 0u;
      long long v152 = 0uLL;
      double v58 = 0.0;
      double v59 = 0.0;
      memset(buf, 0, sizeof(buf));
    }
    if (v44 == 0.0) {
      double v44 = 1.0;
    }
    if (v46 == 0.0) {
      double v46 = 1.0;
    }

    uint64_t v64 = objc_msgSend_objectAtIndexedSubscript_(v7, v60, v25, v61, v62, v63);
    uint64_t v70 = v64;
    if (v64)
    {
      objc_msgSend_principalLines(v64, v65, v66, v67, v68, v69);
      double v72 = *(double *)buf;
      double v71 = *(double *)&buf[8];
      long long v151 = *(_OWORD *)&buf[16];
    }
    else
    {
      long long v164 = 0u;
      long long v165 = 0u;
      long long v163 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      long long v160 = 0u;
      long long v151 = 0uLL;
      double v71 = 0.0;
      double v72 = 0.0;
      memset(buf, 0, sizeof(buf));
    }

    double v73 = v42 + v58 * v46;
    double v74 = (v40 + v59 * v44 + v40 + v72 * v44) * 0.5;
    double v75 = (v73 + v42 + v71 * v46) * 0.5;
    uint64_t v77 = v157;
    uint64_t v76 = (double *)v158;
    if ((unint64_t)v157 < v158)
    {
      *uint64_t v157 = v74;
      v77[1] = v75;
      uint64_t v78 = v77 + 2;
      goto LABEL_37;
    }
    uint64_t v79 = (double *)__p;
    uint64_t v80 = ((char *)v157 - (unsigned char *)__p) >> 4;
    unint64_t v81 = v80 + 1;
    if ((unint64_t)(v80 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v82 = v158 - (void)__p;
    if ((uint64_t)(v158 - (void)__p) >> 3 > v81) {
      unint64_t v81 = v82 >> 3;
    }
    if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v83 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v83 = v81;
    }
    if (v83)
    {
      if (v83 >> 60) {
        sub_1C4949AA8();
      }
      uint64_t v84 = (char *)operator new(16 * v83);
      uint64_t v85 = (double *)&v84[16 * v80];
      double *v85 = v74;
      v85[1] = v75;
      uint64_t v86 = v85;
      if (v77 == v79)
      {
LABEL_35:
        uint64_t v76 = (double *)&v84[16 * v83];
        uint64_t v78 = v85 + 2;
        __p = v86;
        uint64_t v157 = v85 + 2;
        unint64_t v158 = (unint64_t)v76;
        if (!v77) {
          goto LABEL_37;
        }
LABEL_36:
        operator delete(v77);
        uint64_t v76 = (double *)v158;
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v84 = 0;
      uint64_t v85 = (double *)(16 * v80);
      double *v85 = v74;
      v85[1] = v75;
      uint64_t v86 = (double *)(16 * v80);
      if (v77 == v79) {
        goto LABEL_35;
      }
    }
    do
    {
      *((_OWORD *)v86 - 1) = *((_OWORD *)v77 - 1);
      v86 -= 2;
      v77 -= 2;
    }
    while (v77 != v79);
    uint64_t v77 = (double *)__p;
    uint64_t v76 = (double *)&v84[16 * v83];
    uint64_t v78 = v85 + 2;
    __p = v86;
    uint64_t v157 = v85 + 2;
    unint64_t v158 = (unint64_t)v76;
    if (v77) {
      goto LABEL_36;
    }
LABEL_37:
    uint64_t v157 = v78;
    double v87 = (v40 + *(double *)&v152 * v44 + v40 + *(double *)&v151 * v44) * 0.5;
    double v88 = (v42 + *((double *)&v152 + 1) * v46 + v42 + *((double *)&v151 + 1) * v46) * 0.5;
    if (v78 < v76)
    {
      *uint64_t v78 = v87;
      v78[1] = v88;
      uint64_t v89 = (uint64_t)(v78 + 2);
      goto LABEL_55;
    }
    uint64_t v90 = (double *)__p;
    uint64_t v91 = ((char *)v78 - (unsigned char *)__p) >> 4;
    unint64_t v92 = v91 + 1;
    if ((unint64_t)(v91 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v93 = (char *)v76 - (unsigned char *)__p;
    if (v93 >> 3 > v92) {
      unint64_t v92 = v93 >> 3;
    }
    if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v94 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v94 = v92;
    }
    if (v94)
    {
      if (v94 >> 60) {
        sub_1C4949AA8();
      }
      int v95 = (char *)operator new(16 * v94);
      uint64_t v96 = (double *)&v95[16 * v91];
      uint64_t v97 = &v95[16 * v94];
      *uint64_t v96 = v87;
      v96[1] = v88;
      uint64_t v89 = (uint64_t)(v96 + 2);
      if (v78 == v90)
      {
LABEL_53:
        __p = v96;
        uint64_t v157 = (double *)v89;
        unint64_t v158 = (unint64_t)v97;
LABEL_54:
        operator delete(v78);
        goto LABEL_55;
      }
    }
    else
    {
      uint64_t v96 = (double *)(16 * v91);
      uint64_t v97 = 0;
      *uint64_t v96 = v87;
      v96[1] = v88;
      uint64_t v89 = 16 * v91 + 16;
      if (v78 == v90) {
        goto LABEL_53;
      }
    }
    do
    {
      *((_OWORD *)v96 - 1) = *((_OWORD *)v78 - 1);
      v96 -= 2;
      v78 -= 2;
    }
    while (v78 != v90);
    uint64_t v78 = (double *)__p;
    __p = v96;
    uint64_t v157 = (double *)v89;
    unint64_t v158 = (unint64_t)v97;
    if (v78) {
      goto LABEL_54;
    }
LABEL_55:
    uint64_t v157 = (double *)v89;

    ++v25;
  }
  if (v157 == __p)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v98 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C492D000, v98, OS_LOG_TYPE_FAULT, "The number of points in the raw baseline estimate must be > 0 at this point.", buf, 2u);
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v99 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v101 = *(void *)__p;
    uint64_t v100 = *((void *)__p + 1);
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = v101;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v100;
    _os_log_impl(&dword_1C492D000, v99, OS_LOG_TYPE_DEBUG, "Raw points[0] = %.2f, %.2f\n", buf, 0x16u);
  }

  uint64_t v155 = 0;
  uint64_t v102 = objc_opt_class();
  if (v102)
  {
    objc_msgSend_regularizedPathFromPoints_delta_gamma_outError_(v102, v103, (uint64_t)&__p, (uint64_t)&v155, v104, v105, 1.0, 0.9);
    if (qword_1EA3CA000 == -1) {
      goto LABEL_68;
    }
LABEL_79:
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v106 = (id)qword_1EA3C9F98;
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_70;
    }
LABEL_69:
    uint64_t v113 = __p;
    unint64_t v112 = v157;
    uint64_t v114 = v155;
    uint64_t v115 = objc_msgSend_count(v7, v107, v108, v109, v110, v111);
    *(_DWORD *)long long buf = 134218496;
    *(void *)&uint8_t buf[4] = ((char *)v112 - v113) >> 4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v114;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&unsigned char buf[24] = v115;
    _os_log_impl(&dword_1C492D000, v106, OS_LOG_TYPE_DEFAULT, "Baseline Data detectors baseline approximation with %lu points, correction error = %.2f, number of tokens %lu", buf, 0x20u);
    goto LABEL_70;
  }
  uint64_t v153 = 0;
  uint64_t v154 = 0;
  if (qword_1EA3CA000 != -1) {
    goto LABEL_79;
  }
LABEL_68:
  uint64_t v106 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_69;
  }
LABEL_70:

  uint64_t v116 = [CHQuadCurvePointFIFO alloc];
  uint64_t v121 = objc_msgSend_initWithFIFO_(v116, v117, 0, v118, v119, v120);
  uint64_t v122 = [CHBoxcarFilterPointFIFO alloc];
  LODWORD(v123) = 2.0;
  uint64_t v127 = objc_msgSend_initWithFIFO_width_spacing_(v122, v124, (uint64_t)v121, 2, v125, v126, v123);
  uint64_t v128 = [CHPointFIFO alloc];
  uint64_t v138 = objc_msgSend_initWithFIFO_(v128, v129, (uint64_t)v127, v130, v131, v132);
  uint64_t v139 = v153;
  if (v154 != v153)
  {
    unint64_t v140 = 0;
    do
    {
      objc_msgSend_addPoint_(v138, v133, v134, v135, v136, v137, COERCE_DOUBLE(vcvt_f32_f64(v139[v140++])));
      uint64_t v139 = v153;
    }
    while (v140 < v154 - v153);
  }
  objc_msgSend_flush(v138, v133, v134, v135, v136, v137);
  uint64_t v146 = (const CGPath *)objc_msgSend_path(v121, v141, v142, v143, v144, v145);
  uint64_t v147 = CGPathRetain(v146);

  if (v153) {
    operator delete(v153);
  }
  if (__p)
  {
    uint64_t v157 = (double *)__p;
    operator delete(__p);
  }

  return v147;
}

+ (id)resultsBySwapping:(id)a3 swappableColumns:(id)a4 locales:(id)a5 topLocaleIndex:(int64_t)a6 topLocale:(id)a7
{
  uint64_t v752 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v685 = a4;
  id v695 = a5;
  id v696 = a7;
  v690 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15);
  long long v740 = 0u;
  long long v741 = 0u;
  long long v738 = 0u;
  long long v739 = 0u;
  id obj = v10;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v738, (uint64_t)v750, 16, v17);
  if (v22)
  {
    uint64_t v23 = *(void *)v739;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v739 != v23) {
          objc_enumerationMutation(obj);
        }
        unint64_t v25 = objc_msgSend_resultRestoringRawPathInResult_(CHTokenizedTextResult, v18, *(void *)(*((void *)&v738 + 1) + 8 * i), v19, v20, v21);
        objc_msgSend_addObject_(v690, v26, (uint64_t)v25, v27, v28, v29);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v738, (uint64_t)v750, 16, v21);
    }
    while (v22);
  }

  objc_msgSend_array(MEMORY[0x1E4F1CA48], v30, v31, v32, v33, v34);
  id v674 = (id)objc_claimAutoreleasedReturnValue();
  double v39 = objc_msgSend_objectAtIndexedSubscript_(v690, v35, a6, v36, v37, v38);
  double v40 = (void *)MEMORY[0x1E4F1CA48];
  v673 = v39;
  uint64_t v46 = objc_msgSend_tokenColumnCount(v39, v41, v42, v43, v44, v45);
  uint64_t v51 = objc_msgSend_arrayWithCapacity_(v40, v47, v46, v48, v49, v50);
  unint64_t v57 = 0;
  char v708 = 0;
  uint64_t v58 = MEMORY[0x1E4F1CC28];
  uint64_t v59 = MEMORY[0x1E4F1CC38];
  v684 = (void *)v51;
  while (v57 < objc_msgSend_count(v685, v52, v53, v54, v55, v56))
  {
    uint64_t v65 = objc_msgSend_objectAtIndexedSubscript_(v685, v60, v57, v62, v63, v64);
    uint64_t v70 = objc_msgSend_objectAtIndexedSubscript_(v65, v66, 1, v67, v68, v69);
    int v76 = objc_msgSend_intValue(v70, v71, v72, v73, v74, v75);
    unint64_t v81 = objc_msgSend_objectAtIndexedSubscript_(v685, v77, v57, v78, v79, v80);
    uint64_t v86 = objc_msgSend_objectAtIndexedSubscript_(v81, v82, 2, v83, v84, v85);
    int v92 = objc_msgSend_intValue(v86, v87, v88, v89, v90, v91);

    objc_msgSend_addObject_(v684, v93, v58, v94, v95, v96);
    if (v76 + 1 < (unint64_t)(v92 + (uint64_t)v76))
    {
      uint64_t v97 = v92 - 1;
      do
      {
        objc_msgSend_addObject_(v684, v52, v59, v54, v55, v56);
        --v97;
      }
      while (v97);
      char v708 = 1;
    }
    ++v57;
  }
  if (v708)
  {
    uint64_t v98 = objc_msgSend_compressResult_atColumnIndexes_(CHTokenizedTextResult, v60, (uint64_t)v673, (uint64_t)v684, v63, v64);
    unint64_t v104 = 0x1E4F1C000;
  }
  else
  {
    uint64_t v98 = objc_msgSend_mutableCopy(v673, v60, v61, v62, v63, v64);
    unint64_t v104 = 0x1E4F1C000uLL;
  }
  uint64_t v105 = (void *)v98;
  v671 = objc_msgSend_array(*(void **)(v104 + 2632), v99, v100, v101, v102, v103);
  uint64_t v106 = *(void **)(v104 + 2632);
  v682 = v105;
  unint64_t v112 = objc_msgSend_transcriptionPaths(v105, v107, v108, v109, v110, v111);
  v677 = objc_msgSend_arrayWithArray_(v106, v113, (uint64_t)v112, v114, v115, v116);

  uint64_t v117 = (void *)MEMORY[0x1E4F1CA48];
  double v123 = objc_msgSend_transcriptionPathScores(v682, v118, v119, v120, v121, v122);
  v672 = objc_msgSend_arrayWithArray_(v117, v124, (uint64_t)v123, v125, v126, v127);

  uint64_t v128 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v134 = objc_msgSend_transcriptionPaths(v682, v129, v130, v131, v132, v133);
  unint64_t v140 = objc_msgSend_firstObject(v134, v135, v136, v137, v138, v139);
  uint64_t v146 = objc_msgSend_transcriptionPaths(v682, v141, v142, v143, v144, v145);
  long long v152 = objc_msgSend_firstObject(v146, v147, v148, v149, v150, v151);
  v676 = objc_msgSend_arrayWithObjects_(v128, v153, (uint64_t)v140, v154, v155, v156, v152, 0);

  unint64_t v680 = 0;
  uint64_t v732 = 0;
  v733 = &v732;
  uint64_t v734 = 0x3032000000;
  v735 = sub_1C4A8B18C;
  v736 = sub_1C4A8B19C;
  id v737 = 0;
  uint64_t v694 = *MEMORY[0x1E4F1C438];
  while (v680 < objc_msgSend_count(v685, v157, v158, v159, v160, v161))
  {
    v701 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v162, v163, v164, v165, v166);
    v670 = objc_msgSend_objectAtIndexedSubscript_(v685, v167, v680, v168, v169, v170);
    uint64_t v175 = objc_msgSend_objectAtIndexedSubscript_(v670, v171, 0, v172, v173, v174);
    int v181 = objc_msgSend_intValue(v175, v176, v177, v178, v179, v180);

    uint64_t v187 = objc_msgSend_transcriptionPaths(v682, v182, v183, v184, v185, v186);
    uint64_t v192 = objc_msgSend_objectAtIndexedSubscript_(v187, v188, 0, v189, v190, v191);
    uint64_t v679 = objc_msgSend_indexAtPosition_(v192, v193, v680, v194, v195, v196);

    uint64_t v202 = objc_msgSend_tokenColumns(v682, v197, v198, v199, v200, v201);
    uint64_t v207 = objc_msgSend_objectAtIndexedSubscript_(v202, v203, v680, v204, v205, v206);
    uint64_t v213 = objc_msgSend_textTokenRows(v207, v208, v209, v210, v211, v212);
    v675 = objc_msgSend_objectAtIndexedSubscript_(v213, v214, v679, v215, v216, v217);

    uint64_t v223 = objc_msgSend_firstObject(v675, v218, v219, v220, v221, v222);
    LODWORD(v207) = objc_msgSend_properties(v223, v224, v225, v226, v227, v228);

    unint64_t v681 = 0;
    uint64_t v678 = v181;
    unsigned int v697 = (v207 >> 5) & 1;
    while (1)
    {
      uint64_t v234 = objc_msgSend_tokenColumns(v682, v229, v230, v231, v232, v233);
      uint64_t v239 = objc_msgSend_objectAtIndexedSubscript_(v234, v235, v680, v236, v237, v238);
      uint64_t v245 = objc_msgSend_textTokenRows(v239, v240, v241, v242, v243, v244);
      BOOL v251 = v681 < objc_msgSend_count(v245, v246, v247, v248, v249, v250);

      if (!v251) {
        break;
      }
      if (v681 == v679 && v678 != a6)
      {
        v703 = objc_msgSend_objectAtIndexedSubscript_(v690, v252, v678, v254, v255, v256);
        uint64_t v261 = objc_msgSend_objectAtIndexedSubscript_(v685, v257, v680, v258, v259, v260);
        uint64_t v266 = objc_msgSend_objectAtIndexedSubscript_(v261, v262, 3, v263, v264, v265);
        int v272 = objc_msgSend_intValue(v266, v267, v268, v269, v270, v271);
        uint64_t v277 = objc_msgSend_objectAtIndexedSubscript_(v685, v273, v680, v274, v275, v276);
        uint64_t v282 = objc_msgSend_objectAtIndexedSubscript_(v277, v278, 4, v279, v280, v281);
        int v288 = objc_msgSend_intValue(v282, v283, v284, v285, v286, v287);

        long long v730 = 0u;
        long long v731 = 0u;
        long long v728 = 0u;
        long long v729 = 0u;
        uint64_t v294 = objc_msgSend_transcriptionPaths(v703, v289, v290, v291, v292, v293);
        uint64_t v299 = objc_msgSend_objectAtIndexedSubscript_(v294, v295, 0, v296, v297, v298);
        v748[0] = v299;
        uint64_t v300 = -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v703);
        v748[1] = v300;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v301, (uint64_t)v748, 2, v302, v303);
        id v692 = (id)objc_claimAutoreleasedReturnValue();

        unint64_t v306 = 0x1E4F1C000uLL;
        uint64_t v704 = objc_msgSend_countByEnumeratingWithState_objects_count_(v692, v304, (uint64_t)&v728, (uint64_t)v749, 16, v305);
        if (!v704) {
          goto LABEL_75;
        }
        uint64_t v698 = v288;
        uint64_t v699 = v272;
        uint64_t v700 = *(void *)v729;
        while (1)
        {
          uint64_t v709 = 0;
          do
          {
            if (*(void *)v729 != v700) {
              objc_enumerationMutation(v692);
            }
            uint64_t v312 = *(void *)(*((void *)&v728 + 1) + 8 * v709);
            uint64_t v313 = objc_msgSend_array(*(void **)(v306 + 2632), v307, v308, v309, v310, v311);
            v721[0] = MEMORY[0x1E4F143A8];
            v721[1] = 3221225472;
            v721[2] = sub_1C4A955E4;
            v721[3] = &unk_1E64E3510;
            uint64_t v726 = v698;
            char v727 = v697;
            uint64_t v725 = v699;
            v724 = &v732;
            id v722 = v696;
            id v314 = v313;
            id v723 = v314;
            objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v703, v315, v312, v699, v698, (uint64_t)v721);
            v705 = objc_msgSend_objectAtIndex_(v695, v316, a6, v317, v318, v319);
            objc_msgSend_objectForKey_(v705, v320, v694, v321, v322, v323);
            id v706 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_characterDirectionForLanguage_(MEMORY[0x1E4F1CA20], v324, (uint64_t)v706, v325, v326, v327) == 2)
            {
              long long v332 = objc_msgSend_objectAtIndexedSubscript_(obj, v328, 0, v329, v330, v331);
              uint64_t v338 = objc_msgSend_baseWritingDirection(v332, v333, v334, v335, v336, v337);

              if (v338 == 1)
              {
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                long long v339 = (id)qword_1EA3C9F90[0];
                if (os_log_type_enabled(v339, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_1C492D000, v339, OS_LOG_TYPE_DEBUG, "BiDi Swapping : visual->logical transform might be needed in secondary recognizer. First locale is RTL and base direction of first result is also RTL.", buf, 2u);
                }

                long long v719 = 0u;
                long long v720 = 0u;
                long long v717 = 0u;
                long long v718 = 0u;
                id v340 = v314;
                uint64_t v343 = 0;
                uint64_t v348 = objc_msgSend_countByEnumeratingWithState_objects_count_(v340, v341, (uint64_t)&v717, (uint64_t)v747, 16, v342);
                if (v348)
                {
                  uint64_t v349 = *(void *)v718;
                  do
                  {
                    for (uint64_t j = 0; j != v348; ++j)
                    {
                      while (1)
                      {
                        if (*(void *)v718 != v349) {
                          objc_enumerationMutation(v340);
                        }
                        id v351 = *(void **)(*((void *)&v717 + 1) + 8 * j);
                        if (!v343) {
                          break;
                        }
                        sub_1C4964D50((uint64_t)v343, v351);
                        if (v348 == ++j) {
                          goto LABEL_43;
                        }
                      }
                      uint64_t v343 = objc_msgSend_mutableCopy(*(void **)(*((void *)&v717 + 1) + 8 * j), (const char *)v351, v344, v345, v346, v347);
                    }
LABEL_43:
                    uint64_t v348 = objc_msgSend_countByEnumeratingWithState_objects_count_(v340, v352, (uint64_t)&v717, (uint64_t)v747, 16, v347);
                  }
                  while (v348);
                }

                if (qword_1EA3C9F50 == -1)
                {
                  if (v343) {
                    goto LABEL_46;
                  }
LABEL_48:
                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  uint64_t v378 = (id)qword_1EA3C9F90[0];
                  if (os_log_type_enabled(v378, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_1C492D000, v378, OS_LOG_TYPE_DEBUG, "BiDi Swapping : visual->logical transform was not needed since the secondary recognizer results were all strong LTR.", buf, 2u);
                  }
                  id v314 = v340;
                }
                else
                {
                  dispatch_once(&qword_1EA3C9F50, &unk_1F20139E8);
                  if (!v343) {
                    goto LABEL_48;
                  }
LABEL_46:
                  uint64_t v358 = objc_msgSend_string(v343, v353, v354, v355, v356, v357);
                  uint64_t v359 = (void *)qword_1EA3C9F48;
                  id v360 = v358;
                  id v361 = v359;
                  if (objc_msgSend_length(v360, v362, v363, v364, v365, v366))
                  {
                    uint64_t v371 = objc_msgSend_stringByTrimmingCharactersInSet_(v360, v367, (uint64_t)v361, v368, v369, v370);
                    BOOL v377 = objc_msgSend_length(v371, v372, v373, v374, v375, v376) == 0;

                    if (v377) {
                      goto LABEL_48;
                    }
                  }
                  else
                  {
                  }
                  id v691 = v343;
                  self;
                  v689 = objc_msgSend_string(v691, v379, v380, v381, v382, v383);
                  id v686 = objc_alloc_init(MEMORY[0x1E4FAF100]);
                  uint64_t v390 = objc_msgSend_transformVisualToLogical_visualDirectionality_logicalBaseDirectionality_baseDirectionalityPredictionMode_outTokenizedLogicalOrderIndexes_outReorderingPermutation_outMirroredVisualString_outLogicalBaseDirection_(v686, v384, (uint64_t)v689, 1, 2, 0, 0, 0, 0, 0);
                  if (!v390) {
                    uint64_t v390 = objc_msgSend_copy(v689, v385, v386, v387, v388, v389);
                  }
                  v688 = objc_msgSend_componentsSeparatedByString_(v390, v385, @" ", v387, v388, v389);
                  v687 = v390;
                  uint64_t v396 = objc_msgSend_string(MEMORY[0x1E4F28E78], v391, v392, v393, v394, v395);
                  long long v744 = 0u;
                  long long v745 = 0u;
                  long long v742 = 0u;
                  long long v743 = 0u;
                  id v397 = v688;
                  uint64_t v405 = objc_msgSend_countByEnumeratingWithState_objects_count_(v397, v398, (uint64_t)&v742, (uint64_t)buf, 16, v399);
                  if (v405)
                  {
                    uint64_t v406 = *(void *)v743;
                    do
                    {
                      for (uint64_t k = 0; k != v405; ++k)
                      {
                        if (*(void *)v743 != v406) {
                          objc_enumerationMutation(v397);
                        }
                        uint64_t v408 = *(void *)(*((void *)&v742 + 1) + 8 * k);
                        if (objc_msgSend_length(v396, v400, v401, v402, v403, v404)) {
                          objc_msgSend_appendString_(v396, v409, @" ", v410, v411, v412);
                        }
                        uint64_t v413 = objc_opt_class();
                        uint64_t v417 = objc_msgSend_performInverseBiDiForNumeric_isRTLContext_(v413, v414, v408, 1, v415, v416);
                        objc_msgSend_appendString_(v396, v418, (uint64_t)v417, v419, v420, v421);
                      }
                      uint64_t v405 = objc_msgSend_countByEnumeratingWithState_objects_count_(v397, v400, (uint64_t)&v742, (uint64_t)buf, 16, v404);
                    }
                    while (v405);
                  }

                  id v422 = v396;
                  objc_msgSend_setString_(v691, v423, (uint64_t)v422, v424, v425, v426);

                  objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v427, (uint64_t)v691, v428, v429, v430);
                  id v314 = (id)objc_claimAutoreleasedReturnValue();

                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  uint64_t v378 = (id)qword_1EA3C9F90[0];
                  if (os_log_type_enabled(v378, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_1C492D000, v378, OS_LOG_TYPE_DEBUG, "BiDi Swapping : visual->logical transform performed since the secondary recognizer results contained some weak characters.", buf, 2u);
                  }
                }
              }
            }
            objc_msgSend_addObject_(v701, v328, (uint64_t)v314, v329, v330, v331);

            ++v709;
            unint64_t v306 = 0x1E4F1C000;
          }
          while (v709 != v704);
          uint64_t v431 = objc_msgSend_countByEnumeratingWithState_objects_count_(v692, v307, (uint64_t)&v728, (uint64_t)v749, 16, v311);
          uint64_t v704 = v431;
          if (!v431)
          {
LABEL_75:

            char v708 = 1;
            break;
          }
        }
      }
      uint64_t v432 = objc_msgSend_tokenColumns(v682, v252, v253, v254, v255, v256);
      uint64_t v437 = objc_msgSend_objectAtIndexedSubscript_(v432, v433, v680, v434, v435, v436);
      uint64_t v443 = objc_msgSend_textTokenRows(v437, v438, v439, v440, v441, v442);
      uint64_t v448 = objc_msgSend_objectAtIndexedSubscript_(v443, v444, v681, v445, v446, v447);
      objc_msgSend_addObject_(v701, v449, (uint64_t)v448, v450, v451, v452);

      ++v681;
    }
    if (v678 != a6)
    {
      for (unint64_t m = 0; ; ++m)
      {
        uint64_t v454 = objc_msgSend_transcriptionPaths(v682, v252, v253, v254, v255, v256);
        BOOL v460 = m < objc_msgSend_count(v454, v455, v456, v457, v458, v459);

        if (!v460) {
          break;
        }
        uint64_t v466 = objc_msgSend_transcriptionPaths(v682, v461, v462, v463, v464, v465);
        v471 = objc_msgSend_objectAtIndexedSubscript_(v466, v467, m, v468, v469, v470);
        uint64_t v476 = objc_msgSend_indexAtPosition_(v471, v472, v680, v473, v474, v475);

        if (v476 >= v679)
        {
          objc_msgSend_objectAtIndexedSubscript_(v677, v252, m, v254, v255, v256);
          uint64_t v477 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
          uint64_t v478 = modifyIndexPath(v477, v680, v476 + 2);
          objc_msgSend_setObject_atIndexedSubscript_(v677, v479, (uint64_t)v478, m, v480, v481);
        }
      }
      v482 = objc_msgSend_objectAtIndexedSubscript_(v676, v461, 1, v463, v464, v465);
      uint64_t v487 = objc_msgSend_indexAtPosition_(v482, v483, v680, v484, v485, v486);

      if (v487 >= v679)
      {
        objc_msgSend_objectAtIndexedSubscript_(v676, v252, 1, v254, v255, v256);
        uint64_t v488 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
        uint64_t v489 = modifyIndexPath(v488, v680, v487 + 1);
        objc_msgSend_setObject_atIndexedSubscript_(v676, v490, (uint64_t)v489, 1, v491, v492);
      }
    }
    v493 = objc_msgSend_transcriptionPaths(v682, v252, v253, v254, v255, v256);
    uint64_t v499 = objc_msgSend_firstObject(v493, v494, v495, v496, v497, v498);
    uint64_t v505 = objc_msgSend_count(v671, v500, v501, v502, v503, v504);
    uint64_t v510 = objc_msgSend_indexAtPosition_(v499, v506, v505, v507, v508, v509);

    uint64_t v515 = objc_msgSend_objectAtIndexedSubscript_(v701, v511, v510, v512, v513, v514);
    uint64_t v521 = objc_msgSend_lastObject(v515, v516, v517, v518, v519, v520);

    uint64_t v527 = objc_msgSend_string(v521, v522, v523, v524, v525, v526);
    uint64_t v533 = objc_msgSend_lastComposedCharacter(v527, v528, v529, v530, v531, v532);
    uint64_t v534 = (void *)v733[5];
    v733[5] = v533;

    uint64_t v535 = [CHMutableTokenizedResultColumn alloc];
    uint64_t v540 = objc_msgSend_initWithTokenRows_(v535, v536, (uint64_t)v701, v537, v538, v539);
    objc_msgSend_addObject_(v671, v541, (uint64_t)v540, v542, v543, v544);

    ++v680;
  }
  uint64_t v545 = objc_msgSend_firstObject(v677, v162, v163, v164, v165, v166);
  uint64_t v551 = objc_msgSend_transcriptionPaths(v682, v546, v547, v548, v549, v550);
  uint64_t v557 = objc_msgSend_firstObject(v551, v552, v553, v554, v555, v556);
  BOOL v562 = objc_msgSend_compare_(v545, v558, (uint64_t)v557, v559, v560, v561) == 0;

  uint64_t v568 = v682;
  unint64_t v569 = 0x1E4F1C000uLL;
  if (!v562)
  {
    for (unint64_t n = 0; n < objc_msgSend_count(v676, v563, v564, v565, v566, v567); ++n)
    {
      v571 = objc_msgSend_objectAtIndexedSubscript_(v676, v563, n, v565, v566, v567);
      objc_msgSend_insertObject_atIndex_(v677, v572, (uint64_t)v571, n, v573, v574);

      uint64_t v580 = objc_msgSend_transcriptionPathScores(v682, v575, v576, v577, v578, v579);
      v586 = objc_msgSend_firstObject(v580, v581, v582, v583, v584, v585);
      objc_msgSend_insertObject_atIndex_(v672, v587, (uint64_t)v586, 0, v588, v589);

      uint64_t v568 = v682;
      unint64_t v569 = 0x1E4F1C000;
    }
  }
  objc_msgSend_setTokenColumns_(v568, v563, (uint64_t)v671, v565, v566, v567);
  objc_msgSend_setTranscriptionPaths_scores_(v568, v590, (uint64_t)v677, (uint64_t)v672, v591, v592);
  if (v708)
  {
    v710 = objc_msgSend_array(*(void **)(v569 + 2632), v593, v594, v595, v596, v597);
    long long v715 = 0u;
    long long v716 = 0u;
    long long v713 = 0u;
    long long v714 = 0u;
    uint64_t v603 = objc_msgSend_transcriptionPaths(v568, v598, v599, v600, v601, v602);
    id v707 = v603;
    uint64_t v611 = objc_msgSend_countByEnumeratingWithState_objects_count_(v603, v604, (uint64_t)&v713, (uint64_t)v746, 16, v605);
    if (v611)
    {
      uint64_t v612 = *(void *)v714;
      do
      {
        for (iuint64_t i = 0; ii != v611; ++ii)
        {
          if (*(void *)v714 != v612) {
            objc_enumerationMutation(v707);
          }
          uint64_t v614 = *(void *)(*((void *)&v713 + 1) + 8 * ii);
          v615 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v606, v607, v608, v609, v610);
          uint64_t v621 = objc_msgSend_tokenColumnCount(v682, v616, v617, v618, v619, v620);
          v711[0] = MEMORY[0x1E4F143A8];
          v711[1] = 3221225472;
          v711[2] = sub_1C4A95870;
          v711[3] = &unk_1E64E3150;
          id v622 = v615;
          id v712 = v622;
          objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v682, v623, v614, 0, v621, (uint64_t)v711);
          objc_msgSend_addObject_(v710, v624, (uint64_t)v622, v625, v626, v627);
        }
        uint64_t v603 = v707;
        uint64_t v611 = objc_msgSend_countByEnumeratingWithState_objects_count_(v707, v606, (uint64_t)&v713, (uint64_t)v746, 16, v610);
      }
      while (v611);
    }

    uint64_t v633 = objc_msgSend_inputStrokeIdentifiers(v682, v628, v629, v630, v631, v632);
    v634 = [CHMutableTokenizedTextResult alloc];
    uint64_t v640 = objc_msgSend_transcriptionPathScores(v682, v635, v636, v637, v638, v639);
    int64_t v646 = objc_msgSend_trailingSeparator(v682, v641, v642, v643, v644, v645);
    uint64_t v652 = objc_msgSend_recognizerGenerationIdentifier(v682, v647, v648, v649, v650, v651);
    v654 = objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v634, v653, (uint64_t)v710, (uint64_t)v640, (uint64_t)v646, v652);

    objc_msgSend_setInputStrokeIdentifiers_(v654, v655, (uint64_t)v633, v656, v657, v658);
    uint64_t v568 = v654;
  }
  unint64_t v659 = 0;
  v683 = v568;
  while (v659 < objc_msgSend_count(v690, v593, v594, v595, v596, v597))
  {
    if (a6 == v659)
    {
      objc_msgSend_addObject_(v674, v660, (uint64_t)v568, v661, v662, v663);
    }
    else
    {
      v664 = objc_msgSend_objectAtIndexedSubscript_(v690, v660, v659, v661, v662, v663);
      objc_msgSend_addObject_(v674, v665, (uint64_t)v664, v666, v667, v668);

      uint64_t v568 = v683;
    }
    ++v659;
  }
  _Block_object_dispose(&v732, 8);

  return v674;
}

- (id)commonTopStrokeSetsWithResult:(id)a3 shouldReverseOtherColumns:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v18 = objc_msgSend_tokenColumns(self, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v86, (uint64_t)v95, 16, v20);
  if (v26)
  {
    uint64_t v27 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v87 != v27) {
          objc_enumerationMutation(v18);
        }
        uint64_t v29 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v86 + 1) + 8 * i), v21, v22, v23, v24, v25);
        objc_msgSend_addObject_(v12, v30, (uint64_t)v29, v31, v32, v33);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v86, (uint64_t)v95, 16, v25);
    }
    while (v26);
  }

  double v39 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v34, v35, v36, v37, v38);
  objc_msgSend_tokenColumns(v6, v40, v41, v42, v43, v44);
  if (v4) {
    uint64_t v45 = {;
  }
    objc_msgSend_reverseObjectEnumerator(v45, v46, v47, v48, v49, v50);
  }
  else {
    uint64_t v45 = {;
  }
    objc_msgSend_objectEnumerator(v45, v51, v52, v53, v54, v55);
  uint64_t v56 = };

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v57 = v56;
  uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v82, (uint64_t)v94, 16, v59);
  if (v65)
  {
    uint64_t v66 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v65; ++j)
      {
        if (*(void *)v83 != v66) {
          objc_enumerationMutation(v57);
        }
        uint64_t v68 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v82 + 1) + 8 * j), v60, v61, v62, v63, v64, (void)v82);
        objc_msgSend_addObject_(v39, v69, (uint64_t)v68, v70, v71, v72);
      }
      uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v82, (uint64_t)v94, 16, v64);
    }
    while (v65);
  }

  uint64_t v73 = commonIndexSetsFromSets(v12, v39);
  if (objc_msgSend_count(v73, v74, v75, v76, v77, v78))
  {
    id v79 = v73;
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v80 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v91 = v12;
      __int16 v92 = 2112;
      uint64_t v93 = v39;
      _os_log_impl(&dword_1C492D000, v80, OS_LOG_TYPE_ERROR, "Unexpected failure to find common stroke sets between top stroke sets %@ and other stroke sets %@.", buf, 0x16u);
    }

    id v79 = 0;
  }

  return v79;
}

- (id)tokenizedTextResultByAppendingTokenizedTextResult:(id)a3
{
  id v4 = a3;
  uint64_t v209 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  uint64_t v208 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_strokeIndexes(self, v15, v16, v17, v18, v19);
  uint64_t v207 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);

  unint64_t v206 = 0;
  uint64_t v204 = self;
  objc_msgSend_transcriptionPaths(self, v26, v27, v28, v29, v30, v217);
  while (1)
    uint64_t v36 = {;
    unint64_t v42 = objc_msgSend_count(v36, v37, v38, v39, v40, v41);

    if (v206 >= v42) {
      break;
    }
    uint64_t v48 = objc_msgSend_transcriptionPaths(self, v43, v44, v45, v46, v47);
    uint64_t v205 = objc_msgSend_objectAtIndexedSubscript_(v48, v49, v206, v50, v51, v52);

    uint64_t v58 = objc_msgSend_transcriptionPathScores(self, v53, v54, v55, v56, v57);
    uint64_t v63 = objc_msgSend_objectAtIndexedSubscript_(v58, v59, v206, v60, v61, v62);
    objc_msgSend_floatValue(v63, v64, v65, v66, v67, v68);
    float v70 = v69;

    uint64_t v76 = objc_msgSend_tokenColumnCount(self, v71, v72, v73, v74, v75);
    uint64_t v78 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v77, (uint64_t)v205, 0, v76, 0);
    uint64_t v203 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v79, v80, v81, v82, v83);
    uint64_t v89 = objc_msgSend_tokenColumnCount(v204, v84, v85, v86, v87, v88);
    v216[0] = MEMORY[0x1E4F143A8];
    v216[1] = 3221225472;
    v217[0] = sub_1C4A96260;
    v217[1] = &unk_1E64E3150;
    id v210 = v203;
    id v218 = v210;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v204, v90, (uint64_t)v205, 0, v89, (uint64_t)v216);
    unint64_t v96 = 0;
    double v97 = v70;
    while (1)
    {
      uint64_t v98 = objc_msgSend_transcriptionPaths(v4, v91, v92, v93, v94, v95);
      unint64_t v104 = objc_msgSend_count(v98, v99, v100, v101, v102, v103);

      if (v96 >= v104) {
        break;
      }
      uint64_t v110 = objc_msgSend_transcriptionPaths(v4, v105, v106, v107, v108, v109);
      uint64_t v115 = objc_msgSend_objectAtIndexedSubscript_(v110, v111, v96, v112, v113, v114);

      uint64_t v121 = objc_msgSend_transcriptionPathScores(v4, v116, v117, v118, v119, v120);
      uint64_t v126 = objc_msgSend_objectAtIndexedSubscript_(v121, v122, v96, v123, v124, v125);
      objc_msgSend_floatValue(v126, v127, v128, v129, v130, v131);
      float v133 = v132;

      uint64_t v139 = objc_msgSend_tokenColumnCount(v4, v134, v135, v136, v137, v138);
      uint64_t v141 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v4, v140, (uint64_t)v115, 0, v139, 0);
      uint64_t v146 = objc_msgSend_stringByAppendingString_(v78, v142, (uint64_t)v141, v143, v144, v145);
      long long v152 = objc_msgSend_mutableCopy(v210, v147, v148, v149, v150, v151);
      uint64_t v158 = objc_msgSend_tokenColumnCount(v4, v153, v154, v155, v156, v157);
      v211[0] = MEMORY[0x1E4F143A8];
      v211[1] = 3221225472;
      v211[2] = sub_1C4A9626C;
      v211[3] = &unk_1E64E3538;
      uint64_t v215 = v207;
      id v212 = v78;
      id v159 = v146;
      id v213 = v159;
      id v160 = v152;
      id v214 = v160;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v4, v161, (uint64_t)v115, 0, v158, (uint64_t)v211);
      uint64_t v167 = objc_msgSend_copy(v160, v162, v163, v164, v165, v166);
      objc_msgSend_addObject_(v209, v168, (uint64_t)v167, v169, v170, v171);

      uint64_t v177 = objc_msgSend_numberWithDouble_(NSNumber, v172, v173, v174, v175, v176, v97 * v133);
      objc_msgSend_addObject_(v208, v178, (uint64_t)v177, v179, v180, v181);

      ++v96;
    }

    ++v206;
    self = v204;
    objc_msgSend_transcriptionPaths(v204, v31, v32, v33, v34, v35, v202);
  }
  uint64_t v182 = objc_msgSend_inputStrokeIdentifiers(self, v43, v44, v45, v46, v47);
  uint64_t v188 = objc_msgSend_inputStrokeIdentifiers(v4, v183, v184, v185, v186, v187);
  uint64_t v193 = objc_msgSend_arrayByAddingObjectsFromArray_(v182, v189, (uint64_t)v188, v190, v191, v192);

  uint64_t v194 = [CHTokenizedTextResult alloc];
  uint64_t v196 = objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v194, v195, (uint64_t)v209, (uint64_t)v208, (uint64_t)&stru_1F20141C8, 2);
  objc_msgSend_setInputStrokeIdentifiers_(v196, v197, (uint64_t)v193, v198, v199, v200);

  return v196;
}

- (NSString)trailingSeparator
{
  return self->_trailingSeparator;
}

- (NSArray)transcriptionPaths
{
  return self->_transcriptionPaths;
}

- (NSArray)transcriptionPathScores
{
  return self->_transcriptionPathScores;
}

- (NSArray)originalTokens
{
  return self->_originalTokens;
}

- (void)setOriginalTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalTokens, 0);
  objc_storeStrong((id *)&self->_trailingSeparator, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_inputStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_transcriptionPathScores, 0);
  objc_storeStrong((id *)&self->_transcriptionPaths, 0);
  objc_storeStrong((id *)&self->_tokenColumns, 0);
}

@end