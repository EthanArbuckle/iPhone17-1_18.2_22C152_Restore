@interface CHRecognizerConfiguration
+ (BOOL)isLocaleSupported:(id)a3 withMode:(int)a4;
+ (BOOL)isSupportedCyrillicScriptLocale:(id)a3 withMode:(int)a4;
+ (BOOL)isSupportedLatinScriptLocale:(id)a3 withMode:(int)a4;
+ (BOOL)shouldAddSpaceToNeutralQuotationMarks:(id)a3;
+ (BOOL)shouldAdjustGroupingForLocale:(id)a3;
+ (BOOL)shouldAdjustGroupingHeuristicsForVeryComplexCharacters:(id)a3;
+ (BOOL)shouldAllowSpaceInsertionGestureForLocale:(id)a3;
+ (BOOL)shouldApplyLatinSpacingForLocale:(id)a3;
+ (BOOL)shouldApplyThaiSpacingForLocale:(id)a3;
+ (BOOL)shouldForceNoAlternativeRecognitionCandidates:(id)a3;
+ (BOOL)shouldInsertSpaceBetweenPreviousChar:(id)a3 andNextChar:(id)a4 inLocale:(id)a5 inString:(id)a6 atRange:(_NSRange)a7 withQuoteCount:(id)a8;
+ (BOOL)shouldPerformStrictCandidateFiltering:(id)a3;
+ (BOOL)shouldRefinePrefixQueryMatchesForLocale:(id)a3;
+ (BOOL)shouldRemoveSpaceBetweenPreviousChar:(id)a3 andNextChar:(id)a4 inLocale:(id)a5;
+ (BOOL)shouldSwapCyrillicTopResult:(id)a3 topRange:(_NSRange)a4 englishResult:(id)a5 englishRange:(_NSRange)a6 prevousGroupTopString:(id)a7;
+ (BOOL)shouldUseFullWidthSpaceBasedOnContextForLocale:(id)a3;
+ (BOOL)shouldUseOriginalTokensForLocale:(id)a3;
+ (BOOL)shouldUseStrokeReorderingForMode:(int)a3;
+ (CGSize)defaultMinimumDrawingSize;
+ (double)skipLatinActivationThreshold;
+ (id)allNonLatinModelNames;
+ (id)defaultActiveCharacterSetForLocale:(id)a3;
+ (id)defaultActiveCharacterSetForLocales:(id)a3;
+ (id)defaultLocaleForRecognitionType:(int)a3 withMode:(int)a4;
+ (id)effectiveRecognitionLocales:(id)a3 recognitionMode:(int)a4;
+ (id)forcedGen2ModelLocaleForLocale:(id)a3;
+ (id)localeForScriptClass:(id)a3;
+ (id)localesByLanguageGroup:(id)a3;
+ (id)localesForScriptClassification:(id)a3 selectedScriptCodepoints:(id)a4;
+ (id)modelNameArabic;
+ (id)modelNameChinese;
+ (id)modelNameCyrillic;
+ (id)modelNameJapanese;
+ (id)modelNameKorean;
+ (id)modelNameLatin;
+ (id)modelNameThai;
+ (id)modelNameVietnamese;
+ (id)parametersOverride;
+ (id)recognitionEngineCachingKeyForRecognitionLocale:(id)a3;
+ (id)spellCheckingLocaleForRecognitionLocale:(id)a3 string:(id)a4;
+ (id)stringForAutoCapitalizationMode:(int)a3;
+ (id)stringForAutoCorrectionMode:(int)a3;
+ (id)stringForBaseWritingDirection:(int)a3;
+ (id)stringForRecognitionContentType:(int)a3;
+ (id)stringForRecognitionMode:(int)a3;
+ (id)swappableColumnIndexesFromResults:(id)a3 locales:(id)a4;
+ (id)swappableColumnIndexesFromResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5;
+ (int64_t)drawingStrokeLimitForLocale:(id)a3;
+ (int64_t)writingOrientationForLocale:(id)a3;
+ (void)setParametersOverride:(id)a3;
- (BOOL)enableCachingIfAvailable;
- (BOOL)enableGen2CharacterLMIfAvailable;
- (BOOL)enableGen2ModelIfAvailable;
- (BOOL)hasSamePostProcessingAsConfiguration:(id)a3;
- (BOOL)hasSameResourcesAsConfiguration:(id)a3;
- (BOOL)isEqualToRecognizerConfiguration:(id)a3;
- (BOOL)shouldAddAlternativeWidthCandidates;
- (BOOL)shouldApplyCandidatesThresholding;
- (BOOL)shouldApplyChinesePostProcessing;
- (BOOL)shouldApplyDiacriticSensitivity;
- (BOOL)shouldApplyLMRescoring;
- (BOOL)shouldApplyLMSorting;
- (BOOL)shouldApplyLexicalPenalty;
- (BOOL)shouldApplyRomanPostProcessing;
- (BOOL)shouldApplySemanticTokenization;
- (BOOL)shouldAutoCapitalize;
- (BOOL)shouldAutoCorrect;
- (BOOL)shouldComposeLexiconWithNetwork;
- (BOOL)shouldComputeStrokePenalties;
- (BOOL)shouldConvertKanaInPostProcessing;
- (BOOL)shouldCreatePseudoTokens;
- (BOOL)shouldDetectChinesePunctuation;
- (BOOL)shouldDetectRomanPunctuation;
- (BOOL)shouldEnforceGrammarOnTransliterations;
- (BOOL)shouldExpandCodePoints;
- (BOOL)shouldExpandLexiconInNetwork;
- (BOOL)shouldFallbackOnSingleCharacterExpansion;
- (BOOL)shouldFilterLowProbabilityTranscriptionPaths;
- (BOOL)shouldForwardMecabraOTAAssetsUpdate;
- (BOOL)shouldGenerateDigitLetterAlternatives;
- (BOOL)shouldIdentifyChangeableColumns;
- (BOOL)shouldKeepDuplicateTokenIDs;
- (BOOL)shouldKeepOutOfPatternCandidates;
- (BOOL)shouldLoadCJKLexicons;
- (BOOL)shouldMarkMultiWordOVS;
- (BOOL)shouldMarkNoWhiteSpaceColumnsChangeable;
- (BOOL)shouldPenalizeLetterInsertion;
- (BOOL)shouldPenalizePrefixes;
- (BOOL)shouldPerformArabicPostProcessing;
- (BOOL)shouldPerformGlobalBestSearch;
- (BOOL)shouldPerformGlobalBestSearchWithSmallLattice;
- (BOOL)shouldPerformIntegratedLexiconExpansion;
- (BOOL)shouldPreserveLegacyTranscriptionPaths;
- (BOOL)shouldPromoteCJKCommonCharacters;
- (BOOL)shouldPromoteInLexiconCandidates;
- (BOOL)shouldRecoverCyrillicCandidates;
- (BOOL)shouldRefineCandidates;
- (BOOL)shouldRefineChineseCharacterCandidates;
- (BOOL)shouldRelaxFinalCandidatesThresholding;
- (BOOL)shouldRemoveInvalidArabicDiacritics;
- (BOOL)shouldRemoveSpacesFromHashtagsAndMentions;
- (BOOL)shouldReorderSCTCConfusion;
- (BOOL)shouldReplaceInvalidTokenIDs;
- (BOOL)shouldRunLexiconCorrectionPostProcessingStep;
- (BOOL)shouldRunNextGenRecognizer;
- (BOOL)shouldTransformCharacterProbabilitiesIntoLogScores;
- (BOOL)shouldTransliterateAndSynthetizeCandidates;
- (BOOL)shouldTransliterateHalfWidthPunctuations;
- (BOOL)shouldTransliterateSentencesSCTC;
- (BOOL)shouldTreatAllSmallStrokesAsPunctuation;
- (BOOL)shouldUpdateChangeableColumnCountWithPhraseLexicon;
- (BOOL)shouldUseCaching;
- (BOOL)shouldUseModernizedCTCDecoder;
- (BOOL)shouldUseTokenPrecedingSpaces;
- (BOOL)unsafeForSpellCorrection;
- (CHNeuralNetwork)newFreeFormEngine;
- (CHNeuralNetwork)newRecognitionEngine;
- (CHRecognizerConfiguration)initWithMode:(int)a3 locale:(id)a4 contentType:(int)a5 autoCapitalizationMode:(int)a6 autoCorrectionMode:(int)a7 baseWritingDirection:(int)a8 enableCachingIfAvailable:(BOOL)a9 enableGen2ModelIfAvailable:(BOOL)a10 enableGen2CharacterLMIfAvailable:(BOOL)a11;
- (CHRecognizerConfiguration)initWithMode:(int)a3 locale:(id)a4 contentType:(int)a5 enableCachingIfAvailable:(BOOL)a6 enableGen2ModelIfAvailable:(BOOL)a7 enableGen2CharacterLMIfAvailable:(BOOL)a8;
- (NSLocale)locale;
- (VariantMap)newTransliterationVariantMap;
- (_LXLexicon)newPhraseLexicon:(id *)a3;
- (_LXLexicon)newSecondaryStaticLexicon:(id *)a3;
- (_LXLexicon)newStaticLexicon:(id *)a3;
- (_LXLexicon)postProcessorLexiconWithStaticLexicon:(_LXLexicon *)a3 secondaryLexicon:(_LXLexicon *)a4;
- (id)configurationKey;
- (id)decodingCommitActionBlock;
- (id)description;
- (id)forcedActiveCharacterSet;
- (id)languageResourceBundleWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 wordLanguageModel:(void *)a5;
- (id)linguisticResourcesFallbackLocale;
- (id)newCTCRecognitionModel;
- (id)newCTCTextDecoderWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 wordLanguageModel:(void *)a5;
- (id)newCornerDetector;
- (id)newMecabraWrapper;
- (id)newMergedResultPostProcessorWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 stringChecker:(id)a5;
- (id)newOVSStringCheckerWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4;
- (id)newPatternFST;
- (id)newPostProcessorWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 phraseLexicon:(_LXLexicon *)a5 customPhraseLexicon:(_LXLexicon *)a6 textReplacements:(id)a7 postProcessingFST:(id)a8 wordLM:(void *)a9 mecabraWrapper:(id)a10 ovsStringChecker:(id)a11 spellChecker:(id)a12 lmVocabulary:(void *)a13 maxResultCount:(int64_t)a14;
- (id)newSpellChecker;
- (id)pathScoringFunctionForLanguageResourceBundle:(id)a3;
- (id)sharedPostProcessingFST;
- (int)autoCapitalizationMode;
- (int)autoCorrectionMode;
- (int)baseWritingDirection;
- (int)contentType;
- (int)contentTypeForNoSpaceRecognition;
- (int)effectiveAutoCapitalizationMode;
- (int)mecabraInputMethodType;
- (int)mode;
- (int64_t)engineCandidateCount;
- (int64_t)maxRecognitionResultDefaultCount;
- (int64_t)precedingSpaceDefaultBehavior;
- (unint64_t)mixedScriptPenalty;
- (unint64_t)supportedSegmentationStrategy;
- (unsigned)requiredInappropriateFilteringFlags;
- (void)lexiconStringNormalizationFunction;
- (void)newCJKStaticLexicon;
- (void)newCharacterLanguageModelAndMap:(void *)a3 force:(BOOL)a4;
- (void)newGrammarFST;
- (void)newRadicalClusterFST;
- (void)newWordLanguageModel;
- (void)newWordLanguageModelForRecognizer:(id)a3 async:(BOOL)a4 synchronizationQueue:(id)a5;
@end

@implementation CHRecognizerConfiguration

+ (BOOL)isLocaleSupported:(id)a3 withMode:(int)a4
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, &v7, &v6);
  return sub_1C4B68ED0((uint64_t)CHRecognizerConfiguration, v7, a4);
}

- (CHRecognizerConfiguration)initWithMode:(int)a3 locale:(id)a4 contentType:(int)a5 enableCachingIfAvailable:(BOOL)a6 enableGen2ModelIfAvailable:(BOOL)a7 enableGen2CharacterLMIfAvailable:(BOOL)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a3;
  id v15 = a4;
  BOOL v16 = v12 == 2 || a8;
  if (v12 == 6) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v12 == 6) {
    BOOL v18 = a8;
  }
  else {
    BOOL v18 = v16;
  }
  BYTE2(v21) = v18;
  BYTE1(v21) = a7;
  LOBYTE(v21) = a6;
  v19 = (CHRecognizerConfiguration *)objc_msgSend_initWithMode_locale_contentType_autoCapitalizationMode_autoCorrectionMode_baseWritingDirection_enableCachingIfAvailable_enableGen2ModelIfAvailable_enableGen2CharacterLMIfAvailable_(self, v14, v12, (uint64_t)v15, v11, v12 != 6, v17, 0x7FFFFFFFFFFFFFFFLL, v21);

  return v19;
}

- (CHRecognizerConfiguration)initWithMode:(int)a3 locale:(id)a4 contentType:(int)a5 autoCapitalizationMode:(int)a6 autoCorrectionMode:(int)a7 baseWritingDirection:(int)a8 enableCachingIfAvailable:(BOOL)a9 enableGen2ModelIfAvailable:(BOOL)a10 enableGen2CharacterLMIfAvailable:(BOOL)a11
{
  uint64_t v11 = *(void *)&a8;
  id v17 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CHRecognizerConfiguration;
  BOOL v18 = [(CHRecognizerConfiguration *)&v31 init];
  v24 = v18;
  if (v18)
  {
    v18->_mode = a3;
    uint64_t v25 = objc_msgSend_copy(v17, v19, v20, v21, v22, v23);
    locale = v24->_locale;
    v24->_locale = (NSLocale *)v25;

    v24->_contentType = a5;
    *(void *)&v24->_baseWritingDirection = v11;
    uint64_t v29 = 0;
    unint64_t v30 = 0;
    sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v17, (uint64_t *)&v30, &v29);
    uint64_t v27 = v29;
    v24->_language = v30;
    v24->_script = v27;
    v24->_autoCapitalizationMode = a6;
    v24->_autoCorrectionMode = a7;
    v24->_enableCachingIfAvailable = a9;
    v24->_enableGen2ModelIfAvailable = a10;
    v24->_enableGen2CharacterLMIfAvailable = a11;
  }

  return v24;
}

+ (id)stringForRecognitionMode:(int)a3
{
  if ((a3 - 1) > 5) {
    return 0;
  }
  else {
    return off_1E64E4400[a3 - 1];
  }
}

+ (id)stringForRecognitionContentType:(int)a3
{
  if (a3 > 7) {
    return 0;
  }
  else {
    return off_1E64E4430[a3];
  }
}

+ (id)stringForAutoCapitalizationMode:(int)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return off_1E64E4470[a3];
  }
}

+ (id)stringForAutoCorrectionMode:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E64E44A8[a3];
  }
}

+ (id)stringForBaseWritingDirection:(int)a3
{
  v3 = @"default-ltr";
  v4 = @"default-rtl";
  v5 = @"none";
  if (*(void *)&a3 != 0x7FFFFFFFFFFFFFFFLL) {
    v5 = 0;
  }
  if (*(void *)&a3 != 255) {
    v4 = v5;
  }
  if (*(void *)&a3 != 254) {
    v3 = v4;
  }
  uint64_t v6 = @"ltr";
  uint64_t v7 = @"rtl";
  if (*(void *)&a3 != 1) {
    uint64_t v7 = 0;
  }
  if (*(void *)&a3) {
    uint64_t v6 = v7;
  }
  if (*(uint64_t *)&a3 <= 253) {
    return v6;
  }
  else {
    return v3;
  }
}

- (id)description
{
  uint64_t v6 = objc_msgSend_stringForRecognitionMode_(CHRecognizerConfiguration, a2, self->_mode, v2, v3, v4);
  uint64_t v11 = objc_msgSend_stringForRecognitionContentType_(CHRecognizerConfiguration, v7, self->_contentType, v8, v9, v10);
  BOOL v16 = objc_msgSend_stringForAutoCapitalizationMode_(CHRecognizerConfiguration, v12, self->_autoCapitalizationMode, v13, v14, v15);
  uint64_t v21 = objc_msgSend_stringForAutoCorrectionMode_(CHRecognizerConfiguration, v17, self->_autoCorrectionMode, v18, v19, v20);
  v26 = objc_msgSend_stringForBaseWritingDirection_(CHRecognizerConfiguration, v22, *(void *)&self->_baseWritingDirection, v23, v24, v25);
  unint64_t language = self->_language;
  self;
  if (language > 0x1B) {
    v28 = 0;
  }
  else {
    v28 = off_1E64E44C0[language];
  }
  unint64_t script = self->_script;
  self;
  if (script > 8) {
    unint64_t v30 = 0;
  }
  else {
    unint64_t v30 = off_1E64E45A0[script];
  }
  v44.receiver = self;
  v44.super_class = (Class)CHRecognizerConfiguration;
  objc_super v31 = [(CHRecognizerConfiguration *)&v44 description];
  v37 = objc_msgSend_localeIdentifier(self->_locale, v32, v33, v34, v35, v36);
  v42 = objc_msgSend_stringByAppendingFormat_(v31, v38, @" Recognizer configuration with mode: %@, locale: %@, contentType: %@, autoCapitalizationMode: %@, autoCorrectionMode: %@, baseWritingDirection: %@, language: %@, script: %@", v39, v40, v41, v6, v37, v11, v16, v21, v26, v28, v30);

  return v42;
}

+ (id)defaultLocaleForRecognitionType:(int)a3 withMode:(int)a4
{
  uint64_t v7 = 0;
  uint64_t v9 = @"en";
  switch(a3)
  {
    case 0:
      if (a4 != 3) {
        goto LABEL_9;
      }
      uint64_t v7 = 0;
      return v7;
    case 1:
      goto LABEL_9;
    case 2:
      uint64_t v9 = @"zh_Hans";
      goto LABEL_9;
    case 4:
      uint64_t v9 = @"zh_Hant";
      goto LABEL_9;
    case 8:
      uint64_t v9 = @"ja";
LABEL_9:
      uint64_t v7 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], a2, (uint64_t)v9, *(uint64_t *)&a4, v4, v5);
      break;
    default:
      break;
  }
  return v7;
}

+ (BOOL)isSupportedLatinScriptLocale:(id)a3 withMode:(int)a4
{
  id v5 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v5, &v9, &v8);
  if (v8 == 1) {
    char v6 = sub_1C4B68ED0((uint64_t)CHRecognizerConfiguration, v9, a4);
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isSupportedCyrillicScriptLocale:(id)a3 withMode:(int)a4
{
  id v5 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v5, &v9, &v8);
  if (v8 == 7) {
    char v6 = sub_1C4B68ED0((uint64_t)CHRecognizerConfiguration, v9, a4);
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (id)forcedGen2ModelLocaleForLocale:(id)a3
{
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  sub_1C492FBB0((uint64_t)a1, a3, &v9, (uint64_t *)&v10);
  uint64_t v7 = 0;
  if (v9 != 20)
  {
LABEL_4:
    return v7;
  }
  if (v10 <= 8)
  {
    uint64_t v7 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v3, (uint64_t)off_1E64E45E8[v10], v4, v5, v6);
    goto LABEL_4;
  }
  uint64_t v7 = 0;
  return v7;
}

+ (id)effectiveRecognitionLocales:(id)a3 recognitionMode:(int)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11, v6);
  v78 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v13, v14, v15, v16, v17);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v6;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v81, (uint64_t)v85, 16, v19);
  if (!v20)
  {
    char v76 = 0;
    goto LABEL_31;
  }
  char v76 = 0;
  uint64_t v21 = *(void *)v82;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v82 != v21) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = *(void **)(*((void *)&v81 + 1) + 8 * v22);
      uint64_t v79 = 0;
      unint64_t v80 = 0;
      sub_1C492FBB0((uint64_t)a1, v23, &v79, (uint64_t *)&v80);
      uint64_t v28 = v80;
      if (v80 > 8)
      {
        char v29 = 0;
      }
      else
      {
        if (((1 << v80) & 0x1F0) == 0)
        {
          if (((1 << v80) & 3) != 0)
          {
            char v29 = 0;
            v76 |= v79 != 27;
            goto LABEL_12;
          }
          uint64_t v28 = 2;
        }
        unint64_t v30 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v24, v28, v25, v26, v27);
        char v29 = objc_msgSend_containsObject_(v78, v31, (uint64_t)v30, v32, v33, v34);
      }
