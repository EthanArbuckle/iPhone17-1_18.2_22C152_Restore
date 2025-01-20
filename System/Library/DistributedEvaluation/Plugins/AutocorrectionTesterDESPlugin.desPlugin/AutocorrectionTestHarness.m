@interface AutocorrectionTestHarness
+ (id)overrideInputMode:(id)a3;
- (AutocorrectionTestHarness)initWithAttributes:(id)a3;
- (BOOL)compareExpectedValue:(id)a3 withResult:(id)a4;
- (BOOL)multilingualEnabled;
- (BOOL)outcomeIsFailureForTest:(id)a3 withResult:(id)a4;
- (BOOL)requiresMaintenance;
- (BOOL)saveDebugData;
- (NSArray)resultClassifiers;
- (NSString)typologyOutpath;
- (TIInputMode)secondaryInputMode;
- (TIKeyboardInputManagerConfig)config;
- (TIKeyboardTyper)testTyper;
- (TITestTyperDriver)dslTestDriver;
- (id)emptyResultForPlayback:(id)a3;
- (id)emptyResultForTest:(id)a3;
- (id)friendId;
- (id)keyboardFromWidth:(id)a3 useDynamicLayout:(BOOL)a4 orientation:(id)a5 keyboardLayout:(id)a6;
- (id)newKeyboardInputManager;
- (id)replayTest:(id)a3 withError:(id)a4;
- (id)runConversationTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5;
- (id)runTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5;
- selfId;
- (id)testTerminator;
- (id)typeTest:(id)a3 withError:(id)a4;
- (unsigned)seedForTest:(id)a3 trialID:(unint64_t)a4;
- (void)initializeConversationHistory;
- (void)nullifyConversationHistory;
- (void)reset;
- (void)setSaveDebugData:(BOOL)a3;
- (void)setTypologyOutpath:(id)a3;
- (void)tearDown;
- (void)testConversation:(id)a3 testingSender:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7 trialID:(unint64_t)a8 withError:(id)a9 writingResults:(id)a10;
- (void)trainWithCorpus:(id)a3;
@end

@implementation AutocorrectionTestHarness

- (id)keyboardFromWidth:(id)a3 useDynamicLayout:(BOOL)a4 orientation:(id)a5 keyboardLayout:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  [a3 floatValue];
  if (v7)
  {
    unsigned int v12 = [v9 isEqualToString:@"Portrait"];
    v13 = +[UIScreen mainScreen];
    if (v12) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 4;
    }
    v15 = +[UIKBScreenTraits traitsWithScreen:v13 orientation:v14];

    [(__CFString *)v15 keyboardScreenReferenceSize];
    double v17 = v16;
    double v19 = v18;
    v20 = +[TUIKeyboardLayoutFactory sharedKeyboardFactory];
    objc_msgSend(v20, "keyboardSuffixForScreenDimensions:", v17, v19);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    v22 = +[NSString stringWithFormat:@"%@-%@", v10, v21];
    v23 = +[NSString stringWithFormat:@"%@-%@", @"Dynamic", v22];
    +[TUIKeyplaneView keyplaneSizeForLayout:v23 screenTraits:v15 keyboardType:0];
    double v25 = v24;
    double v27 = v26;
    v28 = __stderrp;
    id v29 = v23;
    fprintf(v28, "Attempting to load dynamic keyboard layout named: %s\n", (const char *)[v29 UTF8String]);
    v30 = +[TUIKeyplaneView dynamicKeyboardForName:size:isLandscape:](TUIKeyplaneView, "dynamicKeyboardForName:size:isLandscape:", v22, [v9 isEqualToString:@"Landscape"], v25, v27);

    goto LABEL_29;
  }
  float v31 = v11;
  if (v11 >= 320.0)
  {
    v32 = +[TUIKeyboardLayoutFactory sharedKeyboardFactory];
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      id v34 = [v9 isEqualToString:@"Portrait"];
      v35 = +[TUIKeyboardLayoutFactory sharedKeyboardFactory];
      v15 = [v35 keyboardPrefixForWidth:v34 andEdge:v31];

      if (v15) {
        goto LABEL_28;
      }
    }
    if ([v9 isEqualToString:@"Portrait"])
    {
      CFStringRef v36 = @"Wildcat-Portrait";
      CFStringRef v37 = @"iPhone-Portrait";
      if (v31 < 320.0) {
        CFStringRef v37 = 0;
      }
      if (v31 < 768.0) {
        CFStringRef v36 = v37;
      }
      if (v31 < 1024.0) {
        v15 = (__CFString *)v36;
      }
      else {
        v15 = @"Wildcat-PortraitFudge";
      }
      goto LABEL_28;
    }
    if ([v9 isEqualToString:@"Landscape"])
    {
      if (v31 >= 1366.0)
      {
        v15 = @"Wildcat-LandscapeFudge";
        goto LABEL_28;
      }
      if (v31 >= 1024.0)
      {
        v15 = @"Wildcat-Landscape";
        goto LABEL_28;
      }
      if (v31 >= 568.0)
      {
        v15 = @"iPhone-Caymen";
        goto LABEL_28;
      }
      if (v31 >= 480.0)
      {
        v15 = @"iPhone-Landscape";
        goto LABEL_28;
      }
    }
    v15 = 0;
  }
  else
  {
    v15 = @"iPhone-Portrait";
  }
LABEL_28:
  v38 = +[NSString stringWithFormat:@"%@-%@", v15, v10];
  v39 = __stderrp;
  id v21 = v38;
  fprintf(v39, "Attempting to load keyboard named: %s\n", (const char *)[v21 UTF8String]);
  v22 = +[TUIKeyboardLayoutFactory sharedKeyboardFactory];
  v30 = [v22 keyboardWithName:v21 inCache:0];
