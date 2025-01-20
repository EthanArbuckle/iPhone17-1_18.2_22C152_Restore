@interface CHRecognizer
+ (BOOL)isLocaleSupported:(id)a3 withMode:(int)a4;
+ (void)_updatePrecedingAndTrailingSeparatorsForTopCandidate:(id)a3 history:(id)a4 textAfter:(id)a5 locale:(id)a6 outTrailingSeparator:(id *)a7 inFirstTokenHasPrecedingSpace:(BOOL)a8 outFirstTokenHasPrecedingSpace:(BOOL *)a9;
- (BOOL)_isLocaleSupported:(id)a3;
- (BOOL)enableCachingIfAvailable;
- (BOOL)enableGen2CharacterLMIfAvailable;
- (BOOL)enableGen2ModelIfAvailable;
- (BOOL)isOVSString:(id)a3;
- (BOOL)isRareChineseEntry:(id)a3;
- (CGSize)minimumDrawingSize;
- (CHMecabraWrapper)mecabraWrapper;
- (CHPostProcessingManager)mergedResultPostProcessor;
- (CHPostProcessingManager)postProcessor;
- (CHRecognitionInsight)recordedInsightFromLastRequest;
- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4;
- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 learningDictionaryURL:(id)a5;
- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 learningDictionaryURL:(id)a5 recognizerOptions:(id)a6;
- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 recognizerOptions:(id)a5;
- (CHRecognizer)initWithType:(int)a3 mode:(int)a4;
- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 learningDictionaryURL:(id)a5;
- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 locale:(__CFLocale *)a5;
- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 locale:(__CFLocale *)a5 learningDictionaryURL:(id)a6;
- (CHRecognizerConfiguration)configuration;
- (CHSpellChecker)spellChecker;
- (CHStringOVSChecker)ovsStringChecker;
- (NSCharacterSet)activeCharacterSet;
- (NSDictionary)textReplacements;
- (NSLocale)locale;
- (_LXLexicon)customPhraseLexicon;
- (_LXLexicon)staticLexicon;
- (double)_calculateJointWordLMScoreForString:(id)a3 wordRanges:(id)a4 wordIDs:(id)a5 patternEntries:(id)a6 history:(unsigned int *)a7 historyLength:(unint64_t)a8;
- (id).cxx_construct;
- (id)_addAlternativeCandidatesForTokenizedResult:(id)a3;
- (id)_applySentenceTransliterationCandidates:(unsigned __int16 *)a3 codesLen:(int)a4 codesMax:(int)a5;
- (id)_changeableColumnCountUpdatedResult:(id)a3 options:(id)a4;
- (id)_contextTokenIDsFromHistory:(id)a3 maxCharacterLength:(unint64_t)a4 maxTokenCount:(unint64_t)a5;
- (id)_defaultPunctuationStringsOutputScores:(id *)a3 maxCandidateCount:(int64_t)a4;
- (id)_postprocessingMergedRecognitionResult:(id)a3 options:(id)a4;
- (id)_resultUsingNextGenerationPipelineWithDrawing:(id)a3 options:(id)a4;
- (id)_tokenFromLegacyResult:(id)a3 wordIndex:(unint64_t)a4 strokeSet:(id)a5 substrokeCount:(int64_t)a6;
- (id)_tokenizedTextResultFromResults:(id)a3 segmentGroup:(id)a4 offsetSegment:(int64_t)a5 decodedStrokeSets:(BOOL)a6 spaceBehavior:(int64_t)a7;
- (id)_tokensUsingLMTokenizerForString:(id)a3 wordRanges:(id)a4 nonWordPatterns:(id)a5 outTokenIDs:(id *)a6;
- (id)bestTranscriptionPathsForTokenizedResult:(id)a3 scores:(id *)a4 history:(id)a5;
- (id)characterSetForStrings:(id)a3;
- (id)recognitionEngineCachingKey;
- (id)recognitionResultsForDrawing:(id)a3 options:(id)a4;
- (id)recognitionResultsForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5;
- (id)strokeIndexesForLastCharacter;
- (id)supportedCharacterSet;
- (id)supportedStrings;
- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5;
- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 writingStatistics:(id)a5 shouldCancel:(id)a6;
- (id)transliterationVariantsForString:(id)a3;
- (int)autoCapitalizationMode;
- (int)autoCorrectionMode;
- (int)baseWritingDirection;
- (int)contentType;
- (int)recognitionMode;
- (int)recognitionType;
- (unint64_t)_effectiveMaxRecognitionResultCount;
- (unint64_t)maxRecognitionResultCount;
- (vector<const)completionsForCandidate:(CHRecognizer *)self candidateContext:(SEL)a3 prefix:(id)a4 option:(id)a5;
- (vector<const)completionsForCandidate:(CHRecognizer *)self prefix:(SEL)a3 option:(id)a4;
- (void)_adjustCandidatesForConfusableCharacters:(void *)a3;
- (void)_adjustResultsForConfusableCharacters:(id)a3;
- (void)_applyTransliterationAndSyntheticCandidates:(void *)a3;
- (void)_calculateBestTranscriptionPaths:(id *)a3 scores:(id *)a4 fromTokenizedResult:(id)a5 pathCount:(int64_t)a6 history:(id)a7 skipLMRescoring:(BOOL)a8;
- (void)_initializeMergedResultPostProcessor;
- (void)_rescoreCandidatesWithLanguageModel:(void *)a3 history:(id)a4;
- (void)_setConfiguration:(id)a3;
- (void)_updateWordLanguageModel:(void *)a3;
- (void)candidateAccepted:(void *)a3;
- (void)dealloc;
- (void)recordInsightWithRequest:(id)a3;
- (void)setActiveCharacterSet:(id)a3;
- (void)setAutoCapitalizationMode:(int)a3;
- (void)setAutoCorrectionMode:(int)a3;
- (void)setBaseWritingDirection:(int)a3;
- (void)setContentType:(int)a3;
- (void)setCustomLexicon:(_LXLexicon *)a3 customVocabulary:(void *)a4;
- (void)setCustomPhraseLexicon:(_LXLexicon *)a3;
- (void)setEnableCachingIfAvailable:(BOOL)a3;
- (void)setEnableGen2CharacterLMIfAvailable:(BOOL)a3;
- (void)setEnableGen2ModelIfAvailable:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setMaxRecognitionResultCount:(unint64_t)a3;
- (void)setMecabraWrapper:(id)a3;
- (void)setMergedResultPostProcessor:(id)a3;
- (void)setMinimumDrawingSize:(CGSize)a3;
- (void)setOvsStringChecker:(id)a3;
- (void)setPostProcessor:(id)a3;
- (void)setRecognitionMode:(int)a3;
- (void)setRecognitionType:(int)a3;
- (void)setSpellChecker:(id)a3;
- (void)setStaticLexicon:(_LXLexicon *)a3;
- (void)setTextReplacements:(id)a3;
- (void)setWordLanguageModel:(void *)a3;
- (void)updateAddressBookLexicon:(id)a3;
- (void)updateMecabraWithRegionalOTAAssets:(id)a3 nonRegionalOTAAssets:(id)a4;
- (void)updateUserDictionaryLexicon:(id)a3;
- (void)wordLanguageModel;
@end

@implementation CHRecognizer

- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 locale:(__CFLocale *)a5 learningDictionaryURL:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v13 = a6;
  if (a5)
  {
    v14 = a5;
  }
  else
  {
    objc_msgSend_defaultLocaleForRecognitionType_withMode_(CHRecognizerConfiguration, v10, v8, v7, v11, v12);
    v14 = (__CFLocale *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v14;
  self->_recognitionType = v8;
  v17 = (CHRecognizer *)objc_msgSend_initWithMode_locale_learningDictionaryURL_recognizerOptions_(self, v15, v7, (uint64_t)v14, (uint64_t)v13, 0);

  return v17;
}

- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4
{
  return (CHRecognizer *)objc_msgSend_initWithMode_locale_learningDictionaryURL_recognizerOptions_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, 0, 0);
}

- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 recognizerOptions:(id)a5
{
  return (CHRecognizer *)objc_msgSend_initWithMode_locale_learningDictionaryURL_recognizerOptions_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, 0, (uint64_t)a5);
}

- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 learningDictionaryURL:(id)a5
{
  return (CHRecognizer *)objc_msgSend_initWithMode_locale_learningDictionaryURL_recognizerOptions_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5, 0);
}

- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 learningDictionaryURL:(id)a5 recognizerOptions:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (CHRecognizerOptions *)a6;
  if (objc_msgSend_isLocaleSupported_withMode_(CHRecognizerConfiguration, v13, (uint64_t)v10, v8, v14, v15))
  {
    v74.receiver = self;
    v74.super_class = (Class)CHRecognizer;
    v16 = [(CHRecognizer *)&v74 init];
    if (v16)
    {
      v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v18 = dispatch_queue_create("com.apple.CoreHandwriting.recognizerQueue", v17);
      recognitionQueue = v16->_recognitionQueue;
      v16->_recognitionQueue = (OS_dispatch_queue *)v18;

      v16->_engine = 0;
      cornerDetector = v16->_cornerDetector;
      v16->_cornerDetector = 0;

      recognitionModel = v16->_recognitionModel;
      v16->_recognitionModel = 0;

      spellChecker = v16->_spellChecker;
      v16->_spellChecker = 0;

      ovsStringChecker = v16->_ovsStringChecker;
      v16->_ovsStringChecker = 0;

      v16->_wordLanguageModel = 0;
      v16->_characterLanguageModel = 0;
      mecabraWrapper = v16->_mecabraWrapper;
      v16->_mecabraWrapper = 0;

      v16->_staticLexicon = 0;
      v16->_customLexicon = 0;
      v16->_customPhraseLexicon = 0;
      v16->_radicalClusterFST = 0;
      v16->_formatGrammarFST = 0;
      v16->_cjkDynamicLexicon = 0;
      v16->_secondaryStaticLexicon = 0;
      v16->_cjkStaticLexicon = 0;
      cachedDrawing = v16->_cachedDrawing;
      v16->_cachedDrawing = 0;
      v16->_transliterationVariantMap = 0;

      objc_storeStrong((id *)&v16->_learningDictionaryURL, a5);
      v16->_lastCharacterSegmentCount = -1;
      v26 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
      lastCharacterSegmentIndexes = v16->_lastCharacterSegmentIndexes;
      v16->_lastCharacterSegmentIndexes = v26;

      postProcessor = v16->_postProcessor;
      v16->_postProcessor = 0;

      mergedResultPostProcessor = v16->_mergedResultPostProcessor;
      v16->_mergedResultPostProcessor = 0;

      if (!v12) {
        uint64_t v12 = objc_alloc_init(CHRecognizerOptions);
      }
      v30 = [CHRecognizerConfiguration alloc];
      uint64_t v36 = objc_msgSend_enableCachingIfAvailable(v12, v31, v32, v33, v34, v35);
      uint64_t v42 = objc_msgSend_enableGen2ModelIfAvailable(v12, v37, v38, v39, v40, v41);
      uint64_t v48 = objc_msgSend_enableGen2CharacterLMIfAvailable(v12, v43, v44, v45, v46, v47);
      v50 = objc_msgSend_initWithMode_locale_contentType_enableCachingIfAvailable_enableGen2ModelIfAvailable_enableGen2CharacterLMIfAvailable_(v30, v49, v8, (uint64_t)v10, 0, v36, v42, v48);
      objc_storeStrong((id *)&v16->_configuration, v50);
      activeCharacterSet = v16->_activeCharacterSet;
      v16->_activeCharacterSet = 0;

      v16->_maxRecognitionResultCount = 0;
      v52 = objc_opt_class();
      objc_msgSend_defaultMinimumDrawingSize(v52, v53, v54, v55, v56, v57);
      v16->_minimumDrawingSize.width = v58;
      v16->_minimumDrawingSize.height = v59;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1C496E540;
      v76 = &unk_1E64E0D48;
      v77 = v16;
      sub_1C496D8B8((uint64_t)v16, buf);
    }
    self = v16;
    v60 = self;
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v61 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v66 = objc_msgSend_stringForRecognitionMode_(CHRecognizerConfiguration, v62, v8, v63, v64, v65);
      v72 = objc_msgSend_localeIdentifier(v10, v67, v68, v69, v70, v71);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v72;
      _os_log_impl(&dword_1C492D000, v61, OS_LOG_TYPE_ERROR, "Configuration for recognizer with mode=%@ and locale=%@ is not supported.", buf, 0x16u);
    }
    v60 = 0;
  }

  return v60;
}

- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 learningDictionaryURL:(id)a5
{
  return (CHRecognizer *)MEMORY[0x1F4181798](self, sel_initWithType_mode_locale_learningDictionaryURL_, *(void *)&a3, *(void *)&a4, 0, a5);
}

- (id)strokeIndexesForLastCharacter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C496D854;
  v9 = sub_1C496D864;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C496D86C;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)_defaultPunctuationStringsOutputScores:(id *)a3 maxCandidateCount:(int64_t)a4
{
  v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, a4, v4, v5);
  uint64_t v15 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  transliterationVariantMap = self->_transliterationVariantMap;
  if (transliterationVariantMap)
  {
    VariantMap::VariantsForCode(transliterationVariantMap, 57425, &v54);
    v22 = v54;
    v23 = v55;
    if (v54 != v55)
    {
      v53 = v54;
      v24 = v54 + 4;
      double v25 = 0.0;
      do
      {
        v26 = unicodeToNSString(*((_DWORD *)v24 - 1), v17, v18, v19, v20, v21);
        v31 = v26;
        int v32 = *((_DWORD *)v24 - 1);
        BOOL v33 = v32 == 8212 || v32 == 8943;
        if (v33 || v32 == 8230)
        {
          uint64_t v35 = objc_msgSend_stringByAppendingString_(v26, v27, (uint64_t)v26, v28, v29, v30);

          v31 = (void *)v35;
        }
        objc_msgSend_addObject_(v9, v27, (uint64_t)v31, v28, v29, v30);
        uint64_t v41 = objc_msgSend_numberWithDouble_(NSNumber, v36, v37, v38, v39, v40, v25);
        objc_msgSend_addObject_(v15, v42, (uint64_t)v41, v43, v44, v45);

        uint64_t v51 = objc_msgSend_count(v9, v46, v47, v48, v49, v50);
        if (v51 == a4) {
          break;
        }
        double v25 = v25 + 2.22044605e-16;
        BOOL v33 = v24 == v23;
        v24 += 4;
      }
      while (!v33);
      v22 = v53;
    }
    if (a3) {
      goto LABEL_18;
    }
  }
  else
  {
    v22 = 0;
    if (a3) {
LABEL_18:
    }
      *a3 = v15;
  }
  if (v22) {
    operator delete(v22);
  }

  return v9;
}

- (BOOL)isOVSString:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C496DC90;
  v7[3] = &unk_1E64E1190;
  id v8 = v4;
  v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  sub_1C496D8B8((uint64_t)self, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (id)transliterationVariantsForString:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C496D854;
  uint64_t v15 = sub_1C496D864;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C496DE00;
  v8[3] = &unk_1E64E1190;
  id v9 = v4;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  sub_1C496D8B8((uint64_t)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_initializeMergedResultPostProcessor
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C496EEE4;
  v2[3] = &unk_1E64E0D48;
  v2[4] = self;
  sub_1C496D8B8((uint64_t)self, v2);
}

- (BOOL)_isLocaleSupported:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_mode(self->_configuration, v5, v6, v7, v8, v9);
  char isLocaleSupported_withMode = objc_msgSend_isLocaleSupported_withMode_(CHRecognizer, v11, (uint64_t)v4, v10, v12, v13);

  return isLocaleSupported_withMode;
}

+ (BOOL)isLocaleSupported:(id)a3 withMode:(int)a4
{
  return objc_msgSend_isLocaleSupported_withMode_(CHRecognizerConfiguration, a2, (uint64_t)a3, *(uint64_t *)&a4, v4, v5);
}

- (void)updateAddressBookLexicon:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1C49722A0;
    v10[3] = &unk_1E64E11E0;
    v10[4] = self;
    id v11 = v4;
    sub_1C496D8B8((uint64_t)self, v10);
  }
}

- (void)updateUserDictionaryLexicon:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1C4972488;
    v10[3] = &unk_1E64E11E0;
    v10[4] = self;
    id v11 = v4;
    sub_1C496D8B8((uint64_t)self, v10);
  }
}

- (void)updateMecabraWithRegionalOTAAssets:(id)a3 nonRegionalOTAAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C497268C;
  v10[3] = &unk_1E64E1208;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  sub_1C496D8B8((uint64_t)self, v10);
}

- (void)setCustomLexicon:(_LXLexicon *)a3 customVocabulary:(void *)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C49727EC;
  v4[3] = &unk_1E64E1230;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  sub_1C496D8B8((uint64_t)self, v4);
}

- (void)setCustomPhraseLexicon:(_LXLexicon *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4972988;
  v3[3] = &unk_1E64E1258;
  v3[4] = self;
  v3[5] = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (void)setTextReplacements:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4972AE8;
  v6[3] = &unk_1E64E11E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  sub_1C496D8B8((uint64_t)self, v6);
}