LABEL_12:
      uint64_t v35 = objc_opt_class();
      uint64_t v40 = objc_msgSend_forcedGen2ModelLocaleForLocale_(v35, v36, (uint64_t)v23, v37, v38, v39);
      uint64_t v41 = (void *)v40;
      if (v40) {
        v42 = (void *)v40;
      }
      else {
        v42 = v23;
      }
      id v48 = v42;
      if ((v29 & 1) == 0 && (objc_msgSend_containsObject_(v12, v43, (uint64_t)v48, v45, v46, v47) & 1) == 0)
      {
        objc_msgSend_addObject_(v12, v43, (uint64_t)v48, v45, v46, v47);
        v53 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v49, v28, v50, v51, v52);
        objc_msgSend_addObject_(v78, v54, (uint64_t)v53, v55, v56, v57);
      }
      unint64_t v58 = objc_msgSend_count(v12, v43, v44, v45, v46, v47);
      BOOL v60 = a4 == 6 || v58 < 2;

      if (!v60) {
        goto LABEL_31;
      }
      ++v22;
    }
    while (v20 != v22);
    uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v81, (uint64_t)v85, 16, v62);
    uint64_t v20 = v63;
  }
  while (v63);
LABEL_31:

  if (!((a4 == 6) | v76 & 1))
  {
    v69 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v64, @"en_US", v66, v67, v68);
    objc_msgSend_addObject_(v12, v70, (uint64_t)v69, v71, v72, v73);
  }
  v74 = objc_msgSend_copy(v12, v64, v65, v66, v67, v68);

  return v74;
}

+ (id)localeForScriptClass:(id)a3
{
  unint64_t v6 = objc_msgSend_integerValue(a3, a2, (uint64_t)a3, v3, v4, v5);
  if (v6 > 0x10)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v7, (uint64_t)off_1E64E4630[v6], v8, v9, v10);
  }
  return v11;
}

+ (id)localesForScriptClassification:(id)a3 selectedScriptCodepoints:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v71 = a4;
  v75 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v11, v12, v13, v14, v15);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v71;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v83, (uint64_t)v88, 16, v18);
  if (v24)
  {
    uint64_t v76 = *(void *)v84;
    while (1)
    {
      uint64_t v25 = 0;
      uint64_t v73 = v24;
LABEL_4:
      if (*(void *)v84 != v76) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void **)(*((void *)&v83 + 1) + 8 * v25);
      uint64_t v27 = objc_msgSend_integerValue(v26, v19, v20, v21, v22, v23);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v28 = v77;
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v79, (uint64_t)v87, 16, v30);
      if (!v31)
      {

LABEL_28:
        objc_msgSend_localeForScriptClass_(a1, v19, (uint64_t)v26, v21, v22, v23);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_containsObject_(v16, v42, (uint64_t)v28, v43, v44, v45) & 1) == 0)
        {
          objc_msgSend_addObject_(v75, v46, (uint64_t)v28, v47, v48, v49);
          objc_msgSend_addObject_(v16, v50, (uint64_t)v28, v51, v52, v53);
        }
LABEL_69:

        goto LABEL_70;
      }
      uint64_t v32 = *(void *)v80;
      v74 = v26;
      if (v27 != 2)
      {
        if (v27 == 9)
        {
          char v33 = 0;
          while (1)
          {
            uint64_t v34 = 0;
            while (2)
            {
              if (*(void *)v80 != v32) {
                objc_enumerationMutation(v28);
              }
              uint64_t v35 = *(void **)(*((void *)&v79 + 1) + 8 * v34);
              uint64_t v78 = 0;
              sub_1C492FBB0((uint64_t)a1, v35, 0, &v78);
              switch(v78)
              {
                case 1:
                  if ((v33 & 1) == 0) {
                    goto LABEL_11;
                  }
                  goto LABEL_23;
                case 2:
                case 3:
                  if (v33) {
                    goto LABEL_23;
                  }
                  goto LABEL_11;
                case 4:
                  if ((v33 & 1) == 0) {
                    goto LABEL_11;
                  }
                  goto LABEL_23;
                case 6:
                  goto LABEL_23;
                default:
                  if ((v33 & 1) == 0)
                  {
LABEL_11:
                    char v33 = 0;
                    if (v31 == ++v34) {
                      goto LABEL_25;
                    }
                    continue;
                  }
LABEL_23:
                  if (!objc_msgSend_containsObject_(v16, v36, (uint64_t)v35, v37, v38, v39)) {
                    goto LABEL_68;
                  }
                  char v33 = 1;
                  if (v31 != ++v34) {
                    continue;
                  }
LABEL_25:
                  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v36, (uint64_t)&v79, (uint64_t)v87, 16, v39);
                  if (!v31) {
                    goto LABEL_66;
                  }
                  break;
              }
              break;
            }
          }
        }
        char v33 = 0;
LABEL_49:
        uint64_t v57 = 0;
        while (1)
        {
          if (*(void *)v80 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v35 = *(void **)(*((void *)&v79 + 1) + 8 * v57);
          uint64_t v78 = 0;
          sub_1C492FBB0((uint64_t)a1, v35, 0, &v78);
          switch(v78)
          {
            case 1:
              if (!((v27 == 7) | v33 & 1)) {
                goto LABEL_50;
              }
              goto LABEL_63;
            case 2:
            case 3:
              if (!((v27 == 4) | v33 & 1)) {
                goto LABEL_50;
              }
              goto LABEL_63;
            case 4:
              if ((v27 == 5) | v33 & 1) {
                goto LABEL_63;
              }
              goto LABEL_50;
            case 5:
              if ((v27 == 6) | v33 & 1) {
                goto LABEL_63;
              }
              goto LABEL_50;
            default:
              if (v33)
              {
LABEL_63:
                if ((objc_msgSend_containsObject_(v16, v36, (uint64_t)v35, v58, v59, v39) & 1) == 0) {
                  goto LABEL_68;
                }
                char v33 = 1;
                if (v31 == ++v57)
                {
LABEL_65:
                  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v36, (uint64_t)&v79, (uint64_t)v87, 16, v39);
                  if (!v31) {
                    goto LABEL_66;
                  }
                  goto LABEL_49;
                }
              }
              else
              {
LABEL_50:
                char v33 = 0;
                if (v31 == ++v57) {
                  goto LABEL_65;
                }
              }
              break;
          }
        }
      }
      char v33 = 0;
LABEL_31:
      uint64_t v54 = 0;
      while (2)
      {
        if (*(void *)v80 != v32) {
          objc_enumerationMutation(v28);
        }
        uint64_t v35 = *(void **)(*((void *)&v79 + 1) + 8 * v54);
        uint64_t v78 = 0;
        sub_1C492FBB0((uint64_t)a1, v35, 0, &v78);
        switch(v78)
        {
          case 1:
            if (!((v27 == 7) | v33 & 1)) {
              goto LABEL_32;
            }
            goto LABEL_44;
          case 2:
          case 3:
            if ((v27 == 4) | v33 & 1) {
              goto LABEL_44;
            }
            goto LABEL_32;
          case 4:
            if (!((v27 == 5) | v33 & 1)) {
              goto LABEL_32;
            }
            goto LABEL_44;
          case 7:
            goto LABEL_44;
          default:
            if ((v33 & 1) == 0)
            {
LABEL_32:
              char v33 = 0;
              if (v31 == ++v54) {
                goto LABEL_46;
              }
              continue;
            }
LABEL_44:
            if (!objc_msgSend_containsObject_(v16, v36, (uint64_t)v35, v55, v56, v39))
            {
LABEL_68:
              objc_msgSend_addObject_(v16, v36, (uint64_t)v35, v40, v41, v39);
              objc_msgSend_addObject_(v75, v60, (uint64_t)v35, v61, v62, v63);
              uint64_t v24 = v73;
              goto LABEL_69;
            }
            char v33 = 1;
            if (v31 != ++v54) {
              continue;
            }
LABEL_46:
            uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v36, (uint64_t)&v79, (uint64_t)v87, 16, v39);
            if (v31) {
              goto LABEL_31;
            }
LABEL_66:

            uint64_t v24 = v73;
            uint64_t v26 = v74;
            if ((v33 & 1) == 0) {
              goto LABEL_28;
            }
LABEL_70:
            if (++v25 != v24) {
              goto LABEL_4;
            }
            uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v83, (uint64_t)v88, 16, v23);
            if (!v24) {
              goto LABEL_72;
            }
            break;
        }
        break;
      }
    }
  }
LABEL_72:

  v69 = objc_msgSend_copy(v75, v64, v65, v66, v67, v68);
  return v69;
}

+ (id)recognitionEngineCachingKeyForRecognitionLocale:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, &v4, 0);
  id result = 0;
  if ((unint64_t)(v4 - 1) <= 0x1A) {
    return off_1E64E46B8[v4 - 1];
  }
  return result;
}

+ (id)localesByLanguageGroup:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v3, v4, v5, v6, v7);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v9 = v56;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v57, (uint64_t)v63, 16, v11);
  if (v12)
  {
    uint64_t v13 = *(void *)v58;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v58 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v57 + 1) + 8 * v14);
        uint64_t v16 = objc_opt_class();
        uint64_t v25 = objc_msgSend_recognitionEngineCachingKeyForRecognitionLocale_(v16, v17, (uint64_t)v15, v18, v19, v20);
        if (!v25)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v26 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_localeIdentifier(v15, v27, v28, v29, v30, v31);
            id v32 = objc_claimAutoreleasedReturnValue();
            uint64_t v38 = objc_msgSend_UTF8String(v32, v33, v34, v35, v36, v37);
            *(_DWORD *)buf = 136315138;
            uint64_t v62 = v38;
            _os_log_impl(&dword_1C492D000, v26, OS_LOG_TYPE_FAULT, "Unexpected locale with identifer %s has no matching engine caching key.", buf, 0xCu);
          }
        }
        uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v8, v21, (uint64_t)v25, v22, v23, v24);
        BOOL v40 = v39 == 0;

        if (v40)
        {
          uint64_t v45 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v41, (uint64_t)v15, v42, v43, v44);
          objc_msgSend_setObject_forKeyedSubscript_(v8, v50, (uint64_t)v45, (uint64_t)v25, v51, v52);
        }
        else
        {
          uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v8, v41, (uint64_t)v25, v42, v43, v44);
          objc_msgSend_addObject_(v45, v46, (uint64_t)v15, v47, v48, v49);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v53, (uint64_t)&v57, (uint64_t)v63, 16, v54);
    }
    while (v12);
  }

  return v8;
}

+ (id)defaultActiveCharacterSetForLocale:(id)a3
{
  uint64_t v10 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, &v10, 0);
  uint64_t v8 = 0;
  if ((unint64_t)(v10 - 1) <= 0x11)
  {
    uint64_t v8 = objc_msgSend_ch_latinCharacterSet(MEMORY[0x1E4F28B88], v3, v4, v5, v6, v7);
  }
  return v8;
}

+ (id)defaultActiveCharacterSetForLocales:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v11 = objc_msgSend_count(v4, v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_dictionaryWithCapacity_(v5, v12, v11, v13, v14, v15);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v4;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v33, (uint64_t)v37, 16, v19);
  if (v24)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v17);
        }
        uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v31 = objc_msgSend_defaultActiveCharacterSetForLocale_(a1, v20, v27, v21, v22, v23, (void)v33);
        if (v31) {
          objc_msgSend_setObject_forKeyedSubscript_(v16, v28, (uint64_t)v31, v27, v29, v30);
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v33, (uint64_t)v37, 16, v23);
    }
    while (v24);
  }

  return v16;
}

+ (BOOL)shouldForceNoAlternativeRecognitionCandidates:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, &v4, 0);
  return (unint64_t)(v4 - 19) < 8;
}

+ (BOOL)shouldUseOriginalTokensForLocale:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v4, (uint64_t)&unk_1F203DD10, v5, v6, v7);
  uint64_t v14 = objc_msgSend_languageCode(v3, v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_lowercaseString(v14, v15, v16, v17, v18, v19);
  char v25 = objc_msgSend_containsObject_(v8, v21, (uint64_t)v20, v22, v23, v24);

  return v25;
}

- (BOOL)isEqualToRecognizerConfiguration:(id)a3
{
  uint64_t v4 = (CHRecognizerConfiguration *)a3;
  uint64_t v10 = v4;
  if (v4)
  {
    if (self == v4)
    {
      LOBYTE(v105) = 1;
      goto LABEL_15;
    }
    int v11 = objc_msgSend_mode(self, v5, v6, v7, v8, v9);
    if (v11 == objc_msgSend_mode(v10, v12, v13, v14, v15, v16))
    {
      int v22 = objc_msgSend_contentType(self, v17, v18, v19, v20, v21);
      if (v22 == objc_msgSend_contentType(v10, v23, v24, v25, v26, v27))
      {
        int v33 = objc_msgSend_autoCapitalizationMode(self, v28, v29, v30, v31, v32);
        if (v33 == objc_msgSend_autoCapitalizationMode(v10, v34, v35, v36, v37, v38))
        {
          int v44 = objc_msgSend_autoCorrectionMode(self, v39, v40, v41, v42, v43);
          if (v44 == objc_msgSend_autoCorrectionMode(v10, v45, v46, v47, v48, v49))
          {
            uint64_t v55 = objc_msgSend_baseWritingDirection(self, v50, v51, v52, v53, v54);
            if (v55 == objc_msgSend_baseWritingDirection(v10, v56, v57, v58, v59, v60)
              && self->_script == v10->_script
              && self->_language == v10->_language)
            {
              uint64_t v66 = objc_msgSend_locale(self, v61, v62, v63, v64, v65);
              uint64_t v72 = objc_msgSend_locale(v10, v67, v68, v69, v70, v71);
              int isEqual = objc_msgSend_isEqual_(v66, v73, (uint64_t)v72, v74, v75, v76);

              if (isEqual)
              {
                int v83 = objc_msgSend_enableCachingIfAvailable(self, v78, v79, v80, v81, v82);
                if (v83 == objc_msgSend_enableCachingIfAvailable(v10, v84, v85, v86, v87, v88))
                {
                  int v94 = objc_msgSend_enableGen2ModelIfAvailable(self, v89, v90, v91, v92, v93);
                  if (v94 == objc_msgSend_enableGen2ModelIfAvailable(v10, v95, v96, v97, v98, v99))
                  {
                    int v107 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v100, v101, v102, v103, v104);
                    int v105 = v107 ^ objc_msgSend_enableGen2CharacterLMIfAvailable(v10, v108, v109, v110, v111, v112) ^ 1;
                    goto LABEL_15;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  LOBYTE(v105) = 0;
LABEL_15:

  return v105;
}

- (id)configurationKey
{
  uint64_t v7 = objc_msgSend_locale(self, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_localeIdentifier(v7, v8, v9, v10, v11, v12);

  if (v13) {
    uint64_t v19 = (__CFString *)v13;
  }
  else {
    uint64_t v19 = @"none";
  }
  uint64_t v20 = NSString;
  unsigned int v21 = objc_msgSend_mode(self, v14, v15, v16, v17, v18);
  int shouldRunNextGenRecognizer = objc_msgSend_shouldRunNextGenRecognizer(self, v22, v23, v24, v25, v26);
  if (!self
    || (int v33 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v27, v28, v29, v30, v31),
        unint64_t language = self->_language,
        language - 1 < 0x12)
    || language - 21 <= 6)
  {
    uint64_t v35 = @"G2";
    if (!shouldRunNextGenRecognizer) {
      uint64_t v35 = @"G1";
    }
    goto LABEL_9;
  }
  if (shouldRunNextGenRecognizer) {
    uint64_t v35 = @"G2";
  }
  else {
    uint64_t v35 = @"G1";
  }
  if (!v33)
  {
LABEL_9:
    objc_msgSend_stringWithFormat_(v20, v27, @"%@-%ld-%@-%@", v29, v30, v31, v19, v21, v35, @"G1");
    goto LABEL_10;
  }
  objc_msgSend_stringWithFormat_(v20, v27, @"%@-%ld-%@-%@", v29, v30, v31, v19, v21, v35, @"G2");
  uint64_t v36 = LABEL_10:;

  return v36;
}

- (BOOL)hasSameResourcesAsConfiguration:(id)a3
{
  uint64_t v9 = (uint64_t *)a3;
  if (!v9)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v10 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "Recognizer configuration needs to be defined", buf, 2u);
    }
  }
  if (objc_msgSend_mode(v9, v4, v5, v6, v7, v8) != self->_mode
    || self->_enableGen2ModelIfAvailable != objc_msgSend_enableGen2ModelIfAvailable(v9, v11, v12, v13, v14, v15)|| self->_enableGen2CharacterLMIfAvailable != objc_msgSend_enableGen2CharacterLMIfAvailable(v9, v16, v17, v18, v19, v20))
  {
    BOOL v30 = 0;
    goto LABEL_20;
  }
  uint64_t v32 = 0;
  *(void *)buf = 0;
  uint64_t v26 = objc_msgSend_locale(v9, v21, v22, v23, v24, v25);
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v26, (uint64_t *)buf, &v32);

  unint64_t language = self->_language;
  if (self->_contentType == 6) {
    unint64_t v28 = 1;
  }
  else {
    unint64_t v28 = self->_language;
  }
  if (!v9)
  {
    uint64_t v29 = 0;
    BOOL v30 = 0;
    if (*(void *)buf != language) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  uint64_t v29 = v9[1];
  if (*((_DWORD *)v9 + 8) == 6) {
    uint64_t v29 = 1;
  }
  BOOL v30 = 0;
  if (*(void *)buf == language)
  {
LABEL_17:
    if (v28 == v29) {
      BOOL v30 = v32 == self->_script;
    }
  }
LABEL_20:

  return v30;
}

- (BOOL)hasSamePostProcessingAsConfiguration:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v10 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v85 = 0;
      _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "Recognizer configuration needs to be defined", v85, 2u);
    }
  }
  int v11 = objc_msgSend_effectiveAutoCapitalizationMode(v9, v4, v5, v6, v7, v8);
  if (v11 == objc_msgSend_effectiveAutoCapitalizationMode(self, v12, v13, v14, v15, v16)
    && (int v22 = objc_msgSend_autoCorrectionMode(v9, v17, v18, v19, v20, v21),
        v22 == objc_msgSend_autoCorrectionMode(self, v23, v24, v25, v26, v27))
    && (uint64_t v33 = objc_msgSend_baseWritingDirection(v9, v28, v29, v30, v31, v32),
        v33 == objc_msgSend_baseWritingDirection(self, v34, v35, v36, v37, v38))
    && (int shouldTransliterateHalfWidthPunctuations = objc_msgSend_shouldTransliterateHalfWidthPunctuations(v9, v39, v40, v41, v42, v43), shouldTransliterateHalfWidthPunctuations == objc_msgSend_shouldTransliterateHalfWidthPunctuations(self, v45, v46, v47, v48, v49))&& (shouldApplySemanticTokenization = objc_msgSend_shouldApplySemanticTokenization(v9, v50, v51, v52, v53, v54), shouldApplySemanticTokenization == objc_msgSend_shouldApplySemanticTokenization(self, v56, v57, v58,
                                                           v59,
                                                           v60))
    && (int shouldIdentifyChangeableColumns = objc_msgSend_shouldIdentifyChangeableColumns(v9, v61, v62, v63, v64, v65),
        shouldIdentifyChangeableColumns == objc_msgSend_shouldIdentifyChangeableColumns(self, v67, v68, v69, v70, v71)))
  {
    int shouldMarkNoWhiteSpaceColumnsChangeable = objc_msgSend_shouldMarkNoWhiteSpaceColumnsChangeable(v9, v72, v73, v74, v75, v76);
    int v77 = shouldMarkNoWhiteSpaceColumnsChangeable ^ objc_msgSend_shouldMarkNoWhiteSpaceColumnsChangeable(self, v80, v81, v82, v83, v84) ^ 1;
  }
  else
  {
    LOBYTE(v77) = 0;
  }

  return v77;
}

- (BOOL)shouldGenerateDigitLetterAlternatives
{
  return self->_script == 1;
}

- (BOOL)shouldEnforceGrammarOnTransliterations
{
  return self->_script == 1 && self->_mode != 1;
}

- (unint64_t)supportedSegmentationStrategy
{
  return self->_script == 1 && self->_mode == 5;
}

- (BOOL)shouldApplyRomanPostProcessing
{
  return self->_script == 1;
}

- (BOOL)shouldApplyChinesePostProcessing
{
  return (self->_script & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)shouldRefineChineseCharacterCandidates
{
  if (self->_script - 2 > 2) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v3 = mode >= 6;
  BOOL v4 = mode == 6;
  unsigned int v5 = (0x54u >> mode) & 1;
  if (!v4 && v3) {
    return 0;
  }
  else {
    return v5;
  }
}

- (BOOL)shouldLoadCJKLexicons
{
  return (objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5) & 1) == 0 && self->_script - 2 < 4;
}

- (BOOL)shouldComposeLexiconWithNetwork
{
  return self->_script - 2 < 4;
}

- (BOOL)shouldExpandLexiconInNetwork
{
  return self->_script == 1;
}

- (BOOL)shouldApplyLexicalPenalty
{
  return (self->_contentType > 7u) | (0x39u >> self->_contentType) & 1;
}

- (BOOL)shouldApplyDiacriticSensitivity
{
  return (self->_language < 0x1B) & (0x707EE7Cu >> self->_language);
}

- (BOOL)shouldExpandCodePoints
{
  return self->_script == 1 && self->_mode == 4;
}

- (BOOL)shouldRunNextGenRecognizer
{
  BOOL result = 0;
  switch(self->_mode)
  {
    case 1:
    case 2:
    case 6:
      BOOL result = 1;
      break;
    case 4:
      BOOL result = self->_language < 0x1C;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)skipLatinActivationThreshold
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_objectForKey_(0, a2, @"SkipLatinProbabilityThreshold", v2, v3, v4);
  if (v5)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v6 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEFAULT, "shouldSkipLatinActivation from override weights: %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend_floatValue(v5, v7, v8, v9, v10, v11);
    double v13 = v12;
  }
  else
  {
    double v13 = 0.01;
  }

  return v13;
}