LABEL_29:

  return v30;
}

- (AutocorrectionTestHarness)initWithAttributes:(id)a3
{
  id v6 = a3;
  v163.receiver = self;
  v163.super_class = (Class)AutocorrectionTestHarness;
  BOOL v7 = [(AutocorrectionTestHarness *)&v163 init];

  v162 = v7;
  if (v7)
  {
    uint64_t v8 = [v6 valueForKey:@"TYPOLOGY_OUTPATH"];
    typologyOutpath = v7->_typologyOutpath;
    v7->_typologyOutpath = (NSString *)v8;

    if (v7->_typologyOutpath)
    {
      id v10 = +[NSFileManager defaultManager];
      unsigned __int8 v11 = [v10 createDirectoryAtPath:v7->_typologyOutpath withIntermediateDirectories:1 attributes:0 error:0];

      if ((v11 & 1) == 0)
      {
        NSLog(@"Failure creating TYPOLOGY_OUTPATH %@", v7->_typologyOutpath);
        unsigned int v12 = v7->_typologyOutpath;
        v7->_typologyOutpath = 0;
      }
    }
    id v13 = objc_alloc_init((Class)TIKeyboardInputManagerConfig);
    v154 = v13;
    [v13 setDisableAnalytics:1];
    uint64_t v14 = [v6 valueForKey:@"INPUT_MODE"];
    v155 = v14;
    if ([v14 containsString:@"sw="])
    {
      id v160 = v14;
    }
    else
    {
      v15 = UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom();
      double v16 = [v15 objectAtIndex:0];

      UIKeyboardInputModeWithNewSWLayout();
      id v160 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v17 = [v6 objectForKey:@"SIRI_MODE"];
    double v18 = v17;
    double v19 = @"NO";
    if (!v17) {
      double v17 = @"NO";
    }
    id v20 = [(__CFString *)v17 BOOLValue];

    id v21 = &CFAbsoluteTimeGetCurrent_ptr;
    v159 = +[TIInputMode inputModeWithIdentifier:v160 isSiriMode:v20];
    v22 = [v159 normalizedIdentifier];
    v161 = TIGetInputModeProperties();

    v23 = [v6 objectForKey:@"USE_LANGUAGE_MODEL"];
    double v24 = v23;
    if (!v23)
    {
      double v24 = [v161 objectForKey:TIInputModePropertiesHasWordNgramModel];
    }
    objc_msgSend(v13, "setUsesWordNgramModel:", objc_msgSend(v24, "BOOLValue"));
    if (!v23) {

    }
    if ([v13 usesWordNgramModel]
      && (objc_opt_respondsToSelector() & 1) != 0
      && ![v159 keyboardFeatureSpecializationClassFromInputModeProperties])
    {
      [v159 setQuickTypeKeyboardFeatureSpecializationClass];
    }
    double v25 = +[AutocorrectionTestHarness overrideInputMode:v159];
    [v13 setInputMode:v25];

    double v26 = [v13 inputMode];
    objc_msgSend(v13, "setAllowsSpaceCorrections:", objc_msgSend(v26, "spaceAutocorrectionEnabled"));

    double v27 = [v13 inputMode];
    objc_msgSend(v13, "setUsesETSRescoring:", objc_msgSend(v27, "typedStringLMRankingEnabled"));

    v28 = [v161 objectForKey:TIInputModePropertiesAutocorrectSpellingKey];
    objc_msgSend(v13, "setUsesTextChecker:", objc_msgSend(v28, "BOOLValue"));

    id v29 = [v6 objectForKey:@"USE_RETROCORRECTION"];
    v30 = v29;
    if (!v29) {
      id v29 = @"NO";
    }
    objc_msgSend(v13, "setUsesRetrocorrection:", -[__CFString BOOLValue](v29, "BOOLValue"));

    float v31 = [v6 objectForKey:@"WORD_LEARNING_ENABLED"];
    if ([v31 BOOLValue])
    {
      id v32 = &def_3B118 + 1;
    }
    else
    {
      char v33 = [v6 objectForKey:@"USES_ADAPTATION"];
      v3 = v33;
      if (!v33)
      {
        char v33 = [v6 objectForKey:@"USE_WORD_NGRAM_MODEL_ADAPTATION"];
        v4 = v33;
        if (!v33) {
          char v33 = @"NO";
        }
      }
      id v32 = [(__CFString *)v33 BOOLValue];
      if (!v3) {
    }
      }
    if (objc_opt_respondsToSelector())
    {
      [v13 setUsesAdaptation:v32];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v13 setUsesWordNgramModelAdaptation:v32];
    }
    id v34 = [v6 objectForKey:@"NEGATIVE_LEARNING_ENABLED"];
    objc_msgSend(v13, "setNegativeLearningDisabled:", objc_msgSend(v34, "BOOLValue") ^ 1);

    v35 = [v6 objectForKey:@"MAX_WORDS_PER_PREDICTION"];
    CFStringRef v36 = v35;
    if (!v35) {
      v35 = &off_93F10;
    }
    objc_msgSend(v13, "setMaxWordsPerPrediction:", objc_msgSend(v35, "integerValue"));

    if (objc_opt_respondsToSelector())
    {
      CFStringRef v37 = [v6 objectForKey:@"CUSTOM_STATIC_DICTIONARY_PATH"];
      [v13 setUsesCustomStaticDictionary:v37 != 0];
    }
    v38 = [v6 objectForKey:@"CUSTOM_STATIC_DICTIONARY_PATH"];
    [v13 setStaticDictionaryPath:v38];

    if (objc_opt_respondsToSelector())
    {
      v39 = [v6 objectForKey:@"CUSTOM_LANGUAGE_MODEL_PATH"];
      [v13 setUsesCustomNgramModel:v39 != 0];
    }
    v40 = [v6 objectForKey:@"CUSTOM_LANGUAGE_MODEL_PATH"];
    v41 = v40;
    if (!v40)
    {
      v3 = [v13 inputMode];
      double v19 = [v3 languageWithRegion];
      v41 = TINgramModelPathForInputMode();
    }
    [v13 setNgramModelPath:v41];
    if (!v40)
    {
    }
    v42 = [v6 objectForKey:@"CUSTOM_DYNAMIC_RESOURCE_PATH"];
    v43 = v42;
    if (!v42)
    {
      v43 = UIKeyboardUserDirectory();
    }
    [v13 setDynamicResourcePath:v43];
    if (!v42) {

    }
    v44 = [v6 objectForKey:@"CUSTOM_SHAPE_STORE_DIR"];
    v45 = v44;
    if (!v44)
    {
      v45 = [v13 dynamicResourcePath];
    }
    [v13 setShapeStoreResourceDir:v45];
    if (!v44) {

    }
    if (objc_opt_respondsToSelector())
    {
      v46 = [v161 objectForKey:TIInputModePropertiesUseStemSuffixCorrectionFactorKey];
      objc_msgSend(v13, "setUsesStemSuffixCorrectionFactor:", objc_msgSend(v46, "BOOLValue"));
    }
    uint64_t v47 = [v6 objectForKey:@"FAVONIUS_LANGUAGE_MODEL_WEIGHT"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v157 = (void *)v47;
      id v48 = objc_alloc_init((Class)NSNumberFormatter);
      [v48 setNumberStyle:1];
      v45 = [v6 objectForKey:@"FAVONIUS_LANGUAGE_MODEL_WEIGHT"];
      uint64_t v47 = [v48 numberFromString:v45];
    }
    if (v47)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
        [v13 setFavoniusLanguageModelWeight:v47];
      }
    }
    v158 = (void *)v47;
    uint64_t v49 = [v6 objectForKey:@"MLTT_BUNDLE_URL"];
    v153 = (void *)v49;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v13 setMlttBundleURL:v49];
    }
    [v13 setTesting:1];
    [v13 setUsesUserModelLogging:0];
    [v13 setStickerSuggestionsEnabled:0];
    objc_storeStrong((id *)&v7->_config, v13);
    v50 = [v6 objectForKey:@"MAX_PREDICTIONS"];
    v51 = v50;
    if (!v50)
    {
      v50 = [v6 objectForKey:@"SIZE_OF_AUTOCORRECTION_LIST"];
      v45 = v50;
      if (!v50) {
        v50 = @"3";
      }
    }
    signed int v52 = [(__CFString *)v50 intValue];
    if (!v51) {

    }
    v53 = [v161 objectForKey:TIInputModePropertiesSupportsMultilingual];
    unsigned int v54 = [v53 BOOLValue];

    if (v54)
    {
      v55 = [v6 objectForKey:@"MULTILINGUAL_ENABLED"];
      v56 = v55;
      if (!v55) {
        v55 = &__kCFBooleanFalse;
      }
      v162->_multilingualEnabled = [v55 BOOLValue];
    }
    else
    {
      v162->_multilingualEnabled = 0;
    }
    v156 = [v6 objectForKey:@"KEYBOARD_SECOND_LANGUAGE"];
    if ([v156 length])
    {
      uint64_t v57 = +[TIInputMode inputModeWithIdentifier:v156];
      secondaryInputMode = v162->_secondaryInputMode;
      v162->_secondaryInputMode = (TIInputMode *)v57;
    }
    v59 = [[TIKeyboardTyper alloc] initWithInputMode:v159];
    v60 = [v6 objectForKey:@"BAD_SENTENCES_FILE_PATH"];
    v61 = [v60 stringValue];
    [(TIKeyboardTyper *)v59 setBadSentenceLogFilePath:v61];

    [(TIKeyboardTyper *)v59 setInputModeIdentifier:v160];
    v62 = [v6 objectForKey:@"PRINT_TYPING_TRANSCRIPT"];
    -[TIKeyboardTyper setPrintTypingTranscript:](v59, "setPrintTypingTranscript:", [v62 BOOLValue]);

    v63 = [v6 objectForKey:@"SHOW_CANDIDATE_BAR"];
    -[TIKeyboardTyper setShowsCandidateBar:](v59, "setShowsCandidateBar:", [v63 BOOLValue]);

    v64 = [v6 objectForKey:@"TRANSLITERATION_SUMMARIES"];
    -[TIKeyboardTyper setPrintTranslitSummaries:](v59, "setPrintTranslitSummaries:", [v64 BOOLValue]);

    v65 = [v6 objectForKey:@"TEST_AUTO_FILL_FEATURE"];
    LODWORD(v61) = [v65 BOOLValue];

    v66 = [(TIKeyboardTyper *)v59 keyboardController];
    if (v61) {
      [v66 setIsScreenLocked:0];
    }
    else {
      [v66 setIsScreenLocked:v32 ^ 1];
    }

    uint64_t v67 = [v6 objectForKey:@"USE_LANGUAGE_MODEL"];
    v68 = (void *)v67;
    if (v67)
    {
      int v69 = 0;
      int v70 = 0;
      v71 = (void *)v67;
    }
    else
    {
      uint64_t v72 = [v6 objectForKey:@"USE_PREDICTION"];
      v66 = (void *)v72;
      if (v72)
      {
        int v69 = 0;
        int v70 = 0;
        v71 = (void *)v72;
      }
      else
      {
        uint64_t v73 = [v6 objectForKey:@"AUTOCORRECTION_LISTS"];
        id v21 = (CFAbsoluteTime (**)(void))v73;
        if (v73)
        {
          v66 = 0;
          int v70 = 0;
          int v69 = 1;
          v71 = (void *)v73;
        }
        else
        {
          v71 = [v161 objectForKey:TIInputModePropertiesEnablePrediction];
          v66 = 0;
          id v21 = 0;
          int v69 = 1;
          int v70 = 1;
        }
      }
    }
    unsigned int v74 = [v71 BOOLValue];
    if (v70) {

    }
    if (v69) {
    if (!v68)
    }

    if (v74) {
      [(TIKeyboardTyper *)v59 setUsesPrediction:1];
    }
    [(TIKeyboardTyper *)v59 setMaxPredictions:v52];
    [(TIKeyboardTyper *)v59 setKeyboardInputManagerFactory:v162];
    v75 = [v6 objectForKey:@"USE_AUTOCORRECTION"];
    v76 = v75;
    if (!v75) {
      v75 = &__kCFBooleanTrue;
    }
    -[TIKeyboardTyper setUsesAutocorrection:](v59, "setUsesAutocorrection:", [v75 BOOLValue]);

    v77 = [v6 objectForKey:@"USE_AUTOCAPITALIZATION"];
    v78 = v77;
    if (!v77) {
      v77 = &__kCFBooleanTrue;
    }
    -[TIKeyboardTyper setUsesAutocapitalization:](v59, "setUsesAutocapitalization:", [v77 BOOLValue]);

    v79 = [v6 objectForKey:@"WORD_LEARNING_ENABLED"];
    -[TIKeyboardTyper setWordLearningEnabled:](v59, "setWordLearningEnabled:", [v79 BOOLValue]);

    v80 = [v6 objectForKey:@"WARN_IF_SELECTING_POPUP_VARIANT"];
    v81 = v80;
    if (!v80) {
      v80 = &__kCFBooleanFalse;
    }
    -[TIKeyboardTyper setWarnIfSelectingPopupVariant:](v59, "setWarnIfSelectingPopupVariant:", [v80 BOOLValue]);

    v82 = [v6 objectForKey:@"MAX_PREDICTIONS_REPORTED"];
    v83 = v82;
    if (!v82) {
      v82 = @"0";
    }
    [(TIKeyboardTyper *)v59 setMaxPredictionsReported:[(__CFString *)v82 intValue]];

    v84 = [v6 objectForKey:@"LOG_DOCUMENT_CONTEXT"];
    v85 = v84;
    if (!v84) {
      v84 = &__kCFBooleanFalse;
    }
    -[TIKeyboardTyper setLogDocumentContext:](v59, "setLogDocumentContext:", [v84 BOOLValue]);

    v86 = [v6 objectForKey:@"CONTINUOUS_PATH_ENABLED"];
    v87 = v86;
    if (!v86) {
      v86 = &__kCFBooleanTrue;
    }
    id v88 = [v86 BOOLValue];

    v89 = [(AutocorrectionTestHarness *)v162 config];
    char v90 = objc_opt_respondsToSelector();

    if (v90)
    {
      v91 = [v6 objectForKey:@"CONTINUOUS_PATH_APPEND_SPACE"];
      v92 = v91;
      if (!v91) {
        v91 = &__kCFBooleanFalse;
      }
      -[TIKeyboardTyper setInsertsSpaceAfterPredictiveInput:](v59, "setInsertsSpaceAfterPredictiveInput:", [v91 BOOLValue]);

      v93 = [(AutocorrectionTestHarness *)v162 config];
      [v93 setUsesContinuousPath:v88];

      uint64_t v94 = [(AutocorrectionTestHarness *)v162 config];
      [(id)v94 setUsesCJContinuousPath:v88];

      v95 = [(AutocorrectionTestHarness *)v162 config];
      LOBYTE(v94) = objc_opt_respondsToSelector();

      if (v94)
      {
        v96 = [v6 objectForKey:@"CONTINUOUS_PATH_ALGORITHMS"];
        v97 = v96;
        if (!v96) {
          v96 = &off_93F28;
        }
        id v98 = [v96 intValue];
        v99 = [(AutocorrectionTestHarness *)v162 config];
        [v99 setContinuousPathEnabledAlgorithms:v98];
      }
      v100 = [(AutocorrectionTestHarness *)v162 config];
      char v101 = objc_opt_respondsToSelector();

      if (v101)
      {
        v102 = [v6 objectForKey:@"ENABLE_CONTINUOUS_PATH_RETROCORRECTION"];
        v103 = v102;
        if (!v102) {
          v102 = &__kCFBooleanTrue;
        }
        id v104 = [v102 BOOLValue];
        v105 = [(AutocorrectionTestHarness *)v162 config];
        [v105 setUsesContinuousPathRetrocorrection:v104];
      }
      v106 = [(AutocorrectionTestHarness *)v162 config];
      char v107 = objc_opt_respondsToSelector();

      if (v107)
      {
        v108 = [v6 objectForKey:@"CONTINUOUS_PATH_NUM_CANDIDATE_RESCORED_BY_LM"];
        v109 = v108;
        if (!v108) {
          v108 = &off_93F40;
        }
        id v110 = [v108 integerValue];
        v111 = [(AutocorrectionTestHarness *)v162 config];
        [v111 setCpCandidatesCount:v110];
      }
      v112 = [v161 objectForKey:TIInputModePropertiesContinuousPathParametersKey];
      v113 = [(AutocorrectionTestHarness *)v162 config];
      [v113 setContinuousPathParams:v112];

      v114 = [v161 objectForKey:TIInputModePropertiesContinuousPathEnsembleSourceWeightsKey];
      v115 = [(AutocorrectionTestHarness *)v162 config];
      [v115 setContinuousPathEnsembleSourceWeights:v114];

      v116 = [v161 objectForKey:TIInputModePropertiesContinuousPathEnsembleSourceScalesKey];
      v117 = [(AutocorrectionTestHarness *)v162 config];
      [v117 setContinuousPathEnsembleSourceScales:v116];
    }
    v118 = +[ACTUserActionStreamFactory userActionStreamWithParameters:v6 delegate:v59];
    [(TIKeyboardTyper *)v59 linkWithUserActionStream:v118];

    v119 = [(TIKeyboardTyper *)v59 userModel];
    -[TIKeyboardTyper setUsesTransliteration:](v59, "setUsesTransliteration:", [v119 prefersTransliteration]);

    v120 = UIKeyboardGetInputModeKBStarLayout();
    v121 = [v6 objectForKey:@"TTKKeyboardPlane"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v122 = [(TIKeyboardTyper *)v59 keyboardController];
      [(TTKSimpleKeyboardPlane *)v122 setTtkLayout:v121];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v122 = [[TTKSimpleKeyboardPlane alloc] initWithJsonDictionary:v121];
        v123 = [(TIKeyboardTyper *)v59 keyboardController];
        [v123 setTtkLayout:v122];
      }
      else
      {
        v122 = [v121 description];
        NSLog(@"TTKKeyboardPlane parameter was provided, but was neither a TTKSimpleKeyboardPlane nor a Dictionary of keys. Value was %@", v122);
      }
    }

    v124 = [v6 objectForKey:@"USE_DYNAMIC_LAYOUT"];
    v125 = v124;
    if (!v124) {
      v124 = &__kCFBooleanFalse;
    }
    id v126 = [v124 BOOLValue];

    v127 = [v6 objectForKey:@"KEYBOARD_WIDTH"];
    uint64_t v128 = [v6 objectForKey:@"KEYBOARD_ORIENTATION"];
    v129 = (void *)v128;
    if (v127) {
      v130 = v127;
    }
    else {
      v130 = &off_93F58;
    }
    if (v128) {
      CFStringRef v131 = (const __CFString *)v128;
    }
    else {
      CFStringRef v131 = @"Portrait";
    }
    v132 = [(AutocorrectionTestHarness *)v162 keyboardFromWidth:v130 useDynamicLayout:v126 orientation:v131 keyboardLayout:v120];
    [(TIKeyboardTyper *)v59 setKeyboard:v132];

    v133 = [v6 objectForKey:@"PERSONA"];

    if (v133)
    {
      v134 = [TITestUserPersona alloc];
      v135 = [v6 objectForKey:@"PERSONA"];
      v136 = [(TITestUserPersona *)v134 initWithPersonaName:v135];
      [(TIKeyboardTyper *)v59 setUserPersona:v136];

      v137 = [(TIKeyboardTyper *)v59 userPersona];
      v138 = [(TIKeyboardTyper *)v59 keyplane];
      [v137 updateFromKeyplane:v138];
    }
    else
    {
      [(TIKeyboardTyper *)v59 setUserPersona:0];
    }
    v139 = [(TIKeyboardTyper *)v59 userPersona];

    if (!v139)
    {
      v140 = +[TIErrorGenerator errorGeneratorWithAttributes:v6];
      if (!v140)
      {
        NSLog(@"Unable to construct generator from attrs.");
        exit(1);
      }
      [(TIKeyboardTyper *)v59 setErrorGenerator:v140];
    }
    [(TIKeyboardTyper *)v59 reset];
    dslTestDriver = v162->_dslTestDriver;
    v162->_dslTestDriver = 0;

    objc_storeStrong((id *)&v162->_testTyper, v59);
    v142 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    insertedText = v162->_insertedText;
    v162->_insertedText = v142;

    v144 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    resultClassifiers = v162->_resultClassifiers;
    v162->_resultClassifiers = v144;

    [(AutocorrectionTestHarness *)v162 setResultClassifiers];
    v146 = [v6 objectForKey:@"SAVE_DEBUG_DATA"];
    v147 = v146;
    if (!v146) {
      v146 = &__kCFBooleanFalse;
    }
    v162->_saveDebugData = [v146 BOOLValue];

    v148 = [v6 objectForKey:@"RUN_DSL_TEST"];

    if (v148)
    {
      v149 = [[TITestTyperDriver alloc] initWithTestTyper:v59];
      v150 = v162->_dslTestDriver;
      v162->_dslTestDriver = v149;
    }
  }
  v151 = v162;

  return v151;
}