- (void)_updateWordLanguageModel:(void *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4972D58;
  v3[3] = &unk_1E64E1258;
  v3[4] = self;
  v3[5] = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (void)candidateAccepted:(void *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4972ED8;
  v3[3] = &unk_1E64E1258;
  v3[4] = self;
  v3[5] = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (vector<const)completionsForCandidate:(CHRecognizer *)self prefix:(SEL)a3 option:(id)a4
{
  return (vector<const void *, std::allocator<const void *>> *)MEMORY[0x1F4181798](self, sel_completionsForCandidate_candidateContext_prefix_option_, a4, 0, a5, a6);
}

- (vector<const)completionsForCandidate:(CHRecognizer *)self candidateContext:(SEL)a3 prefix:(id)a4 option:(id)a5
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x4812000000;
  int v32 = sub_1C49731A4;
  BOOL v33 = sub_1C49731C8;
  uint64_t v34 = &unk_1C4CB5C62;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  __p = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C49731E0;
  v24[3] = &unk_1E64E1280;
  v24[4] = self;
  id v15 = v13;
  id v25 = v15;
  id v16 = v14;
  v27 = &v29;
  unint64_t v28 = a7;
  id v26 = v16;
  sub_1C496D8B8((uint64_t)self, v24);
  v17 = v30;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  uint64_t v19 = (unsigned char *)v17[6];
  uint64_t v18 = (unsigned char *)v17[7];
  int64_t v20 = v18 - v19;
  if (v18 != v19)
  {
    if (v20 < 0) {
      sub_1C494A220();
    }
    uint64_t v21 = (void **)operator new(v18 - v19);
    retstr->var0 = v21;
    v22 = &v21[v20 >> 3];
    retstr->var2.var0 = v22;
    memcpy(v21, v19, v20);
    retstr->var1 = v22;
  }

  _Block_object_dispose(&v29, 8);
  if (__p)
  {
    uint64_t v36 = __p;
    operator delete(__p);
  }

  return result;
}

- (BOOL)isRareChineseEntry:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C49734C4;
  v7[3] = &unk_1E64E12A8;
  v7[4] = self;
  id v8 = v4;
  id v9 = &v10;
  id v5 = v4;
  sub_1C496D8B8((uint64_t)self, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (CHRecognizer)initWithType:(int)a3 mode:(int)a4
{
  return (CHRecognizer *)((uint64_t (*)(CHRecognizer *, char *, void, void, void))MEMORY[0x1F4181798])(self, sel_initWithType_mode_locale_, *(void *)&a3, *(void *)&a4, 0);
}

- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 locale:(__CFLocale *)a5
{
  return (CHRecognizer *)MEMORY[0x1F4181798](self, sel_initWithType_mode_locale_learningDictionaryURL_, *(void *)&a3, *(void *)&a4, a5, 0);
}

- (void)dealloc
{
  if (self)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1C4971E40;
    v4[3] = &unk_1E64E0D48;
    v4[4] = self;
    sub_1C496D8B8((uint64_t)self, v4);
  }
  if (self->_icuTransliterator)
  {
    utrans_close();
    self->_icuTransliterator = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CHRecognizer;
  [(CHRecognizer *)&v3 dealloc];
}

- (id)supportedCharacterSet
{
  if (self->_engine)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    CHNeuralNetwork::supportedCodes(self->_engine, &v10);
    id v7 = v10;
    id v8 = v11;
    if (v10 != v11)
    {
      do
      {
        objc_msgSend_addCharactersInRange_(v3, v4, *(int *)v7, 1, v5, v6);
        v7 += 4;
      }
      while (v7 != v8);
      id v7 = v10;
    }
    if (v7)
    {
      id v11 = v7;
      operator delete(v7);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)supportedStrings
{
  if (self->_engine)
  {
    id v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
    CHNeuralNetwork::supportedCodes(self->_engine, &v27);
    char v13 = v27;
    id v14 = v28;
    if (v27 != v28)
    {
      do
      {
        id v15 = (const char *)*(unsigned int *)v13;
        if (objc_msgSend_mode(self->_configuration, v8, v9, v10, v11, v12) == 3) {
          sub_1C49738B0((uint64_t)self, v15, v17, v18, v19, v20);
        }
        else {
        uint64_t v21 = unicodeToNSString((int)v15, v16, v17, v18, v19, v20);
        }
        objc_msgSend_addObject_(v7, v22, (uint64_t)v21, v23, v24, v25);

        v13 += 4;
      }
      while (v13 != v14);
      char v13 = v27;
    }
    if (v13)
    {
      unint64_t v28 = v13;
      operator delete(v13);
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)characterSetForStrings:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16, v8);
  if (v11)
  {
    uint64_t v12 = *(void *)v33;
    if (self)
    {
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v6);
          }
          id v14 = *(id *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_objectForKey_(&unk_1F203CF18, v15, (uint64_t)v14, v16, v17, v18, (void)v32);

          if (v19)
          {
            int v25 = objc_msgSend_integerValue(v19, v20, v21, v22, v23, v24);
            objc_msgSend_addCharactersInRange_(v5, v26, v25, 1, v27, v28);
          }
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v29, (uint64_t)&v32, (uint64_t)v36, 16, v30);
      }
      while (v11);
    }
    else
    {
      do
      {
        if (*(void *)v33 == v12)
        {
          do
            --v11;
          while (v11);
        }
        else
        {
          do
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v6);
            }
            --v11;
          }
          while (v11);
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v32, (uint64_t)v36, 16, v10);
      }
      while (v11);
    }
  }

  return v5;
}

- (double)_calculateJointWordLMScoreForString:(id)a3 wordRanges:(id)a4 wordIDs:(id)a5 patternEntries:(id)a6 history:(unsigned int *)a7 historyLength:(unint64_t)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v18 = a6;
  if (qword_1EA3C9D20 != -1) {
    dispatch_once(&qword_1EA3C9D20, &unk_1F2013110);
  }
  uint64_t v78 = v13;
  v76 = v18;
  uint64_t v24 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v14, (uint64_t)v18, v15, v16, v17);
  for (unint64_t i = 0; i < objc_msgSend_count(v12, v19, v20, v21, v22, v23); ++i)
  {
    uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v24, v26, i, v27, v28, v29);
    int v36 = objc_msgSend_BOOLValue(v30, v31, v32, v33, v34, v35);

    if (v36)
    {
      uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v12, v19, i, v21, v22, v23);
      uint64_t v43 = objc_msgSend_rangeValue(v37, v38, v39, v40, v41, v42);
      uint64_t v45 = v44;

      uint64_t v51 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], v46, v47, v48, v49, v50);
      uint64_t v53 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v11, v52, (uint64_t)v51, 2, v43, v45);

      if (v53 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v54 = objc_msgSend_numberWithBool_(NSNumber, v19, 0, v21, v22, v23);
        objc_msgSend_setObject_atIndexedSubscript_(v24, v55, (uint64_t)v54, i, v56, v57);
      }
    }
  }
  if (objc_msgSend_indexOfObject_(v78, v26, (uint64_t)&unk_1F203E040, v27, v28, v29) == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v59 = v12;
    objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v60, (uint64_t)v78, v61, v62, v63);
    id v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v94[0] = 0;
    uint64_t v65 = objc_msgSend__tokensUsingLMTokenizerForString_wordRanges_nonWordPatterns_outTokenIDs_(self, v58, (uint64_t)v11, (uint64_t)v12, (uint64_t)v24, (uint64_t)v94);
    id v64 = v94[0];
    id v59 = (id)v65;
  }
  uint64_t v90 = 0;
  v91 = (double *)&v90;
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = 0;
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = sub_1C49786C4;
  v79[3] = &unk_1E64E13B8;
  unint64_t v88 = a8;
  id v66 = v59;
  id v80 = v66;
  v89 = a7;
  id v67 = v12;
  id v81 = v67;
  id v68 = v11;
  id v82 = v68;
  id v69 = v76;
  id v83 = v69;
  id v70 = v78;
  id v84 = v70;
  id v85 = v64;
  v86 = self;
  v87 = &v90;
  id v71 = v64;
  sub_1C496D8B8((uint64_t)self, v79);
  double v72 = v91[3];

  _Block_object_dispose(&v90, 8);
  return v72;
}

- (id)_tokensUsingLMTokenizerForString:(id)a3 wordRanges:(id)a4 nonWordPatterns:(id)a5 outTokenIDs:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v17 = a5;
  if (qword_1EA3C9D30 != -1) {
    dispatch_once(&qword_1EA3C9D30, &unk_1F2013190);
  }
  id v18 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
  uint64_t v24 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_stringByAppendingString_(v10, v25, @" ", v26, v27, v28);

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1C4978CB8;
  v42[3] = &unk_1E64E1408;
  id v30 = v29;
  id v43 = v30;
  uint64_t v44 = self;
  id v31 = v11;
  id v45 = v31;
  id v32 = v17;
  id v46 = v32;
  id v33 = v24;
  id v47 = v33;
  id v34 = v18;
  id v48 = v34;
  sub_1C496D8B8((uint64_t)self, v42);
  if (a6)
  {
    objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v35, (uint64_t)v33, v36, v37, v38);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v39 = v48;
  id v40 = v34;

  return v40;
}

- (id)_addAlternativeCandidatesForTokenizedResult:(id)a3
{
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v193 = a3;
  v191 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4, v5, v6, v7);
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v14 = objc_msgSend_transcriptionPaths(v193, v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_arrayWithArray_(v8, v15, (uint64_t)v14, v16, v17, v18);

  uint64_t v20 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v26 = objc_msgSend_transcriptionPathScores(v193, v21, v22, v23, v24, v25);
  v195 = objc_msgSend_arrayWithArray_(v20, v27, (uint64_t)v26, v28, v29, v30);

  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  objc_msgSend_tokenColumns(v193, v31, v32, v33, v34, v35);
  obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v196, (uint64_t)v200, 16, v37);
  if (v38)
  {
    uint64_t v44 = 0;
    uint64_t v190 = *(void *)v197;
    do
    {
      uint64_t v192 = v38;
      for (uint64_t i = 0; i != v192; ++i)
      {
        if (*(void *)v197 != v190) {
          objc_enumerationMutation(obj);
        }
        id v46 = *(void **)(*((void *)&v196 + 1) + 8 * i);
        id v47 = objc_msgSend_firstObject(v19, v39, v40, v41, v42, v43);
        unint64_t v52 = objc_msgSend_indexAtPosition_(v47, v48, v44, v49, v50, v51);

        CGFloat v58 = objc_msgSend_transcriptionPaths(v193, v53, v54, v55, v56, v57);
        id v64 = objc_msgSend_firstObject(v58, v59, v60, v61, v62, v63);
        v194 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v193, v65, (uint64_t)v64, v44, v66, v67);

        if (objc_msgSend_count(v194, v68, v69, v70, v71, v72) == 1)
        {
          uint64_t v78 = (void *)MEMORY[0x1E4F1CA48];
          v79 = objc_msgSend_textTokenRows(v46, v73, v74, v75, v76, v77);
          id v84 = objc_msgSend_arrayWithArray_(v78, v80, (uint64_t)v79, v81, v82, v83);

          if ((unint64_t)objc_msgSend_count(v84, v85, v86, v87, v88, v89) >= 2)
          {
            for (unint64_t j = 1; j < objc_msgSend_count(v19, v90, v91, v92, v93, v94); ++j)
            {
              v101 = objc_msgSend_objectAtIndexedSubscript_(v19, v96, j, v98, v99, v100);
              unint64_t v106 = objc_msgSend_indexAtPosition_(v101, v102, v44, v103, v104, v105);

              if (v106 > v52)
              {
                objc_msgSend_objectAtIndex_(v19, v90, j, v92, v93, v94);
                v107 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
                uint64_t v112 = objc_msgSend_indexAtPosition_(v107, v108, v44, v109, v110, v111);
                v113 = modifyIndexPath(v107, v44, v112);
                objc_msgSend_replaceObjectAtIndex_withObject_(v19, v114, j, (uint64_t)v113, v115, v116);
              }
            }
            uint64_t v121 = objc_msgSend_count(v84, v96, v97, v98, v99, v100) - 1;
            if (v121 >= 0)
            {
              do
              {
                v122 = objc_msgSend_objectAtIndex_(v84, v117, v121, v118, v119, v120);
                v128 = v122;
                if (v121 != v52 && objc_msgSend_count(v122, v123, v124, v125, v126, v127) == 1)
                {
                  v134 = objc_msgSend_firstObject(v128, v129, v130, v131, v132, v133);
                  BOOL v140 = (objc_msgSend_properties(v134, v135, v136, v137, v138, v139) & 4) == 0;

                  if (v140)
                  {
                    objc_msgSend_removeObjectAtIndex_(v84, v141, v121, v142, v143, v144);
                    uint64_t v154 = objc_msgSend_count(v19, v145, v146, v147, v148, v149);
                    if (v154 - 1 >= 0)
                    {
                      do
                      {
                        objc_msgSend_objectAtIndex_(v19, v150, --v154, v151, v152, v153);
                        v155 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend_indexAtPosition_(v155, v156, v44, v157, v158, v159) == v121)
                        {
                          objc_msgSend_removeObjectAtIndex_(v19, v160, v154, v161, v162, v163);
                          objc_msgSend_removeObjectAtIndex_(v195, v164, v154, v165, v166, v167);
                        }
                        else if (objc_msgSend_indexAtPosition_(v155, v160, v44, v161, v162, v163) > (unint64_t)v121)
                        {
                          uint64_t v172 = objc_msgSend_indexAtPosition_(v155, v168, v44, v169, v170, v171);
                          v173 = modifyIndexPath(v155, v44, v172 - 1);
                          objc_msgSend_replaceObjectAtIndex_withObject_(v19, v174, v154, (uint64_t)v173, v175, v176);
                        }
                      }
                      while (v154 > 0);
                    }
                  }
                }
              }
              while (v121-- > 0);
            }
          }
          v178 = [CHMutableTokenizedResultColumn alloc];
          v183 = objc_msgSend_initWithTokenRows_(v178, v179, (uint64_t)v84, v180, v181, v182);
          objc_msgSend_addObject_(v191, v184, (uint64_t)v183, v185, v186, v187);
        }
        else
        {
          objc_msgSend_addObject_(v191, v73, (uint64_t)v46, v75, v76, v77);
        }

        ++v44;
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v196, (uint64_t)v200, 16, v43);
    }
    while (v38);
  }

  return v193;
}

- (void)_adjustResultsForConfusableCharacters:(id)a3
{
  id v112 = a3;
  if (objc_msgSend_count(v112, v3, v4, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(v112, v8, 0, v9, v10, v11);
    uint64_t v18 = objc_msgSend_string(v12, v13, v14, v15, v16, v17);
    uint64_t v24 = objc_msgSend_length(v18, v19, v20, v21, v22, v23);

    if (v24)
    {
      uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v112, v25, 0, v26, v27, v28);
      uint64_t v35 = objc_msgSend_string(v29, v30, v31, v32, v33, v34);
      objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v35, v36, 0, v37, v38, v39);
      if (v44 == 1)
      {
        id v45 = objc_msgSend_string(v29, (const char *)1, v40, v41, v42, v43);
        int v50 = objc_msgSend_characterAtIndex_(v45, v46, 0, v47, v48, v49);

        if (v50 != 161)
        {
LABEL_14:

          goto LABEL_15;
        }
        uint64_t v56 = objc_msgSend_string(v29, v51, v52, v53, v54, v55);
        uint64_t v61 = objc_msgSend_stringWithFormat_(NSString, v57, @"%c", v58, v59, v60, 105);
        uint64_t v35 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v56, v62, 0, 1, (uint64_t)v61, v63);

        for (unint64_t i = 0; i < objc_msgSend_count(v112, v64, v65, v66, v67, v68); ++i)
        {
          uint64_t v74 = objc_msgSend_objectAtIndexedSubscript_(v112, v70, i, v71, v72, v73);
          id v80 = objc_msgSend_string(v74, v75, v76, v77, v78, v79);
          uint64_t v84 = objc_msgSend_compare_options_(v35, v81, (uint64_t)v80, 129, v82, v83);

          if (!v84)
          {
            if (i != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v85 = objc_msgSend_objectAtIndexedSubscript_(v112, v64, i, v66, v67, v68);
              RootCursor = (const void *)LXLexiconCreateRootCursor();
              uint64_t v92 = objc_msgSend_string(v85, v87, v88, v89, v90, v91);
              uint64_t v93 = (const void *)LXCursorCreateByAdvancing();

              CFRelease(RootCursor);
              if (v93)
              {
                objc_msgSend_score(v29, v94, v95, v96, v97, v98);
                objc_msgSend_setScore_(v85, v100, v101, v102, v103, v104, v99 + -0.0001);
                objc_msgSend_insertObject_atIndex_(v112, v105, (uint64_t)v85, 0, v106, v107);
                objc_msgSend_removeObjectAtIndex_(v112, v108, i + 1, v109, v110, v111);
                CFRelease(v93);
              }
            }
            break;
          }
        }
      }

      goto LABEL_14;
    }
  }
LABEL_15:
}

- (id)_tokenFromLegacyResult:(id)a3 wordIndex:(unint64_t)a4 strokeSet:(id)a5 substrokeCount:(int64_t)a6
{
  id v9 = a3;
  id v187 = a5;
  uint64_t v15 = objc_msgSend_wordRanges(v9, v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, a4, v17, v18, v19);
  uint64_t v26 = objc_msgSend_rangeValue(v20, v21, v22, v23, v24, v25);
  uint64_t v28 = v27;

  uint64_t v34 = objc_msgSend_wordIDs(v9, v29, v30, v31, v32, v33);
  uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v34, v35, a4, v36, v37, v38);
  unsigned int v185 = objc_msgSend_intValue(v39, v40, v41, v42, v43, v44);

  int v50 = objc_msgSend_wordRecognitionScores(v9, v45, v46, v47, v48, v49);
  uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v50, v51, a4, v52, v53, v54);
  objc_msgSend_doubleValue(v55, v56, v57, v58, v59, v60);
  double v62 = v61;

  uint64_t v68 = objc_msgSend_wordCombinedScores(v9, v63, v64, v65, v66, v67);
  uint64_t v73 = objc_msgSend_objectAtIndexedSubscript_(v68, v69, a4, v70, v71, v72);
  objc_msgSend_doubleValue(v73, v74, v75, v76, v77, v78);
  double v80 = v79;

  if (v187)
  {
    id v91 = v187;
  }
  else
  {
    uint64_t v92 = objc_msgSend_wordStrokeSets(v9, v81, v82, v83, v84, v85);
    objc_msgSend_objectAtIndexedSubscript_(v92, v93, a4, v94, v95, v96);
    id v91 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v97 = objc_msgSend_wordLexicalEntries(v9, v86, v87, v88, v89, v90);
  uint64_t v102 = objc_msgSend_objectAtIndexedSubscript_(v97, v98, a4, v99, v100, v101);
  int v108 = objc_msgSend_BOOLValue(v102, v103, v104, v105, v106, v107);

  if (v108) {
    uint64_t v114 = 261;
  }
  else {
    uint64_t v114 = 1;
  }
  uint64_t v115 = objc_msgSend_wordPatternEntries(v9, v109, v110, v111, v112, v113);
  uint64_t v120 = objc_msgSend_objectAtIndexedSubscript_(v115, v116, a4, v117, v118, v119);
  int v126 = objc_msgSend_BOOLValue(v120, v121, v122, v123, v124, v125);

  if (v126) {
    uint64_t v132 = v114 | 8;
  }
  else {
    uint64_t v132 = v114;
  }
  uint64_t v133 = objc_msgSend_inappropriateWordIndexes(v9, v127, v128, v129, v130, v131);
  int v138 = objc_msgSend_containsIndex_(v133, v134, a4, v135, v136, v137);

  int shouldUseTokenPrecedingSpaces = objc_msgSend_shouldUseTokenPrecedingSpaces(self->_configuration, v139, v140, v141, v142, v143);
  uint64_t v150 = v132 | 0x10;
  if (!v138) {
    uint64_t v150 = v132;
  }
  if (shouldUseTokenPrecedingSpaces) {
    uint64_t v151 = v150 | 0x20;
  }
  else {
    uint64_t v151 = v150;
  }
  uint64_t v152 = objc_msgSend_rareWordIndexes(v9, v145, v146, v147, v148, v149);
  int v157 = objc_msgSend_containsIndex_(v152, v153, a4, v154, v155, v156);

  if (v157) {
    uint64_t v163 = v151 | 2;
  }
  else {
    uint64_t v163 = v151;
  }
  if (objc_msgSend_isTextReplacement(v9, v158, v159, v160, v161, v162)) {
    uint64_t v169 = 17;
  }
  else {
    uint64_t v169 = 1;
  }
  uint64_t v170 = objc_msgSend_string(v9, v164, v165, v166, v167, v168);
  v174 = objc_msgSend_substringWithRange_(v170, v171, v26, v28, v172, v173);

  uint64_t v175 = [CHMutableTokenizedTextResultToken alloc];
  uint64_t v181 = objc_msgSend_locale(self->_configuration, v176, v177, v178, v179, v180);
  v183 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v175, v182, (uint64_t)v174, (uint64_t)v91, v185, v163, v181, v169, v62, v62, v80, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), a6);

  return v183;
}

- (id)bestTranscriptionPathsForTokenizedResult:(id)a3 scores:(id *)a4 history:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v26 = 0;
  uint64_t v15 = objc_msgSend__effectiveMaxRecognitionResultCount(self, v10, v11, v12, v13, v14);
  objc_msgSend__calculateBestTranscriptionPaths_scores_fromTokenizedResult_pathCount_history_skipLMRescoring_(self, v16, (uint64_t)&v26, (uint64_t)a4, (uint64_t)v8, v15, v9, 0);
  id v17 = v26;
  if (!objc_msgSend_count(v17, v18, v19, v20, v21, v22))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v23 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_1C492D000, v23, OS_LOG_TYPE_FAULT, "There must be at least one valid path", v25, 2u);
    }
  }
  return v17;
}