- (BOOL)shouldPenalizePrefixes
{
  return (self->_mode < 7u) & (0x54u >> self->_mode);
}

- (BOOL)shouldPerformGlobalBestSearch
{
  return self->_mode == 5;
}

- (BOOL)shouldPerformGlobalBestSearchWithSmallLattice
{
  int mode = self->_mode;
  if (mode == 5) {
    return 1;
  }
  if (mode == 4) {
    return self->_script == 1;
  }
  return 0;
}

- (BOOL)shouldPerformIntegratedLexiconExpansion
{
  return self->_script == 1;
}

- (BOOL)shouldFallbackOnSingleCharacterExpansion
{
  return self->_mode == 4;
}

- (BOOL)shouldComputeStrokePenalties
{
  return self->_mode == 5;
}

- (BOOL)shouldPenalizeLetterInsertion
{
  return self->_script == 1 && self->_mode == 4;
}

- (BOOL)shouldApplyCandidatesThresholding
{
  return self->_script - 2 < 3;
}

- (BOOL)shouldRelaxFinalCandidatesThresholding
{
  if (self->_script - 2 > 2) {
    return 0;
  }
  int mode = self->_mode;
  return mode == 4 || mode == 2;
}

- (BOOL)shouldFilterLowProbabilityTranscriptionPaths
{
  return self->_mode == 4;
}

- (BOOL)shouldAutoCapitalize
{
  objc_msgSend_effectiveAutoCapitalizationMode(self, a2, v2, v3, v4, v5);
  return 0;
}

- (int)effectiveAutoCapitalizationMode
{
  if ((self->_autoCapitalizationMode & 0xFFFFFFFD) == 1 && self->_language == 27) {
    return 6;
  }
  else {
    return self->_autoCapitalizationMode;
  }
}

- (BOOL)shouldCreatePseudoTokens
{
  return self->_script != 7;
}

- (BOOL)shouldAutoCorrect
{
  unint64_t script = self->_script;
  int autoCorrectionMode = self->_autoCorrectionMode;
  if (autoCorrectionMode) {
    return autoCorrectionMode != 2 && script != 8;
  }
  return (self->_contentType - 8) < 0xFFFFFFF9 && script != 8;
}

- (BOOL)unsafeForSpellCorrection
{
  return self->_script == 7;
}

- (BOOL)shouldRunLexiconCorrectionPostProcessingStep
{
  if (objc_msgSend_shouldAutoCapitalize(self, a2, v2, v3, v4, v5)) {
    return 1;
  }
  return objc_msgSend_shouldAutoCorrect(self, v7, v8, v9, v10, v11);
}

- (BOOL)shouldApplyLMRescoring
{
  return self->_language - 19 < 4;
}

- (BOOL)shouldApplyLMSorting
{
  return self->_script == 1 && self->_mode == 4;
}

- (BOOL)shouldTransliterateAndSynthetizeCandidates
{
  return self->_language - 19 < 3;
}

- (BOOL)shouldTransliterateSentencesSCTC
{
  return self->_script == 3;
}

- (BOOL)shouldReorderSCTCConfusion
{
  return self->_script == 2;
}

- (BOOL)shouldRecoverCyrillicCandidates
{
  return self->_script == 7;
}

- (BOOL)shouldRemoveInvalidArabicDiacritics
{
  return self->_script == 8;
}

- (BOOL)shouldUseCaching
{
  int v7 = objc_msgSend_enableCachingIfAvailable(self, a2, v2, v3, v4, v5);
  if (v7) {
    LOBYTE(v7) = self->_script != 1 || self->_mode != 4;
  }
  return v7;
}

- (BOOL)shouldPreserveLegacyTranscriptionPaths
{
  return self->_language - 19 < 2;
}

- (BOOL)shouldUseTokenPrecedingSpaces
{
  return self->_language - 22 < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)shouldReplaceInvalidTokenIDs
{
  return self->_mode == 1;
}

- (BOOL)shouldTransformCharacterProbabilitiesIntoLogScores
{
  return (self->_mode < 7u) & (0x74u >> self->_mode);
}

- (BOOL)shouldPromoteCJKCommonCharacters
{
  return self->_script - 2 < 4;
}

- (BOOL)shouldMarkMultiWordOVS
{
  return self->_script - 2 < 3;
}

- (BOOL)shouldKeepOutOfPatternCandidates
{
  return self->_script - 2 < 7;
}

- (BOOL)shouldKeepDuplicateTokenIDs
{
  return self->_mode == 5;
}

- (BOOL)shouldRefineCandidates
{
  return self->_script - 2 > 2 || self->_mode == 2;
}

- (BOOL)shouldDetectChinesePunctuation
{
  return (self->_script < 7) & (0x5Cu >> self->_script);
}

- (BOOL)shouldDetectRomanPunctuation
{
  return self->_script == 1;
}

- (BOOL)shouldTreatAllSmallStrokesAsPunctuation
{
  return self->_mode == 5;
}

- (BOOL)shouldTransliterateHalfWidthPunctuations
{
  return self->_script - 2 < 3;
}

- (BOOL)shouldAddAlternativeWidthCandidates
{
  return self->_script == 4;
}

- (BOOL)shouldApplySemanticTokenization
{
  unint64_t script = self->_script;
  BOOL v3 = script >= 6;
  BOOL v5 = script == 6;
  uint64_t v4 = (1 << script) & 0x5C;
  BOOL v5 = !v5 && v3 || v4 == 0;
  return !v5 && self->_mode != 2;
}

- (BOOL)shouldIdentifyChangeableColumns
{
  return (self->_script < 9) & (0x17Cu >> self->_script);
}

- (BOOL)shouldMarkNoWhiteSpaceColumnsChangeable
{
  unint64_t script = self->_script;
  BOOL v3 = script > 6;
  uint64_t v4 = (1 << script) & 0x5C;
  if (v3 || v4 == 0) {
    return 0;
  }
  int mode = self->_mode;
  return mode == 4 || mode == 2;
}

- (BOOL)shouldRemoveSpacesFromHashtagsAndMentions
{
  return self->_mode == 6;
}

- (BOOL)shouldPerformArabicPostProcessing
{
  return self->_script == 8;
}

- (BOOL)shouldPromoteInLexiconCandidates
{
  return self->_script - 7 < 2;
}

- (BOOL)shouldConvertKanaInPostProcessing
{
  return self->_script == 4 && self->_mode != 2;
}

- (BOOL)shouldUpdateChangeableColumnCountWithPhraseLexicon
{
  return self->_script == 1;
}

- (unsigned)requiredInappropriateFilteringFlags
{
  unsigned int result = 0;
  unsigned int mode = self->_mode;
  if (mode <= 6)
  {
    int v5 = 1 << mode;
    if ((v5 & 0x54) != 0)
    {
      BOOL v6 = self->_script == 5;
      unsigned int v7 = 25165824;
      unsigned int v8 = 25165826;
    }
    else
    {
      if ((v5 & 0x22) == 0) {
        return result;
      }
      BOOL v6 = self->_script == 5;
      unsigned int v7 = 58720256;
      unsigned int v8 = 58720258;
    }
    if (v6) {
      return v8;
    }
    else {
      return v7;
    }
  }
  return result;
}

- (int)mecabraInputMethodType
{
  switch(self->_script)
  {
    case 2uLL:
      int result = 11;
      break;
    case 3uLL:
      if (self->_language == 20) {
        int result = 14;
      }
      else {
        int result = 12;
      }
      break;
    case 4uLL:
      int result = 1;
      break;
    case 5uLL:
      int result = 17;
      break;
    default:
      int result = 0;
      break;
  }
  return result;
}

- (BOOL)shouldForwardMecabraOTAAssetsUpdate
{
  return self->_language == 20;
}

- (int64_t)precedingSpaceDefaultBehavior
{
  unint64_t v2 = self->_script - 2;
  if (v2 > 4) {
    return 0;
  }
  else {
    return qword_1C4C447E0[v2];
  }
}

- (id)forcedActiveCharacterSet
{
  if (self->_script == 7 && self->_mode == 4)
  {
    if (self->_language == 25)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28E58]);
      float v12 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v7, v8, v9, v10, v11);
      objc_msgSend_formUnionWithCharacterSet_(v6, v13, (uint64_t)v12, v14, v15, v16);

      int v22 = objc_msgSend_ch_russianOnlyCharacterSet(MEMORY[0x1E4F28B88], v17, v18, v19, v20, v21);
      objc_msgSend_formUnionWithCharacterSet_(v6, v23, (uint64_t)v22, v24, v25, v26);
    }
    else
    {
      objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], a2, v2, v3, v4, v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v34 = objc_msgSend_invertedSet(v6, v27, v28, v29, v30, v31);

    uint64_t v32 = (void *)v34;
  }
  else
  {
    uint64_t v32 = 0;
  }
  return v32;
}

- (id)linguisticResourcesFallbackLocale
{
  if (self->_language == 20)
  {
    uint64_t v5 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], a2, @"zh_hant", v2, v3, v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (_LXLexicon)newStaticLexicon:(id *)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v7 = mode > 6;
  int v8 = (1 << mode) & 0x76;
  if (v7 || v8 == 0) {
    return 0;
  }
  unint64_t script = self->_script;
  if (script > 8)
  {
    uint64_t v17 = 0;
    if (!a3) {
      return v17;
    }
    goto LABEL_17;
  }
  if (((1 << script) & 0x1A2) != 0)
  {
    uint64_t v23 = *MEMORY[0x1E4F72458];
    float v12 = objc_msgSend_localeIdentifier(self->_locale, a2, (uint64_t)a3, v3, v4, v5);
    v24[0] = v12;
    uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v24, (uint64_t)&v23, 1, v14);

    uint64_t v16 = LXLexiconCreate();
    goto LABEL_12;
  }
  uint64_t v17 = 0;
  if (((1 << script) & 0x1C) != 0)
  {
    if (objc_msgSend_shouldRunNextGenRecognizer(self, a2, (uint64_t)a3, v3, v4, v5))
    {
      uint64_t v21 = *MEMORY[0x1E4F72458];
      int v22 = @"en_US";
      uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)&v22, (uint64_t)&v21, 1, v19);
      uint64_t v16 = LXLexiconCreate();
LABEL_12:
      uint64_t v17 = (_LXLexicon *)v16;

      if (!a3) {
        return v17;
      }
      goto LABEL_17;
    }
    uint64_t v17 = 0;
  }
  if (a3) {
LABEL_17:
  }
    *a3 = 0;
  return v17;
}

- (_LXLexicon)newSecondaryStaticLexicon:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v5 = mode > 6;
  int v6 = (1 << mode) & 0x76;
  if (v5 || v6 == 0) {
    return 0;
  }
  uint64_t v9 = 0;
  if (self->_script == 5)
  {
    uint64_t v12 = *MEMORY[0x1E4F72458];
    v13[0] = @"en_US";
    uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v13, (uint64_t)&v12, 1, v3);
    uint64_t v9 = (_LXLexicon *)LXLexiconCreate();
  }
  if (a3) {
    *a3 = 0;
  }
  return v9;
}

- (_LXLexicon)postProcessorLexiconWithStaticLexicon:(_LXLexicon *)a3 secondaryLexicon:(_LXLexicon *)a4
{
  if (self->_script == 5) {
    return a4;
  }
  else {
    return a3;
  }
}

- (_LXLexicon)newPhraseLexicon:(id *)a3
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v8 = mode > 6;
  int v9 = (1 << mode) & 0x76;
  BOOL v10 = v8 || v9 == 0;
  if (v10
    || !objc_msgSend_shouldRunNextGenRecognizer(self, a2, (uint64_t)a3, v3, v4, v5)
    || self->_mode == 5)
  {
    return 0;
  }
  uint64_t v17 = 0;
  if (self->_script == 1)
  {
    v23[0] = *MEMORY[0x1E4F72458];
    uint64_t v19 = objc_msgSend_localeIdentifier(self->_locale, v12, v13, v14, v15, v16);
    v23[1] = *MEMORY[0x1E4F72470];
    v24[0] = v19;
    v24[1] = *MEMORY[0x1E4F72478];
    int v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v24, (uint64_t)v23, 2, v21);

    uint64_t v17 = (_LXLexicon *)LXLexiconCreate();
  }
  if (a3) {
    *a3 = 0;
  }
  return v17;
}

- (void)newCJKStaticLexicon
{
  v44[2] = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v8 = mode > 6;
  int v9 = (1 << mode) & 0x76;
  BOOL v10 = v8 || v9 == 0;
  if (v10 || !objc_msgSend_shouldLoadCJKLexicons(self, a2, v2, v3, v4, v5)) {
    return 0;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F723C8];
  v43[0] = *MEMORY[0x1E4F723C8];
  uint64_t v17 = objc_msgSend_localeIdentifier(self->_locale, v11, v12, v13, v14, v15);
  uint64_t v18 = (void *)MEMORY[0x1E4F723F0];
  v43[1] = *MEMORY[0x1E4F723F0];
  uint64_t v19 = MEMORY[0x1E4F1CC28];
  v44[0] = v17;
  v44[1] = MEMORY[0x1E4F1CC28];
  int v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v44, (uint64_t)v43, 2, v21);

  uint64_t v28 = (void *)LMLexiconCreate();
  if (!v28)
  {
    uint64_t v29 = objc_msgSend_linguisticResourcesFallbackLocale(self, v23, v24, v25, v26, v27);
    uint64_t v35 = v29;
    if (v29)
    {
      v41[0] = *v16;
      uint64_t v36 = objc_msgSend_localeIdentifier(v29, v30, v31, v32, v33, v34);
      v41[1] = *v18;
      v42[0] = v36;
      v42[1] = v19;
      uint64_t v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)v42, (uint64_t)v41, 2, v38);

      uint64_t v28 = (void *)LMLexiconCreate();
      int v22 = (void *)v39;
    }
    else
    {
      uint64_t v28 = 0;
    }
  }
  return v28;
}

- (void)newWordLanguageModel
{
  return objc_msgSend_newWordLanguageModelForRecognizer_async_synchronizationQueue_(self, a2, 0, 0, 0, v2);
}

- (void)newWordLanguageModelForRecognizer:(id)a3 async:(BOOL)a4 synchronizationQueue:(id)a5
{
  BOOL v6 = a4;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v89 = a3;
  id v13 = a5;
  uint64_t v14 = 0;
  switch(self->_mode)
  {
    case 1:
      if (objc_msgSend_shouldApplyLMRescoring(self, v8, v9, v10, v11, v12)) {
        goto LABEL_2;
      }
      uint64_t v14 = 0;
      goto LABEL_34;
    case 2:
    case 4:
    case 6:
LABEL_2:
      uint64_t v15 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9, v10, v11, v12, v89);
      uint64_t v21 = objc_msgSend_localeIdentifier(self->_locale, v16, v17, v18, v19, v20);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v22, (uint64_t)v21, *MEMORY[0x1E4F723C8], v23, v24);

      objc_msgSend_setObject_forKeyedSubscript_(v15, v25, MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F723F0], v26, v27);
      if (self->_script == 1)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v15, v28, MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F72358], v29, v30);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v31, (uint64_t)&unk_1F203F018, *MEMORY[0x1E4F723D0], v32, v33);
      }
      uint64_t v34 = objc_msgSend_pathForLanguageModelForLocale_modelType_resourceType_(MEMORY[0x1E4F56758], v28, (uint64_t)self->_locale, 2, 1, v30);
      uint64_t v40 = v34;
      if (v34)
      {
        uint64_t v41 = objc_msgSend_lastPathComponent(v34, v35, v36, v37, v38, v39);
        uint64_t v47 = objc_msgSend_stringByDeletingPathExtension(v41, v42, v43, v44, v45, v46);

        uint64_t v53 = objc_msgSend_stringByDeletingLastPathComponent(v40, v48, v49, v50, v51, v52);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v54, (uint64_t)v53, *MEMORY[0x1E4F72380], v55, v56);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v57, (uint64_t)v47, *MEMORY[0x1E4F72370], v58, v59);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v60, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F72360], v61, v62);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v63, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F723B8], v64, v65);
        if (qword_1EA3CA000 == -1)
        {
          uint64_t v66 = (id)qword_1EA3C9F98;
          if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
LABEL_8:

            goto LABEL_12;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          uint64_t v66 = (id)qword_1EA3C9F98;
          if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_8;
          }
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v97 = (const char *)v40;
        _os_log_impl(&dword_1C492D000, v66, OS_LOG_TYPE_DEBUG, "Attempting to load wordLM from %@", buf, 0xCu);
        goto LABEL_8;
      }
      if (qword_1EA3CA000 == -1)
      {
        uint64_t v47 = (id)qword_1EA3C9F98;
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v47 = (id)qword_1EA3C9F98;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v47, OS_LOG_TYPE_DEBUG, "Attempting to load wordLM from default LanguageModeling search path", buf, 2u);
      }