+ (id)overrideInputMode:(id)a3
{
  id v3 = a3;
  v4 = [v3 languageWithRegion];
  unsigned int v5 = [v4 hasPrefix:@"ars"];

  if (v5)
  {
    id v6 = [v3 languageWithRegion];
    NSLog(@"Override %@ input mode identifier with the ar", v6);

    id v7 = +[TIInputMode inputModeWithIdentifier:@"ar"];
  }
  else
  {
    id v7 = v3;
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)newKeyboardInputManager
{
  if ([(AutocorrectionTestHarness *)self multilingualEnabled]
    && ([(AutocorrectionTestHarness *)self config],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 inputMode],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isSiriMode],
        v4,
        v3,
        !v5))
  {
    v39 = objc_alloc_init(TIDynamicLanguageLikelihoodModel);
    unsigned int v12 = [TIMultilingualPreferenceOverrides alloc];
    id v13 = [(AutocorrectionTestHarness *)self secondaryInputMode];
    uint64_t v14 = [(AutocorrectionTestHarness *)self config];
    v15 = [v14 inputMode];
    v41 = v15;
    double v16 = +[NSArray arrayWithObjects:&v41 count:1];
    double v17 = [(AutocorrectionTestHarness *)self config];
    double v18 = [v17 inputMode];
    double v19 = [v18 languageWithRegion];
    v40 = v19;
    id v20 = +[NSArray arrayWithObjects:&v40 count:1];
    id v21 = [(TIMultilingualPreferenceOverrides *)v12 initWithPreferredSecondaryInputMode:v13 userEnabledInputModes:v16 userPreferredLanguages:v20];

    id v22 = [objc_alloc((Class)TILanguageSelectionController) initWithLanguageLikelihoodModel:v39 preferenceProvider:v21];
    v23 = [(AutocorrectionTestHarness *)self config];
    double v24 = [v23 inputMode];
    double v25 = (objc_class *)[v24 multilingualInputManagerClass];

    id v26 = [v25 alloc];
    double v27 = [(AutocorrectionTestHarness *)self config];
    id v11 = [v26 initWithConfig:v27 keyboardState:0 languageSelectionController:v22];

    v28 = +[NSMutableDictionary dictionary];
    [v11 setTestingStateObject:v28];
  }
  else
  {
    id v6 = [(AutocorrectionTestHarness *)self config];
    id v7 = [v6 inputMode];
    uint64_t v8 = (objc_class *)[v7 inputManagerClass];

    id v9 = [v8 alloc];
    id v10 = [(AutocorrectionTestHarness *)self config];
    id v11 = [v9 initWithConfig:v10 keyboardState:0];
  }
  id v29 = [(AutocorrectionTestHarness *)self typologyOutpath];
  BOOL v30 = v29 == 0;

  if (!v30)
  {
    id v31 = objc_alloc((Class)TITypologyPreferencesEnabledForTesting);
    id v32 = [(AutocorrectionTestHarness *)self typologyOutpath];
    id v33 = [v31 initWithOutputPath:v32];
    [v11 setTypologyPreferences:v33];

    id v34 = objc_alloc((Class)TIKeyboardInputManagerLogger);
    v35 = [v11 typologyPreferences];
    id v36 = [v34 initWithTypologyPreferences:v35];

    [v11 setInputManagerLogger:v36];
    CFStringRef v37 = [v11 configurationPropertyList];
    [v36 setConfig:v37];
  }
  return v11;
}