- (void)_calculateBestTranscriptionPaths:(id *)a3 scores:(id *)a4 fromTokenizedResult:(id)a5 pathCount:(int64_t)a6 history:(id)a7 skipLMRescoring:(BOOL)a8
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v118 = a5;
  id v113 = a7;
  if (objc_msgSend_shouldApplyLMSorting(self->_configuration, v11, v12, v13, v14, v15))
  {
    BOOL v21 = !a8;
    if (!self->_wordLanguageModel) {
      BOOL v21 = 0;
    }
    BOOL v114 = v21;
  }
  else
  {
    BOOL v114 = 0;
  }
  uint64_t v117 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19, v20);
  uint64_t v115 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v22, v23, v24, v25, v26);
  if ((objc_msgSend_hasValidColumns(v118, v27, v28, v29, v30, v31) & 1) == 0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v37 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      uint64_t v42 = objc_msgSend_descriptionWithSensitiveInformation_(v118, v38, 0, v39, v40, v41);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v42;
      _os_log_impl(&dword_1C492D000, v37, OS_LOG_TYPE_FAULT, "Unexpected tokenized result with invalid columns passed to _calculateBestTranscriptionPaths, description = %@", buf, 0xCu);
    }
  }
  if (v114
    || (objc_msgSend_tokenColumns(v118, v32, v33, v34, v35, v36),
        uint64_t v43 = objc_claimAutoreleasedReturnValue(),
        BOOL v49 = objc_msgSend_count(v43, v44, v45, v46, v47, v48) == 1,
        v43,
        !v49))
  {
    operator new[]();
  }
  uint64_t v55 = objc_msgSend_tokenColumns(v118, v50, v51, v52, v53, v54);
  uint64_t v119 = objc_msgSend_objectAtIndex_(v55, v56, 0, v57, v58, v59);

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  uint64_t v120 = objc_msgSend_textTokenRows(v119, v60, v61, v62, v63, v64);
  uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v65, (uint64_t)&v125, (uint64_t)v130, 16, v66);
  if (v67)
  {
    uint64_t v68 = 0;
    uint64_t v69 = *(void *)v126;
LABEL_16:
    uint64_t v70 = 0;
    while (1)
    {
      if (*(void *)v126 != v69) {
        objc_enumerationMutation(v120);
      }
      uint64_t v71 = *(void **)(*((void *)&v125 + 1) + 8 * v70);
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id v72 = v71;
      uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v121, (uint64_t)v129, 16, v74);
      if (v80)
      {
        uint64_t v81 = *(void *)v122;
        double v82 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v80; ++i)
          {
            if (*(void *)v122 != v81) {
              objc_enumerationMutation(v72);
            }
            objc_msgSend_combinedScore(*(void **)(*((void *)&v121 + 1) + 8 * i), v75, v76, v77, v78, v79);
            double v82 = v82 + v84;
          }
          uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v121, (uint64_t)v129, 16, v79);
        }
        while (v80);
      }
      else
      {
        double v82 = 0.0;
      }

      uint64_t v89 = objc_msgSend_indexPathWithIndex_(MEMORY[0x1E4F28D58], v85, v68, v86, v87, v88);
      objc_msgSend_addObject_(v117, v90, (uint64_t)v89, v91, v92, v93);

      uint64_t v99 = objc_msgSend_numberWithDouble_(NSNumber, v94, v95, v96, v97, v98, v82);
      objc_msgSend_addObject_(v115, v100, (uint64_t)v99, v101, v102, v103);

      if (objc_msgSend_count(v117, v104, v105, v106, v107, v108) == a6) {
        break;
      }
      ++v68;
      if (++v70 == v67)
      {
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v109, (uint64_t)&v125, (uint64_t)v130, 16, v110);
        if (v67) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  if (a3) {
    *a3 = v117;
  }
  if (a4) {
    *a4 = v115;
  }
}

- (id)_contextTokenIDsFromHistory:(id)a3 maxCharacterLength:(unint64_t)a4 maxTokenCount:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v14 = v8;
  if (v8)
  {
    unint64_t v19 = objc_msgSend_length(v8, v9, v10, v11, v12, v13);
    if (v19 <= a4)
    {
      objc_msgSend_substringWithRange_(v14, v15, 0, v19, v17, v18);
    }
    else
    {
      uint64_t v20 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v14, v15, v19 - a4, v16, v17, v18);
      objc_msgSend_substringWithRange_(v14, v21, v20, v19 - v20, v22, v23);
    uint64_t v25 = };
    uint64_t v26 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v27 = (void *)MEMORY[0x1E4F29238];
    uint64_t v33 = objc_msgSend_length(v25, v28, v29, v30, v31, v32);
    uint64_t v37 = objc_msgSend_valueWithRange_(v27, v34, 0, v33, v35, v36);
    uint64_t v42 = objc_msgSend_arrayWithObject_(v26, v38, (uint64_t)v37, v39, v40, v41);

    uint64_t v43 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v48 = objc_msgSend_numberWithBool_(NSNumber, v44, 0, v45, v46, v47);
    uint64_t v53 = objc_msgSend_arrayWithObject_(v43, v49, (uint64_t)v48, v50, v51, v52);

    id v72 = 0;
    id v55 = (id)objc_msgSend__tokensUsingLMTokenizerForString_wordRanges_nonWordPatterns_outTokenIDs_(self, v54, (uint64_t)v25, (uint64_t)v42, (uint64_t)v53, (uint64_t)&v72);
    id v24 = v72;
    if (objc_msgSend_count(v24, v56, v57, v58, v59, v60) > a5)
    {
      uint64_t v66 = objc_msgSend_count(v24, v61, v62, v63, v64, v65);
      uint64_t v70 = objc_msgSend_subarrayWithRange_(v24, v67, v66 - a5, a5, v68, v69);

      id v24 = (id)v70;
    }
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

- (id)_tokenizedTextResultFromResults:(id)a3 segmentGroup:(id)a4 offsetSegment:(int64_t)a5 decodedStrokeSets:(BOOL)a6 spaceBehavior:(int64_t)a7
{
  v194[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v193 = a4;
  id v187 = objc_alloc_init(CHMutableTokenizedTextResult);
  uint64_t v190 = objc_alloc_init(CHMutableTokenizedResultColumn);
  unint64_t v11 = 0x1E4F1C000uLL;
  v191 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
  uint64_t v192 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v17, v18, v19, v20, v21);
  unint64_t v22 = 0;
  v189 = v10;
  for (unint64_t i = objc_msgSend_count(v10, v23, v24, v25, v26, v27);
        v22 < i;
        unint64_t i = objc_msgSend_count(v189, v173, v174, v175, v176, v177))
  {
    uint64_t v33 = objc_msgSend_objectAtIndex_(v10, v29, v22, v30, v31, v32);
    uint64_t v44 = objc_msgSend_array(*(void **)(v11 + 2632), v34, v35, v36, v37, v38);
    if (a6)
    {
      for (unint64_t j = 0; ; ++j)
      {
        uint64_t v46 = objc_msgSend_wordRanges(v33, v39, v40, v41, v42, v43);
        unint64_t v52 = objc_msgSend_count(v46, v47, v48, v49, v50, v51);

        if (j >= v52) {
          break;
        }
        uint64_t v58 = objc_msgSend_totalSegmentCount(v193, v53, v54, v55, v56, v57);
        uint64_t v60 = objc_msgSend__tokenFromLegacyResult_wordIndex_strokeSet_substrokeCount_(self, v59, (uint64_t)v33, j, 0, v58);
        uint64_t v66 = objc_msgSend_properties(v60, v61, v62, v63, v64, v65);
        uint64_t v76 = objc_msgSend_inputSources(v60, v67, v68, v69, v70, v71);
        unint64_t v77 = v66 & 0xFFFFFFFFFFFFFFDFLL;
        if (a7 != 1) {
          unint64_t v77 = v66;
        }
        if (a7 == 2) {
          objc_msgSend_setProperties_(v60, v72, v66 | 0x20, v73, v74, v75);
        }
        else {
          objc_msgSend_setProperties_(v60, v72, v77, v73, v74, v75);
        }
        if (v22) {
          objc_msgSend_setInputSources_(v60, v78, v76, v79, v80, v81);
        }
        else {
          objc_msgSend_setInputSources_(v60, v78, v76 | 4, v79, v80, v81);
        }
        objc_msgSend_addObject_(v44, v82, (uint64_t)v60, v83, v84, v85);
      }
    }
    else
    {
      for (unint64_t k = 0; ; ++k)
      {
        uint64_t v87 = objc_msgSend_wordRanges(v33, v39, v40, v41, v42, v43);
        unint64_t v93 = objc_msgSend_count(v87, v88, v89, v90, v91, v92);

        if (k >= v93) {
          break;
        }
        uint64_t v95 = objc_msgSend_wordStrokeSets(v33, v53, v94, v55, v56, v57);
        uint64_t v100 = objc_msgSend_objectAtIndexedSubscript_(v95, v96, k, v97, v98, v99);

        uint64_t v106 = objc_msgSend_wordStrokeSets(v33, v101, v102, v103, v104, v105);
        uint64_t v111 = objc_msgSend_objectAtIndexedSubscript_(v106, v107, k, v108, v109, v110);
        uint64_t v117 = objc_msgSend_count(v111, v112, v113, v114, v115, v116);

        uint64_t v119 = objc_msgSend__tokenFromLegacyResult_wordIndex_strokeSet_substrokeCount_(self, v118, (uint64_t)v33, k, (uint64_t)v100, v117);
        uint64_t v125 = objc_msgSend_properties(v119, v120, v121, v122, v123, v124);
        uint64_t v131 = objc_msgSend_inputSources(v119, v126, v127, v128, v129, v130);
        uint64_t v136 = v125 | 0x20;
        if (a7 != 2) {
          uint64_t v136 = v125;
        }
        if (a7 == 1) {
          unint64_t v137 = v125 & 0xFFFFFFFFFFFFFFDFLL;
        }
        else {
          unint64_t v137 = v136;
        }
        uint64_t v138 = v131;
        objc_msgSend_setProperties_(v119, v132, v137, v133, v134, v135);
        if (v22) {
          objc_msgSend_setInputSources_(v119, v139, v138, v140, v141, v142);
        }
        else {
          objc_msgSend_setInputSources_(v119, v139, v138 | 4, v140, v141, v142);
        }
        objc_msgSend_addObject_(v44, v143, (uint64_t)v119, v144, v145, v146);
      }
    }
    uint64_t v147 = objc_msgSend_addTokenRowWithTokens_(v190, v53, (uint64_t)v44, v55, v56, v57);
    uint64_t v152 = objc_msgSend_indexPathWithIndex_(MEMORY[0x1E4F28D58], v148, v147, v149, v150, v151);
    objc_msgSend_addObject_(v191, v153, (uint64_t)v152, v154, v155, v156);

    int v157 = NSNumber;
    objc_msgSend_score(v33, v158, v159, v160, v161, v162);
    uint64_t v168 = objc_msgSend_numberWithDouble_(v157, v163, v164, v165, v166, v167);
    objc_msgSend_addObject_(v192, v169, (uint64_t)v168, v170, v171, v172);

    ++v22;
    id v10 = v189;
    unint64_t v11 = 0x1E4F1C000;
  }
  v194[0] = v190;
  uint64_t v178 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v29, (uint64_t)v194, 1, v31, v32);
  objc_msgSend_setTokenColumns_(v187, v179, (uint64_t)v178, v180, v181, v182);

  objc_msgSend_setTranscriptionPaths_scores_(v187, v183, (uint64_t)v191, (uint64_t)v192, v184, v185);
  return v187;
}

- (id)_resultUsingNextGenerationPipelineWithDrawing:(id)a3 options:(id)a4
{
  uint64_t v1026 = *MEMORY[0x1E4F143B8];
  id v980 = a3;
  id v981 = a4;
  v998 = self;
  if (self->_recognitionModel)
  {
    if (self->_legacyTextDecoder) {
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v7 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_FAULT, "The recognition model must be loaded before inference can be called on it", buf, 2u);
    }

    if (self->_legacyTextDecoder) {
      goto LABEL_10;
    }
  }
  if (!self->_textDecoder.__engaged_)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v16 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v16, OS_LOG_TYPE_FAULT, "The text decoder must be loaded before decoding can be executed", buf, 2u);
    }

    if (!self->_recognitionModel) {
      goto LABEL_21;
    }
    goto LABEL_11;
  }
LABEL_10:
  if (!self->_recognitionModel)
  {
LABEL_21:
    id v17 = 0;
    goto LABEL_366;
  }
LABEL_11:
  if (!self->_legacyTextDecoder && !self->_textDecoder.__engaged_) {
    goto LABEL_21;
  }
  v1012 = 0;
  v1013 = 0;
  v1014 = 0;
  v1009 = 0;
  v1010 = 0;
  v1011 = 0;
  id v8 = v981;
  uint64_t v13 = v8;
  id v14 = 0;
  v984 = v8;
  if (v8)
  {
    uint64_t v15 = objc_msgSend_objectForKey_(v8, v9, CHRecognitionOptionInferenceCache, v10, v11, v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v15;
    }
    else {
      id v14 = 0;
    }

    uint64_t v13 = v984;
  }

  id v18 = v14;
  id v1001 = v980;
  v979 = v18;
  if (!v18)
  {
    v988 = 0;
    goto LABEL_116;
  }
  uint64_t v24 = objc_msgSend_recognitionEngineCachingKey(v998, v19, v20, v21, v22, v23);
  *(void *)buf = 0;
  *(void *)v1023 = 0;
  v988 = objc_msgSend_retrieveActivationMatrixForDrawing_recognitionEngineCachingKey_outStrokeIndexMapping_outStrokeEndings_(v18, v25, (uint64_t)v1001, (uint64_t)v24, (uint64_t)buf, (uint64_t)v1023);
  id v26 = *(id *)buf;
  id v1003 = *(id *)v1023;

  if (v988 && v26)
  {
    v1013 = (char *)v1012;
    unint64_t v32 = objc_msgSend_count(v26, v27, v28, v29, v30, v31);
    unint64_t v38 = v32;
    if (v32 > (v1014 - (unsigned char *)v1012) >> 3)
    {
      if (v32 >> 61) {
        sub_1C494A220();
      }
      uint64_t v39 = (char *)operator new(8 * v32);
      v1012 = &v39[(v1013 - (unsigned char *)v1012) & 0xFFFFFFFFFFFFFFF8];
      v1013 = (char *)v1012;
      v1014 = &v39[8 * v38];
    }
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= objc_msgSend_count(v26, v33, v34, v35, v36, v37)) {
        goto LABEL_55;
      }
      uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(v26, v27, i, v29, v30, v31);
      uint64_t v47 = objc_msgSend_integerValue(v41, v42, v43, v44, v45, v46);
      uint64_t v48 = v47;
      uint64_t v49 = v1013;
      if (v1013 < v1014)
      {
        *(void *)v1013 = v47;
        uint64_t v50 = (uint64_t)(v49 + 8);
        goto LABEL_54;
      }
      uint64_t v4 = (uint64_t)v1012;
      int64_t v51 = v1013 - (unsigned char *)v1012;
      uint64_t v52 = (v1013 - (unsigned char *)v1012) >> 3;
      unint64_t v53 = v52 + 1;
      if ((unint64_t)(v52 + 1) >> 61) {
        sub_1C494A220();
      }
      uint64_t v54 = v1014 - (unsigned char *)v1012;
      if ((v1014 - (unsigned char *)v1012) >> 2 > v53) {
        unint64_t v53 = v54 >> 2;
      }
      unint64_t v55 = (unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v53;
      if (v55) {
        break;
      }
      uint64_t v56 = 0;
      uint64_t v57 = (uint64_t *)(8 * v52);
      *(void *)(8 * v52) = v48;
      uint64_t v50 = 8 * v52 + 8;
      uint64_t v58 = &v49[-v4];
      if (v49 != (char *)v4) {
        goto LABEL_46;
      }
LABEL_52:
      v1012 = v57;
      v1013 = (char *)v50;
      v1014 = &v56[8 * v55];
      if (v4) {
        operator delete((void *)v4);
      }
LABEL_54:
      v1013 = (char *)v50;
    }
    if (v55 >> 61) {
      sub_1C4949AA8();
    }
    uint64_t v56 = (char *)operator new(8 * v55);
    uint64_t v57 = (uint64_t *)&v56[8 * v52];
    *uint64_t v57 = v48;
    uint64_t v50 = (uint64_t)(v57 + 1);
    uint64_t v58 = &v49[-v4];
    if (v49 == (char *)v4) {
      goto LABEL_52;
    }
LABEL_46:
    unint64_t v59 = (unint64_t)(v58 - 8);
    if (v59 < 0x58) {
      goto LABEL_381;
    }
    if ((unint64_t)(v49 - v56 - v51) < 0x20) {
      goto LABEL_381;
    }
    uint64_t v60 = (v59 >> 3) + 1;
    uint64_t v61 = 8 * (v60 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v62 = &v49[-v61];
    uint64_t v57 = (uint64_t *)((char *)v57 - v61);
    uint64_t v63 = &v56[8 * v52 - 16];
    uint64_t v64 = v49 - 16;
    uint64_t v65 = v60 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v66 = *(_OWORD *)v64;
      *((_OWORD *)v63 - 1) = *((_OWORD *)v64 - 1);
      *(_OWORD *)uint64_t v63 = v66;
      v63 -= 32;
      v64 -= 32;
      v65 -= 4;
    }
    while (v65);
    uint64_t v49 = v62;
    if (v60 != (v60 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_381:
      do
      {
        uint64_t v67 = *((void *)v49 - 1);
        v49 -= 8;
        *--uint64_t v57 = v67;
      }
      while (v49 != (char *)v4);
    }
    goto LABEL_52;
  }