LABEL_12:

      if (v6)
      {
        uint64_t v72 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1CA60], v67, (uint64_t)v15, v69, v70, v71);
        objc_msgSend_setObject_forKeyedSubscript_(v72, v73, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F723E0], v74, v75);
        uint64_t v81 = objc_msgSend_linguisticResourcesFallbackLocale(self, v76, v77, v78, v79, v80);
        uint64_t v14 = (void *)sub_1C4B6BC00((uint64_t)CHRecognizerConfiguration, v72, v81);

        if (!v13)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v82 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v82, OS_LOG_TYPE_FAULT, "Synchronization queue can not be nil when async loading language models.", buf, 2u);
          }
        }
        if (!v89)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v83 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v83, OS_LOG_TYPE_FAULT, "Recognizer can not be nil when async loading language models.", buf, 2u);
          }
        }
        if (qword_1EA3C9468 != -1) {
          dispatch_once(&qword_1EA3C9468, &unk_1F2012F70);
        }
        uint64_t v84 = qword_1EA3C9460;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4B6C47C;
        block[3] = &unk_1E64E2500;
        uint64_t v91 = v15;
        uint64_t v92 = self;
        v95 = v14;
        id v93 = v13;
        id v94 = v89;
        dispatch_async(v84, block);

        uint64_t v85 = v91;
      }
      else
      {
        uint64_t v86 = objc_msgSend_linguisticResourcesFallbackLocale(self, v67, v68, v69, v70, v71);
        uint64_t v14 = (void *)sub_1C4B6BC00((uint64_t)CHRecognizerConfiguration, v15, v86);

        if (qword_1EA3CA000 == -1)
        {
          uint64_t v85 = (id)qword_1EA3C9F98;
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_33;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          uint64_t v85 = (id)qword_1EA3C9F98;
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_33;
          }
        }
        uint64_t v87 = "has";
        if (!v14) {
          uint64_t v87 = "has not";
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v97 = v87;
        _os_log_impl(&dword_1C492D000, v85, OS_LOG_TYPE_DEBUG, "wordLM %s been loaded", buf, 0xCu);
      }
LABEL_33:

LABEL_34:
      return v14;
    default:
      goto LABEL_34;
  }
}

- (id)newSpellChecker
{
  if (!self) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v8 = mode > 6;
  int v9 = (1 << mode) & 0x76;
  if (v8 || v9 == 0) {
    return 0;
  }
  if (objc_msgSend_unsafeForSpellCorrection(self, a2, v2, v3, v4, v5)) {
    return 0;
  }
  if (!self->_enableGen2ModelIfAvailable) {
    return 0;
  }
  unsigned int v11 = self->_mode;
  if (v11 > 6 || ((1 << v11) & 0x54) == 0) {
    return 0;
  }
  return objc_alloc_init(CHSpellChecker);
}

- (void)newCharacterLanguageModelAndMap:(void *)a3 force:(BOOL)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self);
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  if (v4)
  {
    uint64_t v7 = v4;
    unsigned int v8 = *(_DWORD *)(v4 + 28);
    if (v8 <= 6 && ((1 << v8) & 0x76) != 0)
    {
      uint64_t v10 = v5;
      if (!*(unsigned char *)(v4 + 25))
      {
        unsigned int v11 = (v8 < 7) & (0x74u >> v8);
        if ((unint64_t)(*(void *)(v4 + 8) - 19) < 2) {
          LOBYTE(v11) = 1;
        }
        if (v11) {
          goto LABEL_12;
        }
      }
      if (v6)
      {
LABEL_12:
        bzero(v169, 0x400uLL);
        firstMatchingResourceForLocale(*(NSLocale **)(v7 + 48), &stru_1F20141C8.isa, &cfstr_Lm.isa, v169);
        uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F1CB10];
          objc_msgSend_stringWithUTF8String_(NSString, v13, (uint64_t)v169, v15, v16, v17);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = objc_msgSend_URLWithString_(v19, v21, (uint64_t)v20, v22, v23, v24);
          goto LABEL_20;
        }
        uint64_t v26 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14, v15, v16, v17);
        v159[1] = (id)MEMORY[0x1E4F143A8];
        v159[2] = (id)3221225472;
        v159[3] = sub_1C4B6CED0;
        v159[4] = &unk_1E64E4370;
        id v20 = v26;
        id v160 = v20;
        uint64_t v161 = v7;
        LDEnumerateAssetDataItems();
        uint64_t v32 = objc_msgSend_localeIdentifier(*(void **)(v7 + 48), v27, v28, v29, v30, v31);
        uint64_t v37 = objc_msgSend_objectForKey_(v20, v33, (uint64_t)v32, v34, v35, v36);
        BOOL v38 = v37 == 0;

        uint64_t v44 = *(void **)(v7 + 48);
        if (v38)
        {
          uint64_t v50 = objc_msgSend_languageCode(v44, v39, v40, v41, v42, v43);
          uint64_t v55 = objc_msgSend_objectForKey_(v20, v51, (uint64_t)v50, v52, v53, v54);
          BOOL v56 = v55 == 0;

          if (v56)
          {
            uint64_t v18 = 0;
            uint64_t v25 = 0;
            goto LABEL_19;
          }
          objc_msgSend_languageCode(*(void **)(v7 + 48), v57, v58, v59, v60, v61);
          uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v49 = objc_msgSend_objectForKey_(v20, v62, (uint64_t)v18, v63, v64, v65);
        }
        else
        {
          objc_msgSend_localeIdentifier(v44, v39, v40, v41, v42, v43);
          uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v49 = objc_msgSend_objectForKey_(v20, v45, (uint64_t)v18, v46, v47, v48);
        }
        uint64_t v25 = (void *)v49;
LABEL_19:

LABEL_20:
        if (v25) {
          goto LABEL_21;
        }
        if (*(void *)(v7 + 8) == 6)
        {

          uint64_t v25 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v129, @"/System/Library/PrivateFrameworks/TextRecognition.framework/pt_BR.lm", v130, v131, v132);
          v159[0] = 0;
          char v137 = objc_msgSend_checkResourceIsReachableAndReturnError_(v25, v133, (uint64_t)v159, v134, v135, v136);
          id v138 = v159[0];
          if ((v137 & 1) == 0)
          {
            v155 = v138;

            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            log = (id)qword_1EA3C9F98;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v145 = objc_msgSend_absoluteString(0, v140, v141, v142, v143, v144);
              v151 = objc_msgSend_debugDescription(v155, v146, v147, v148, v149, v150);
              *(_DWORD *)__str = 138412546;
              v163 = v145;
              __int16 v164 = 2112;
              v165 = v151;
              _os_log_impl(&dword_1C492D000, log, OS_LOG_TYPE_ERROR, "Failed to load n-gram model from TextRecognition.framework at location %@ with error %@", (uint8_t *)__str, 0x16u);
            }
            uint64_t v25 = 0;
            uint64_t v12 = 0;
            uint64_t v18 = @"pt_BR";
LABEL_47:

LABEL_50:
            return v12;
          }

          uint64_t v18 = @"pt_BR";
          if (v25)
          {
LABEL_21:
            v155 = objc_msgSend_path(v25, v66, v67, v68, v69, v70);
            v156 = v25;
            v157 = v18;
            uint64_t v76 = objc_msgSend_lastPathComponent(v155, v71, v72, v73, v74, v75);
            log = objc_msgSend_stringByDeletingPathExtension(v76, v77, v78, v79, v80, v81);

            uint64_t v87 = objc_msgSend_stringByDeletingLastPathComponent(v155, v82, v83, v84, v85, v86);
            uint64_t v88 = *MEMORY[0x1E4F72358];
            v167[0] = *MEMORY[0x1E4F723C8];
            v167[1] = v88;
            v168[0] = v18;
            v168[1] = MEMORY[0x1E4F1CC28];
            uint64_t v89 = *MEMORY[0x1E4F72370];
            v167[2] = *MEMORY[0x1E4F72380];
            v167[3] = v89;
            v153 = (void *)v87;
            v168[2] = v87;
            v168[3] = log;
            uint64_t v92 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v90, (uint64_t)v168, (uint64_t)v167, 4, v91);
            uint64_t v12 = (void *)LMLanguageModelCreate();
            if (v10)
            {
              bzero(v166, 0x400uLL);
              v152 = v92;
              objc_msgSend_lastPathComponent(v25, v93, v94, v95, v96, v97);
              id v98 = objc_claimAutoreleasedReturnValue();
              uint64_t v104 = (const char *)objc_msgSend_UTF8String(v98, v99, v100, v101, v102, v103);
              BOOL v105 = pathForResource("corpus.wid", v104, v166);

              if (v105)
              {
                v106 = fopen((const char *)v166, "r");
                if (fgets(__str, 4096, v106))
                {
                  int v107 = v10 + 1;
                  do
                  {
                    v108 = strtok(__str, " \t\n\r\b");
                    if (v108)
                    {
                      v113 = objc_msgSend_stringWithUTF8String_(NSString, v109, (uint64_t)v108, v110, v111, v112);
                      unsigned int CodepointInString = objc_msgSend_firstCodepointInString(v113, v114, v115, v116, v117, v118);

                      int v158 = 0;
                      v120 = strtok(0, " \t\n\r\b");
                      if (v120)
                      {
                        sscanf(v120, "%d", &v158);
                        int v121 = v158;
                        v122 = *v107;
                        v123 = v10 + 1;
                        v124 = v10 + 1;
                        if (*v107)
                        {
                          while (1)
                          {
                            while (1)
                            {
                              v124 = (uint64_t **)v122;
                              unsigned int v125 = *((_DWORD *)v122 + 7);
                              if (CodepointInString >= v125) {
                                break;
                              }
                              v122 = *v124;
                              v123 = v124;
                              if (!*v124) {
                                goto LABEL_37;
                              }
                            }
                            if (v125 >= CodepointInString) {
                              break;
                            }
                            v122 = v124[1];
                            if (!v122)
                            {
                              v123 = v124 + 1;
                              goto LABEL_37;
                            }
                          }
                          v126 = v124;
                        }
                        else
                        {
LABEL_37:
                          v126 = operator new(0x28uLL);
                          v126[7] = CodepointInString;
                          v126[8] = 0;
                          *(void *)v126 = 0;
                          *((void *)v126 + 1) = 0;
                          *((void *)v126 + 2) = v124;
                          *v123 = (uint64_t *)v126;
                          v127 = (uint64_t *)**v10;
                          v128 = (uint64_t *)v126;
                          if (v127)
                          {
                            *uint64_t v10 = v127;
                            v128 = *v123;
                          }
                          sub_1C4949FD4(v10[1], v128);
                          v10[2] = (uint64_t *)((char *)v10[2] + 1);
                        }
                        v126[8] = v121;
                        uint64_t v25 = v156;
                        uint64_t v18 = v157;
                      }
                    }
                  }
                  while (fgets(__str, 4096, v106));
                }
                fclose(v106);
              }
              uint64_t v92 = v152;
            }

            goto LABEL_47;
          }
        }
        else
        {
          uint64_t v25 = 0;
        }
        uint64_t v12 = 0;
        goto LABEL_50;
      }
    }
  }
  return 0;
}

- (id)newOVSStringCheckerWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v8 = mode > 6;
  int v9 = (1 << mode) & 0x76;
  if (v8 || v9 == 0) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_requiredInappropriateFilteringFlags(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  unint64_t language = self->_language;
  BOOL v8 = language > 0x17;
  uint64_t v15 = (1 << language) & 0xE80000;
  if (v8 || v15 == 0)
  {
    uint64_t v23 = 0;
  }
  else
  {
    bzero(v34, 0x400uLL);
    uint64_t v21 = firstMatchingResourceForLocale(self->_locale, &stru_1F20141C8.isa, &cfstr_Odat.isa, (UInt8 *)v34);
    if (v21)
    {
      uint64_t v22 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)v34, v18, v19, v20);
      uint64_t v23 = CFBurstTrieCreateFromFile();
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  uint64_t v25 = [CHStringOVSChecker alloc];
  uint64_t v31 = objc_msgSend_lexiconStringNormalizationFunction(self, v26, v27, v28, v29, v30);
  uint64_t v24 = objc_msgSend_initWithTrie_staticLexicon_customLexicon_flags_stringNormalizationFunction_(v25, v32, v23, (uint64_t)a3, (uint64_t)a4, v13, v31);
  if (v23) {
    CFBurstTrieRelease();
  }
  return v24;
}

- (id)newPatternFST
{
  if (!self) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v3 = mode > 6;
  int v4 = (1 << mode) & 0x76;
  BOOL v5 = v3 || v4 == 0;
  if (v5 || self->_enableGen2ModelIfAvailable) {
    return 0;
  }
  uint64_t v7 = [CHPatternNetwork alloc];
  return (id)objc_msgSend_initWithFile_(v7, v8, @"P.bin", v9, v10, v11);
}

- (id)sharedPostProcessingFST
{
  if (self)
  {
    unsigned int mode = self->_mode;
    BOOL v4 = mode > 6;
    int v5 = (1 << mode) & 0x76;
    BOOL v6 = v4 || v5 == 0;
    if (v6 || !self->_enableGen2ModelIfAvailable)
    {
      self = 0;
    }
    else
    {
      if (qword_1EA3C9478 != -1) {
        dispatch_once(&qword_1EA3C9478, &unk_1F2013B08);
      }
      self = (CHRecognizerConfiguration *)(id)qword_1EA3C9470;
    }
    uint64_t v2 = vars8;
  }
  return self;
}

- (void)newGrammarFST
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    unsigned int mode = self->_mode;
    BOOL v7 = mode > 6;
    int v8 = (1 << mode) & 0x76;
    BOOL v9 = v7 || v8 == 0;
    if (!v9
      && self->_language - 19 <= 1
      && (objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5) & 1) == 0
      && pathForResource("G.bin", 0, __s))
    {
      operator new();
    }
  }
  return 0;
}

- (void)newRadicalClusterFST
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    unsigned int mode = self->_mode;
    BOOL v7 = mode > 6;
    int v8 = (1 << mode) & 0x76;
    BOOL v9 = v7 || v8 == 0;
    if (!v9
      && self->_language - 19 <= 1
      && (objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5) & 1) == 0
      && pathForResource("R.bin", 0, __s))
    {
      operator new();
    }
  }
  return 0;
}

- (id)newMecabraWrapper
{
  if (self->_language - 19 > 2) {
    return 0;
  }
  else {
    return objc_alloc_init(CHMecabraWrapper);
  }
}

- (VariantMap)newTransliterationVariantMap
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    unsigned int mode = self->_mode;
    BOOL v4 = mode > 6;
    int v5 = (1 << mode) & 0x76;
    BOOL v6 = v4 || v5 == 0;
    if (!v6 && self->_language - 1 <= 0x1A)
    {
      bzero(v80, 0x400uLL);
      firstMatchingResourceForLocale(self->_locale, &cfstr_Synthetics.isa, &cfstr_Txt.isa, (UInt8 *)v80);
      if (objc_claimAutoreleasedReturnValue()) {
LABEL_8:
      }
        operator new();
      switch(self->_script)
      {
        case 1uLL:
          uint64_t v11 = objc_msgSend_stringByAppendingString_(@"synthetics_", v7, @"en", v8, v9, v10);
          uint64_t v16 = objc_msgSend_stringByAppendingPathExtension_(v11, v12, @"txt", v13, v14, v15);

          id v17 = v16;
          uint64_t v23 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21, v22);
          BOOL v24 = pathForResource(v23, 0, (UInt8 *)v80);
          goto LABEL_15;
        case 2uLL:
          uint64_t v25 = objc_msgSend_stringByAppendingString_(@"synthetics_", v7, @"zh-Hans", v8, v9, v10);
          uint64_t v30 = objc_msgSend_stringByAppendingPathExtension_(v25, v26, @"txt", v27, v28, v29);

          id v17 = v30;
          uint64_t v36 = (const char *)objc_msgSend_UTF8String(v17, v31, v32, v33, v34, v35);
          BOOL v24 = pathForResource(v36, 0, (UInt8 *)v80);
          goto LABEL_15;
        case 3uLL:
          uint64_t v37 = objc_msgSend_stringByAppendingString_(@"synthetics_", v7, @"zh-Hant", v8, v9, v10);
          uint64_t v42 = objc_msgSend_stringByAppendingPathExtension_(v37, v38, @"txt", v39, v40, v41);

          id v17 = v42;
          uint64_t v48 = (const char *)objc_msgSend_UTF8String(v17, v43, v44, v45, v46, v47);
          BOOL v24 = pathForResource(v48, 0, (UInt8 *)v80);
          goto LABEL_15;
        case 8uLL:
          uint64_t v49 = objc_msgSend_stringByAppendingString_(@"synthetics_", v7, @"ar", v8, v9, v10);
          uint64_t v54 = objc_msgSend_stringByAppendingPathExtension_(v49, v50, @"txt", v51, v52, v53);

          id v17 = v54;
          uint64_t v60 = (const char *)objc_msgSend_UTF8String(v17, v55, v56, v57, v58, v59);
          BOOL v24 = pathForResource(v60, 0, (UInt8 *)v80);
LABEL_15:
          BOOL v61 = v24;

          if (!v61) {
            goto LABEL_16;
          }
          goto LABEL_8;
        default:
LABEL_16:
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v62 = (id)qword_1EA3C9F98;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
          {
            uint64_t v68 = objc_msgSend_debugDescription(self->_locale, v63, v64, v65, v66, v67);
            unint64_t language = self->_language;
            unint64_t script = self->_script;
            int v72 = 138413058;
            uint64_t v73 = v68;
            __int16 v74 = 2048;
            unint64_t v75 = script;
            __int16 v76 = 2048;
            unint64_t v77 = language;
            __int16 v78 = 2080;
            uint64_t v79 = v80;
            _os_log_impl(&dword_1C492D000, v62, OS_LOG_TYPE_FAULT, "Resource for transliteration map not found for locale \"%@\" (script=%lu, language=%lu) with resource path \"%s\"", (uint8_t *)&v72, 0x2Au);
          }
          break;
      }
    }
  }
  return 0;
}

- (CHNeuralNetwork)newRecognitionEngine
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5) & 1) == 0)
  {
    id v12 = 0;
    unsigned int mode = self->_mode;
    if (mode > 6)
    {
      uint64_t v11 = 0;
    }
    else
    {
      if (((1 << mode) & 0x76) != 0)
      {
        unint64_t language = self->_language;
        if (language - 19 <= 1)
        {
          objc_msgSend_stringByAppendingPathExtension_(@"zh", v7, @"bundle", v8, v9, v10);
          id v12 = objc_claimAutoreleasedReturnValue();
          uint64_t v20 = (const char *)objc_msgSend_UTF8String(v12, v15, v16, v17, v18, v19);
          if (!pathForResource(v20, 0, (UInt8 *)__s))
          {
            uint64_t v25 = objc_msgSend_stringByAppendingPathExtension_(@"zh_compact", v21, @"bundle", v22, v23, v24);

            id v12 = v25;
            uint64_t v31 = (const char *)objc_msgSend_UTF8String(v12, v26, v27, v28, v29, v30);
            if (pathForResource(v31, 0, (UInt8 *)__s))
            {
              uint64_t v32 = 1;
              size_t v33 = strlen(__s);
              if (v33 > 0x7FFFFFFFFFFFFFF7) {
                goto LABEL_9;
              }
              goto LABEL_41;
            }
LABEL_20:
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            uint64_t v45 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v77 = v12;
              _os_log_impl(&dword_1C492D000, v45, OS_LOG_TYPE_FAULT, "Error loading model resource from path=%@", buf, 0xCu);
            }

            uint64_t v11 = 0;
            goto LABEL_50;
          }
LABEL_40:
          uint64_t v32 = 0;
          size_t v33 = strlen(__s);
          if (v33 > 0x7FFFFFFFFFFFFFF7) {
LABEL_9:
          }
            sub_1C4949B7C();
LABEL_41:
          uint64_t v67 = (void *)v33;
          if (v33 >= 0x17)
          {
            uint64_t v69 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v33 | 7) != 0x17) {
              uint64_t v69 = v33 | 7;
            }
            uint64_t v70 = v69 + 1;
            uint64_t v68 = (void **)operator new(v69 + 1);
            __dst[1] = v67;
            unint64_t v75 = v70 | 0x8000000000000000;
            __dst[0] = v68;
          }
          else
          {
            HIBYTE(v75) = v33;
            uint64_t v68 = __dst;
            if (!v33)
            {
LABEL_48:
              *((unsigned char *)v67 + (void)v68) = 0;
              uint64_t v11 = (CHNeuralNetwork *)sub_1C4968A28((uint64_t)__dst, (const char *)v32, 1u, v34, v35, v36);
              if (SHIBYTE(v75) < 0) {
                operator delete(__dst[0]);
              }
              goto LABEL_50;
            }
          }
          memcpy(v68, __s, (size_t)v67);
          goto LABEL_48;
        }
        if (self->_script == 1)
        {
          if (mode == 1)
          {
            objc_msgSend_stringByAppendingPathExtension_(@"vo_en_compact", v7, @"bundle", v8, v9, v10);
            id v12 = objc_claimAutoreleasedReturnValue();
            uint64_t v66 = (const char *)objc_msgSend_UTF8String(v12, v61, v62, v63, v64, v65);
            BOOL v44 = pathForResource(v66, 0, (UInt8 *)__s);
            goto LABEL_39;
          }
          if (mode == 5)
          {
            uint64_t v37 = @"vo_other";
            if (language == 5) {
              uint64_t v37 = @"vo_de";
            }
            if (language == 1) {
              objc_msgSend_stringByAppendingPathExtension_(@"vo_en_compact", v7, @"bundle", v8, v9, v10);
            }
            else {
              objc_msgSend_stringByAppendingPathExtension_(v37, v7, @"bundle", v8, v9, v10);
            }
            id v12 = objc_claimAutoreleasedReturnValue();
            uint64_t v43 = (const char *)objc_msgSend_UTF8String(v12, v38, v39, v40, v41, v42);
            BOOL v44 = pathForResource(v43, 0, (UInt8 *)__s);
LABEL_39:
            if (!v44) {
              goto LABEL_20;
            }
            goto LABEL_40;
          }
        }
        id v12 = 0;
        goto LABEL_20;
      }
      uint64_t v11 = 0;
      if (mode == 3)
      {
        objc_msgSend_stringByAppendingPathExtension_(@"is", v7, @"bundle", v8, v9, v10);
        id v46 = objc_claimAutoreleasedReturnValue();
        uint64_t v52 = (const char *)objc_msgSend_UTF8String(v46, v47, v48, v49, v50, v51);
        pathForResource(v52, 0, (UInt8 *)__s);

        size_t v53 = strlen(__s);
        if (v53 > 0x7FFFFFFFFFFFFFF7) {
          sub_1C4949B7C();
        }
        uint64_t v57 = (void *)v53;
        if (v53 >= 0x17)
        {
          uint64_t v59 = (v53 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v53 | 7) != 0x17) {
            uint64_t v59 = v53 | 7;
          }
          uint64_t v60 = v59 + 1;
          uint64_t v58 = operator new(v59 + 1);
          __p[1] = v57;
          unint64_t v73 = v60 | 0x8000000000000000;
          __p[0] = v58;
        }
        else
        {
          HIBYTE(v73) = v53;
          uint64_t v58 = __p;
          if (!v53) {
            goto LABEL_35;
          }
        }
        memcpy(v58, __s, (size_t)v57);