- (id)testTerminator
{
  return @" ";
}

- (id)replayTest:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = +[TITypingLog typingLogWithDebug:self->_saveDebugData];
  id v7 = [(AutocorrectionTestHarness *)self testTyper];
  uint64_t v8 = [v5 intended];
  id v9 = [v5 expected];
  [v7 attemptToTypeIntended:v8 expected:v9 typingLog:v6];

  id v10 = [(AutocorrectionTestHarness *)self testTyper];
  [v10 commitText];

  return v6;
}

- (id)typeTest:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = +[TITypingLog typingLogWithDebug:self->_saveDebugData];
  id v7 = [(AutocorrectionTestHarness *)self testTyper];
  uint64_t v8 = [v5 input];
  [v7 attemptToTypeText:v8 typingLog:v6];

  id v9 = [(AutocorrectionTestHarness *)self testTyper];
  [v9 commitText];

  return v6;
}

- (id)emptyResultForTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AutocorrectionResult);
  id v6 = [(AutocorrectionTestHarness *)self testTyper];
  id v7 = [v4 input];
  uint64_t v8 = [v6 tokensForString:v7];
  [(AutocorrectionResult *)v5 setInput:v8];

  id v9 = [(AutocorrectionTestHarness *)self testTyper];
  id v10 = [v9 userModel];
  if ([v10 prefersContinuousPath])
  {
    id v11 = [(AutocorrectionTestHarness *)self config];
    unsigned int v12 = [v11 usesContinuousPath];

    if (v12)
    {
      id v13 = [(AutocorrectionTestHarness *)self testTyper];
      uint64_t v14 = [v4 input];
      v15 = [v13 tokensForString:v14];

      id v16 = [v15 count];
      double v17 = v15;
      if (!v16)
      {
        double v17 = +[NSMutableArray arrayWithObject:&stru_8DEF0];
      }
      [(AutocorrectionResult *)v5 setIntended:v17];
      if (!v16) {
        goto LABEL_12;
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  double v18 = [v4 expectedOutput];
  id v19 = [v18 count];

  if ((unint64_t)v19 >= 2)
  {
    v15 = [v4 expectedOutput];
    [(AutocorrectionResult *)v5 setIntended:v15];
    goto LABEL_14;
  }
  id v20 = [v4 expectedOutput];
  id v21 = (char *)[v20 count];

  if (v21 == (unsigned char *)&def_3B118 + 1)
  {
    v15 = [(AutocorrectionTestHarness *)self testTyper];
    double v17 = [v4 expectedOutput];
    id v22 = [v17 firstObject];
    v23 = [v15 tokensForString:v22];
    [(AutocorrectionResult *)v5 setIntended:v23];

LABEL_12:
    goto LABEL_14;
  }
  v15 = +[NSMutableArray arrayWithObject:&stru_8DEF0];
  [(AutocorrectionResult *)v5 setIntended:v15];
LABEL_14:

  double v24 = [v4 corpusId];
  [(AutocorrectionResult *)v5 setCorpusId:v24];

  return v5;
}

- (id)emptyResultForPlayback:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AutocorrectionResult);
  id v5 = [v3 intended];
  [(AutocorrectionResult *)v4 setInput:v5];

  id v6 = [v3 intended];
  [(AutocorrectionResult *)v4 setIntended:v6];

  id v7 = [v3 corpusId];
  [(AutocorrectionResult *)v4 setCorpusId:v7];

  return v4;
}