LABEL_55:
  if (v988 && v1003)
  {
    v1010 = (char *)v1009;
    uint64_t v68 = objc_msgSend_activations(v988, v27, v28, v29, v30, v31);
    unint64_t v74 = objc_msgSend_timestepCount(v68, v69, v70, v71, v72, v73);
    uint64_t v4 = v74;
    uint64_t v75 = (char *)v1009;
    if (v74 <= (v1011 - (unsigned char *)v1009) >> 3)
    {
LABEL_69:

      for (uint64_t j = 0; ; ++j)
      {
        uint64_t v97 = objc_msgSend_activations(v988, v90, v91, v92, v93, v94);
        BOOL v103 = j < objc_msgSend_timestepCount(v97, v98, v99, v100, v101, v102);

        if (!v103) {
          goto LABEL_115;
        }
        uint64_t v108 = v1010;
        if (objc_msgSend_containsIndex_(v1003, v104, j, v105, v106, v107))
        {
          if (v1010 < v1011)
          {
            *(void *)v1010 = 1;
            uint64_t v109 = (uint64_t)(v108 + 8);
LABEL_70:
            uint64_t v96 = v109;
            goto LABEL_71;
          }
          uint64_t v110 = (char *)v1009;
          uint64_t v4 = v1010 - (unsigned char *)v1009;
          uint64_t v118 = (v1010 - (unsigned char *)v1009) >> 3;
          unint64_t v119 = v118 + 1;
          if ((unint64_t)(v118 + 1) >> 61) {
            sub_1C494A220();
          }
          uint64_t v120 = v1011 - (unsigned char *)v1009;
          if ((v1011 - (unsigned char *)v1009) >> 2 > v119) {
            unint64_t v119 = v120 >> 2;
          }
          if ((unint64_t)v120 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v114 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v114 = v119;
          }
          if (v114)
          {
            if (v114 >> 61) {
              sub_1C4949AA8();
            }
            uint64_t v115 = (char *)operator new(8 * v114);
            uint64_t v116 = &v115[8 * v118];
            *(void *)uint64_t v116 = 1;
            uint64_t v96 = (uint64_t)(v116 + 8);
            int64_t v121 = v108 - v110;
            if (v108 == v110) {
              goto LABEL_113;
            }
LABEL_107:
            unint64_t v131 = v121 - 8;
            if (v131 < 0x58) {
              goto LABEL_382;
            }
            if ((unint64_t)(v108 - &v115[v4]) < 0x20) {
              goto LABEL_382;
            }
            uint64_t v132 = (v131 >> 3) + 1;
            uint64_t v133 = 8 * (v132 & 0x3FFFFFFFFFFFFFFCLL);
            uint64_t v134 = &v108[-v133];
            v116 -= v133;
            uint64_t v135 = &v115[8 * v118 - 16];
            uint64_t v136 = v108 - 16;
            uint64_t v137 = v132 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v138 = *(_OWORD *)v136;
              *((_OWORD *)v135 - 1) = *((_OWORD *)v136 - 1);
              *(_OWORD *)uint64_t v135 = v138;
              v135 -= 32;
              v136 -= 32;
              v137 -= 4;
            }
            while (v137);
            uint64_t v108 = v134;
            if (v132 != (v132 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_382:
              do
              {
                uint64_t v139 = *((void *)v108 - 1);
                v108 -= 8;
                *((void *)v116 - 1) = v139;
                v116 -= 8;
              }
              while (v108 != v110);
            }
            goto LABEL_113;
          }
          uint64_t v115 = 0;
          uint64_t v116 = (char *)(8 * v118);
          *(void *)(8 * v118) = 1;
          uint64_t v96 = 8 * v118 + 8;
          int64_t v121 = v108 - v110;
          if (v108 != v110) {
            goto LABEL_107;
          }
        }
        else
        {
          if (v1010 < v1011)
          {
            *(void *)v1010 = 0;
            uint64_t v109 = (uint64_t)(v108 + 8);
            goto LABEL_70;
          }
          uint64_t v110 = (char *)v1009;
          uint64_t v4 = v1010 - (unsigned char *)v1009;
          uint64_t v111 = (v1010 - (unsigned char *)v1009) >> 3;
          unint64_t v112 = v111 + 1;
          if ((unint64_t)(v111 + 1) >> 61) {
            sub_1C494A220();
          }
          uint64_t v113 = v1011 - (unsigned char *)v1009;
          if ((v1011 - (unsigned char *)v1009) >> 2 > v112) {
            unint64_t v112 = v113 >> 2;
          }
          if ((unint64_t)v113 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v114 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v114 = v112;
          }
          if (v114)
          {
            if (v114 >> 61) {
              sub_1C4949AA8();
            }
            uint64_t v115 = (char *)operator new(8 * v114);
            uint64_t v116 = &v115[8 * v111];
            *(void *)uint64_t v116 = 0;
            uint64_t v96 = (uint64_t)(v116 + 8);
            int64_t v117 = v108 - v110;
            if (v108 == v110) {
              goto LABEL_113;
            }
LABEL_99:
            unint64_t v122 = v117 - 8;
            if (v122 < 0x58) {
              goto LABEL_383;
            }
            if ((unint64_t)(v108 - v115 - v4) < 0x20) {
              goto LABEL_383;
            }
            uint64_t v123 = (v122 >> 3) + 1;
            uint64_t v124 = 8 * (v123 & 0x3FFFFFFFFFFFFFFCLL);
            uint64_t v125 = &v108[-v124];
            v116 -= v124;
            long long v126 = &v115[8 * v111 - 16];
            uint64_t v127 = v108 - 16;
            uint64_t v128 = v123 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v129 = *(_OWORD *)v127;
              *((_OWORD *)v126 - 1) = *((_OWORD *)v127 - 1);
              *(_OWORD *)long long v126 = v129;
              v126 -= 32;
              v127 -= 32;
              v128 -= 4;
            }
            while (v128);
            uint64_t v108 = v125;
            if (v123 != (v123 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_383:
              do
              {
                uint64_t v130 = *((void *)v108 - 1);
                v108 -= 8;
                *((void *)v116 - 1) = v130;
                v116 -= 8;
              }
              while (v108 != v110);
            }
            goto LABEL_113;
          }
          uint64_t v115 = 0;
          uint64_t v116 = (char *)(8 * v111);
          *(void *)(8 * v111) = 0;
          uint64_t v96 = 8 * v111 + 8;
          int64_t v117 = v108 - v110;
          if (v108 != v110) {
            goto LABEL_99;
          }
        }
LABEL_113:
        v1009 = v116;
        v1010 = (char *)v96;
        v1011 = &v115[8 * v114];
        if (v110) {
          operator delete(v110);
        }
LABEL_71:
        v1010 = (char *)v96;
      }
    }
    if (v74 >> 61) {
      sub_1C494A220();
    }
    uint64_t v76 = v1010;
    unint64_t v77 = operator new(8 * v74);
    uint64_t v78 = v1010 - (unsigned char *)v1009;
    uint64_t v79 = &v77[(v1010 - (unsigned char *)v1009) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v80 = v79;
    if (v1010 != v1009)
    {
      if ((unint64_t)(v78 - 8) < 0x58)
      {
        uint64_t v80 = &v77[(v1010 - (unsigned char *)v1009) & 0xFFFFFFFFFFFFFFF8];
        do
        {
LABEL_66:
          uint64_t v89 = *((void *)v76 - 1);
          v76 -= 8;
          *((void *)v80 - 1) = v89;
          v80 -= 8;
        }
        while (v76 != v75);
        goto LABEL_67;
      }
      uint64_t v80 = &v77[(v1010 - (unsigned char *)v1009) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(v1010 - &v77[v78 & 0xFFFFFFFFFFFFFFF8]) < 0x20) {
        goto LABEL_66;
      }
      uint64_t v81 = v78 >> 3;
      unint64_t v82 = ((unint64_t)(v78 - 8) >> 3) + 1;
      uint64_t v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v84 = &v1010[-v83];
      uint64_t v80 = &v79[-v83];
      uint64_t v85 = &v77[8 * v81 - 16];
      uint64_t v86 = v1010 - 16;
      uint64_t v87 = v82 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v88 = *(_OWORD *)v86;
        *(v85 - 1) = *((_OWORD *)v86 - 1);
        *uint64_t v85 = v88;
        v85 -= 2;
        v86 -= 32;
        v87 -= 4;
      }
      while (v87);
      uint64_t v76 = v84;
      if (v82 != (v82 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_66;
      }
    }
LABEL_67:
    v1009 = v80;
    v1010 = v79;
    v1011 = &v77[8 * v4];
    if (v75) {
      operator delete(v75);
    }
    goto LABEL_69;
  }
LABEL_115:

LABEL_116:
  double v1008 = 0.0;
  if (v988)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v140 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v146 = objc_msgSend_description(v998->_configuration, v141, v142, v143, v144, v145);
      uint64_t v152 = objc_msgSend_description(v1001, v147, v148, v149, v150, v151);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v146;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v152;
      _os_log_impl(&dword_1C492D000, v140, OS_LOG_TYPE_DEBUG, "Activation matrix retrieved from inference cache for config %@ and drawing %@.", buf, 0x16u);
    }
    id v975 = 0;
    goto LABEL_168;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v153 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v153, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_description(v998->_configuration, v154, v155, v156, v157, v158);
    id v159 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v1001, v160, v161, v162, v163, v164);
    id v165 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v159;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v165;
    _os_log_impl(&dword_1C492D000, v153, OS_LOG_TYPE_DEBUG, "Obtaining activation matrix by model inference for config %@ and drawing %@.", buf, 0x16u);
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v166 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v167 = os_signpost_id_generate(v166);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v168 = (id)qword_1EA3C9FC8;
  uint64_t v169 = v168;
  unint64_t v170 = v167 - 1;
  if (v167 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v168))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v169, OS_SIGNPOST_INTERVAL_BEGIN, v167, "CHRecognizerActivationMatrix", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v171 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v171, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRecognizerActivationMatrix\"", buf, 2u);
  }

  id v172 = v984;
  uint64_t v177 = v172;
  *(void *)buf = 0x4034000000000000;
  if (v984)
  {
    uint64_t v178 = objc_msgSend_objectForKey_(v172, v173, CHRecognitionOptionMinSizeForReliableRescaling, v174, v175, v176);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_getValue_(v178, v179, (uint64_t)buf, v180, v181, v182);
    }

    double v183 = *(double *)buf;
    id v184 = v177;
    *(_OWORD *)buf = *MEMORY[0x1E4F1DAD8];
    v189 = objc_msgSend_objectForKey_(v184, v185, (uint64_t)CHRecognitionOptionDrawingAnchorPoint, v186, v187, v188);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_getValue_(v189, v190, (uint64_t)buf, v191, v192, v193);
    }

    double v195 = *(double *)buf;
    double v194 = *(double *)&buf[8];
    long long v196 = v998;
    uint64_t v140 = v998->_activeCharacterSet;
    if (!v140) {
      goto LABEL_148;
    }
  }
  else
  {

    id v202 = v177;
    *(_OWORD *)buf = *MEMORY[0x1E4F1DAD8];
    double v203 = *(double *)buf;
    double v194 = *(double *)&buf[8];
    if (objc_msgSend_mode(v998->_configuration, v204, v205, v206, v207, v208) == 1)
    {
      double v194 = -20.0;
      double v195 = 0.0;
    }
    else
    {
      double v195 = v203;
    }
    double v183 = 20.0;
    long long v196 = v998;
    uint64_t v140 = v998->_activeCharacterSet;
    if (!v140)
    {
LABEL_148:
      uint64_t v140 = objc_msgSend_forcedActiveCharacterSet(v196->_configuration, v197, v198, v199, v200, v201);
      long long v196 = v998;
    }
  }
  v209 = v196->_recognitionModel;
  id v1007 = 0;
  v988 = objc_msgSend_recognizeDrawing_minimumDrawingSize_initialVectorAnchorPoint_activeCharacterSet_outStrokeIndexMapping_outStrokeEndings_outFallbackSymbol_outFallbackSymbolScore_(v209, v210, (uint64_t)v1001, (uint64_t)v140, (uint64_t)&v1012, (uint64_t)&v1009, &v1007, &v1008, v183, v183, v195, v194);
  id v975 = v1007;

  if (v979)
  {
    v220 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v211, (v1013 - (unsigned char *)v1012) >> 3, v212, v213, v214);
    v221 = v1012;
    if (v1013 != v1012)
    {
      unint64_t v222 = 0;
      do
      {
        v223 = objc_msgSend_numberWithLong_(NSNumber, v215, v221[v222], v217, v218, v219);
        objc_msgSend_addObject_(v220, v224, (uint64_t)v223, v225, v226, v227);

        ++v222;
        v221 = v1012;
      }
      while (v222 < (v1013 - (unsigned char *)v1012) >> 3);
    }
    v233 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v215, v216, v217, v218, v219);
    v235 = (uint64_t *)v1009;
    v234 = v1010;
    if (v1010 != v1009)
    {
      unint64_t v236 = 0;
      do
      {
        if (v235[v236] >= 1)
        {
          objc_msgSend_addIndex_(v233, v228, v236, v230, v231, v232);
          v235 = (uint64_t *)v1009;
          v234 = v1010;
        }
        ++v236;
      }
      while (v236 < (v234 - (char *)v235) >> 3);
    }
    uint64_t v4 = objc_msgSend_recognitionEngineCachingKey(v998, v228, v229, v230, v231, v232);
    objc_msgSend_cacheActivationMatrix_strokeIndexMapping_strokeEndings_drawing_recognitionEngineCachingKey_(v979, v237, (uint64_t)v988, (uint64_t)v220, (uint64_t)v233, (uint64_t)v1001, v4);
  }
  if (qword_1EA3CA000 == -1)
  {
    v238 = (id)qword_1EA3C9FC8;
    if (v170 <= 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_161;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v238 = (id)qword_1EA3C9FC8;
    if (v170 <= 0xFFFFFFFFFFFFFFFDLL)
    {
LABEL_161:
      if (os_signpost_enabled(v238))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C492D000, v238, OS_SIGNPOST_INTERVAL_END, v167, "CHRecognizerActivationMatrix", "", buf, 2u);
      }
    }
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v239 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v239, OS_LOG_TYPE_DEFAULT, "END \"CHRecognizerActivationMatrix\"", buf, 2u);
  }

LABEL_168:
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v240 = (id)qword_1EA3C9FC8;
  os_signpost_id_t spid = os_signpost_id_generate(v240);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v241 = (id)qword_1EA3C9FC8;
  v242 = v241;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v241))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v242, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHRecognizerDecoding", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v243 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v243, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRecognizerDecoding\"", buf, 2u);
  }

  v244 = sub_1C4981C3C((uint64_t)v998, v984);
  v983 = objc_msgSend_precomposedStringWithCanonicalMapping(v244, v245, v246, v247, v248, v249);

  if (v983)
  {
    if (objc_msgSend_length(v983, v250, v251, v252, v253, v254))
    {
      if (sub_1C4981CFC((uint64_t)v998, v984) == 2)
      {
        objc_msgSend_stringByAppendingString_(v983, v255, @" ", v256, v257, v258);
        v259 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v259 = (NSString *)v983;
      }
      v983 = v259;
      v322 = lastWordInString(v259);
      uint64_t v328 = objc_msgSend_length(v259, v323, v324, v325, v326, v327);
      uint64_t v334 = objc_msgSend_length(v322, v329, v330, v331, v332, v333);
      id v1003 = (id)objc_msgSend_length(v322, v335, v336, v337, v338, v339);

      int v260 = 0;
      uint64_t v4 = v328 - v334;
      if (!v998->_textDecoder.__engaged_) {
        goto LABEL_201;
      }
LABEL_185:
      v261 = objc_msgSend_activations(v988, v250, v251, v252, v253, v254);
      v267 = objc_msgSend_getActivationsMultiArray(v261, v262, v263, v264, v265, v266);

      v273 = objc_msgSend_activations(v988, v268, v269, v270, v271, v272);
      v279 = objc_msgSend_getIndicesMultiArray(v273, v274, v275, v276, v277, v278);

      v285 = objc_msgSend_activations(v988, v280, v281, v282, v283, v284);
      uint64_t v291 = objc_msgSend_timestepCount(v285, v286, v287, v288, v289, v290);
      v297 = objc_msgSend_activations(v988, v292, v293, v294, v295, v296);
      uint64_t v303 = objc_msgSend_observationCount(v297, v298, v299, v300, v301, v302);
      id v304 = v267;
      uint64_t v310 = objc_msgSend_dataPointer(v304, v305, v306, v307, v308, v309);
      if (v279)
      {
        id v311 = v279;
        uint64_t v317 = objc_msgSend_dataPointer(v311, v312, v313, v314, v315, v316);
      }
      else
      {
        uint64_t v317 = 0;
      }
      *(void *)buf = v291;
      *(void *)&buf[8] = v303;
      *(_OWORD *)&uint8_t buf[16] = 0u;
      long long v1019 = 0u;
      long long v1020 = 0u;
      uint64_t v1021 = v310;
      uint64_t v1022 = v317;

      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v318 = (id)qword_1EA3C9F98;
      if (os_log_type_enabled(v318, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v1023 = 134218240;
        *(void *)&v1023[4] = *(void *)buf;
        *(_WORD *)&v1023[12] = 2048;
        *(void *)&v1023[14] = *(void *)&buf[8];
        _os_log_impl(&dword_1C492D000, v318, OS_LOG_TYPE_DEBUG, "CTCMOD logActivations.shape=(%lu, %lu)", v1023, 0x16u);
      }

      if (v260)
      {
        memset(v1023, 0, 24);
      }
      else
      {
        id v319 = v983;
        v320 = v319;
        if (v319) {
          CFRetain(v319);
        }
        sub_1C499CB34(&cf, v320);

        CFTypeRef v321 = cf;
        if (cf)
        {
          CFRetain(cf);
          *(void *)v1023 = v321;
          *(void *)&v1023[8] = v4;
          *(void *)&v1023[16] = v1003;
          if (cf) {
            CFRelease(cf);
          }
        }
        else
        {
          *(void *)v1023 = 0;
          *(void *)&v1023[8] = v4;
          *(void *)&v1023[16] = v1003;
        }
      }
      (*((void (**)(_OWORD *__return_ptr))v998->_textDecoder.var0.__val_._vptr$AbstractCTCDecoder + 2))(__p);
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v389 = (id)qword_1EA3C9F98;
      if (os_log_type_enabled(v389, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v1016 = 134217984;
        *(void *)&v1016[4] = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)&__p[0] + 1) - *(void *)&__p[0]) >> 3);
        _os_log_impl(&dword_1C492D000, v389, OS_LOG_TYPE_DEBUG, "CTCMOD num paths %lu", v1016, 0xCu);
      }

      id v1005 = v988;
      v388 = convertToCVNLPTextDecodingResult();

      v390 = *(void ***)&__p[0];
      if (*(void *)&__p[0])
      {
        v391 = (void **)*((void *)&__p[0] + 1);
        v392 = *(void **)&__p[0];
        if (*((void *)&__p[0] + 1) != *(void *)&__p[0])
        {
          v393 = (void **)*((void *)&__p[0] + 1);
          do
          {
            v396 = (char *)*(v393 - 5);
            v393 -= 5;
            v395 = v396;
            if (v396)
            {
              v397 = (char *)*(v391 - 4);
              v394 = v395;
              if (v397 != v395)
              {
                v398 = (char *)*(v391 - 4);
                do
                {
                  v400 = (void *)*((void *)v398 - 8);
                  v398 -= 64;
                  v399 = v400;
                  if (v400)
                  {
                    *((void *)v397 - 7) = v399;
                    operator delete(v399);
                  }
                  v397 = v398;
                }
                while (v398 != v395);
                v394 = *v393;
              }
              *(v391 - 4) = v395;
              operator delete(v394);
            }
            v391 = v393;
          }
          while (v393 != v390);
          v392 = *(void **)&__p[0];
        }
        *((void *)&__p[0] + 1) = v390;
        operator delete(v392);
      }
      if (*(void *)v1023) {
        CFRelease(*(CFTypeRef *)v1023);
      }
      if (*((void *)&v1019 + 1))
      {
        *(void *)&long long v1020 = *((void *)&v1019 + 1);
        operator delete(*((void **)&v1019 + 1));
      }
      if (*(void *)&buf[16])
      {
        *(void *)&unsigned char buf[24] = *(void *)&buf[16];
        operator delete(*(void **)&buf[16]);
      }
      goto LABEL_240;
    }
  }
  else
  {
    v983 = 0;
  }
  int v260 = 1;
  if (v998->_textDecoder.__engaged_) {
    goto LABEL_185;
  }