LABEL_35:
        *((unsigned char *)v57 + (void)v58) = 0;
        uint64_t v11 = (CHNeuralNetwork *)sub_1C4968A28((uint64_t)__p, 0, 1u, v54, v55, v56);
        if (SHIBYTE(v73) < 0) {
          operator delete(__p[0]);
        }
        id v12 = 0;
      }
    }
LABEL_50:

    return v11;
  }
  return 0;
}

+ (id)parametersOverride
{
  return 0;
}

+ (void)setParametersOverride:(id)a3
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_FAULT, "not supported", v4, 2u);
  }
}

- (id)newCTCRecognitionModel
{
  uint64_t v274 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5)) {
    return 0;
  }
  id v12 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_dictionaryForKey_(v12, v13, @"com.apple.corehandwriting", v14, v15, v16);

  v266[0] = MEMORY[0x1E4F143A8];
  v266[1] = 3221225472;
  v266[2] = sub_1C4B6EFAC;
  v266[3] = &unk_1E64E4398;
  id v18 = v17;
  id v267 = v18;
  uint64_t v23 = (uint64_t (**)(void, void))MEMORY[0x1C8786E90](v266);
  uint64_t v24 = 0;
  unsigned int mode = self->_mode;
  if (mode <= 6 && ((1 << mode) & 0x56) != 0)
  {
    if (self->_contentType == 6) {
      unint64_t language = 1;
    }
    else {
      unint64_t language = self->_language;
    }
    unint64_t v27 = language - 1;
    switch(language)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
        uint64_t v28 = objc_msgSend_stringByAppendingPathExtension_(@"ctc_latn", v19, @"bundle", v20, v21, v22);
        uint64_t v29 = [CHCTCRecognitionModel alloc];
        long long v264 = xmmword_1C4C446D0;
        uint64_t v265 = 20;
        uint64_t v24 = objc_msgSend_initWithModelName_decodingPruningPolicy_(v29, v30, (uint64_t)v28, (uint64_t)&v264, v31, v32);
        objc_msgSend_setNormalizeFeatures_(v24, v33, 0, v34, v35, v36);
        objc_msgSend_setInterpointDistance_(v24, v37, v38, v39, v40, v41, 0.05);
        objc_msgSend_setStrokeOrdering_(v24, v42, 1, v43, v44, v45);
        uint64_t v46 = ((uint64_t (**)(void, __CFString *))v23)[2](v23, @"ctc_latn");
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v47, v46, v48, v49, v50);
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v51 = (id)qword_1EA3C9F98;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v57 = objc_msgSend_localeIdentifier(self->_locale, v52, v53, v54, v55, v56);
          self;
          if (v27 > 0x11) {
            uint64_t v58 = 0;
          }
          else {
            uint64_t v58 = off_1E64E4790[v27];
          }
          *(_DWORD *)buf = 138412802;
          v269 = v57;
          __int16 v270 = 2112;
          v271 = v58;
          __int16 v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1C492D000, v51, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);
        }
        if (v24) {
          goto LABEL_24;
        }
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v60 = (id)qword_1EA3C9F90[0];
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x13uLL:
      case 0x14uLL:
        if (mode == 2) {
          float v62 = -6.9078;
        }
        else {
          float v62 = -3.912;
        }
        uint64_t v28 = objc_msgSend_stringByAppendingPathExtension_(@"ctc_zh", v19, @"bundle", v20, v21, v22);
        uint64_t v63 = [CHCTCRecognitionModel alloc];
        int v259 = 0;
        uint64_t v258 = 1;
        float v260 = v62;
        uint64_t v261 = 0xFFFFFFFFLL;
        uint64_t v24 = objc_msgSend_initWithModelName_decodingPruningPolicy_(v63, v64, (uint64_t)v28, (uint64_t)&v258, v65, v66);
        objc_msgSend_setNormalizeFeatures_(v24, v67, 0, v68, v69, v70);
        objc_msgSend_setInterpointDistance_(v24, v71, v72, v73, v74, v75, 0.1);
        uint64_t v76 = ((uint64_t (**)(void, __CFString *))v23)[2](v23, @"ctc_zh");
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v77, v76, v78, v79, v80);
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v81 = (id)qword_1EA3C9F98;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v87 = objc_msgSend_localeIdentifier(self->_locale, v82, v83, v84, v85, v86);
          sub_1C4B68B94((uint64_t)CHRecognizerConfiguration, language);
          uint64_t v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v269 = v87;
          __int16 v270 = 2112;
          v271 = v88;
          __int16 v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1C492D000, v81, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);
        }
        if (v24) {
          goto LABEL_24;
        }
        uint64_t v60 = CHOSLogForCategory(0);
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x15uLL:
        if (mode == 2) {
          float v146 = -6.9078;
        }
        else {
          float v146 = -3.912;
        }
        uint64_t v28 = objc_msgSend_stringByAppendingPathExtension_(@"ctc_ja", v19, @"bundle", v20, v21, v22);
        uint64_t v147 = [CHCTCRecognitionModel alloc];
        int v255 = 0;
        uint64_t v254 = 1;
        float v256 = v146;
        uint64_t v257 = 0xFFFFFFFFLL;
        uint64_t v24 = objc_msgSend_initWithModelName_decodingPruningPolicy_(v147, v148, (uint64_t)v28, (uint64_t)&v254, v149, v150);
        objc_msgSend_setNormalizeFeatures_(v24, v151, 0, v152, v153, v154);
        objc_msgSend_setInterpointDistance_(v24, v155, v156, v157, v158, v159, 0.1);
        uint64_t v160 = ((uint64_t (**)(void, __CFString *))v23)[2](v23, @"ctc_ja");
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v161, v160, v162, v163, v164);
        v165 = CHOSLogForCategory(1);
        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
        {
          v171 = objc_msgSend_localeIdentifier(self->_locale, v166, v167, v168, v169, v170);
          self;
          *(_DWORD *)buf = 138412802;
          v269 = v171;
          __int16 v270 = 2112;
          v271 = @"Japanese";
          __int16 v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1C492D000, v165, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);
        }
        if (v24) {
          goto LABEL_24;
        }
        uint64_t v60 = CHOSLogForCategory(0);
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x16uLL:
        uint64_t v28 = objc_msgSend_stringByAppendingPathExtension_(@"ctc_ko", v19, @"bundle", v20, v21, v22);
        v172 = [CHCTCRecognitionModel alloc];
        long long v250 = xmmword_1C4C446E8;
        uint64_t v251 = 0xFFFFFFFFLL;
        uint64_t v24 = objc_msgSend_initWithModelName_decodingPruningPolicy_(v172, v173, (uint64_t)v28, (uint64_t)&v250, v174, v175);
        objc_msgSend_setNormalizeFeatures_(v24, v176, 0, v177, v178, v179);
        objc_msgSend_setInterpointDistance_(v24, v180, v181, v182, v183, v184, 0.1);
        uint64_t v185 = ((uint64_t (**)(void, __CFString *))v23)[2](v23, @"ctc_ko");
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v186, v185, v187, v188, v189);
        v190 = CHOSLogForCategory(1);
        if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
        {
          v196 = objc_msgSend_localeIdentifier(self->_locale, v191, v192, v193, v194, v195);
          self;
          *(_DWORD *)buf = 138412802;
          v269 = v196;
          __int16 v270 = 2112;
          v271 = @"Korean";
          __int16 v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1C492D000, v190, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);
        }
        if (v24) {
          goto LABEL_24;
        }
        uint64_t v60 = CHOSLogForCategory(0);
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x17uLL:
        uint64_t v28 = objc_msgSend_stringByAppendingPathExtension_(@"ctc_th", v19, @"bundle", v20, v21, v22);
        v197 = [CHCTCRecognitionModel alloc];
        long long v252 = xmmword_1C4C446E8;
        uint64_t v253 = 0xFFFFFFFFLL;
        uint64_t v24 = objc_msgSend_initWithModelName_decodingPruningPolicy_(v197, v198, (uint64_t)v28, (uint64_t)&v252, v199, v200);
        objc_msgSend_setNormalizeFeatures_(v24, v201, 0, v202, v203, v204);
        objc_msgSend_setInterpointDistance_(v24, v205, v206, v207, v208, v209, 0.1);
        uint64_t v210 = ((uint64_t (**)(void, __CFString *))v23)[2](v23, @"ctc_th");
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v211, v210, v212, v213, v214);
        v215 = CHOSLogForCategory(1);
        if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
        {
          v221 = objc_msgSend_localeIdentifier(self->_locale, v216, v217, v218, v219, v220);
          self;
          *(_DWORD *)buf = 138412802;
          v269 = v221;
          __int16 v270 = 2112;
          v271 = @"Thai";
          __int16 v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1C492D000, v215, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);
        }
        if (v24) {
          goto LABEL_24;
        }
        uint64_t v60 = CHOSLogForCategory(0);
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x18uLL:
      case 0x19uLL:
        uint64_t v28 = objc_msgSend_stringByAppendingPathExtension_(@"ctc_cyrl", v19, @"bundle", v20, v21, v22);
        uint64_t v89 = [CHCTCRecognitionModel alloc];
        long long v248 = xmmword_1C4C446E8;
        uint64_t v249 = 0xFFFFFFFFLL;
        uint64_t v24 = objc_msgSend_initWithModelName_decodingPruningPolicy_(v89, v90, (uint64_t)v28, (uint64_t)&v248, v91, v92);
        objc_msgSend_setNormalizeFeatures_(v24, v93, 0, v94, v95, v96);
        objc_msgSend_setInterpointDistance_(v24, v97, v98, v99, v100, v101, 0.05);
        uint64_t v102 = ((uint64_t (**)(void, __CFString *))v23)[2](v23, @"ctc_cyrl");
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v103, v102, v104, v105, v106);
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        int v107 = (id)qword_1EA3C9F98;
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          v113 = objc_msgSend_localeIdentifier(self->_locale, v108, v109, v110, v111, v112);
          sub_1C4B68B94((uint64_t)CHRecognizerConfiguration, language);
          v114 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v269 = v113;
          __int16 v270 = 2112;
          v271 = v114;
          __int16 v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1C492D000, v107, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);
        }
        if (v24) {
          goto LABEL_24;
        }
        uint64_t v60 = CHOSLogForCategory(0);
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x1AuLL:
        uint64_t v28 = objc_msgSend_stringByAppendingPathExtension_(@"ctc_ar", v19, @"bundle", v20, v21, v22);
        uint64_t v115 = [CHCTCRecognitionModel alloc];
        long long v246 = xmmword_1C4C446E8;
        uint64_t v247 = 0xFFFFFFFFLL;
        uint64_t v24 = objc_msgSend_initWithModelName_decodingPruningPolicy_(v115, v116, (uint64_t)v28, (uint64_t)&v246, v117, v118);
        objc_msgSend_setNormalizeFeatures_(v24, v119, 0, v120, v121, v122);
        objc_msgSend_setInterpointDistance_(v24, v123, v124, v125, v126, v127, 0.05);
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v128, 1, v129, v130, v131);
        objc_msgSend_setShouldUseStrokeDirectionFeature_(v24, v132, 1, v133, v134, v135);
        objc_msgSend_setShouldUseArabicVisualOrderFeatureExtraction_(v24, v136, 1, v137, v138, v139);
        uint64_t v60 = CHOSLogForCategory(1);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v145 = objc_msgSend_localeIdentifier(self->_locale, v140, v141, v142, v143, v144);
          self;
          *(_DWORD *)buf = 138412802;
          v269 = v145;
          __int16 v270 = 2112;
          v271 = @"Arabic";
          __int16 v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1C492D000, v60, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);
        }
        goto LABEL_23;
      case 0x1BuLL:
        uint64_t v28 = objc_msgSend_stringByAppendingPathExtension_(@"ctc_vi", v19, @"bundle", v20, v21, v22);
        v222 = [CHCTCRecognitionModel alloc];
        long long v262 = xmmword_1C4C446D0;
        uint64_t v263 = 20;
        uint64_t v24 = objc_msgSend_initWithModelName_decodingPruningPolicy_(v222, v223, (uint64_t)v28, (uint64_t)&v262, v224, v225);
        objc_msgSend_setNormalizeFeatures_(v24, v226, 0, v227, v228, v229);
        objc_msgSend_setInterpointDistance_(v24, v230, v231, v232, v233, v234, 0.1);
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v235, 1, v236, v237, v238);
        v239 = CHOSLogForCategory(1);
        if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
        {
          v245 = objc_msgSend_localeIdentifier(self->_locale, v240, v241, v242, v243, v244);
          self;
          *(_DWORD *)buf = 138412802;
          v269 = v245;
          __int16 v270 = 2112;
          v271 = @"Vietnamese";
          __int16 v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1C492D000, v239, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);
        }
        if (v24) {
          goto LABEL_24;
        }
        uint64_t v60 = CHOSLogForCategory(0);
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      default:
        uint64_t v24 = 0;
        goto LABEL_25;
    }
    _os_log_impl(&dword_1C492D000, v60, OS_LOG_TYPE_FAULT, "An error occurred when loading the CTC model %@", buf, 0xCu);
LABEL_22:
    uint64_t v24 = 0;
LABEL_23:

LABEL_24:
  }
LABEL_25:
  id v59 = v24;

  return v59;
}