- (unsigned)seedForTest:(id)a3 trialID:(unint64_t)a4
{
  int v4 = a4;
  id v5 = [a3 input];
  id v6 = (char *)[v5 length];
  if (v6)
  {
    id v7 = 0;
    unsigned int v8 = 5381;
    do
      unsigned int v8 = 33 * v8 + [v5 characterAtIndex:v7++];
    while (v6 != v7);
    int v9 = 33 * v8;
  }
  else
  {
    int v9 = 177573;
  }
  unsigned int v10 = v9 + v4;

  return v10;
}

- (id)friendId
{
  return @"mailto:friend@apple.com";
}

- selfId
{
  return @"mailto:self@apple.com";
}

- (void)initializeConversationHistory
{
  id v3 = [(AutocorrectionTestHarness *)self friendId];
  id v9 = +[NSSet setWithObject:v3];

  int v4 = [(AutocorrectionTestHarness *)self selfId];
  id v5 = +[NSSet setWithObject:v4];

  id v6 = [objc_alloc((Class)TIInputContextHistory) initWithRecipientIdentifiers:v9 senderIdentifiers:v5];
  id v7 = [(AutocorrectionTestHarness *)self testTyper];
  unsigned int v8 = [v7 keyboardController];
  [v8 setInputContextHistory:v6];
}