LABEL_201:
  v340 = objc_msgSend_activations(v988, v250, v251, v252, v253, v254);
  objc_msgSend_setActivationMatrix_(v998->_legacyTextDecoder, v341, (uint64_t)v340, v342, v343, v344);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v345 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v345, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v345, OS_LOG_TYPE_DEBUG, "Using the CVNLP Text Decoder", buf, 2u);
  }

  objc_msgSend_decodingCommitActionBlock(v998->_configuration, v346, v347, v348, v349, v350);
  id v304 = (id)objc_claimAutoreleasedReturnValue();
  configuration = v998->_configuration;
  v357 = objc_msgSend_languageResourceBundle(v998->_legacyTextDecoder, v352, v353, v354, v355, v356);
  v279 = objc_msgSend_pathScoringFunctionForLanguageResourceBundle_(configuration, v358, (uint64_t)v357, v359, v360, v361);

  uint64_t v367 = objc_msgSend__effectiveMaxRecognitionResultCount(v998, v362, v363, v364, v365, v366);
  uint64_t v373 = v367;
  if (2 * v367 <= 20) {
    uint64_t v374 = 20;
  }
  else {
    uint64_t v374 = 2 * v367;
  }
  uint64_t v375 = objc_msgSend_mixedScriptPenalty(v998->_configuration, v368, v369, v370, v371, v372);
  id v376 = objc_alloc(MEMORY[0x1E4F56778]);
  BOOL v378 = v375 == 1;
  if (v373 <= 3) {
    uint64_t shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths = objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths_(v376, v377, (uint64_t)v304, (uint64_t)v279, v374, 3, 1, v378);
  }
  else {
    uint64_t shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths = objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths_(v376, v377, (uint64_t)v304, (uint64_t)v279, v374, v373, 1, v378);
  }
  v383 = (void *)shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths;
  if (v260)
  {
    active = 0;
  }
  else
  {
    id v385 = objc_alloc(MEMORY[0x1E4F56788]);
    active = objc_msgSend_initWithHistory_activeRange_(v385, v386, (uint64_t)v983, v4, (uint64_t)v1003, v387);
  }
  v388 = objc_msgSend_decodingResultWithConfiguration_withContext_(v998->_legacyTextDecoder, v380, (uint64_t)v383, (uint64_t)active, v381, v382);

LABEL_240:
  uint64_t v977 = sub_1C4981CFC((uint64_t)v998, v984);
  int v406 = objc_msgSend_mode(v998->_configuration, v401, v402, v403, v404, v405);
  id v982 = v388;
  id v978 = v984;
  id v994 = v1001;
  v412 = objc_msgSend_modelName(v998->_recognitionModel, v407, v408, v409, v410, v411);
  v418 = objc_msgSend_modelNameChinese(CHRecognizerConfiguration, v413, v414, v415, v416, v417);
  int isEqualToString = objc_msgSend_isEqualToString_(v412, v419, (uint64_t)v418, v420, v421, v422);

  if (isEqualToString)
  {
    v428 = v984;
      v425,
      v426,
    v993 = v427);
  }
  else
  {
    v993 = 0;
    v428 = v984;
  }
  v429 = sub_1C4981C3C((uint64_t)v998, v978);
  v973 = objc_msgSend_precomposedStringWithCanonicalMapping(v429, v430, v431, v432, v433, v434);

  id v435 = v978;
  v440 = v435;
  if (v428)
  {
    v442 = objc_msgSend_objectForKey_(v435, v436, (uint64_t)CHRecognitionOptionTextAfter, v437, v438, v439);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v441 = v442;
    }
    else {
      id v441 = 0;
    }
  }
  else
  {
    id v441 = 0;
  }
  v972 = v440;

  v974 = objc_msgSend_precomposedStringWithCanonicalMapping(v441, v443, v444, v445, v446, v447);

  if (!v982
    || (objc_msgSend_candidates(v982, v448, v449, v450, v451, v452),
        v453 = objc_claimAutoreleasedReturnValue(),
        BOOL v459 = objc_msgSend_count(v453, v454, v455, v456, v457, v458) == 0,
        v453,
        v459))
  {
    v882 = 0;
  }
  else
  {
    v987 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v460, v461, v462, v463, v464);
    v986 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v465, v466, v467, v468, v469);
    BOOL v1015 = v977 == 2;
    v475 = objc_msgSend_candidates(v982, v470, v471, v472, v473, v474);
    BOOL v481 = objc_msgSend_count(v475, v476, v477, v478, v479, v480) == 0;

    v971 = @" ";
    if (!v481)
    {
      v487 = objc_msgSend_candidates(v982, v482, v483, v484, v485, v486);
      v493 = objc_msgSend_firstObject(v487, v488, v489, v490, v491, v492);
      v499 = objc_msgSend_fullString(v493, v494, v495, v496, v497, v498);
      v503 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v499, v500, @"", (uint64_t)&stru_1F20141C8, v501, v502);

      if (v406 == 1)
      {
        if (objc_msgSend_length(v503, v504, v505, v506, v507, v508))
        {
          uint64_t v509 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v503, v504, 0, v506, v507, v508);
          uint64_t v511 = (uint64_t)v510;
          if ((unint64_t)v510 < objc_msgSend_length(v503, v510, v512, v513, v514, v515))
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v516 = (id)qword_1EA3C9F98;
            if (os_log_type_enabled(v516, OS_LOG_TYPE_ERROR))
            {
              uint64_t v522 = objc_msgSend_countCodepoints(v503, v517, v518, v519, v520, v521);
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v522;
              _os_log_impl(&dword_1C492D000, v516, OS_LOG_TYPE_ERROR, "Decoder predicted string with %ld code points in single character mode, truncating results to 1 character.", buf, 0xCu);
            }

            uint64_t v526 = objc_msgSend_substringWithRange_(v503, v523, v509, v511, v524, v525);

            v503 = (void *)v526;
          }
        }
      }
      v527 = objc_msgSend_locale(v998->_configuration, v504, v505, v506, v507, v508);
      *(void *)v1016 = @" ";
      objc_msgSend__updatePrecedingAndTrailingSeparatorsForTopCandidate_history_textAfter_locale_outTrailingSeparator_inFirstTokenHasPrecedingSpace_outFirstTokenHasPrecedingSpace_(CHRecognizer, v528, (uint64_t)v503, (uint64_t)v973, (uint64_t)v974, (uint64_t)v527, v1016, v977 == 2, &v1015);
      v971 = (__CFString *)*(id *)v1016;
    }
    v992 = objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v482, 1, (uint64_t)v998->_patternFST, 0, v486);
    long long v1024 = 0u;
    long long v1025 = 0u;
    memset(v1023, 0, sizeof(v1023));
    objc_msgSend_candidates(v982, v529, v530, v531, v532, v533);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v990 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v534, (uint64_t)v1023, (uint64_t)buf, 16, v535);
    if (v990)
    {
      uint64_t v989 = **(void **)&v1023[16];
      do
      {
        for (uint64_t k = 0; k != v990; ++k)
        {
          if (**(void **)&v1023[16] != v989) {
            objc_enumerationMutation(obj);
          }
          v997 = *(void **)(*(void *)&v1023[8] + 8 * k);
          v995 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v536, v537, v538, v539, v540);
          v996 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v541, v542, v543, v544, v545);
          unint64_t v999 = 0;
          v1000 = 0;
          uint64_t v551 = 0;
          char v552 = v1015;
          while (1)
          {
            v553 = objc_msgSend_tokens(v997, v546, v547, v548, v549, v550);
            BOOL v559 = v999 < objc_msgSend_count(v553, v554, v555, v556, v557, v558);

            if (!v559) {
              break;
            }
            v565 = objc_msgSend_tokens(v997, v560, v561, v562, v563, v564);
            v1004 = objc_msgSend_objectAtIndexedSubscript_(v565, v566, v999, v567, v568, v569);

            v575 = objc_msgSend_score(v1004, v570, v571, v572, v573, v574);
            objc_msgSend_doubleValue(v575, v576, v577, v578, v579, v580);
            double v582 = v581;

            v588 = objc_msgSend_string(v1004, v583, v584, v585, v586, v587);
            v592 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v588, v589, @" ", (uint64_t)&stru_1F20141C8, v590, v591);

            objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v592, v593, @"", (uint64_t)&stru_1F20141C8, v594, v595);
            v1002 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v601 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v596, v597, v598, v599, v600);
            uint64_t v607 = objc_msgSend_activationRange(v1004, v602, v603, v604, v605, v606);
            objc_msgSend_activationRange(v1004, v608, v609, v610, v611, v612);
            v618 = &v613[v607];
            if ((unint64_t)&v613[v607] > (v1010 - (unsigned char *)v1009) >> 3)
            {
              if (qword_1EA3CA000 != -1) {
                dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
              }
              v619 = (id)qword_1EA3C9F90[0];
              if (os_log_type_enabled(v619, OS_LOG_TYPE_FAULT))
              {
                LOWORD(__p[0]) = 0;
                _os_log_impl(&dword_1C492D000, v619, OS_LOG_TYPE_FAULT, "The token activation range is longer than the sequence in the activation matrix.", (uint8_t *)__p, 2u);
              }
            }
            unint64_t v625 = objc_msgSend_activationRange(v1004, v613, v614, v615, v616, v617);
            if (v625 < (unint64_t)v618)
            {
              v626 = (uint64_t *)v1009;
              do
              {
                if (v626[v625] >= 1)
                {
                  uint64_t v627 = 0;
                  do
                  {
                    objc_msgSend_addIndex_(v601, v620, v551 + v627++, v622, v623, v624);
                    v626 = (uint64_t *)v1009;
                  }
                  while (v627 < *((void *)v1009 + v625));
                  v551 += v627;
                }
                ++v625;
              }
              while ((const char *)v625 != v618);
            }
            if (!objc_msgSend_count(v601, v620, v621, v622, v623, v624)
              && objc_msgSend_length(v1002, v628, v629, v630, v631, v632))
            {
              if (objc_msgSend_count(v1000, v633, v634, v635, v636, v637))
              {
                uint64_t Index = objc_msgSend_lastIndex(v1000, v638, v639, v640, v641, v642);
                objc_msgSend_addIndex_(v601, v644, Index, v645, v646, v647);
              }
              else
              {
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                v648 = (id)qword_1EA3C9F98;
                if (os_log_type_enabled(v648, OS_LOG_TYPE_ERROR))
                {
                  v654 = objc_msgSend_string(v1004, v649, v650, v651, v652, v653);
                  LODWORD(__p[0]) = 138412290;
                  *(void *)((char *)__p + 4) = v654;
                  _os_log_impl(&dword_1C492D000, v648, OS_LOG_TYPE_ERROR, "Previous token stroke index set is empty, and current token %@ stroke index set is also empty", (uint8_t *)__p, 0xCu);
                }
                objc_msgSend_addIndex_(v601, v655, 0, v656, v657, v658);
              }
            }
            id v659 = v601;

            v1000 = v659;
            if (objc_msgSend_length(v1002, v660, v661, v662, v663, v664))
            {
              if (v993)
              {
                objc_msgSend_activationRange(v1004, v665, v666, v667, v668, v669);
                if ((unint64_t)v665 <= 2)
                {
                  uint64_t v670 = objc_msgSend_codepointAtIndex_outRange_(v1002, v665, 0, (uint64_t)__p, v668, v669);
                  unint64_t v676 = objc_msgSend_length(v1002, v671, v672, v673, v674, v675);
                  if (v676 > *((void *)&__p[0] + 1)
                    || (objc_msgSend_longCharacterIsMember_(v993, v677, v670, v678, v679, v680) & 1) == 0)
                  {

                    v1002 = @".";
                  }
                }
              }
              objc_msgSend_addIndexes_(v1000, v665, (uint64_t)v995, v667, v668, v669);
              objc_msgSend_removeAllIndexes(v995, v681, v682, v683, v684, v685);
              LOBYTE(__p[0]) = 0;
              uint64_t staticLexicon = (uint64_t)v998->_staticLexicon;
              if (staticLexicon)
              {
                uint64_t v691 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v686, (uint64_t)v1002, staticLexicon, v688, v689);
                if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v692, (uint64_t)v1002, (uint64_t)v998->_staticLexicon, (uint64_t)__p, v693) & 1) == 0)
                {
                  uint64_t customLexicon = (uint64_t)v998->_customLexicon;
                  if (!customLexicon)
                  {
LABEL_309:
                    uint64_t v768 = 8;
                    goto LABEL_314;
                  }
LABEL_304:
                  uint64_t v691 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v686, (uint64_t)v1002, customLexicon, v688, v689);
                  if (!objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v766, (uint64_t)v1002, (uint64_t)v998->_customLexicon, (uint64_t)__p, v767))goto LABEL_309; {
                }
                  }
                if (objc_msgSend_isInappropriateTokenID_(v998->_ovsStringChecker, v686, v691, customLexicon, v688, v689))
                {
                  uint64_t v768 = 12;
                  if (LOBYTE(__p[0])) {
                    uint64_t v768 = 268;
                  }
                }
                else
                {
                  int isInappropriateString = objc_msgSend_isInappropriateString_(v998->_ovsStringChecker, v686, (uint64_t)v1002, customLexicon, v688, v689);
                  uint64_t v768 = 12;
                  if (LOBYTE(__p[0])) {
                    uint64_t v768 = 268;
                  }
                  if (!isInappropriateString) {
                    goto LABEL_314;
                  }
                }
                v768 |= 0x10uLL;
LABEL_314:
                if (v552) {
                  uint64_t v770 = v768 | 0x20;
                }
                else {
                  uint64_t v770 = v768;
                }
                v771 = objc_msgSend_lastObject(v996, v686, v687, customLexicon, v688, v689);
                v777 = objc_msgSend_string(v771, v772, v773, v774, v775, v776);
                objc_msgSend_lastComposedCharacter(v777, v778, v779, v780, v781, v782);
                v783 = (NSString *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_firstComposedCharacter(v1002, v784, v785, v786, v787, v788);
                v789 = (NSString *)objc_claimAutoreleasedReturnValue();
                if (shouldForbidSpaceInBetween(v783, v789)) {
                  unint64_t v792 = v770 & 0xFFFFFFFFFFFFFFDFLL;
                }
                else {
                  unint64_t v792 = v770;
                }
                if (!v999)
                {
                  v793 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v790, (uint64_t)v1002, (uint64_t)v992, (uint64_t)v998->_patternFST, v791);
                  v799 = v793;
                  if (v793)
                  {
                    if (objc_msgSend_isCompletePattern(v793, v794, v795, v796, v797, v798)) {
                      v792 |= 0x80uLL;
                    }
                  }
                }
                v800 = sub_1C4A43FE0(v1000, (uint64_t)&v1012);
                objc_msgSend_boundsForStrokeIndexes_(v994, v801, (uint64_t)v800, v802, v803, v804);
                double v806 = v805;
                double v808 = v807;
                double v810 = v809;
                double v812 = v811;
                v813 = [CHTokenizedTextResultToken alloc];
                v819 = objc_msgSend_alignmentScore(v1004, v814, v815, v816, v817, v818);
                objc_msgSend_doubleValue(v819, v820, v821, v822, v823, v824);
                double v826 = v825;
                v832 = objc_msgSend_locale(v998->_configuration, v827, v828, v829, v830, v831);
                uint64_t v838 = objc_msgSend_count(v800, v833, v834, v835, v836, v837);
                v840 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v813, v839, (uint64_t)v1002, (uint64_t)v800, v691, v792, v832, 2, v582, v582, v582, v826, v806, v808, v810, v812, v838);

                objc_msgSend_addObject_(v996, v841, (uint64_t)v840, v842, v843, v844);
                v850 = objc_msgSend_terminatingCharacter(v1004, v845, v846, v847, v848, v849);
                char v552 = objc_msgSend_isEqualToString_(v850, v851, @" ", v852, v853, v854);

                goto LABEL_326;
              }
              uint64_t v691 = 0;
              uint64_t customLexicon = (uint64_t)v998->_customLexicon;
              if (!customLexicon) {
                goto LABEL_309;
              }
              goto LABEL_304;
            }
            v695 = objc_msgSend_terminatingCharacter(v1004, v665, v666, v667, v668, v669);
            char v700 = objc_msgSend_isEqualToString_(v695, v696, @" ", v697, v698, v699);

            v552 |= v700;
            if (objc_msgSend_count(v1000, v701, v702, v703, v704, v705))
            {
              if (objc_msgSend_count(v996, v706, v707, v708, v709, v710))
              {
                v716 = objc_msgSend_lastObject(v996, v711, v712, v713, v714, v715);
                v717 = sub_1C4A43FE0(v1000, (uint64_t)&v1012);
                objc_msgSend_boundsForStrokeIndexes_(v994, v718, (uint64_t)v717, v719, v720, v721);
                CGFloat v723 = v722;
                CGFloat v725 = v724;
                CGFloat v727 = v726;
                CGFloat v729 = v728;
                objc_msgSend_bounds(v716, v730, v731, v732, v733, v734);
                v1029.origin.x = v723;
                v1029.origin.y = v725;
                v1029.size.width = v727;
                v1029.size.height = v729;
                CGRectUnion(v1028, v1029);
                v735 = objc_opt_class();
                v741 = objc_msgSend_alignmentScore(v1004, v736, v737, v738, v739, v740);
                objc_msgSend_doubleValue(v741, v742, v743, v744, v745, v746);
                v750 = objc_msgSend_extendedToken_withStrokeIndexSet_alignmentScore_bounds_(v735, v747, (uint64_t)v716, (uint64_t)v717, v748, v749);

                uint64_t v756 = objc_msgSend_lastIndex(v1000, v751, v752, v753, v754, v755);
                uint64_t v762 = objc_msgSend_count(v996, v757, v758, v759, v760, v761);
                objc_msgSend_setObject_atIndexedSubscript_(v996, v763, (uint64_t)v750, v762 - 1, v764, v765);

                uint64_t v551 = v756 + 1;
              }
              else
              {
                objc_msgSend_addIndexes_(v995, v711, (uint64_t)v1000, v713, v714, v715);
              }
            }
LABEL_326:

            ++v999;
          }
          if (objc_msgSend_count(v996, v560, v561, v562, v563, v564))
          {
            objc_msgSend_addObject_(v987, v855, (uint64_t)v996, v856, v857, v858);
            v859 = NSNumber;
            objc_msgSend_score(v997, v860, v861, v862, v863, v864);
            v870 = objc_msgSend_numberWithDouble_(v859, v865, v866, v867, v868, v869);
            objc_msgSend_addObject_(v986, v871, (uint64_t)v870, v872, v873, v874);
          }
        }
        uint64_t v990 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v536, (uint64_t)v1023, (uint64_t)buf, 16, v540);
      }
      while (v990);
    }

    if (objc_msgSend_count(v987, v875, v876, v877, v878, v879))
    {
      v880 = [CHTokenizedTextResult alloc];
      v882 = objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v880, v881, (uint64_t)v987, (uint64_t)v986, (uint64_t)v971, 2);
    }
    else
    {
      v882 = 0;
    }
  }
  if (!v882)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v883 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v883, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v883, OS_LOG_TYPE_ERROR, "Text decoding unexpectedly leads to empty result - falling back on single-character result from the activation matrix.", buf, 2u);
    }

    double v884 = v1008;
    id v885 = v994;
    id v891 = v975;
    if (v977 == 2) {
      uint64_t v892 = 40;
    }
    else {
      uint64_t v892 = 8;
    }
    v893 = (void *)MEMORY[0x1E4F28D60];
    uint64_t v894 = objc_msgSend_strokeCount(v885, v886, v887, v888, v889, v890);
    v898 = objc_msgSend_indexSetWithIndexesInRange_(v893, v895, 0, v894, v896, v897);
    if (v891)
    {
      v899 = [CHTokenizedTextResultToken alloc];
      v905 = objc_msgSend_locale(v998->_configuration, v900, v901, v902, v903, v904);
      uint64_t v911 = objc_msgSend_strokeCount(v885, v906, v907, v908, v909, v910);
      objc_msgSend_bounds(v885, v912, v913, v914, v915, v916);
      uint64_t v922 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v899, v917, (uint64_t)v891, (uint64_t)v898, 0, v892, v905, 4, v884, v884, v884, v884, v918, v919, v920, v921, v911);
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v923 = (id)qword_1EA3C9F98;
      if (os_log_type_enabled(v923, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v923, OS_LOG_TYPE_ERROR, "No fallback symbol could be retrieved from the activation matrix. Creating fallback token with empty string.", buf, 2u);
      }

      v924 = [CHTokenizedTextResultToken alloc];
      v905 = objc_msgSend_locale(v998->_configuration, v925, v926, v927, v928, v929);
      uint64_t v935 = objc_msgSend_strokeCount(v885, v930, v931, v932, v933, v934);
      objc_msgSend_bounds(v885, v936, v937, v938, v939, v940);
      uint64_t v922 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v924, v941, (uint64_t)&stru_1F20141C8, (uint64_t)v898, 0, v892, v905, 4, 0.0, 0.0, 0.0, 0.0, v942, v943, v944, v945, v935);
    }
    v946 = (void *)v922;

    v947 = [CHTokenizedTextResult alloc];
    *(void *)v1023 = v946;
    v951 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v948, (uint64_t)v1023, 1, v949, v950);
    *(void *)buf = v951;
    v955 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v952, (uint64_t)buf, 1, v953, v954);
    v961 = objc_msgSend_numberWithDouble_(NSNumber, v956, v957, v958, v959, v960, v884);
    *(void *)&__p[0] = v961;
    v965 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v962, (uint64_t)__p, 1, v963, v964);
    v882 = objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v947, v966, (uint64_t)v955, (uint64_t)v965, (uint64_t)&stru_1F20141C8, 2);
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v967 = (id)qword_1EA3C9FC8;
  v968 = v967;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v967))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v968, OS_SIGNPOST_INTERVAL_END, spid, "CHRecognizerDecoding", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v969 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v969, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v969, OS_LOG_TYPE_DEFAULT, "END \"CHRecognizerDecoding\"", buf, 2u);
  }

  id v17 = v882;
  if (v1009)
  {
    v1010 = (char *)v1009;
    operator delete(v1009);
  }
  if (v1012)
  {
    v1013 = (char *)v1012;
    operator delete(v1012);
  }