- (id)newPostProcessorWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 phraseLexicon:(_LXLexicon *)a5 customPhraseLexicon:(_LXLexicon *)a6 textReplacements:(id)a7 postProcessingFST:(id)a8 wordLM:(void *)a9 mecabraWrapper:(id)a10 ovsStringChecker:(id)a11 spellChecker:(id)a12 lmVocabulary:(void *)a13 maxResultCount:(int64_t)a14
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  id v21 = a11;
  id v27 = a12;
  if (!self) {
    goto LABEL_51;
  }
  unsigned int mode = self->_mode;
  BOOL v29 = mode > 6;
  int v30 = (1 << mode) & 0x76;
  BOOL v31 = v29 || v30 == 0;
  if (v31 || (objc_msgSend_shouldRunNextGenRecognizer(self, v22, v23, v24, v25, v26) & 1) == 0)
  {
    self = 0;
    goto LABEL_51;
  }
  id v517 = v20;
  v518 = a3;
  uint64_t v521 = (uint64_t)v27;
  uint64_t v522 = (uint64_t)v21;
  uint64_t v523 = (uint64_t)v19;
  id v516 = v18;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v525 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v527 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v524 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v526 = objc_alloc_init(CHPreserveOriginalRecognitionStep);
  objc_msgSend_addObject_(v32, v34, (uint64_t)v526, v35, v36, v37);
  objc_msgSend_addObject_(v33, v38, (uint64_t)v526, v39, v40, v41);
  objc_msgSend_addObject_(v525, v42, (uint64_t)v526, v43, v44, v45);
  objc_msgSend_addObject_(v527, v46, (uint64_t)v526, v47, v48, v49);
  objc_msgSend_addObject_(v524, v50, (uint64_t)v526, v51, v52, v53);
  if (objc_msgSend_shouldPerformArabicPostProcessing(self, v54, v55, v56, v57, v58))
  {
    uint64_t v64 = objc_alloc_init(CHTransliterateConfusableCharactersArabicStep);
    objc_msgSend_addObject_(v32, v65, (uint64_t)v64, v66, v67, v68);
    objc_msgSend_addObject_(v33, v69, (uint64_t)v64, v70, v71, v72);
    uint64_t v73 = [CHVisualToLogicalTransformStep alloc];
    uint64_t v79 = objc_msgSend_baseWritingDirection(self, v74, v75, v76, v77, v78);
    uint64_t v85 = objc_msgSend_mode(self, v80, v81, v82, v83, v84);
    uint64_t v89 = objc_msgSend_initWithBaseDirection_mode_(v73, v86, v79, v85, v87, v88);
    objc_msgSend_addObject_(v32, v90, (uint64_t)v89, v91, v92, v93);
    objc_msgSend_addObject_(v33, v94, (uint64_t)v89, v95, v96, v97);
    objc_msgSend_addObject_(v525, v98, (uint64_t)v89, v99, v100, v101);
    objc_msgSend_addObject_(v527, v102, (uint64_t)v89, v103, v104, v105);
    objc_msgSend_addObject_(v524, v106, (uint64_t)v89, v107, v108, v109);
  }
  int v110 = self->_mode;
  if (v110 == 4 || v110 == 2)
  {
    uint64_t v111 = [CHRemoveSpacesFromStrongURLsAndEmailsStep alloc];
    uint64_t v116 = objc_msgSend_initWithPatternFst_(v111, v112, v523, v113, v114, v115);
    objc_msgSend_addObject_(v32, v117, (uint64_t)v116, v118, v119, v120);
    objc_msgSend_addObject_(v33, v121, (uint64_t)v116, v122, v123, v124);
  }
  if ((objc_msgSend_shouldRunLexiconCorrectionPostProcessingStep(self, v59, v60, v61, v62, v63) & 1) != 0
    || objc_msgSend_shouldConvertKanaInPostProcessing(self, v125, v126, v127, v128, v129))
  {
    uint64_t v135 = [CHCleanUpSpacesStep alloc];
    uint64_t v141 = objc_msgSend_locale(self, v136, v137, v138, v139, v140);
    float v146 = objc_msgSend_initWithLocale_(v135, v142, (uint64_t)v141, v143, v144, v145);

    objc_msgSend_addObject_(v32, v147, (uint64_t)v146, v148, v149, v150);
    objc_msgSend_addObject_(v33, v151, (uint64_t)v146, v152, v153, v154);
  }
  if (objc_msgSend_shouldReorderSCTCConfusion(self, v130, v131, v132, v133, v134))
  {
    uint64_t v160 = [CHReorderSCTCConfusionStep alloc];
    v165 = objc_msgSend_initWithMaxResultCount_(v160, v161, a14, v162, v163, v164);
    objc_msgSend_addObject_(v32, v166, (uint64_t)v165, v167, v168, v169);
    objc_msgSend_addObject_(v33, v170, (uint64_t)v165, v171, v172, v173);
  }
  if (objc_msgSend_shouldRemoveInvalidArabicDiacritics(self, v155, v156, v157, v158, v159))
  {
    uint64_t v179 = objc_alloc_init(CHRemoveInvalidArabicDiacriticsStep);
    objc_msgSend_addObject_(v32, v180, (uint64_t)v179, v181, v182, v183);
    objc_msgSend_addObject_(v33, v184, (uint64_t)v179, v185, v186, v187);
  }
  if (objc_msgSend_shouldConvertKanaInPostProcessing(self, v174, v175, v176, v177, v178))
  {
    uint64_t v193 = [CHJapaneseTokenizationAndConversionStep alloc];
    uint64_t v195 = objc_msgSend_initWithMecabra_wordLanguageModel_ovsStringChecker_promoteKanaConversion_(v193, v194, (uint64_t)v20, (uint64_t)a9, (uint64_t)v21, 0);
    objc_msgSend_addObject_(v32, v196, (uint64_t)v195, v197, v198, v199);
    objc_msgSend_addObject_(v33, v200, (uint64_t)v195, v201, v202, v203);
  }
  if (objc_msgSend_shouldApplySemanticTokenization(self, v188, v189, v190, v191, v192))
  {
    uint64_t v209 = [CHSemanticTokenizerStep alloc];
    uint64_t v213 = objc_msgSend_initWithWordLanguageModel_ovsStringChecker_(v209, v210, (uint64_t)a9, (uint64_t)v21, v211, v212);
    objc_msgSend_addObject_(v32, v214, (uint64_t)v213, v215, v216, v217);
    objc_msgSend_addObject_(v33, v218, (uint64_t)v213, v219, v220, v221);
  }
  unint64_t language = self->_language;
  if (language - 4 >= 0xF && (language > 0x1A || ((1 << language) & 0x4800007) == 0))
  {
    v497 = [CHTransliterateConfusableCharactersStep alloc];
    v503 = objc_msgSend_locale(self, v498, v499, v500, v501, v502);
    v506 = objc_msgSend_initWithStaticLexicon_customLexicon_locale_(v497, v504, (uint64_t)v518, (uint64_t)a4, (uint64_t)v503, v505);

    objc_msgSend_addObject_(v32, v507, (uint64_t)v506, v508, v509, v510);
    if (self->_script != 5) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (self->_script == 5)
  {
LABEL_27:
    v223 = objc_alloc_init(CHRemoveSpacesFromEnglishAndKoreanParticlesStep);
    objc_msgSend_addObject_(v32, v224, (uint64_t)v223, v225, v226, v227);
    objc_msgSend_addObject_(v33, v228, (uint64_t)v223, v229, v230, v231);
  }
LABEL_28:
  if (objc_msgSend_shouldRunLexiconCorrectionPostProcessingStep(self, v204, v205, v206, v207, v208))
  {
    uint64_t PseudoTokens = objc_msgSend_shouldCreatePseudoTokens(self, v232, v233, v234, v235, v236);
    uint64_t v238 = [CHLexiconCorrectionStep alloc];
    uint64_t v244 = objc_msgSend_effectiveAutoCapitalizationMode(self, v239, v240, v241, v242, v243);
    uint64_t shouldAutoCorrect = objc_msgSend_shouldAutoCorrect(self, v245, v246, v247, v248, v249);
    uint64_t shouldAutoCapitalize = objc_msgSend_shouldAutoCapitalize(self, v251, v252, v253, v254, v255);
    long long v262 = objc_msgSend_locale(self, v257, v258, v259, v260, v261);
    PseudoTokens_locale_staticLexicon_customLexicon_phraseLexicon_customPhraseLexicon_spellChecker_lmVocabulary_ovsStringChecker_textReplacements = objc_msgSend_initWithAutoCapitalizationMode_shouldAutoCorrect_shouldAutoCapitalize_shouldCreatePseudoTokens_locale_staticLexicon_customLexicon_phraseLexicon_customPhraseLexicon_spellChecker_lmVocabulary_ovsStringChecker_textReplacements_(v238, v263, v244, shouldAutoCorrect, shouldAutoCapitalize, PseudoTokens, v262, v518, a4, a5, a6, v521, a13, v522, v516);

    objc_msgSend_addObject_(v32, v265, (uint64_t)PseudoTokens_locale_staticLexicon_customLexicon_phraseLexicon_customPhraseLexicon_spellChecker_lmVocabulary_ovsStringChecker_textReplacements, v266, v267, v268);
    v269 = [CHSpellCorrectionCandidatesStep alloc];
    v275 = objc_msgSend_locale(self, v270, v271, v272, v273, v274);
    v277 = objc_msgSend_initWithLocale_spellChecker_staticLexicon_customLexicon_(v269, v276, (uint64_t)v275, v521, (uint64_t)v518, (uint64_t)a4);

    objc_msgSend_addObject_(v32, v278, (uint64_t)v277, v279, v280, v281);
  }
  if (objc_msgSend_shouldPromoteInLexiconCandidates(self, v232, v233, v234, v235, v236))
  {
    v287 = [CHPromoteInLexiconCandidatesStep alloc];
    v291 = objc_msgSend_initWithStaticLexicon_customLexicon_(v287, v288, (uint64_t)v518, (uint64_t)a4, v289, v290);
    objc_msgSend_addObject_(v32, v292, (uint64_t)v291, v293, v294, v295);
  }
  if (objc_msgSend_shouldTransliterateHalfWidthPunctuations(self, v282, v283, v284, v285, v286))
  {
    uint64_t shouldAddAlternativeWidthCandidates = objc_msgSend_shouldAddAlternativeWidthCandidates(self, v296, v297, v298, v299, v300);
    v302 = [CHTransliterateHalfWidthPunctuationStep alloc];
    ShouldAddAlternatives = objc_msgSend_initWithShouldAddAlternatives_(v302, v303, shouldAddAlternativeWidthCandidates, v304, v305, v306);
    objc_msgSend_addObject_(v32, v308, (uint64_t)ShouldAddAlternatives, v309, v310, v311);
    v312 = objc_alloc_init(CHOpeningClosingCharacterMatchingStep);
    objc_msgSend_addObject_(v32, v313, (uint64_t)v312, v314, v315, v316);
  }
  if (self->_script - 2 <= 2)
  {
    v317 = [CHTransliterateChineseJapaneseStep alloc];
    uint64_t shouldTransliterateSentencesSCTC = objc_msgSend_shouldTransliterateSentencesSCTC(self, v318, v319, v320, v321, v322);
    v328 = objc_msgSend_initWithTransliterateSentences_(v317, v324, shouldTransliterateSentencesSCTC, v325, v326, v327);
    objc_msgSend_addObject_(v32, v329, (uint64_t)v328, v330, v331, v332);
    objc_msgSend_addObject_(v33, v333, (uint64_t)v328, v334, v335, v336);
  }
  if (objc_msgSend_shouldRefineCandidates(self, v296, v297, v298, v299, v300))
  {
    v342 = [CHCandidateRefinementStep alloc];
    uint64_t shouldKeepOutOfPatternCandidates = objc_msgSend_shouldKeepOutOfPatternCandidates(self, v343, v344, v345, v346, v347);
    uint64_t v354 = objc_msgSend_shouldTransliterateSentencesSCTC(self, v349, v350, v351, v352, v353);
    shouldKeepOriginalSpelling = objc_msgSend_initWithShouldKeepOutOfPatternCandidates_shouldKeepDuplicateTokenIDs_shouldKeepOutOfLexiconAlternatives_shouldKeepAlternativeLengths_shouldKeepSubstrings_shouldKeepOriginalSpelling_(v342, v355, shouldKeepOutOfPatternCandidates, v354, 0, 0, 0, 1);
    objc_msgSend_addObject_(v32, v357, (uint64_t)shouldKeepOriginalSpelling, v358, v359, v360);
    objc_msgSend_addObject_(v33, v361, (uint64_t)shouldKeepOriginalSpelling, v362, v363, v364);
  }
  unint64_t v365 = self->_language;
  if (v365 - 4 >= 0xF && (v365 > 0x1A || ((1 << v365) & 0x4800007) == 0))
  {
    v511 = objc_alloc_init(CHTransliterateIsolatedConfusableCharactersStep);
    objc_msgSend_addObject_(v32, v512, (uint64_t)v511, v513, v514, v515);
  }
  if (objc_msgSend_shouldMarkMultiWordOVS(self, v337, v338, v339, v340, v341))
  {
    v371 = [CHMultiWordOVSFilteringStep alloc];
    v376 = objc_msgSend_initWithOVSStringChecker_(v371, v372, v522, v373, v374, v375);
    objc_msgSend_addObject_(v32, v377, (uint64_t)v376, v378, v379, v380);
    objc_msgSend_addObject_(v33, v381, (uint64_t)v376, v382, v383, v384);
  }
  if (objc_msgSend_shouldIdentifyChangeableColumns(self, v366, v367, v368, v369, v370))
  {
    v390 = objc_alloc_init(CHIdentifyLowAlignmentConfidenceColumnsStep);
    objc_msgSend_addObject_(v32, v391, (uint64_t)v390, v392, v393, v394);
    objc_msgSend_addObject_(v33, v395, (uint64_t)v390, v396, v397, v398);
  }
  if (objc_msgSend_shouldMarkNoWhiteSpaceColumnsChangeable(self, v385, v386, v387, v388, v389))
  {
    v404 = objc_alloc_init(CHMarkNoWhiteSpaceColumnsChangeableStep);
    objc_msgSend_addObject_(v32, v405, (uint64_t)v404, v406, v407, v408);
    objc_msgSend_addObject_(v33, v409, (uint64_t)v404, v410, v411, v412);
  }
  if (objc_msgSend_shouldRemoveSpacesFromHashtagsAndMentions(self, v399, v400, v401, v402, v403))
  {
    v413 = objc_alloc_init(CHRemoveSpacesFromHashtagsAndMentionsStep);
    objc_msgSend_addObject_(v32, v414, (uint64_t)v413, v415, v416, v417);
    objc_msgSend_addObject_(v33, v418, (uint64_t)v413, v419, v420, v421);
  }
  v422 = [CHRemoveSpacesFromSpecialFieldsStep alloc];
  v424 = objc_msgSend_initWithPatternFst_patternType_capitalizationToSplit_convertToLowercase_(v422, v423, v523, 10, 1, 1);
  objc_msgSend_addObject_(v525, v425, (uint64_t)v424, v426, v427, v428);

  v429 = [CHNumberFieldResultReorderingStep alloc];
  v435 = objc_msgSend_initForPhoneNumberFields(v429, v430, v431, v432, v433, v434);
  objc_msgSend_addObject_(v527, v436, (uint64_t)v435, v437, v438, v439);

  v440 = [CHRemoveSpacesFromSpecialFieldsStep alloc];
  v442 = objc_msgSend_initWithPatternFst_patternType_capitalizationToSplit_convertToLowercase_(v440, v441, v523, 8, 0, 0);
  objc_msgSend_addObject_(v527, v443, (uint64_t)v442, v444, v445, v446);

  v447 = [CHNumberFieldResultReorderingStep alloc];
  v453 = objc_msgSend_initForDigitFields(v447, v448, v449, v450, v451, v452);
  objc_msgSend_addObject_(v524, v454, (uint64_t)v453, v455, v456, v457);

  v458 = [CHPostProcessingManager alloc];
  v463 = objc_msgSend_initWithSequence_(v458, v459, (uint64_t)v32, v460, v461, v462);
  v464 = [CHPostProcessingManager alloc];
  v469 = objc_msgSend_initWithSequence_(v464, v465, (uint64_t)v33, v466, v467, v468);
  v470 = [CHPostProcessingManager alloc];
  v475 = objc_msgSend_initWithSequence_(v470, v471, (uint64_t)v525, v472, v473, v474);
  v476 = [CHPostProcessingManager alloc];
  v481 = objc_msgSend_initWithSequence_(v476, v477, (uint64_t)v527, v478, v479, v480);
  v482 = [CHPostProcessingManager alloc];
  v487 = objc_msgSend_initWithSequence_(v482, v483, (uint64_t)v524, v484, v485, v486);
  v488 = [CHTextFieldTypeSwitchStep alloc];
  inited = objc_msgSend_initProcessorDefault_processorDigits_processorPhone_processorUsername_processorEmail_processorURL_processorASCII_processorEquation_(v488, v489, (uint64_t)v463, (uint64_t)v487, (uint64_t)v481, (uint64_t)v475, v475, v469, v469, v469);
  v491 = [CHPostProcessingManager alloc];
  self = (CHRecognizerConfiguration *)objc_msgSend_initWithStep_(v491, v492, (uint64_t)inited, v493, v494, v495);

  id v18 = v516;
  id v20 = v517;
  id v21 = (id)v522;
  id v19 = (id)v523;
  id v27 = (id)v521;
LABEL_51:

  return self;
}

- (id)newMergedResultPostProcessorWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 stringChecker:(id)a5
{
  id v13 = a5;
  if (self
    && ((mode = self->_mode, BOOL v15 = mode > 6, v16 = (1 << mode) & 0x76, !v15) ? (v17 = v16 == 0) : (v17 = 1),
        !v17 && (objc_msgSend_shouldRunNextGenRecognizer(self, v8, v9, v10, v11, v12) & 1) != 0))
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (objc_msgSend_shouldRecoverCyrillicCandidates(self, v19, v20, v21, v22, v23))
    {
      uint64_t v24 = [CHCyrillicAddAlternativeScriptCandidatesStep alloc];
      uint64_t v28 = objc_msgSend_initWithStaticLexicon_customLexicon_(v24, v25, (uint64_t)a3, (uint64_t)a4, v26, v27);
      objc_msgSend_addObject_(v18, v29, (uint64_t)v28, v30, v31, v32);
      id v33 = objc_alloc_init(CHCyrillicRecoverConfusableWordsStep);
      objc_msgSend_addObject_(v18, v34, (uint64_t)v33, v35, v36, v37);
    }
    uint64_t v38 = [CHMultiWordOVSFilteringStep alloc];
    uint64_t v43 = objc_msgSend_initWithOVSStringChecker_(v38, v39, (uint64_t)v13, v40, v41, v42);
    objc_msgSend_addObject_(v18, v44, (uint64_t)v43, v45, v46, v47);
    uint64_t v48 = [CHCandidateRefinementStep alloc];
    shouldKeepOriginalSpelling = objc_msgSend_initWithShouldKeepOutOfPatternCandidates_shouldKeepDuplicateTokenIDs_shouldKeepOutOfLexiconAlternatives_shouldKeepAlternativeLengths_shouldKeepSubstrings_shouldKeepOriginalSpelling_(v48, v49, 1, 1, 1, 1, 1, 1);
    objc_msgSend_addObject_(v18, v51, (uint64_t)shouldKeepOriginalSpelling, v52, v53, v54);
    uint64_t v55 = [CHPostProcessingManager alloc];
    uint64_t v60 = objc_msgSend_initWithSequence_(v55, v56, (uint64_t)v18, v57, v58, v59);
  }
  else
  {
    uint64_t v60 = 0;
  }

  return v60;
}

- (id)newCTCTextDecoderWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 wordLanguageModel:(void *)a5
{
  if (!objc_msgSend_shouldRunNextGenRecognizer(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5)) {
    return 0;
  }
  unsigned int mode = self->_mode;
  BOOL v13 = mode > 6;
  int v14 = (1 << mode) & 0x56;
  if (v13 || v14 == 0) {
    return 0;
  }
  int v16 = objc_msgSend_languageResourceBundleWithStaticLexicon_customLexicon_wordLanguageModel_(self, v10, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v11);
  id v17 = objc_alloc(MEMORY[0x1E4F56750]);
  uint64_t v22 = objc_msgSend_initWithLanguageResourceBundle_(v17, v18, (uint64_t)v16, v19, v20, v21);

  return v22;
}

- (CHNeuralNetwork)newFreeFormEngine
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_mode != 3) {
    return 0;
  }
  objc_msgSend_stringByAppendingPathExtension_(@"gd", a2, @"bundle", v2, v3, v4);
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (const char *)objc_msgSend_UTF8String(v5, v6, v7, v8, v9, v10);
  pathForResource(v11, 0, (UInt8 *)__s);

  size_t v12 = strlen(__s);
  if (v12 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C4949B7C();
  }
  int v16 = (void *)v12;
  if (v12 >= 0x17)
  {
    uint64_t v19 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v19 = v12 | 7;
    }
    uint64_t v20 = v19 + 1;
    id v17 = operator new(v19 + 1);
    __p[1] = v16;
    unint64_t v23 = v20 | 0x8000000000000000;
    __p[0] = v17;
    goto LABEL_10;
  }
  HIBYTE(v23) = v12;
  id v17 = __p;
  if (v12) {
LABEL_10:
  }
    memcpy(v17, __s, (size_t)v16);
  *((unsigned char *)v16 + (void)v17) = 0;
  id v18 = (CHNeuralNetwork *)sub_1C4968A28((uint64_t)__p, 0, 1u, v13, v14, v15);
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[0]);
  }
  return v18;
}

- (id)newCornerDetector
{
  if (self->_mode != 3) {
    return 0;
  }
  uint64_t v2 = objc_alloc_init(CHCornerDetector);
  objc_msgSend_setShouldUseDynamicSampling_(v2, v3, 0, v4, v5, v6);
  return v2;
}

- (int64_t)maxRecognitionResultDefaultCount
{
  if (self->_language - 19 < 2 || self->_mode == 3) {
    return 15;
  }
  else {
    return 6;
  }
}

+ (CGSize)defaultMinimumDrawingSize
{
  double v2 = 11.0;
  double v3 = 11.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)shouldUseStrokeReorderingForMode:(int)a3
{
  return a3 == 2;
}

- (int64_t)engineCandidateCount
{
  int64_t v2 = 6;
  if (self->_mode == 5) {
    int64_t v2 = 4;
  }
  if (self->_language - 19 >= 2) {
    return v2;
  }
  else {
    return 15;
  }
}

- (id)decodingCommitActionBlock
{
  uint64_t v6 = objc_msgSend_defaultCommitActionBehaviorForLocale_(MEMORY[0x1E4F56780], a2, (uint64_t)self->_locale, v2, v3, v4);
  uint64_t v7 = v6;
  unint64_t language = self->_language;
  BOOL v9 = language > 0x17;
  uint64_t v10 = (1 << language) & 0xB80000;
  if (!v9 && v10 != 0)
  {

    uint64_t v7 = &unk_1F2013B28;
  }
  size_t v12 = (void *)MEMORY[0x1C8786E90](v7);

  return v12;
}

- (id)pathScoringFunctionForLanguageResourceBundle:(id)a3
{
  id v4 = a3;
  BOOL v9 = objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_(MEMORY[0x1E4F56790], v5, (uint64_t)v4, v6, v7, v8);
  uint64_t v10 = v9;
  if (self->_mode == 1)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1C4B70400;
    v15[3] = &unk_1E64E43E0;
    id v16 = v9;
    uint64_t v11 = (void *)MEMORY[0x1C8786E90](v15);
    size_t v12 = (void *)MEMORY[0x1C8786E90]();
  }
  else
  {
    size_t v12 = (void *)MEMORY[0x1C8786E90](v9);
  }
  uint64_t v13 = (void *)MEMORY[0x1C8786E90](v12);

  return v13;
}

- (unint64_t)mixedScriptPenalty
{
  unint64_t script = self->_script;
  if (script == 7) {
    return 1;
  }
  else {
    return 2 * (script == 8);
  }
}