- (void)nullifyConversationHistory
{
  id v3 = objc_alloc((Class)TIInputContextHistory);
  id v7 = +[NSSet setWithObject:@"mailto:null@apple.com"];
  id v4 = objc_msgSend(v3, "initWithRecipientIdentifiers:");
  id v5 = [(AutocorrectionTestHarness *)self testTyper];
  id v6 = [v5 keyboardController];
  [v6 setInputContextHistory:v4];

  id v8 = [(AutocorrectionTestHarness *)self testTyper];
  [v8 syncToEmptyDocument];
}

- (void)testConversation:(id)a3 testingSender:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7 trialID:(unint64_t)a8 withError:(id)a9 writingResults:(id)a10
{
  BOOL v34 = a6;
  BOOL v35 = a7;
  id v12 = a3;
  id v39 = a4;
  id v31 = a9;
  id v32 = a10;
  [(AutocorrectionTestHarness *)self initializeConversationHistory];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v13)
  {
    int v14 = 0;
    uint64_t v15 = *(void *)v41;
    do
    {
      id v16 = 0;
      uint64_t v38 = v14;
      unint64_t v33 = v14 - a5;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v16);
        double v18 = [v17 senderId];
        unsigned int v19 = [v18 isEqualToString:v39];

        if (!v19)
        {
          if (!v35) {
            goto LABEL_14;
          }
          double v24 = [(AutocorrectionTestHarness *)self testTyper];
          double v25 = [v24 keyboardController];
          id v26 = [v25 inputContextHistory];
          double v27 = [v17 text];
          v28 = +[NSDate date];
          id v29 = [(AutocorrectionTestHarness *)self friendId];
          [v26 addTextEntry:v27 timestamp:v28 senderIdentifier:v29];
          goto LABEL_13;
        }
        if ((unint64_t)v16 + v38 >= a5)
        {
          id v20 = [(AutocorrectionTestHarness *)self testTyper];
          [v20 syncToEmptyDocument];

          TIDispatchWaitForAllBlocks();
          id v21 = [v17 text];
          id v22 = +[AutocorrectionTest testWithInput:v21];

          v23 = [(AutocorrectionTestHarness *)self runTest:v22 trialID:a8 withError:v31];
          [v32 setObject:v23 atIndexedSubscript:(char *)v16 + v33];
        }
        if (v34)
        {
          double v24 = [(AutocorrectionTestHarness *)self testTyper];
          double v25 = [v24 keyboardController];
          id v26 = [v25 inputContextHistory];
          double v27 = [v17 text];
          v28 = +[NSDate date];
          id v29 = [(AutocorrectionTestHarness *)self selfId];
          [v26 addTextEntry:v27 timestamp:v28 senderIdentifier:v29];
LABEL_13:
        }
LABEL_14:
        id v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      int v14 = v38 + v16;
    }
    while (v13);
  }

  [(AutocorrectionTestHarness *)self nullifyConversationHistory];
}