LABEL_366:

  return v17;
}

- (id)recognitionEngineCachingKey
{
  recognitionModel = self->_recognitionModel;
  if (recognitionModel)
  {
    recognitionModel = objc_msgSend_modelName(recognitionModel, a2, v2, v3, v4, v5);
  }
  return recognitionModel;
}

+ (void)_updatePrecedingAndTrailingSeparatorsForTopCandidate:(id)a3 history:(id)a4 textAfter:(id)a5 locale:(id)a6 outTrailingSeparator:(id *)a7 inFirstTokenHasPrecedingSpace:(BOOL)a8 outFirstTokenHasPrecedingSpace:(BOOL *)a9
{
  id v139 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v134 = v15;
  uint64_t v135 = v14;
  uint64_t v133 = v16;
  objc_msgSend_lastComposedCharacter(v14, v17, v18, v19, v20, v21);
  uint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v132 = v22;
  objc_msgSend_firstComposedCharacter(v15, v23, v24, v25, v26, v27);
  uint64_t v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstComposedCharacter(v139, v29, v30, v31, v32, v33);
  uint64_t v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v130 = a7;
  unint64_t v131 = v34;
  objc_msgSend_lastComposedCharacter(v139, v35, v36, v37, v38, v39);
  uint64_t v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v136 = v40;
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v41, v42, v43, v44, v45);
  uint64_t v46 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  BOOL v129 = isStringEntirelyFromSet(v22, v46);

  objc_msgSend_ch_sentenceEndPunctuationCharacterSet(MEMORY[0x1E4F28B88], v47, v48, v49, v50, v51);
  uint64_t v52 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  BOOL v128 = isStringEntirelyFromSet(v22, v52);

  uint64_t v138 = objc_msgSend_length(v14, v53, v54, v55, v56, v57);
  uint64_t v137 = objc_msgSend_length(v15, v58, v59, v60, v61, v62);
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v63, v64, v65, v66, v67);
  uint64_t v68 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  BOOL v127 = isStringEntirelyFromSet(v28, v68);

  objc_msgSend_ch_sentenceEndPunctuationCharacterSet(MEMORY[0x1E4F28B88], v69, v70, v71, v72, v73);
  unint64_t v74 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  BOOL v126 = isStringEntirelyFromSet(v28, v74);

  if (v138 && objc_msgSend_length(v22, v75, v76, v77, v78, v79) == 1)
  {
    BOOL v80 = objc_msgSend_firstCodepointInString(v22, v75, v76, v77, v78, v79) == 65532;
    if (!v137) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v80 = 0;
    if (!v137) {
      goto LABEL_8;
    }
  }
  if (objc_msgSend_length(v28, v75, v76, v77, v78, v79) == 1)
  {
    BOOL v124 = objc_msgSend_firstCodepointInString(v28, v75, v81, v77, v78, v79) == 65532;
    goto LABEL_9;
  }
LABEL_8:
  BOOL v124 = 0;
LABEL_9:
  char shouldApplyThaiSpacingForLocale = objc_msgSend_shouldApplyThaiSpacingForLocale_(CHRecognizerConfiguration, v75, (uint64_t)v16, v77, v78, v79);
  if (isCharacterLatinOrCommonScript(v34)) {
    int v123 = isCharacterFullWidth(v34) ^ 1;
  }
  else {
    int v123 = 0;
  }
  BOOL v122 = a8;
  if (isCharacterLatinOrCommonScript(v40)) {
    int v82 = isCharacterFullWidth(v40) ^ 1;
  }
  else {
    int v82 = 0;
  }
  BOOL v121 = v80;
  if (isCharacterLatinOrCommonScript(v28)) {
    int v88 = isCharacterFullWidth(v28) ^ 1;
  }
  else {
    int v88 = 0;
  }
  objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v83, v84, v85, v86, v87);
  uint64_t v89 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  BOOL v90 = isStringEntirelyFromSet(v28, v89);

  objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v91, v92, v93, v94, v95);
  uint64_t v96 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  BOOL v97 = isStringEntirelyFromSet(v22, v96);

  if (isCharacterLatinOrCommonScript(v22)) {
    int v98 = isCharacterFullWidth(v22) ^ 1;
  }
  else {
    int v98 = 0;
  }
  char v99 = shouldForbidSpaceInBetween(v22, v34);
  int v100 = shouldForbidSpaceInBetween(v136, v28);
  if (objc_msgSend_countCharacters(v139, v101, v102, v103, v104, v105) < 2)
  {
    BOOL v112 = 1;
  }
  else
  {
    objc_msgSend_ch_latinCharacterSet(MEMORY[0x1E4F28B88], v106, v107, v108, v109, v110);
    uint64_t v111 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    BOOL v112 = isStringEntirelyFromSet((NSString *)v139, v111);
  }
  int v113 = v129 || v128 || v127 || v90 || v97 || v126;
  if (!v138) {
    int v113 = 1;
  }
  if (v137) {
    char v114 = v90;
  }
  else {
    char v114 = 1;
  }
  char v115 = v114 ^ 1 | v122;
  if (shouldApplyThaiSpacingForLocale)
  {
    int v116 = v82 & v88;
    v115 &= v98 & v123;
  }
  else
  {
    int v116 = 1;
  }
  int v117 = v112 & ~(v113 | (v137 == 0 || v121 || v124) | v123 ^ v98 | v82 ^ v88);
  if (v138) {
    char v118 = v129;
  }
  else {
    char v118 = 1;
  }
  if (v130)
  {
    int v119 = v90 || v126;
    if (!v137) {
      int v119 = 1;
    }
    if ((v116 & ~(v119 | v100 | v117)) != 0) {
      uint64_t v120 = @" ";
    }
    else {
      uint64_t v120 = &stru_1F20141C8;
    }
    *uint64_t v130 = v120;
  }
  if (a9) {
    *a9 = v115 & ~(v118 | v97 | v99 | v117);
  }
}

- (id)_postprocessingMergedRecognitionResult:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v12 = a4;
  mergedResultPostProcessor = self->_mergedResultPostProcessor;
  if (mergedResultPostProcessor)
  {
    if (!v6) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend__initializeMergedResultPostProcessor(self, v7, v8, v9, v10, v11);
    mergedResultPostProcessor = self->_mergedResultPostProcessor;
    if (!v6) {
      goto LABEL_7;
    }
  }
  if (mergedResultPostProcessor)
  {
    id v14 = sub_1C4981C3C((uint64_t)self, v12);
    id v15 = [CHResultWithContext alloc];
    uint64_t v21 = objc_msgSend_contentType(self->_configuration, v16, v17, v18, v19, v20);
    uint64_t v24 = objc_msgSend_initWithResult_leftContext_contentType_(v15, v22, (uint64_t)v6, (uint64_t)v14, v21, v23);
    uint64_t v28 = objc_msgSend_process_options_(self->_mergedResultPostProcessor, v25, (uint64_t)v24, (uint64_t)v12, v26, v27);
    uint64_t v34 = objc_msgSend_result(v28, v29, v30, v31, v32, v33);

    id v6 = (id)v34;
  }
LABEL_7:

  return v6;
}

- (id)_changeableColumnCountUpdatedResult:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v12 = a4;
  if ((self->_phraseLexicon || self->_customPhraseLexicon)
    && (objc_msgSend_configuration(self, v7, v8, v9, v10, v11),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        char shouldUpdateChangeableColumnCountWithPhraseLexicon = objc_msgSend_shouldUpdateChangeableColumnCountWithPhraseLexicon(v13, v14, v15, v16, v17, v18), v13, (shouldUpdateChangeableColumnCountWithPhraseLexicon & 1) != 0))
  {
    sub_1C4981C3C((uint64_t)self, v12);
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x3032000000;
    uint64_t v47 = sub_1C496D854;
    uint64_t v48 = sub_1C496D864;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v49 = v20;
    if (objc_msgSend_length(v20, v21, v22, v23, v24, v25))
    {
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v43[3] = 0;
      uint64_t v31 = objc_msgSend_length(v20, v26, v27, v28, v29, v30);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = sub_1C498B494;
      v39[3] = &unk_1E64E1550;
      uint64_t v41 = v43;
      uint64_t v42 = &v44;
      id v40 = v20;
      objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v40, v32, 0, v31, 259, (uint64_t)v39);

      _Block_object_dispose(v43, 8);
    }
    phraseLexicon = self->_phraseLexicon;
    if (phraseLexicon)
    {
      uint64_t v34 = objc_msgSend_changeableColumnCountUpdatedResultWithHistory_phraseLexicon_maxPhraseLength_(v6, v26, v45[5], (uint64_t)phraseLexicon, 3, v30);

      id v6 = (id)v34;
    }
    customPhraseLexicon = self->_customPhraseLexicon;
    if (customPhraseLexicon)
    {
      uint64_t v36 = objc_msgSend_changeableColumnCountUpdatedResultWithHistory_phraseLexicon_maxPhraseLength_(v6, v26, v45[5], (uint64_t)customPhraseLexicon, 3, v30);

      id v6 = (id)v36;
    }
    id v37 = v6;
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    id v37 = v6;
  }

  return v37;
}

- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5
{
  uint64_t v5 = objc_msgSend_textRecognitionResultForDrawing_options_writingStatistics_shouldCancel_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, (uint64_t)a5);
  return v5;
}

- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 writingStatistics:(id)a5 shouldCancel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (uint64_t (**)(void))a6;
  if (self)
  {
    activeRecognitionInsight = self->_activeRecognitionInsight;
    self->_activeRecognitionInsight = 0;

    if (self->_nextRecognitionInsightRequest)
    {
      uint64_t v15 = objc_alloc_init(CHRecognitionInsight);
      uint64_t v16 = self->_activeRecognitionInsight;
      self->_activeRecognitionInsight = v15;

      objc_msgSend_recordInsightRequest_(self->_activeRecognitionInsight, v17, (uint64_t)self->_nextRecognitionInsightRequest, v18, v19, v20);
      nextRecognitionInsightRequest = self->_nextRecognitionInsightRequest;
      self->_nextRecognitionInsightRequest = 0;
    }
  }
  if (v13 && (v13[2](v13) & 1) != 0)
  {
    id v22 = 0;
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x3032000000;
    uint64_t v47 = sub_1C496D854;
    uint64_t v48 = sub_1C496D864;
    id v49 = 0;
    recognitionQueue = self->_recognitionQueue;
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    uint64_t v36 = sub_1C498B7D4;
    id v37 = &unk_1E64E1578;
    id v38 = v10;
    uint64_t v39 = self;
    uint64_t v43 = &v44;
    id v40 = v12;
    id v24 = v11;
    id v41 = v24;
    uint64_t v42 = v13;
    dispatch_sync(recognitionQueue, &v34);
    uint64_t v25 = self->_activeRecognitionInsight;
    uint64_t v29 = v25;
    if (v25)
    {
      objc_msgSend_recordConfigurationForRecognizer_options_(v25, v26, (uint64_t)self, (uint64_t)v24, v27, v28, v34, v35, v36, v37, v38, v39, v40, v41);
      objc_msgSend_recordTextResult_recognitionError_(v29, v30, v45[5], 0, v31, v32);
    }
    id v22 = (id)v45[5];

    _Block_object_dispose(&v44, 8);
  }

  return v22;
}

- (id)recognitionResultsForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10 && ((*((uint64_t (**)(id))v10 + 2))(v10) & 1) != 0)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = sub_1C496D854;
    uint64_t v25 = sub_1C496D864;
    id v26 = 0;
    recognitionQueue = self->_recognitionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C498BF34;
    block[3] = &unk_1E64E15A0;
    id v16 = v8;
    uint64_t v17 = self;
    uint64_t v20 = &v21;
    id v18 = v9;
    id v19 = v11;
    dispatch_sync(recognitionQueue, block);
    id v12 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }

  return v12;
}

- (id)recognitionResultsForDrawing:(id)a3 options:(id)a4
{
  uint64_t v5 = objc_msgSend_recognitionResultsForDrawing_options_shouldCancel_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, v4);
  return v5;
}

- (void)_adjustCandidatesForConfusableCharacters:(void *)a3
{
  if (objc_msgSend_characterIsMember_(self->_activeCharacterSet, a2, 161, v3, v4, v5))
  {
    id v8 = *(int **)a3;
    uint64_t v7 = (int *)*((void *)a3 + 1);
    uint64_t v9 = (uint64_t)v7 - *(void *)a3;
    if (v7 != *(int **)a3)
    {
      uint64_t v10 = 0;
      unint64_t v11 = v9 >> 3;
      uint64_t v12 = (unint64_t)(v9 >> 3) <= 1 ? 1 : v9 >> 3;
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      id v14 = *(int **)a3;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        int v17 = *v14;
        v14 += 2;
        int v16 = v17;
        if (v17 == 161) {
          uint64_t v18 = v10;
        }
        else {
          uint64_t v18 = v15;
        }
        if (v16 == 105) {
          uint64_t v13 = v10;
        }
        else {
          uint64_t v15 = v18;
        }
        ++v10;
      }
      while (v12 != v10);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        float v19 = *(float *)&v8[2 * v13 + 1] * 0.75;
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v20 = &v8[2 * v15];
          if (v19 <= *((float *)v20 + 1)) {
            return;
          }
          size_t v21 = (char *)v7 - (char *)(v20 + 2);
          if (v21)
          {
            memmove(&v8[2 * v15], v20 + 2, v21);
            id v8 = *(int **)a3;
          }
          uint64_t v7 = (int *)((char *)v20 + v21);
          *((void *)a3 + 1) = v7;
          unint64_t v11 = ((char *)v7 - (char *)v8) >> 3;
        }
        LODWORD(v43) = 161;
        *((float *)&v43 + 1) = v19;
        if (v7 != v8)
        {
          uint64_t v22 = v11 <= 1 ? 1 : v11;
          uint64_t v23 = (float *)(v8 + 1);
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v25 = v8;
          while (v19 <= *v23)
          {
            v25 += 2;
            --v24;
            v23 += 2;
            if (!--v22) {
              goto LABEL_30;
            }
          }
          if (v24)
          {
            sub_1C496BA64((unint64_t *)a3, v25, (char *)&v43);
            return;
          }
        }
LABEL_30:
        unint64_t v26 = *((void *)a3 + 2);
        if ((unint64_t)v7 < v26)
        {
          *(void *)uint64_t v7 = v43;
          uint64_t v27 = v7 + 2;
LABEL_54:
          *((void *)a3 + 1) = v27;
          return;
        }
        unint64_t v28 = v11 + 1;
        if ((v11 + 1) >> 61) {
          sub_1C494A220();
        }
        uint64_t v29 = v26 - (void)v8;
        if (v29 >> 2 > v28) {
          unint64_t v28 = v29 >> 2;
        }
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v30 = v28;
        }
        if (v30)
        {
          if (v30 >> 61) {
            sub_1C4949AA8();
          }
          uint64_t v31 = operator new(8 * v30);
        }
        else
        {
          uint64_t v31 = 0;
        }
        uint64_t v32 = &v31[8 * v11];
        uint64_t v33 = &v31[8 * v30];
        *uint64_t v32 = v43;
        uint64_t v27 = v32 + 1;
        if (v7 == v8)
        {
LABEL_52:
          *(void *)a3 = v32;
          *((void *)a3 + 1) = v27;
          *((void *)a3 + 2) = v33;
          if (v7) {
            operator delete(v7);
          }
          goto LABEL_54;
        }
        unint64_t v34 = (char *)v7 - (char *)v8 - 8;
        if (v34 >= 0x58)
        {
          if ((char *)v7 - v31 - 8 * v11 >= 0x20)
          {
            uint64_t v36 = (v34 >> 3) + 1;
            uint64_t v37 = 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
            uint64_t v35 = &v7[v37 / 0xFFFFFFFFFFFFFFFCLL];
            uint64_t v32 = (void *)((char *)v32 - v37);
            id v38 = &v31[8 * v11 - 16];
            uint64_t v39 = (long long *)(v7 - 4);
            uint64_t v40 = v36 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v41 = *v39;
              *(v38 - 1) = *(v39 - 1);
              *id v38 = v41;
              v38 -= 2;
              v39 -= 2;
              v40 -= 4;
            }
            while (v40);
            if (v36 == (v36 & 0x3FFFFFFFFFFFFFFCLL)) {
              goto LABEL_51;
            }
          }
          else
          {
            uint64_t v35 = v7;
          }
        }
        else
        {
          uint64_t v35 = v7;
        }
        do
        {
          uint64_t v42 = *((void *)v35 - 1);
          v35 -= 2;
          *--uint64_t v32 = v42;
        }
        while (v35 != v8);
LABEL_51:
        uint64_t v7 = *(int **)a3;
        goto LABEL_52;
      }
    }
  }
}

- (id)_applySentenceTransliterationCandidates:(unsigned __int16 *)a3 codesLen:(int)a4 codesMax:(int)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v19 = 0;
  int v20 = a4;
  MEMORY[0x1F4188790](self);
  uint64_t v9 = (char *)&v18 - v8;
  memcpy((char *)&v18 - v8, a3, 2 * v10);
  if (self->_icuTransliterator
    || (long long v21 = *(_OWORD *)"S",
        v22[0] = *(_OWORD *)L"ed-Traditional",
        *(_OWORD *)((char *)v22 + 14) = *(_OWORD *)L"itional",
        unint64_t v11 = (void **)utrans_openU(),
        (self->_icuTransliterator = v11) != 0))
  {
    LODWORD(v21) = a4;
    utrans_transUChars();
    if (v19 < 1)
    {
      objc_msgSend_stringWithCharacters_length_(NSString, v12, (uint64_t)a3, v20, v13, v14);
      goto LABEL_8;
    }
    uint64_t v15 = v20;
  }
  else
  {
    uint64_t v15 = a4;
  }
  objc_msgSend_stringWithCharacters_length_(NSString, v12, (uint64_t)v9, v15, v13, v14);
  int v16 = LABEL_8:;
  return v16;
}