- (id)languageResourceBundleWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 wordLanguageModel:(void *)a5
{
  v220[2] = *MEMORY[0x1E4F143B8];
  uint64_t v216 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5);
  if (!self)
  {
LABEL_26:
    uint64_t v74 = 0;
    if (qword_1EA3CA000 != -1) {
      goto LABEL_24;
    }
    goto LABEL_27;
  }
  uint64_t v13 = objc_msgSend_objectForKey_(0, v9, @"DecodingLexiconWeight", v10, v11, v12);
  if (v13)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v14 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        objc_msgSend_floatValue(v13, v15, v16, v17, v18, v19);
        double v21 = v20;
        goto LABEL_7;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v14 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "decodingLexiconWeight from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_6;
  }
  int contentType = self->_contentType;
  if ((contentType - 4) < 2)
  {
    double v21 = 0.1;
  }
  else
  {
    double v21 = 0.0;
    if (contentType == 3 || !contentType)
    {
      switch(self->_script)
      {
        case 0uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
          double v21 = 0.3;
          break;
        case 1uLL:
          unint64_t language = self->_language;
          if (language == 27) {
            double v21 = 0.2;
          }
          else {
            double v21 = dbl_1C4C446B0[language - 7 < 0xC];
          }
          break;
        default:
          break;
      }
    }
  }
LABEL_7:

  uint64_t v26 = objc_msgSend_objectForKey_(0, v22, @"DecodingLexiconLowerBoundLogProbability", v23, v24, v25);
  if (v26)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v27 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        objc_msgSend_floatValue(v26, v28, v29, v30, v31, v32);
        double v34 = v33;
        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v27 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v26;
    _os_log_impl(&dword_1C492D000, v27, OS_LOG_TYPE_DEFAULT, "decodingLexiconLowerBoundLogProbability from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_11;
  }
  double v34 = -6.90775528;
LABEL_18:

  if (v21 <= 0.0) {
    goto LABEL_26;
  }
  if (a3)
  {
    id v36 = objc_alloc(MEMORY[0x1E4F56760]);
    uint64_t v40 = objc_msgSend_initWithLexicon_priority_(v36, v37, (uint64_t)a3, 1, v38, v39);
    objc_msgSend_addObject_(v216, v41, (uint64_t)v40, v42, v43, v44);
  }
  if (a4)
  {
    id v45 = objc_alloc(MEMORY[0x1E4F56760]);
    uint64_t v49 = objc_msgSend_initWithLexicon_priority_(v45, v46, (uint64_t)a4, 0, v47, v48);
    objc_msgSend_addObject_(v216, v50, (uint64_t)v49, v51, v52, v53);
  }
  id v54 = objc_alloc(MEMORY[0x1E4F56768]);
  uint64_t v60 = objc_msgSend_numberWithDouble_(NSNumber, v55, v56, v57, v58, v59, v21);
  uint64_t v66 = objc_msgSend_numberWithDouble_(NSNumber, v61, v62, v63, v64, v65, v34);
  uint64_t v72 = objc_msgSend_lexiconStringNormalizationFunction(self, v67, v68, v69, v70, v71);
  uint64_t v74 = objc_msgSend_initWithLexicons_decodingWeight_lowerBoundLogProbability_inputNormalizationFunction_(v54, v73, (uint64_t)v216, (uint64_t)v60, (uint64_t)v66, v72);

  if (qword_1EA3CA000 != -1)
  {
LABEL_24:
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v75 = (id)qword_1EA3C9F98;
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v75 = (id)qword_1EA3C9F98;
  if (!os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_36;
  }
LABEL_28:
  if (self)
  {
    int v81 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v76, v77, v78, v79, v80);
    unint64_t v82 = self->_language - 1;
    if ((0x7F3FFFFu >> v82)) {
      int v83 = 0;
    }
    else {
      int v83 = v81;
    }
    if (v82 <= 0x1A) {
      int v84 = v83;
    }
    else {
      int v84 = v81;
    }
  }
  else
  {
    int v84 = 0;
  }
  LODWORD(buf) = 67109120;
  DWORD1(buf) = v84;
  _os_log_impl(&dword_1C492D000, v75, OS_LOG_TYPE_DEFAULT, "CHRecognizer is running rnn character language model: %d", (uint8_t *)&buf, 8u);
LABEL_36:

  if (!self)
  {
    uint64_t v116 = 0;
    uint64_t v157 = 0;
    goto LABEL_75;
  }
  uint64_t v89 = objc_msgSend_objectForKey_(0, v85, @"DecodingCharacterLMWeight", v86, v87, v88);
  if (v89)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v90 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
LABEL_41:

        objc_msgSend_floatValue(v89, v91, v92, v93, v94, v95);
        double v97 = v96;
        goto LABEL_42;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v90 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v89;
    _os_log_impl(&dword_1C492D000, v90, OS_LOG_TYPE_DEFAULT, "decodingCharacterLMWeight from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_41;
  }
  double v97 = 0.0;
  switch(self->_script)
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
      double v97 = 0.3;
      break;
    case 1uLL:
      unint64_t v180 = self->_language;
      if (v180 != 27)
      {
        if (v180 - 7 >= 0xC) {
          double v97 = 0.219690248;
        }
        else {
          double v97 = 0.0;
        }
      }
      break;
    case 4uLL:
      double v97 = 0.15;
      break;
    case 6uLL:
      double v97 = 0.1;
      break;
    case 7uLL:
      double v97 = 0.4;
      break;
    case 8uLL:
      double v97 = 0.2;
      break;
    default:
      break;
  }
LABEL_42:

  uint64_t v102 = objc_msgSend_objectForKey_(0, v98, @"DecodingCharacterLMLowerBoundLogProbability", v99, v100, v101);
  if (v102)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v103 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
LABEL_46:

        objc_msgSend_floatValue(v102, v104, v105, v106, v107, v108);
        double v110 = v109;
        goto LABEL_52;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v103 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v102;
    _os_log_impl(&dword_1C492D000, v103, OS_LOG_TYPE_DEFAULT, "characterLMLowerBoundLogProbability from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_46;
  }
  if (self->_script == 1) {
    double v110 = -6.90775528;
  }
  else {
    double v110 = -1.79769313e308;
  }
LABEL_52:

  if (v97 <= 0.0)
  {
LABEL_53:
    uint64_t v116 = 0;
    goto LABEL_60;
  }
  int v117 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v111, v112, v113, v114, v115);
  unint64_t v118 = self->_language;
  if (v118 - 1 < 0x12 || v118 - 21 < 7) {
    goto LABEL_56;
  }
  if (!v117)
  {
    if (v118 <= 0x14 && ((1 << v118) & 0x180001) != 0) {
      goto LABEL_53;
    }
LABEL_56:
    *((void *)&buf + 1) = 0;
    uint64_t v218 = 0;
    *(void *)&long long buf = (char *)&buf + 8;
    uint64_t v119 = objc_msgSend_newCharacterLanguageModelAndMap_force_(self, v111, (uint64_t)&buf, 1, v114, v115);
    if (v119)
    {
      id v120 = objc_alloc(MEMORY[0x1E4F56758]);
      locale = self->_locale;
      uint64_t v127 = objc_msgSend_numberWithDouble_(NSNumber, v122, v123, v124, v125, v126, v97);
      uint64_t v133 = objc_msgSend_numberWithDouble_(NSNumber, v128, v129, v130, v131, v132, v110);
      uint64_t v116 = objc_msgSend_initWithLMLanguageModel_locale_decodingWeight_lowerBoundLogProbability_(v120, v134, v119, (uint64_t)locale, (uint64_t)v127, (uint64_t)v133);

      LMLanguageModelRelease();
    }
    else
    {
      uint64_t v116 = 0;
    }
    sub_1C4999C7C((uint64_t)&buf, *((void **)&buf + 1));
    goto LABEL_60;
  }
  uint64_t v181 = objc_msgSend_forcedGen2ModelLocaleForLocale_(CHRecognizerConfiguration, v111, (uint64_t)self->_locale, v113, v114, v115);
  uint64_t v213 = v181;
  if (!v181) {
    uint64_t v181 = self->_locale;
  }
  id v182 = v181;
  v219[0] = *MEMORY[0x1E4F567B0];
  id v214 = v182;
  uint64_t v188 = objc_msgSend_localeIdentifier(v182, v183, v184, v185, v186, v187);
  v220[0] = v188;
  v219[1] = *MEMORY[0x1E4F567B8];
  uint64_t v193 = objc_msgSend_numberWithInt_(NSNumber, v189, 1, v190, v191, v192);
  v220[1] = v193;
  v196 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v194, (uint64_t)v220, (uint64_t)v219, 2, v195);

  uint64_t v197 = (const void *)CVNLPLanguageModelCreate();
  if (v197)
  {
    id v198 = objc_alloc(MEMORY[0x1E4F56758]);
    uint64_t v204 = objc_msgSend_numberWithDouble_(NSNumber, v199, v200, v201, v202, v203, v97, v213);
    uint64_t v210 = objc_msgSend_numberWithDouble_(NSNumber, v205, v206, v207, v208, v209, v110);
    uint64_t v116 = objc_msgSend_initWithCVNLPLanguageModel_locale_decodingWeight_lowerBoundLogProbability_(v198, v211, (uint64_t)v197, (uint64_t)v214, (uint64_t)v204, (uint64_t)v210);

    CFRelease(v197);
  }
  else
  {
    uint64_t v116 = 0;
  }

LABEL_60:
  uint64_t v135 = objc_msgSend_objectForKey_(0, v111, @"DecodingWordLMWeight", v113, v114, v115, v213);
  if (v135)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v136 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
LABEL_64:

        objc_msgSend_floatValue(v135, v137, v138, v139, v140, v141);
        double v143 = v142;
        goto LABEL_66;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v136 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_64;
      }
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v135;
    _os_log_impl(&dword_1C492D000, v136, OS_LOG_TYPE_DEFAULT, "decodingWordLMWeight from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_64;
  }
  double v143 = 0.0;
  if (!self->_contentType)
  {
    unint64_t script = self->_script;
    if (script == 7)
    {
      double v143 = 0.117129375;
    }
    else if (script == 1)
    {
      unint64_t v179 = self->_language;
      if (v179 == 27) {
        double v143 = 0.1;
      }
      else {
        double v143 = dbl_1C4C446C0[v179 - 7 < 0xC];
      }
    }
  }
LABEL_66:

  uint64_t v148 = objc_msgSend_objectForKey_(0, v144, @"DecodingWordLMLowerBoundLogProbability", v145, v146, v147);
  if (!v148)
  {
    double v156 = -6.90775528;
    goto LABEL_72;
  }
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v149 = (id)qword_1EA3C9F98;
    if (!os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  uint64_t v149 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
  {
LABEL_69:
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v148;
    _os_log_impl(&dword_1C492D000, v149, OS_LOG_TYPE_DEFAULT, "decodingWordLMLowerBoundLogProbability from override weights: %@", (uint8_t *)&buf, 0xCu);
  }
LABEL_70:

  objc_msgSend_floatValue(v148, v150, v151, v152, v153, v154);
  double v156 = v155;
LABEL_72:

  uint64_t v157 = 0;
  if (a5 && v143 > 0.0)
  {
    id v158 = objc_alloc(MEMORY[0x1E4F56758]);
    uint64_t v159 = self->_locale;
    v165 = objc_msgSend_numberWithDouble_(NSNumber, v160, v161, v162, v163, v164, v143);
    uint64_t v171 = objc_msgSend_numberWithDouble_(NSNumber, v166, v167, v168, v169, v170, v156);
    uint64_t v157 = objc_msgSend_initWithLMLanguageModel_locale_decodingWeight_lowerBoundLogProbability_(v158, v172, (uint64_t)a5, (uint64_t)v159, (uint64_t)v165, (uint64_t)v171);
  }
LABEL_75:
  id v173 = objc_alloc(MEMORY[0x1E4F56770]);
  uint64_t v176 = objc_msgSend_initWithLexicons_characterLanguageModel_wordLanguageModel_(v173, v174, (uint64_t)v74, (uint64_t)v116, (uint64_t)v157, v175);

  return v176;
}

- (BOOL)shouldUseModernizedCTCDecoder
{
  int shouldRunNextGenRecognizer = objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5);
  if (shouldRunNextGenRecognizer)
  {
    unsigned int mode = self->_mode;
    BOOL v9 = mode > 6;
    int v10 = (1 << mode) & 0x56;
    LOBYTE(shouldRunNextGenRecognizer) = !v9 && v10 != 0 && self->_script < 9;
  }
  return shouldRunNextGenRecognizer;
}

- (void)lexiconStringNormalizationFunction
{
  if (self->_script == 5) {
    return compatibilityJamoFromComposedHangulString;
  }
  else {
    return 0;
  }
}

+ (BOOL)shouldApplyLatinSpacingForLocale:(id)a3
{
  unint64_t v5 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, 0, (uint64_t *)&v5);
  return (v5 > 6) | (0x23u >> v5) & 1;
}

+ (BOOL)shouldUseFullWidthSpaceBasedOnContextForLocale:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  return v4 == 4;
}

+ (id)swappableColumnIndexesFromResults:(id)a3 locales:(id)a4
{
  unint64_t v5 = objc_msgSend_swappableColumnIndexesFromResults_locales_topLocaleIndex_(CHRecognizerConfiguration, a2, (uint64_t)a3, (uint64_t)a4, 0, v4);
  return v5;
}

+ (id)swappableColumnIndexesFromResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5
{
  v148[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = objc_msgSend_numberWithInteger_(NSNumber, v9, a5, v10, v11, v12);
  v147[0] = v13;
  v147[1] = &unk_1F203F030;
  uint64_t v14 = NSNumber;
  uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v7, v15, a5, v16, v17, v18);
  uint64_t v25 = objc_msgSend_tokenColumns(v19, v20, v21, v22, v23, v24);
  uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
  id v36 = objc_msgSend_numberWithUnsignedInteger_(v14, v32, v31, v33, v34, v35);
  v147[2] = v36;
  v147[3] = &unk_1F203F030;
  v147[4] = &unk_1F203F030;
  uint64_t v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v147, 5, v38, v39);
  v148[0] = v40;
  uint64_t v44 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v41, (uint64_t)v148, 1, v42, v43);

  if ((unint64_t)objc_msgSend_count(v7, v45, v46, v47, v48, v49) >= 2
    && (unint64_t)objc_msgSend_count(v8, v50, v51, v52, v53, v54) > 1)
  {
    uint64_t v145 = 0;
    uint64_t v146 = 0;
    uint64_t v61 = objc_msgSend_objectAtIndexedSubscript_(v8, v55, a5, v56, v57, v58);
    sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v61, &v146, &v145);

    uint64_t v66 = objc_msgSend_indexOfObjectPassingTest_(v8, v62, (uint64_t)&unk_1F2013B48, v63, v64, v65);
    if (v146 == 27 || v145 != 1)
    {
      uint64_t v73 = v66;
      if (v66 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v74 = objc_msgSend_count(v7, v67, v68, v69, v70, v71);
        if (v74 == objc_msgSend_count(v8, v75, v76, v77, v78, v79))
        {
          if (v145 == 8)
          {
            uint64_t v144 = objc_msgSend_objectAtIndexedSubscript_(v7, v80, a5, v81, v82, v83);
            uint64_t v88 = objc_msgSend_objectAtIndexedSubscript_(v7, v84, v73, v85, v86, v87);
            if (objc_msgSend_tokenColumnCount(v88, v89, v90, v91, v92, v93) < 2)
            {
              BOOL v138 = 0;
            }
            else
            {
              uint64_t v141 = objc_msgSend_tokenColumns(v88, v94, v95, v96, v97, v98);
              float v142 = objc_msgSend_lastObject(v141, v99, v100, v101, v102, v103);
              double v143 = objc_msgSend_strokeIndexes(v142, v104, v105, v106, v107, v108);
              uint64_t Index = objc_msgSend_firstIndex(v143, v109, v110, v111, v112, v113);
              id v120 = objc_msgSend_tokenColumns(v144, v115, v116, v117, v118, v119);
              uint64_t v126 = objc_msgSend_firstObject(v120, v121, v122, v123, v124, v125);
              uint64_t v132 = objc_msgSend_strokeIndexes(v126, v127, v128, v129, v130, v131);
              BOOL v138 = Index == objc_msgSend_firstIndex(v132, v133, v134, v135, v136, v137);
            }
            objc_msgSend_swappableColumnIndexesInResults_locales_topLocaleIndex_swappableIndex_shouldReverseSwappableColumns_(CHTokenizedTextResult, v139, (uint64_t)v7, (uint64_t)v8, a5, v73, v138);
          }
          else
          {
            objc_msgSend_swappableColumnIndexesInResults_locales_topLocaleIndex_swappableIndex_shouldReverseSwappableColumns_(CHTokenizedTextResult, v80, (uint64_t)v7, (uint64_t)v8, a5, v73, 0);
          uint64_t v140 = };

          uint64_t v44 = (void *)v140;
        }
      }
    }
  }
  id v59 = v44;

  return v59;
}

+ (BOOL)shouldPerformStrictCandidateFiltering:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, &v4, 0);
  return (unint64_t)(v4 - 19) < 4;
}

+ (id)spellCheckingLocaleForRecognitionLocale:(id)a3 string:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v21 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v7, 0, &v21);
  uint64_t v13 = v7;
  if ((unint64_t)(v21 - 2) < 4)
  {
    objc_msgSend_firstComposedCharacter(v6, v8, v9, v10, v11, v12);
    uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = isCharacterLatinOrCommonScript(v14);

    uint64_t v13 = v7;
    if (v15)
    {
      uint64_t v13 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v16, @"en", v17, v18, v19);
    }
  }

  return v13;
}

+ (BOOL)shouldAdjustGroupingForLocale:(id)a3
{
  unint64_t v5 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, 0, (uint64_t *)&v5);
  return (v5 < 9) & (0x17Cu >> v5);
}

+ (int64_t)writingOrientationForLocale:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  if (v4 == 8) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (BOOL)shouldAdjustGroupingHeuristicsForVeryComplexCharacters:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  return (unint64_t)(v4 - 3) < 3;
}

+ (id)modelNameChinese
{
  return @"ctc_zh";
}

+ (id)modelNameJapanese
{
  return @"ctc_ja";
}

+ (id)modelNameThai
{
  return @"ctc_th";
}

+ (id)modelNameKorean
{
  return @"ctc_ko";
}

+ (id)modelNameLatin
{
  return @"ctc_latn";
}

+ (id)modelNameCyrillic
{
  return @"ctc_cyrl";
}

+ (id)modelNameArabic
{
  return @"ctc_ar";
}

+ (id)modelNameVietnamese
{
  return @"ctc_vi";
}

+ (id)allNonLatinModelNames
{
  v42[6] = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_modelNameChinese(CHRecognizerConfiguration, a2, v2, v3, v4, v5);
  v42[0] = v6;
  uint64_t v12 = objc_msgSend_modelNameJapanese(CHRecognizerConfiguration, v7, v8, v9, v10, v11);
  v42[1] = v12;
  uint64_t v18 = objc_msgSend_modelNameKorean(CHRecognizerConfiguration, v13, v14, v15, v16, v17);
  void v42[2] = v18;
  uint64_t v24 = objc_msgSend_modelNameThai(CHRecognizerConfiguration, v19, v20, v21, v22, v23);
  v42[3] = v24;
  uint64_t v30 = objc_msgSend_modelNameCyrillic(CHRecognizerConfiguration, v25, v26, v27, v28, v29);
  v42[4] = v30;
  id v36 = objc_msgSend_modelNameArabic(CHRecognizerConfiguration, v31, v32, v33, v34, v35);
  v42[5] = v36;
  uint64_t v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v42, 6, v38, v39);

  return v40;
}

+ (int64_t)drawingStrokeLimitForLocale:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v6 = 0;
    sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v3, 0, &v6);
    if ((unint64_t)(v6 - 2) >= 4) {
      int64_t v4 = 1000;
    }
    else {
      int64_t v4 = 100;
    }

    return v4;
  }
  else
  {

    return 1000;
  }
}