- (id)runConversationTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v24 = a5;
  id v9 = [v8 conversation];
  unsigned int v10 = [v9 count];
  id v11 = [v8 warmupMessages];

  id v25 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10 - v11];
  if (v10 != v11)
  {
    int64_t v12 = v11 - v10;
    do
    {
      id v13 = +[NSNull null];
      [v25 addObject:v13];
    }
    while (!__CFADD__(v12++, 1));
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = [v8 sendersToTest];
  id obj = v15;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v20 = [v8 conversation];
        -[AutocorrectionTestHarness testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:](self, "testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:", v20, v19, [v8 warmupMessages], objc_msgSend(v8, "adaptToSentMessages"), objc_msgSend(v8, "adaptToReceivedMessages"), a4, v24, v25);
      }
      uint64_t v15 = obj;
      id v16 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }

  id v21 = +[NSNull null];
  [v25 removeObjectIdenticalTo:v21];

  return v25;
}

- (id)runTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5
{
  id v39 = a3;
  [(NSMutableArray *)self->_insertedText removeAllObjects];
  id v7 = v39;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [(AutocorrectionTestHarness *)self emptyResultForPlayback:v7];
  }
  else {
  id v9 = [(AutocorrectionTestHarness *)self emptyResultForTest:v7];
  }
  unsigned int v10 = [v7 sourceMetadata];
  [v9 setSourceMetadata:v10];

  unsigned int v40 = [(AutocorrectionTestHarness *)self seedForTest:v7 trialID:a4];
  id v11 = [(AutocorrectionTestHarness *)self testTyper];
  int64_t v12 = [v11 userActionStream];
  [v12 setRandomNumberSeed:v40];

  if (isKindOfClass) {
    [(AutocorrectionTestHarness *)self replayTest:v7 withError:0];
  }
  else {
  id v13 = [(AutocorrectionTestHarness *)self typeTest:v7 withError:0];
  }
  int v14 = [(AutocorrectionTestHarness *)self typologyOutpath];

  if (v14)
  {
    uint64_t v15 = [(TIKeyboardTyper *)self->_testTyper inputManager];
    id v16 = [v15 inputManagerLogger];
    uint64_t v17 = [v16 writeToFile];

    double v18 = [v17 objectAtIndexedSubscript:0];
    [v9 setTypologyLogURL:v18];

    uint64_t v19 = [v17 objectAtIndexedSubscript:1];
    [v9 setTypologyTraceLogURL:v19];
  }
  id v20 = [v13 correctedTransliterationSequence];
  id v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    v23 = [(AutocorrectionTestHarness *)self testTyper];
    id v24 = [(AutocorrectionTestHarness *)self testTyper];
    id v25 = [v24 text];
    id v22 = [v23 tokensForString:v25];
  }
  long long v26 = [(AutocorrectionTestHarness *)self config];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_21;
  }
  long long v27 = [(AutocorrectionTestHarness *)self config];
  unsigned int v28 = [v27 usesContinuousPath];

  if (!v28) {
    goto LABEL_23;
  }
  long long v29 = [v9 intended];
  long long v26 = [v29 componentsJoinedByString:&stru_8DEF0];

  if ([v26 hasSuffix:@" "]) {
    goto LABEL_21;
  }
  if ([v13 adjustForContinuousPath]
    && ([v22 lastObject],
        BOOL v30 = objc_claimAutoreleasedReturnValue(),
        unsigned int v31 = [v30 isEqualToString:@" "],
        v30,
        v31))
  {
    uint64_t v32 = [v22 count] - 1;
    unint64_t v33 = +[NSMutableArray arrayWithCapacity:(int)v32];
    if (v32)
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        BOOL v35 = [v22 objectAtIndex:i];
        [v33 addObject:v35];
      }
    }
  }
  else
  {
LABEL_21:
    unint64_t v33 = v22;
  }

  id v22 = v33;