- (void)_applyTransliterationAndSyntheticCandidates:(void *)a3
{
  if (self->_transliterationVariantMap)
  {
    id v6 = (uint64_t *)a3;
    uint64_t v193 = 0;
    long long v194 = 0uLL;
    uint64_t v190 = 0;
    uint64_t v191 = 0;
    unint64_t v192 = 0;
    uint64_t v188 = 0;
    uint64_t v189 = 0;
    uint64_t v187 = &v188;
    uint64_t v7 = *((void *)a3 + 1) - *(void *)a3;
    if (v7)
    {
      uint64_t v8 = 0;
      unint64_t v9 = v7 >> 3;
      if (v9 <= 1) {
        unint64_t v9 = 1;
      }
      uint64_t v174 = (char *)&v194 + 8;
      unint64_t v175 = v9;
      while (1)
      {
        id v184 = 0;
        uint64_t v185 = 0;
        uint64_t v186 = 0;
        VariantMap::VariantsForCode(self->_transliterationVariantMap, *(_DWORD *)(*v6 + 8 * v8), (char **)&__p);
        int v10 = v6;
        uint64_t v180 = 0;
        uint64_t v181 = 0;
        unint64_t v11 = __p;
        uint64_t v12 = *v10;
        uint64_t v178 = v8;
        if (v183 != __p)
        {
          float v13 = *(float *)(v12 + 8 * v8 + 4);
          if (v13 > 0.0)
          {
            uint64_t v14 = 0;
            uint64_t v15 = 0;
            int v16 = 0;
            unint64_t v17 = 0;
            double v18 = v13;
            while (1)
            {
              if (v16 < v15)
              {
                *(_DWORD *)int v16 = v11[v17];
                v16 += 4;
                uint64_t v181 = v16;
                int v20 = v185;
                int v19 = v186;
                if (v185 >= v186) {
                  goto LABEL_30;
                }
                goto LABEL_12;
              }
              uint64_t v22 = (v16 - v14) >> 2;
              unint64_t v23 = v22 + 1;
              if ((unint64_t)(v22 + 1) >> 62) {
                sub_1C494A220();
              }
              if ((v15 - v14) >> 1 > v23) {
                unint64_t v23 = (v15 - v14) >> 1;
              }
              if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v24 = v23;
              }
              if (v24)
              {
                if (v24 >> 62) {
                  goto LABEL_218;
                }
                uint64_t v25 = operator new(4 * v24);
                unint64_t v26 = &v25[4 * v22];
                *(_DWORD *)unint64_t v26 = v11[v17];
                uint64_t v27 = (uint64_t)(v26 + 4);
                int64_t v28 = v16 - v14;
                if (v16 == v14) {
                  goto LABEL_27;
                }
              }
              else
              {
                uint64_t v25 = 0;
                unint64_t v26 = (char *)(4 * v22);
                *(_DWORD *)(4 * v22) = v11[v17];
                uint64_t v27 = 4 * v22 + 4;
                int64_t v28 = v16 - v14;
                if (v16 == v14) {
                  goto LABEL_27;
                }
              }
              unint64_t v29 = v28 - 4;
              if (v29 < 0xBC)
              {
                unint64_t v30 = v16;
                goto LABEL_26;
              }
              unint64_t v50 = (v16 - 4 - v14) & 0xFFFFFFFFFFFFFFFCLL;
              if (&v25[v16 - v14 - 4 - v50] > &v25[v16 - v14 - 4])
              {
                unint64_t v30 = v16;
                do
                {
LABEL_26:
                  int v31 = *((_DWORD *)v30 - 1);
                  v30 -= 4;
                  *((_DWORD *)v26 - 1) = v31;
                  v26 -= 4;
                }
                while (v30 != v14);
                goto LABEL_27;
              }
              if (&v16[-v50 - 4] > v16 - 4)
              {
                unint64_t v30 = v16;
                goto LABEL_26;
              }
              if ((unint64_t)(v14 - v25) < 0x20)
              {
                unint64_t v30 = v16;
                goto LABEL_26;
              }
              uint64_t v51 = (v29 >> 2) + 1;
              uint64_t v52 = 4 * (v51 & 0x7FFFFFFFFFFFFFF8);
              unint64_t v30 = &v16[-v52];
              v26 -= v52;
              unint64_t v53 = &v25[4 * v22 - 16];
              uint64_t v54 = v16 - 16;
              uint64_t v55 = v51 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                long long v56 = *(_OWORD *)v54;
                *(v53 - 1) = *((_OWORD *)v54 - 1);
                _OWORD *v53 = v56;
                v53 -= 2;
                v54 -= 32;
                v55 -= 8;
              }
              while (v55);
              if (v51 != (v51 & 0x7FFFFFFFFFFFFFF8)) {
                goto LABEL_26;
              }
LABEL_27:
              uint64_t v15 = &v25[4 * v24];
              uint64_t v180 = v26;
              if (v14) {
                operator delete(v14);
              }
              uint64_t v14 = v26;
              int v16 = (char *)v27;
              uint64_t v181 = (char *)v27;
              int v20 = v185;
              int v19 = v186;
              if (v185 >= v186)
              {
LABEL_30:
                uint64_t v32 = (double *)v184;
                int64_t v33 = (char *)v20 - (unsigned char *)v184;
                uint64_t v34 = ((char *)v20 - (unsigned char *)v184) >> 3;
                unint64_t v35 = v34 + 1;
                if ((unint64_t)(v34 + 1) >> 61) {
                  sub_1C494A220();
                }
                uint64_t v36 = (char *)v19 - (unsigned char *)v184;
                if (v36 >> 2 > v35) {
                  unint64_t v35 = v36 >> 2;
                }
                if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v37 = v35;
                }
                if (v37)
                {
                  if (v37 >> 61) {
LABEL_218:
                  }
                    sub_1C4949AA8();
                  id v38 = operator new(8 * v37);
                  uint64_t v39 = (double *)&v38[8 * v34];
                  *uint64_t v39 = v18;
                  uint64_t v21 = (uint64_t)(v39 + 1);
                  int64_t v40 = (char *)v20 - (char *)v32;
                  if (v20 == v32) {
                    goto LABEL_47;
                  }
LABEL_41:
                  unint64_t v41 = v40 - 8;
                  if (v41 < 0x58) {
                    goto LABEL_232;
                  }
                  if ((unint64_t)((char *)v20 - v38 - v33) < 0x20) {
                    goto LABEL_232;
                  }
                  uint64_t v42 = (v41 >> 3) + 1;
                  uint64_t v43 = 8 * (v42 & 0x3FFFFFFFFFFFFFFCLL);
                  uint64_t v44 = &v20[v43 / 0xFFFFFFFFFFFFFFF8];
                  uint64_t v39 = (double *)((char *)v39 - v43);
                  uint64_t v45 = &v38[8 * v34 - 16];
                  uint64_t v46 = v20 - 2;
                  uint64_t v47 = v42 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    long long v48 = *(_OWORD *)v46;
                    *(v45 - 1) = *((_OWORD *)v46 - 1);
                    *uint64_t v45 = v48;
                    v45 -= 2;
                    v46 -= 4;
                    v47 -= 4;
                  }
                  while (v47);
                  int v20 = v44;
                  if (v42 != (v42 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_232:
                    do
                    {
                      uint64_t v49 = *((void *)v20-- - 1);
                      *((void *)v39-- - 1) = v49;
                    }
                    while (v20 != v32);
                  }
                }
                else
                {
                  id v38 = 0;
                  uint64_t v39 = (double *)(8 * v34);
                  *(double *)(8 * v34) = v18;
                  uint64_t v21 = 8 * v34 + 8;
                  int64_t v40 = (char *)v20 - (char *)v32;
                  if (v20 != v32) {
                    goto LABEL_41;
                  }
                }
LABEL_47:
                id v184 = v39;
                uint64_t v185 = (double *)v21;
                uint64_t v186 = (double *)&v38[8 * v37];
                if (v32) {
                  operator delete(v32);
                }
                goto LABEL_49;
              }
LABEL_12:
              *int v20 = v18;
              uint64_t v21 = (uint64_t)(v20 + 1);
LABEL_49:
              uint64_t v185 = (double *)v21;
              ++v17;
              unint64_t v11 = __p;
              if (v17 < (v183 - (unsigned char *)__p) >> 2)
              {
                double v18 = v18 + -0.00000011920929;
                if (v18 > 0.0) {
                  continue;
                }
              }
              break;
            }
          }
LABEL_64:
          uint64_t v61 = *((void *)&v194 + 1);
          uint64_t v62 = (char *)v194;
          if ((unint64_t)v194 < *((void *)&v194 + 1)) {
            goto LABEL_65;
          }
          goto LABEL_89;
        }
        int v57 = *(_DWORD *)(v12 + 8 * v8);
        uint64_t v58 = (char *)operator new(4uLL);
        *(_DWORD *)uint64_t v58 = v57;
        uint64_t v181 = v58 + 4;
        uint64_t v180 = v58;
        double v59 = *(float *)(v12 + 8 * v8 + 4);
        uint64_t v60 = v185;
        if (v185 < v186)
        {
          *uint64_t v185 = v59;
          uint64_t v185 = v60 + 1;
          goto LABEL_64;
        }
        uint64_t v67 = (double *)v184;
        int64_t v68 = (char *)v185 - (unsigned char *)v184;
        uint64_t v69 = ((char *)v185 - (unsigned char *)v184) >> 3;
        unint64_t v70 = v69 + 1;
        if ((unint64_t)(v69 + 1) >> 61) {
          sub_1C494A220();
        }
        uint64_t v71 = (char *)v186 - (unsigned char *)v184;
        if (((char *)v186 - (unsigned char *)v184) >> 2 > v70) {
          unint64_t v70 = v71 >> 2;
        }
        unint64_t v72 = (unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v70;
        if (!v72) {
          break;
        }
        if (v72 >> 61) {
          sub_1C4949AA8();
        }
        uint64_t v73 = (char *)operator new(8 * v72);
        unint64_t v74 = (double *)&v73[8 * v69];
        *unint64_t v74 = v59;
        uint64_t v75 = (uint64_t)(v74 + 1);
        int64_t v76 = (char *)v60 - (char *)v67;
        if (v60 != v67) {
          goto LABEL_80;
        }
LABEL_86:
        id v184 = v74;
        uint64_t v185 = (double *)v75;
        uint64_t v186 = (double *)&v73[8 * v72];
        if (v67) {
          operator delete(v67);
        }
        uint64_t v185 = (double *)v75;
        uint64_t v61 = *((void *)&v194 + 1);
        uint64_t v62 = (char *)v194;
        if ((unint64_t)v194 < *((void *)&v194 + 1))
        {
LABEL_65:
          *(void *)uint64_t v62 = 0;
          *((void *)v62 + 1) = 0;
          *((void *)v62 + 2) = 0;
          int64_t v63 = v181 - v180;
          if (v181 != v180)
          {
            if (v63 < 0) {
              sub_1C494A220();
            }
            uint64_t v64 = (char *)operator new(v181 - v180);
            *(void *)uint64_t v62 = v64;
            *((void *)v62 + 1) = v64;
            uint64_t v65 = &v64[4 * (v63 >> 2)];
            *((void *)v62 + 2) = v65;
            memcpy(v64, v180, v63);
            *((void *)v62 + 1) = v65;
          }
          uint64_t v66 = v62 + 24;
          goto LABEL_112;
        }
LABEL_89:
        uint64_t v86 = (char *)v193;
        unint64_t v87 = 0xAAAAAAAAAAAAAAABLL * ((v62 - (unsigned char *)v193) >> 3);
        unint64_t v88 = v87 + 1;
        if (v87 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_1C494A220();
        }
        unint64_t v89 = 0xAAAAAAAAAAAAAAABLL * ((v61 - (uint64_t)v193) >> 3);
        if (2 * v89 > v88) {
          unint64_t v88 = 2 * v89;
        }
        if (v89 >= 0x555555555555555) {
          unint64_t v90 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v90 = v88;
        }
        uint64_t v198 = (char *)&v194 + 8;
        if (v90)
        {
          if (v90 > 0xAAAAAAAAAAAAAAALL) {
            sub_1C4949AA8();
          }
          uint64_t v91 = (char *)operator new(24 * v90);
        }
        else
        {
          uint64_t v91 = 0;
        }
        uint64_t v92 = &v91[24 * v87];
        double v195 = v91;
        long long v196 = v92;
        uint64_t v93 = &v91[24 * v90];
        *((void *)v92 + 1) = 0;
        *(void *)&long long v197 = v92;
        *((void *)&v197 + 1) = v93;
        *((void *)v92 + 2) = 0;
        *(void *)uint64_t v92 = 0;
        int64_t v94 = v181 - v180;
        if (v181 != v180)
        {
          if (v94 < 0) {
            sub_1C494A220();
          }
          uint64_t v95 = (char *)operator new(v94);
          *(void *)uint64_t v92 = v95;
          uint64_t v96 = &v95[4 * (v94 >> 2)];
          *((void *)v92 + 2) = v96;
          memcpy(v95, v180, v94);
          *((void *)v92 + 1) = v96;
        }
        uint64_t v66 = v92 + 24;
        *(void *)&long long v197 = v92 + 24;
        if (v62 == v86)
        {
          uint64_t v193 = v92;
          *(void *)&long long v194 = v92 + 24;
          *((void *)&v194 + 1) = v93;
        }
        else
        {
          do
          {
            BOOL v97 = v92;
            *((void *)v92 - 2) = 0;
            *((void *)v92 - 1) = 0;
            long long v98 = *(_OWORD *)(v62 - 24);
            v62 -= 24;
            *(_OWORD *)(v92 - 24) = v98;
            v92 -= 24;
            *((void *)v97 - 1) = *((void *)v62 + 2);
            *(void *)uint64_t v62 = 0;
            *((void *)v62 + 1) = 0;
            *((void *)v62 + 2) = 0;
          }
          while (v62 != v86);
          uint64_t v62 = (char *)v193;
          char v99 = (char *)v194;
          uint64_t v193 = v92;
          long long v194 = v197;
          uint64_t v66 = (void *)v197;
          if (v99 != v62)
          {
            int v100 = v99;
            do
            {
              uint64_t v102 = (void *)*((void *)v100 - 3);
              v100 -= 24;
              uint64_t v101 = v102;
              if (v102)
              {
                *((void *)v99 - 2) = v101;
                operator delete(v101);
              }
              char v99 = v100;
            }
            while (v100 != v62);
          }
        }
        if (v62) {
          operator delete(v62);
        }
LABEL_112:
        *(void *)&long long v194 = v66;
        uint64_t v103 = v191;
        if ((unint64_t)v191 < v192)
        {
          *(void *)uint64_t v191 = 0;
          *((void *)v103 + 1) = 0;
          *((void *)v103 + 2) = 0;
          uint64_t v104 = v184;
          int64_t v105 = (char *)v185 - (unsigned char *)v184;
          id v6 = (uint64_t *)a3;
          if (v185 != v184)
          {
            if (v105 < 0) {
              sub_1C494A220();
            }
            uint64_t v106 = (char *)operator new((char *)v185 - (unsigned char *)v184);
            *(void *)uint64_t v103 = v106;
            *((void *)v103 + 1) = v106;
            uint64_t v107 = &v106[8 * (v105 >> 3)];
            *((void *)v103 + 2) = v107;
            memcpy(v106, v104, v105);
            *((void *)v103 + 1) = v107;
          }
          uint64_t v191 = v103 + 24;
          uint64_t v109 = v178;
          uint64_t v108 = v180;
          if (!v180) {
            goto LABEL_120;
          }
LABEL_119:
          operator delete(v108);
          goto LABEL_120;
        }
        id v6 = (uint64_t *)a3;
        uint64_t v191 = sub_1C49A1C84((char **)&v190, (uint64_t)&v184);
        uint64_t v109 = v178;
        uint64_t v108 = v180;
        if (v180) {
          goto LABEL_119;
        }
LABEL_120:
        if (__p)
        {
          double v183 = __p;
          operator delete(__p);
        }
        if (v184)
        {
          uint64_t v185 = (double *)v184;
          operator delete(v184);
        }
        uint64_t v8 = v109 + 1;
        if (v8 == v175) {
          goto LABEL_124;
        }
      }
      uint64_t v73 = 0;
      unint64_t v74 = (double *)(8 * v69);
      *(double *)(8 * v69) = v59;
      uint64_t v75 = 8 * v69 + 8;
      int64_t v76 = (char *)v60 - (char *)v67;
      if (v60 == v67) {
        goto LABEL_86;
      }
LABEL_80:
      unint64_t v77 = v76 - 8;
      if (v77 < 0x58) {
        goto LABEL_233;
      }
      if ((unint64_t)((char *)v60 - v73 - v68) < 0x20) {
        goto LABEL_233;
      }
      uint64_t v78 = (v77 >> 3) + 1;
      uint64_t v79 = 8 * (v78 & 0x3FFFFFFFFFFFFFFCLL);
      BOOL v80 = &v60[v79 / 0xFFFFFFFFFFFFFFF8];
      unint64_t v74 = (double *)((char *)v74 - v79);
      uint64_t v81 = &v73[8 * v69 - 16];
      int v82 = v60 - 2;
      uint64_t v83 = v78 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v84 = *(_OWORD *)v82;
        *((_OWORD *)v81 - 1) = *((_OWORD *)v82 - 1);
        *(_OWORD *)uint64_t v81 = v84;
        v81 -= 32;
        v82 -= 4;
        v83 -= 4;
      }
      while (v83);
      uint64_t v60 = v80;
      if (v78 != (v78 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_233:
        do
        {
          uint64_t v85 = *((void *)v60-- - 1);
          *((void *)v74-- - 1) = v85;
        }
        while (v60 != v67);
      }
      goto LABEL_86;
    }