+ (BOOL)shouldRemoveSpaceBetweenPreviousChar:(id)a3 andNextChar:(id)a4 inLocale:(id)a5
{
  id v7 = (NSString *)a3;
  id v8 = a4;
  id v13 = a5;
  LOBYTE(v14) = 0;
  if (v7 && v8)
  {
    unint64_t v15 = objc_msgSend_characterTypeFromString_(CHCharacterSetRules, v9, (uint64_t)v7, v10, v11, v12);
    unint64_t v20 = objc_msgSend_characterTypeFromString_(CHCharacterSetRules, v16, (uint64_t)v8, v17, v18, v19);
    uint64_t v61 = 0;
    sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v13, &v61, 0);
    uint64_t v14 = objc_msgSend_countryCode(v13, v21, v22, v23, v24, v25);
    uint64_t v31 = objc_msgSend_uppercaseString((void *)v14, v26, v27, v28, v29, v30);

    uint64_t v32 = objc_opt_class();
    LODWORD(v14) = objc_msgSend_isCharacterEmoji_(v32, v33, (uint64_t)v7, v34, v35, v36);
    uint64_t v37 = objc_opt_class();
    isCharacterEmojuint64_t i = objc_msgSend_isCharacterEmoji_(v37, v38, (uint64_t)v8, v39, v40, v41);
    switch(v61)
    {
      case 0:
      case 4:
      case 5:
      case 6:
      case 23:
      case 27:
        uint64_t v14 = (v20 >> 25) & 1;
        break;
      case 1:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 24:
      case 25:
      case 26:
        uint64_t v14 = (v20 >> 25) & 1;
        if ((objc_msgSend_containsString_(v31, v43, @"AU", v44, v45, v46) & 1) == 0
          && (objc_msgSend_containsString_(v31, v47, @"CA", v48, v49, v50) & 1) == 0)
        {
          int v51 = (v20 >> 2) & 1 & (v15 >> 27) | v14;
          goto LABEL_21;
        }
        break;
      case 2:
        if (objc_msgSend_containsString_(v31, v43, @"CA", v44, v45, v46))
        {
          if ((v20 & 0x2000000) == 0) {
            goto LABEL_17;
          }
          LODWORD(v14) = objc_msgSend_isEqualToString_(v8, v56, @":", v57, v58, v59) ^ 1;
        }
        else
        {
          LOBYTE(v14) = (v20 & 0x6000000) == 0x2000000;
        }
        break;
      case 3:
        LODWORD(v14) = ((v20 >> 25) | (v15 >> 28)) & 1;
        break;
      case 19:
      case 20:
      case 21:
      case 22:
        uint64_t v52 = (v20 >> 30) & 1;
        if ((v15 & 0x80000000) == 0) {
          LODWORD(v52) = 0;
        }
        uint64_t v53 = (v15 >> 30) & 1;
        if ((v20 & 0x80000000) == 0) {
          LODWORD(v53) = 0;
        }
        int v54 = (v20 >> 25) & 1 | v52 | v53 | v14 | isCharacterEmoji;
        LOBYTE(v14) = v54 != 0;
        if (v61 != 22)
        {
          BOOL v55 = !isCharacterLatinOrCommonScript(v7) || !isCharacterLatinOrCommonScript((NSString *)v8);
          int v51 = v55 | v54;
LABEL_21:
          LOBYTE(v14) = v51 != 0;
        }
        break;
      default:
LABEL_17:
        LOBYTE(v14) = 0;
        break;
    }
  }
  return v14;
}

+ (BOOL)shouldInsertSpaceBetweenPreviousChar:(id)a3 andNextChar:(id)a4 inLocale:(id)a5 inString:(id)a6 atRange:(_NSRange)a7 withQuoteCount:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v13 = a3;
  uint64_t v14 = (NSString *)a4;
  id v15 = a5;
  uint64_t v16 = (NSString *)a6;
  id v21 = a8;
  LOBYTE(HasEmoticonStartingAtIndex) = 0;
  if (!v13 || !v14) {
    goto LABEL_14;
  }
  unint64_t v268 = objc_msgSend_characterTypeFromString_(CHCharacterSetRules, v17, (uint64_t)v13, v18, v19, v20);
  unint64_t v27 = objc_msgSend_characterTypeFromString_(CHCharacterSetRules, v23, (uint64_t)v14, v24, v25, v26);
  HasEmoticonStartingAtuint64_t Index = stringHasEmoticonStartingAtIndex(location, v16, v27, 1);
  uint64_t v270 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, v15, &v270, 0);
  uint64_t v33 = objc_msgSend_countryCode(v15, v28, v29, v30, v31, v32);
  v269 = objc_msgSend_uppercaseString(v33, v34, v35, v36, v37, v38);

  switch(v270)
  {
    case 0:
    case 19:
    case 20:
    case 21:
    case 22:
      if ((v268 & 0x40) == 0) {
        goto LABEL_8;
      }
      uint64_t v43 = v269;
      HasEmoticonStartingAtuint64_t Index = !isCharacterLatinOrCommonScript(v14);
      goto LABEL_13;
    case 1:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      uint64_t v43 = v269;
      if ((objc_msgSend_containsString_(v269, v39, @"AU", v40, v41, v42) & 1) != 0
        || objc_msgSend_containsString_(v269, v44, @"CA", v45, v46, v47))
      {
        int v48 = (v27 >> 2) & 1 & (v268 >> 27);
      }
      else
      {
        int v48 = 0;
      }
      LOBYTE(HasEmoticonStartingAtIndex) = (v48 | HasEmoticonStartingAtIndex) != 0;
      goto LABEL_13;
    case 2:
      uint64_t v43 = v269;
      if (objc_msgSend_containsString_(v269, v39, @"CA", v40, v41, v42)) {
        LOBYTE(v54) = objc_msgSend_isEqualToString_(v14, v50, @":", v51, v52, v53);
      }
      else {
        uint64_t v54 = (v27 >> 26) & 1;
      }
      if ((v268 & 0x2000000) != 0) {
        char v83 = 0;
      }
      else {
        char v83 = v54;
      }
      LOBYTE(HasEmoticonStartingAtIndex) = HasEmoticonStartingAtIndex | v83 | ((v27 & 0x8000000) != 0) & (v268 >> 2);
      goto LABEL_13;
    case 3:
      uint64_t v43 = v269;
      if (objc_msgSend_containsString_(v269, v39, @"ES", v40, v41, v42)) {
        int v59 = (v27 >> 27) & 1 & (v268 >> 2);
      }
      else {
        int v59 = 0;
      }
      int v84 = objc_msgSend_containsString_(v269, v55, @"MX", v56, v57, v58);
      int v85 = (v27 >> 2) & 1 & (v268 >> 27) | v59;
      if (!v84) {
        int v85 = v59;
      }
      HasEmoticonStartingAtIndex |= v85 | (v27 >> 28) & 1 & (v268 >> 25);
      goto LABEL_13;
    case 4:
    case 5:
    case 24:
    case 25:
    case 27:
      HasEmoticonStartingAtIndex |= (v27 >> 27) & 1 & (v268 >> 2);
      goto LABEL_10;
    case 6:
      uint64_t v43 = v269;
      if (objc_msgSend_containsString_(v269, v39, @"PT", v40, v41, v42)) {
        int v64 = (v27 >> 27) & 1 & (v268 >> 2);
      }
      else {
        int v64 = 0;
      }
      if (objc_msgSend_containsString_(v269, v60, @"BR", v61, v62, v63)) {
        v64 |= (v27 >> 2) & 1 & (v268 >> 27);
      }
      LOBYTE(HasEmoticonStartingAtIndex) = HasEmoticonStartingAtIndex | v64;
      goto LABEL_13;
    case 23:
      uint64_t v65 = objc_opt_class();
      int v70 = objc_msgSend_singleScriptCodeForString_(v65, v66, (uint64_t)v13, v67, v68, v69);
      uint64_t v71 = objc_opt_class();
      int v267 = objc_msgSend_singleScriptCodeForString_(v71, v72, (uint64_t)v14, v73, v74, v75);
      BOOL v82 = (v268 & 4) != 0 && (v27 & 4) == 0 && v267 == 38;
      int v86 = v70;
      BOOL v87 = v70 == 38;
      if ((v268 & 4) != 0) {
        BOOL v87 = 0;
      }
      uint64_t v88 = (v27 >> 2) & 1;
      int v89 = v87 & v88 | v82;
      if (v86 == 38)
      {
        uint64_t v259 = 0;
        if (v267 != 38 && v267 != 0) {
          int v89 = 1;
        }
        int v260 = v89;
      }
      else
      {
        int v260 = v89;
        BOOL v91 = v86 != 0;
        if (v267 != 38) {
          BOOL v91 = 0;
        }
        LOBYTE(v259) = v86 == 0;
        HIDWORD(v259) = v91;
      }
      if ((v27 & 0x2000000) != 0)
      {
        int IsMember = 1;
      }
      else
      {
        uint64_t v263 = objc_msgSend_ch_basicClosingParenthesesSet(MEMORY[0x1E4F28B88], v76, v77, v78, v79, v80);
        uint64_t v96 = objc_msgSend_characterAtIndex_(v14, v92, 0, v93, v94, v95);
        if (objc_msgSend_characterIsMember_(v263, v97, v96, v98, v99, v100))
        {
          int IsMember = 1;
        }
        else
        {
          uint64_t v106 = objc_msgSend_ch_thaiExtraSpaceAfterSymbolsSet(MEMORY[0x1E4F28B88], v101, v102, v103, v104, v105);
          uint64_t v111 = objc_msgSend_characterAtIndex_(v14, v107, 0, v108, v109, v110);
          int IsMember = objc_msgSend_characterIsMember_(v106, v112, v111, v113, v114, v115);
        }
        LODWORD(v88) = (v27 >> 2) & 1;
      }
      if ((v268 & 0x2000000) != 0)
      {
        if (((v88 | IsMember) & 1) == 0) {
          goto LABEL_64;
        }
LABEL_67:
        int v130 = 0;
        goto LABEL_71;
      }
      long long v264 = objc_msgSend_ch_thaiExtraSpaceAfterSymbolsSet(MEMORY[0x1E4F28B88], v76, v77, v78, v79, v80);
      uint64_t v120 = objc_msgSend_characterAtIndex_(v13, v116, 0, v117, v118, v119);
      if (!objc_msgSend_characterIsMember_(v264, v121, v120, v122, v123, v124))
      {
        int v130 = 0;
        goto LABEL_69;
      }

      if ((v88 | IsMember)) {
        goto LABEL_67;
      }
LABEL_64:
      unint64_t v125 = objc_msgSend_length(v16, v76, v77, v78, v79, v80);
      uint64_t v77 = location + length;
      if (location + length < v125)
      {
        long long v264 = objc_msgSend_substringFromIndex_(v16, v76, v77, v78, v79, v80);
        int v130 = objc_msgSend_hasPrefix_(v264, v126, @".", v127, v128, v129) ^ 1;
LABEL_69:

        goto LABEL_71;
      }
      int v130 = 1;
LABEL_71:
      uint64_t v265 = objc_msgSend_ch_basicOpeningParenthesesSet(MEMORY[0x1E4F28B88], v76, v77, v78, v79, v80);
      uint64_t v135 = objc_msgSend_characterAtIndex_(v13, v131, 0, v132, v133, v134);
      int v145 = v260 | HIDWORD(v259) | v130;
      if ((objc_msgSend_characterIsMember_(v265, v136, v135, v137, v138, v139) & 1) == 0)
      {
        uint64_t v146 = objc_msgSend_ch_basicOpeningParenthesesSet(MEMORY[0x1E4F28B88], v140, v141, v142, v143, v144);
        uint64_t v151 = objc_msgSend_characterAtIndex_(v14, v147, 0, v148, v149, v150);
        v145 |= objc_msgSend_characterIsMember_(v146, v152, v151, v153, v154, v155);
      }
      uint64_t v161 = objc_msgSend_ch_basicClosingParenthesesSet(MEMORY[0x1E4F28B88], v156, v157, v158, v159, v160);
      uint64_t v166 = objc_msgSend_characterAtIndex_(v13, v162, 0, v163, v164, v165);
      int v266 = objc_msgSend_characterIsMember_(v161, v167, v166, v168, v169, v170);

      uint64_t v176 = objc_msgSend_ch_thaiMathSymbolsNeedingSpaceSet(MEMORY[0x1E4F28B88], v171, v172, v173, v174, v175);
      uint64_t v181 = objc_msgSend_characterAtIndex_(v13, v177, 0, v178, v179, v180);
      int v262 = IsMember ^ 1;
      if (objc_msgSend_characterIsMember_(v176, v182, v181, v183, v184, v185)) {
        BOOL v187 = (v27 & 4) == 0 && v267 != 0;
      }
      else {
        BOOL v187 = 0;
      }
      int v188 = v145 | v266 & v262 | v187;

      if (!((v268 >> 2) & 1 | v259 & 1))
      {
        uint64_t v194 = objc_msgSend_ch_thaiMathSymbolsNeedingSpaceSet(MEMORY[0x1E4F28B88], v189, v190, v191, v192, v193);
        uint64_t v199 = objc_msgSend_characterAtIndex_(v14, v195, 0, v196, v197, v198);
        v188 |= objc_msgSend_characterIsMember_(v194, v200, v199, v201, v202, v203);
      }
      if (objc_msgSend_isEqualToString_(v13, v189, @"ฯ", v191, v192, v193))
      {
        uint64_t v208 = objc_msgSend_substringFromIndex_(v16, v204, location, v205, v206, v207);
        v188 |= objc_msgSend_hasPrefix_(v208, v209, @"ลฯ", v210, v211, v212) ^ 1;
      }
      uint64_t v213 = objc_msgSend_substringFromIndex_(v16, v204, location, v205, v206, v207);
      char hasPrefix = objc_msgSend_hasPrefix_(v213, v214, @"ฯลฯ", v215, v216, v217);

      uint64_t v224 = objc_msgSend_ch_neutralQuotationMarkSet(MEMORY[0x1E4F28B88], v219, v220, v221, v222, v223);
      uint64_t v229 = objc_msgSend_characterAtIndex_(v13, v225, 0, v226, v227, v228);
      if (objc_msgSend_characterIsMember_(v224, v230, v229, v231, v232, v233))
      {
        if (objc_msgSend_countForObject_(v21, v234, (uint64_t)v13, v235, v236, v237)) {
          char v238 = 0;
        }
        else {
          char v238 = v262;
        }
      }
      else
      {
        char v238 = 0;
      }

      uint64_t v244 = objc_msgSend_ch_neutralQuotationMarkSet(MEMORY[0x1E4F28B88], v239, v240, v241, v242, v243);
      uint64_t v249 = objc_msgSend_characterAtIndex_(v14, v245, 0, v246, v247, v248);
      if (objc_msgSend_characterIsMember_(v244, v250, v249, v251, v252, v253)) {
        BOOL v258 = (objc_msgSend_countForObject_(v21, v254, (uint64_t)v14, v255, v256, v257) & 1) == 0;
      }
      else {
        BOOL v258 = 0;
      }
      LOBYTE(HasEmoticonStartingAtIndex) = HasEmoticonStartingAtIndex | v258 | v188 | hasPrefix | v238;

LABEL_10:
      uint64_t v43 = v269;
LABEL_13:

LABEL_14:
      return HasEmoticonStartingAtIndex;
    case 26:
      goto LABEL_10;
    default:
LABEL_8:
      LOBYTE(HasEmoticonStartingAtIndex) = 0;
      goto LABEL_10;
  }
}

+ (BOOL)shouldRefinePrefixQueryMatchesForLocale:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)a1, a3, &v4, 0);
  return (unint64_t)(v4 - 19) < 4;
}

+ (BOOL)shouldAllowSpaceInsertionGestureForLocale:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  return v4 == 6;
}

+ (BOOL)shouldApplyThaiSpacingForLocale:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  return v4 == 6;
}

+ (BOOL)shouldSwapCyrillicTopResult:(id)a3 topRange:(_NSRange)a4 englishResult:(id)a5 englishRange:(_NSRange)a6 prevousGroupTopString:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v10 = a4.length;
  NSUInteger v11 = a4.location;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  self;
  self;
  self;
  self;
  self;
  self;
  self;
  self;
  objc_msgSend_averageTokenRecognitionScoreForColumnRange_(v12, v15, v11, v10, v16, v17);
  double v19 = v18;
  objc_msgSend_heuristicTextScoreForColumnRange_(v12, v20, v11, v10, v21, v22);
  double v24 = v23;
  objc_msgSend_averageTokenRecognitionScoreForColumnRange_(v13, v25, location, length, v26, v27);
  double v29 = v28;
  objc_msgSend_heuristicTextScoreForColumnRange_(v13, v30, location, length, v31, v32);
  double v34 = v33;
  uint64_t v40 = objc_msgSend_transcriptionPaths(v12, v35, v36, v37, v38, v39);
  uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(v40, v41, 0, v42, v43, v44);
  uint64_t v124 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v12, v46, (uint64_t)v45, v11, v10, 0);

  uint64_t v52 = objc_msgSend_transcriptionPaths(v13, v47, v48, v49, v50, v51);
  uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(v52, v53, 0, v54, v55, v56);
  int v59 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v13, v58, (uint64_t)v57, location, length, 0);

  uint64_t v65 = objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E4F28B88], v60, v61, v62, v63, v64);
  uint64_t v69 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v124, v66, (uint64_t)v65, 0, v67, v68);

  uint64_t v75 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v70, v71, v72, v73, v74);
  uint64_t v79 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v59, v76, (uint64_t)v75, 0, v77, v78);

  int v85 = objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E4F28B88], v80, v81, v82, v83, v84);
  uint64_t v89 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v14, v86, (uint64_t)v85, 1, v87, v88);

  uint64_t v95 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v90, v91, v92, v93, v94);
  uint64_t v96 = v14;
  uint64_t v100 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v14, v97, (uint64_t)v95, 1, v98, v99);

  BOOL v105 = v69 == 1 && v79 == 1;
  int v106 = v105;
  BOOL v108 = v105 && v100 > 0 && v89 < 1;
  if (v100 >= 1) {
    int v106 = 0;
  }
  if (v89 > 0) {
    int v109 = v106;
  }
  else {
    int v109 = 0;
  }
  BOOL v110 = (v69 | v79) == 0;
  uint64_t v111 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v101, @"èéêëÈÉÊË", v102, v103, v104);
  uint64_t v115 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v59, v112, (uint64_t)v111, 1, v113, v114);

  BOOL v116 = 0;
  if (((v109 | v110) & 1) == 0 && v115 <= 0)
  {
    BOOL v117 = v24 > v34 * 1.45;
    if (v19 < v29 * 0.55) {
      BOOL v117 = 0;
    }
    BOOL v118 = v19 > 0.98;
    if (v29 >= 0.98) {
      BOOL v118 = 0;
    }
    BOOL v116 = !v118 && !v117;
  }
  BOOL v119 = v29 > v19 * 1.052664;
  if (v34 < v24 * 0.948053) {
    BOOL v119 = 0;
  }
  BOOL v120 = v34 > v24 * 1.478344;
  if (v29 < v19 * 0.943234) {
    BOOL v120 = 0;
  }
  char v121 = v119 || v120;
  if (v34 > v24 * 2.858661) {
    char v121 = 1;
  }
  if (v29 > v19 * 1.33896) {
    char v121 = 1;
  }
  BOOL v122 = (v121 | v108) & v116;

  return v122;
}

+ (BOOL)shouldAddSpaceToNeutralQuotationMarks:(id)a3
{
  uint64_t v4 = 0;
  sub_1C492FBB0((uint64_t)CHRecognizerConfiguration, a3, &v4, 0);
  return v4 == 23;
}

- (int)mode
{
  return self->_mode;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)contentTypeForNoSpaceRecognition
{
  return self->_contentTypeForNoSpaceRecognition;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (int)baseWritingDirection
{
  return *(void *)&self->_baseWritingDirection;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (BOOL)enableGen2ModelIfAvailable
{
  return self->_enableGen2ModelIfAvailable;
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  return self->_enableGen2CharacterLMIfAvailable;
}

- (void).cxx_destruct
{
}

@end