LABEL_23:
  [v9 extractDataFromTypingLog:v13];
  [v9 setCorrected:v22];
  id v36 = +[NSString stringWithFormat:@"%lu", v40];
  [v9 setSeed:v36];

  CFStringRef v37 = [(AutocorrectionTestHarness *)self resultClassifiers];
  [v9 setTagsFromClassifiers:v37];

  return v9;
}

- (void)trainWithCorpus:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = [(AutocorrectionTestHarness *)self testTyper];
        [v9 attemptToTypeText:v8];

        unsigned int v10 = [(AutocorrectionTestHarness *)self testTyper];
        [v10 commitText];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (BOOL)compareExpectedValue:(id)a3 withResult:(id)a4
{
  return _[a3 isEqualToArray:a4];
}

- (BOOL)outcomeIsFailureForTest:(id)a3 withResult:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 intended];
  id v7 = [v5 corrected];
  LOBYTE(self) = ![(AutocorrectionTestHarness *)self compareExpectedValue:v6 withResult:v7];

  return (char)self;
}

- (void)reset
{
}

- (void)tearDown
{
}

- (BOOL)requiresMaintenance
{
  v2 = [(AutocorrectionTestHarness *)self testTyper];
  unsigned __int8 v3 = [v2 wordLearningEnabled];

  return v3;
}

- (NSArray)resultClassifiers
{
  return &self->_resultClassifiers->super;
}

- (TIKeyboardTyper)testTyper
{
  return self->_testTyper;
}

- (TITestTyperDriver)dslTestDriver
{
  return self->_dslTestDriver;
}

- (BOOL)saveDebugData
{
  return self->_saveDebugData;
}

- (void)setSaveDebugData:(BOOL)a3
{
  self->_saveDebugData = a3;
}

- (TIKeyboardInputManagerConfig)config
{
  return self->_config;
}

- (BOOL)multilingualEnabled
{
  return self->_multilingualEnabled;
}

- (TIInputMode)secondaryInputMode
{
  return self->_secondaryInputMode;
}

- (NSString)typologyOutpath
{
  return self->_typologyOutpath;
}

- (void)setTypologyOutpath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typologyOutpath, 0);
  objc_storeStrong((id *)&self->_secondaryInputMode, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_dslTestDriver, 0);
  objc_storeStrong((id *)&self->_testTyper, 0);
  objc_storeStrong((id *)&self->_insertedText, 0);
  objc_storeStrong((id *)&self->_resultClassifiers, 0);

  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

@end