LABEL_124:
    unint64_t v179 = objc_msgSend__effectiveMaxRecognitionResultCount(self, a2, (uint64_t)a3, v3, v4, v5, v174);
    uint64_t v110 = v193;
    uint64_t v111 = v194;
    if ((void *)v194 != v193 && v179)
    {
      unint64_t v112 = 0;
      uint64_t v113 = 0;
      while (1)
      {
        uint64_t v115 = v110[3 * v113];
        if (v110[3 * v113 + 1] != v115) {
          break;
        }
LABEL_128:
        if (++v113 >= 0xAAAAAAAAAAAAAAABLL * ((v111 - (uint64_t)v110) >> 3) || v112 >= v179) {
          goto LABEL_201;
        }
      }
      uint64_t v116 = 0;
      while (1)
      {
        BOOL v122 = v188;
        int v123 = *(_DWORD *)(v115 + 4 * v116);
        BOOL v124 = &v188;
LABEL_143:
        uint64_t v125 = v124;
        if (v122)
        {
          do
          {
            BOOL v124 = (void **)v122;
            int v126 = *((_DWORD *)v122 + 7);
            if (v123 < v126)
            {
              BOOL v122 = *v124;
              goto LABEL_143;
            }
            if (v126 >= v123) {
              goto LABEL_137;
            }
            BOOL v122 = v124[1];
          }
          while (v122);
          uint64_t v125 = v124 + 1;
        }
        BOOL v127 = operator new(0x20uLL);
        *((_DWORD *)v127 + 7) = v123;
        *BOOL v127 = 0;
        v127[1] = 0;
        v127[2] = v124;
        *uint64_t v125 = v127;
        if (*v187)
        {
          uint64_t v187 = (void *)*v187;
          BOOL v127 = (void *)*v125;
        }
        BOOL v128 = v188;
        BOOL v129 = v127 == v188;
        *((unsigned char *)v127 + 24) = v127 == v188;
        if (!v129)
        {
          do
          {
            uint64_t v130 = v127[2];
            if (*(unsigned char *)(v130 + 24)) {
              break;
            }
            unint64_t v131 = *(void **)(v130 + 16);
            uint64_t v132 = *v131;
            if (*v131 == v130)
            {
              uint64_t v135 = v131[1];
              if (!v135 || (v136 = *(unsigned __int8 *)(v135 + 24), uint64_t v133 = (unsigned char *)(v135 + 24), v136))
              {
                if (*(void **)v130 == v127)
                {
                  *(unsigned char *)(v130 + 24) = 1;
                  *((unsigned char *)v131 + 24) = 0;
                  uint64_t v139 = *(void *)(v130 + 8);
                  *unint64_t v131 = v139;
                  if (v139) {
                    goto LABEL_165;
                  }
                }
                else
                {
                  uint64_t v137 = *(uint64_t **)(v130 + 8);
                  uint64_t v138 = *v137;
                  *(void *)(v130 + 8) = *v137;
                  if (v138)
                  {
                    *(void *)(v138 + 16) = v130;
                    unint64_t v131 = *(void **)(v130 + 16);
                  }
                  v137[2] = (uint64_t)v131;
                  *(void *)(*(void *)(v130 + 16) + 8 * (**(void **)(v130 + 16) != v130)) = v137;
                  *uint64_t v137 = v130;
                  *(void *)(v130 + 16) = v137;
                  unint64_t v131 = (void *)v137[2];
                  uint64_t v130 = *v131;
                  *((unsigned char *)v137 + 24) = 1;
                  *((unsigned char *)v131 + 24) = 0;
                  uint64_t v139 = *(void *)(v130 + 8);
                  *unint64_t v131 = v139;
                  if (v139) {
LABEL_165:
                  }
                    *(void *)(v139 + 16) = v131;
                }
                *(void *)(v130 + 16) = v131[2];
                *(void *)(v131[2] + 8 * (*(void *)v131[2] != (void)v131)) = v130;
                *(void *)(v130 + 8) = v131;
LABEL_171:
                v131[2] = v130;
                break;
              }
            }
            else if (!v132 || (v134 = *(unsigned __int8 *)(v132 + 24), uint64_t v133 = (unsigned char *)(v132 + 24), v134))
            {
              if (*(void **)v130 == v127)
              {
                uint64_t v161 = v127[1];
                *(void *)uint64_t v130 = v161;
                if (v161)
                {
                  *(void *)(v161 + 16) = v130;
                  unint64_t v131 = *(void **)(v130 + 16);
                }
                v127[2] = v131;
                *(void *)(*(void *)(v130 + 16) + 8 * (**(void **)(v130 + 16) != v130)) = v127;
                v127[1] = v130;
                *(void *)(v130 + 16) = v127;
                unint64_t v131 = (void *)v127[2];
                *((unsigned char *)v127 + 24) = 1;
                *((unsigned char *)v131 + 24) = 0;
                uint64_t v130 = v131[1];
                uint64_t v140 = *(void **)v130;
                v131[1] = *(void *)v130;
                if (v140) {
LABEL_169:
                }
                  v140[2] = v131;
              }
              else
              {
                *(unsigned char *)(v130 + 24) = 1;
                *((unsigned char *)v131 + 24) = 0;
                uint64_t v130 = v131[1];
                uint64_t v140 = *(void **)v130;
                v131[1] = *(void *)v130;
                if (v140) {
                  goto LABEL_169;
                }
              }
              *(void *)(v130 + 16) = v131[2];
              *(void *)(v131[2] + 8 * (*(void *)v131[2] != (void)v131)) = v130;
              *(void *)uint64_t v130 = v131;
              goto LABEL_171;
            }
            *(unsigned char *)(v130 + 24) = 1;
            BOOL v127 = v131;
            *((unsigned char *)v131 + 24) = v131 == v128;
            *uint64_t v133 = 1;
          }
          while (v131 != v128);
        }
        ++v189;
        char v118 = (char *)*v6;
        uint64_t v141 = (char *)v6[1];
        uint64_t v142 = (uint64_t)&v141[-*v6];
        uint64_t v143 = v142 >> 3;
        if (v142 >> 3 > v112) {
          goto LABEL_136;
        }
        unint64_t v144 = v6[2];
        if ((unint64_t)v141 < v144)
        {
          *(void *)uint64_t v141 = 0;
          int v117 = v141 + 8;
          goto LABEL_135;
        }
        unint64_t v145 = v143 + 1;
        if ((unint64_t)(v143 + 1) >> 61) {
          sub_1C494A220();
        }
        uint64_t v146 = v144 - (void)v118;
        if (v146 >> 2 > v145) {
          unint64_t v145 = v146 >> 2;
        }
        unint64_t v147 = (unint64_t)v146 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v145;
        if (v147)
        {
          if (v147 >> 61) {
            sub_1C4949AA8();
          }
          uint64_t v148 = operator new(8 * v147);
          uint64_t v149 = &v148[8 * v143];
          *uint64_t v149 = 0;
          uint64_t v150 = (char *)(v141 - v118);
          if (v141 == v118)
          {
LABEL_186:
            int v117 = v149 + 1;
            *(void *)a3 = v149;
            *((void *)a3 + 1) = v149 + 1;
            *((void *)a3 + 2) = &v148[8 * v147];
            id v6 = (uint64_t *)a3;
            if (!v141) {
              goto LABEL_135;
            }
LABEL_194:
            operator delete(v141);
            goto LABEL_135;
          }
        }
        else
        {
          uint64_t v148 = 0;
          uint64_t v149 = (void *)(8 * v143);
          *(void *)(8 * v143) = 0;
          uint64_t v150 = (char *)(v141 - v118);
          if (v141 == v118) {
            goto LABEL_186;
          }
        }
        uint64_t v151 = v150 - 8;
        if ((unint64_t)(v150 - 8) < 0x58) {
          break;
        }
        uint64_t v152 = v149;
        if ((unint64_t)(v141 - v148 - v142) < 0x20) {
          goto LABEL_192;
        }
        uint64_t v153 = ((unint64_t)v151 >> 3) + 1;
        uint64_t v154 = 8 * (v153 & 0x3FFFFFFFFFFFFFFCLL);
        uint64_t v155 = &v141[-v154];
        uint64_t v152 = &v149[v154 / 0xFFFFFFFFFFFFFFF8];
        uint64_t v156 = &v148[8 * v143 - 16];
        uint64_t v157 = v141 - 16;
        uint64_t v158 = v153 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v159 = *(_OWORD *)v157;
          *(v156 - 1) = *((_OWORD *)v157 - 1);
          _OWORD *v156 = v159;
          v156 -= 2;
          v157 -= 32;
          v158 -= 4;
        }
        while (v158);
        uint64_t v141 = v155;
        if (v153 != (v153 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_192;
        }
LABEL_193:
        uint64_t v141 = *(char **)a3;
        int v117 = v149 + 1;
        *(void *)a3 = v152;
        *((void *)a3 + 1) = v149 + 1;
        *((void *)a3 + 2) = &v148[8 * v147];
        id v6 = (uint64_t *)a3;
        if (v141) {
          goto LABEL_194;
        }
LABEL_135:
        v6[1] = (uint64_t)v117;
        char v118 = (char *)*v6;
LABEL_136:
        uint64_t v110 = v193;
        uint64_t v115 = *((void *)v193 + 3 * v113);
        int v119 = (float *)&v118[8 * v112];
        *int v119 = *(float *)(v115 + 4 * v116);
        float v120 = *(double *)(*((void *)v190 + 3 * v113) + 8 * v116);
        v119[1] = v120;
        ++v112;
LABEL_137:
        if (++v116 >= (unint64_t)((v110[3 * v113 + 1] - v115) >> 2) || v112 >= v179)
        {
          uint64_t v111 = v194;
          goto LABEL_128;
        }
      }
      uint64_t v152 = v149;
      do
      {
LABEL_192:
        uint64_t v160 = *((void *)v141 - 1);
        v141 -= 8;
        *--uint64_t v152 = v160;
      }
      while (v141 != v118);
      goto LABEL_193;
    }
LABEL_201:
    sub_1C49A1374(v188);
    uint64_t v162 = (char *)v190;
    if (v190)
    {
      uint64_t v163 = v191;
      uint64_t v164 = v190;
      if (v191 != v190)
      {
        id v165 = v191;
        do
        {
          os_signpost_id_t v167 = (void *)*((void *)v165 - 3);
          v165 -= 24;
          uint64_t v166 = v167;
          if (v167)
          {
            *((void *)v163 - 2) = v166;
            operator delete(v166);
          }
          uint64_t v163 = v165;
        }
        while (v165 != v162);
        uint64_t v164 = v190;
      }
      uint64_t v191 = v162;
      operator delete(v164);
    }
    uint64_t v168 = (char *)v193;
    if (v193)
    {
      uint64_t v169 = (char *)v194;
      unint64_t v170 = v193;
      if ((void *)v194 != v193)
      {
        uint64_t v171 = (char *)v194;
        do
        {
          uint64_t v173 = (void *)*((void *)v171 - 3);
          v171 -= 24;
          id v172 = v173;
          if (v173)
          {
            *((void *)v169 - 2) = v172;
            operator delete(v172);
          }
          uint64_t v169 = v171;
        }
        while (v171 != v168);
        unint64_t v170 = v193;
      }
      *(void *)&long long v194 = v168;
      operator delete(v170);
    }
  }
}

- (void)_rescoreCandidatesWithLanguageModel:(void *)a3 history:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C498EEC4;
  v8[3] = &unk_1E64E1618;
  id v9 = v6;
  int v10 = a3;
  v8[4] = self;
  id v7 = v6;
  sub_1C496D8B8((uint64_t)self, v8);
}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C498FDBC;
  v3[3] = &unk_1E64E1258;
  v3[4] = self;
  v3[5] = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (unint64_t)_effectiveMaxRecognitionResultCount
{
  if (self->_maxRecognitionResultCount) {
    return self->_maxRecognitionResultCount;
  }
  else {
    return ((uint64_t (*)(CHRecognizerConfiguration *, char *))MEMORY[0x1F4181798])(self->_configuration, sel_maxRecognitionResultDefaultCount);
  }
}

- (CGSize)minimumDrawingSize
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x4012000000;
  int v10 = sub_1C498FED4;
  unint64_t v11 = nullsub_3;
  uint64_t v12 = &unk_1C4CB5C62;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C498FEE4;
  v6[3] = &unk_1E64E1168;
  v6[4] = self;
  void v6[5] = &v7;
  sub_1C496D8B8((uint64_t)self, v6);
  double v2 = v8[6];
  double v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setMinimumDrawingSize:(CGSize)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C498FF70;
  v3[3] = &unk_1E64E1230;
  v3[4] = self;
  CGSize v4 = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (void)setRecognitionType:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C498FFF8;
  v3[3] = &unk_1E64E1640;
  v3[4] = self;
  int v4 = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (int)recognitionMode
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C499038C;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setRecognitionMode:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4990438;
  v3[3] = &unk_1E64E1640;
  int v4 = a3;
  v3[4] = self;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (void)_setConfiguration:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend_isEqualToRecognizerConfiguration_(self->_configuration, v6, (uint64_t)v5, v7, v8, v9) & 1) == 0)
  {
    configuration = self->_configuration;
    if (configuration
      && objc_msgSend_hasSameResourcesAsConfiguration_(configuration, v10, (uint64_t)v5, v11, v12, v13))
    {
      char hasSamePostProcessingAsConfiguration = objc_msgSend_hasSamePostProcessingAsConfiguration_(self->_configuration, v15, (uint64_t)v5, v16, v17, v18);
      objc_storeStrong((id *)&self->_configuration, a3);
      if ((hasSamePostProcessingAsConfiguration & 1) == 0)
      {
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        uint64_t v27 = sub_1C496ED70;
        int64_t v28 = &unk_1E64E0D48;
        unint64_t v29 = self;
        sub_1C496D8B8((uint64_t)self, &v25);
        if (self->_mergedResultPostProcessor) {
          objc_msgSend__initializeMergedResultPostProcessor(self, v20, v21, v22, v23, v24);
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      uint64_t v27 = sub_1C496E540;
      int64_t v28 = &unk_1E64E0D48;
      unint64_t v29 = self;
      sub_1C496D8B8((uint64_t)self, &v25);
    }
  }
}

- (NSLocale)locale
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C496D854;
  uint64_t v9 = sub_1C496D864;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4990A18;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSLocale *)v2;
}

- (void)setLocale:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4990B14;
  v6[3] = &unk_1E64E11E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  sub_1C496D8B8((uint64_t)self, v6);
}

- (void)setActiveCharacterSet:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4990EB8;
  v6[3] = &unk_1E64E11E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  sub_1C496D8B8((uint64_t)self, v6);
}

- (int)contentType
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4990F94;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setContentType:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4991040;
  v3[3] = &unk_1E64E1640;
  v3[4] = self;
  int v4 = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (int)autoCapitalizationMode
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4991288;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setAutoCapitalizationMode:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4991334;
  v3[3] = &unk_1E64E1640;
  v3[4] = self;
  int v4 = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (int)autoCorrectionMode
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C499157C;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setAutoCorrectionMode:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4991628;
  v3[3] = &unk_1E64E1640;
  v3[4] = self;
  int v4 = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (int)baseWritingDirection
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4991870;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setBaseWritingDirection:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4991918;
  v3[3] = &unk_1E64E1258;
  v3[4] = self;
  void v3[5] = *(void *)&a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (BOOL)enableCachingIfAvailable
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4991B5C;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEnableCachingIfAvailable:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4991C08;
  v3[3] = &unk_1E64E1668;
  v3[4] = self;
  BOOL v4 = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (BOOL)enableGen2ModelIfAvailable
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4991E58;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEnableGen2ModelIfAvailable:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4991F04;
  v3[3] = &unk_1E64E1668;
  v3[4] = self;
  BOOL v4 = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4992154;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEnableGen2CharacterLMIfAvailable:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4992200;
  v3[3] = &unk_1E64E1668;
  v3[4] = self;
  BOOL v4 = a3;
  sub_1C496D8B8((uint64_t)self, v3);
}

- (int)recognitionType
{
  return self->_recognitionType;
}

- (unint64_t)maxRecognitionResultCount
{
  return self->_maxRecognitionResultCount;
}

- (NSCharacterSet)activeCharacterSet
{
  return self->_activeCharacterSet;
}

- (CHSpellChecker)spellChecker
{
  return self->_spellChecker;
}

- (void)setSpellChecker:(id)a3
{
}

- (_LXLexicon)customPhraseLexicon
{
  return self->_customPhraseLexicon;
}

- (NSDictionary)textReplacements
{
  return self->_textReplacements;
}

- (CHPostProcessingManager)postProcessor
{
  return self->_postProcessor;
}

- (void)setPostProcessor:(id)a3
{
}

- (CHPostProcessingManager)mergedResultPostProcessor
{
  return self->_mergedResultPostProcessor;
}

- (void)setMergedResultPostProcessor:(id)a3
{
}

- (CHRecognizerConfiguration)configuration
{
  return self->_configuration;
}

- (CHMecabraWrapper)mecabraWrapper
{
  return self->_mecabraWrapper;
}

- (void)setMecabraWrapper:(id)a3
{
}

- (_LXLexicon)staticLexicon
{
  return self->_staticLexicon;
}

- (void)setStaticLexicon:(_LXLexicon *)a3
{
  self->_uint64_t staticLexicon = a3;
}

- (void)wordLanguageModel
{
  return self->_wordLanguageModel;
}

- (void)setWordLanguageModel:(void *)a3
{
  self->_wordLanguageModel = a3;
}

- (CHStringOVSChecker)ovsStringChecker
{
  return self->_ovsStringChecker;
}

- (void)setOvsStringChecker:(id)a3
{
}

- (void).cxx_destruct
{
  sub_1C4999C7C((uint64_t)&self->_characterIDMap, (void *)self->_characterIDMap.__tree_.__pair1_.__value_.__left_);
  sub_1C499CD44((void *)self->_cachedResults.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_ovsStringChecker, 0);
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mergedResultPostProcessor, 0);
  objc_storeStrong((id *)&self->_postProcessor, 0);
  objc_storeStrong((id *)&self->_textReplacements, 0);
  objc_storeStrong((id *)&self->_spellChecker, 0);
  objc_storeStrong((id *)&self->_lastCharacterSegmentIndexes, 0);
  objc_storeStrong((id *)&self->_cachedDrawing, 0);
  objc_storeStrong((id *)&self->_learningDictionaryURL, 0);
  objc_storeStrong((id *)&self->_textReplacementLowercasedKeyMapping, 0);
  objc_storeStrong((id *)&self->_postProcessingFST, 0);
  objc_storeStrong((id *)&self->_patternFST, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_legacyTextDecoder, 0);
  objc_storeStrong((id *)&self->_recognitionModel, 0);
  objc_storeStrong((id *)&self->_cornerDetector, 0);
  objc_storeStrong((id *)&self->_activeCharacterSet, 0);
  if (self->_textDecoder.__engaged_)
  {
    self->_textDecoder.var0.__val_._vptr$AbstractCTCDecoder = (void **)&unk_1F2012530;
    self->_textDecoder.var0.__val_.pathBuilder_._vptr$AbstractResultPathBuilder = (void **)&unk_1F2012610;
    begin = self->_textDecoder.var0.__val_.pathBuilder_.spaceLabels_.__begin_;
    if (begin)
    {
      self->_textDecoder.var0.__val_.pathBuilder_.spaceLabels_.__end_ = begin;
      operator delete(begin);
    }
    self->_textDecoder.var0.__val_.beamScorer_._vptr$BaseBeamScorer = (void **)&unk_1F2012660;
    BOOL v4 = self->_textDecoder.var0.__val_.beamScorer_.scorers_.__begin_;
    if (v4)
    {
      end = self->_textDecoder.var0.__val_.beamScorer_.scorers_.__end_;
      id v6 = self->_textDecoder.var0.__val_.beamScorer_.scorers_.__begin_;
      if (end != v4)
      {
        do
        {
          uint64_t v8 = *--end;
          uint64_t v7 = v8;
          void *end = 0;
          if (v8) {
            (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
          }
        }
        while (end != v4);
        id v6 = self->_textDecoder.var0.__val_.beamScorer_.scorers_.__begin_;
      }
      self->_textDecoder.var0.__val_.beamScorer_.scorers_.__end_ = v4;
      operator delete(v6);
    }
  }
  objc_storeStrong((id *)&self->_whitelistMecabraRareCharacters, 0);
  objc_storeStrong((id *)&self->_activeRecognitionInsight, 0);
  objc_storeStrong((id *)&self->_nextRecognitionInsightRequest, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 32) = 0;
  *((unsigned char *)self + 200) = 0;
  *((_OWORD *)self + 33) = 0u;
  *((void *)self + 65) = (char *)self + 528;
  *(_OWORD *)((char *)self + 552) = 0u;
  *((void *)self + 68) = (char *)self + 552;
  return self;
}

- (void)recordInsightWithRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4992734;
  v6[3] = &unk_1E64E11E0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  sub_1C496D8B8((uint64_t)self, v6);
}

- (CHRecognitionInsight)recordedInsightFromLastRequest
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C496D854;
  uint64_t v9 = sub_1C496D864;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4992854;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C496D8B8((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHRecognitionInsight *)v2;
}

@end