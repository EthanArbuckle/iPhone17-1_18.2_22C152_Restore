@interface SFSpeechLanguageModel
+ (id)supportedLocales;
+ (void)appLmNeedsRebuild:(id)a3 language:(id)a4 clientIdentifier:(id)a5 modelOverride:(id)a6 completion:(id)a7;
+ (void)initialize;
+ (void)prepareCustomLanguageModelForUrl:(NSURL *)asset clientIdentifier:(NSString *)clientIdentifier configuration:(SFSpeechLanguageModelConfiguration *)configuration completion:(void *)completion;
+ (void)prepareCustomLanguageModelForUrl:(NSURL *)asset clientIdentifier:(NSString *)clientIdentifier configuration:(SFSpeechLanguageModelConfiguration *)configuration ignoresCache:(BOOL)ignoresCache completion:(void *)completion;
+ (void)trainAppLmFromNgramCountsArtifact:(id)a3 language:(id)a4 clientIdentifier:(id)a5 writeToDirectory:(id)a6 modelOverride:(id)a7 completion:(id)a8;
+ (void)trainAppLmFromNgramsSerializedDataFile:(id)a3 customPronsFile:(id)a4 language:(id)a5 writeToDirectory:(id)a6 modelOverride:(id)a7 completion:(id)a8;
- (BOOL)addProns:(id)a3 forWord:(id)a4;
- (BOOL)trainFromPlainTextAndWriteToDirectory:(id)a3;
- (NSArray)outOfVocabularyWords;
- (NSDictionary)outOfVocabularyWordsAndFrequencies;
- (NSLocale)locale;
- (SFSpeechLanguageModel)init;
- (SFSpeechLanguageModel)initWithAssetPath:(id)a3;
- (SFSpeechLanguageModel)initWithLocale:(id)a3 clientID:(id)a4;
- (id)addOovsFromSentence:(id)a3;
- (id)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeDirectory:(id)a4;
- (id)createNgramCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeDirectory:(id)a6;
- (id)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeDirectory:(id)a6;
- (id)deserializeModelData:(id)a3;
- (id)metrics;
- (int64_t)lmeThreshold;
- (void)addPronsFromFile:(id)a3;
- (void)addSentence:(id)a3;
- (void)addSentences:(id)a3;
- (void)dealloc;
- (void)generateNgramsSerializeDataAndWriteToFile:(id)a3;
- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 completion:(id)a4;
@end

@implementation SFSpeechLanguageModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_lsrClient, 0);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (id)createNgramCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeDirectory:(id)a6
{
  id v10 = a6;
  v11 = [(SFSpeechLanguageModel *)self createPhraseCountsArtifactWithIdentifier:a3 rawPhraseCountsPath:a4 customPronunciationsPath:a5 writeDirectory:v10];
  v12 = [(SFSpeechLanguageModel *)self createNgramCountsArtifactFromPhraseCountArtifact:v11 writeDirectory:v10];

  return v12;
}

- (id)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__608;
  v24 = __Block_byref_object_dispose__609;
  id v25 = 0;
  v8 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    v9 = [v7 path];
    id v19 = 0;
    id v10 = +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:v9 error:&v19];
    id v11 = v19;

    if (v10)
    {
      [v8 addObject:v10];

      if (!v6)
      {
        NSLog(&cfstr_NoPhrasecounta.isa);
        goto LABEL_12;
      }
      v12 = [v6 path];
      id v18 = 0;
      v13 = +[SFUtilities issueReadSandboxExtensionForFilePath:v12 error:&v18];
      id v11 = v18;

      if (v13)
      {
        [v8 addObject:v13];

        lsrClient = self->_lsrClient;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __89__SFSpeechLanguageModel_createNgramCountsArtifactFromPhraseCountArtifact_writeDirectory___block_invoke;
        v17[3] = &unk_1E6154BF8;
        v17[4] = &v20;
        [(SFLocalSpeechRecognitionClient *)lsrClient createNgramCountsArtifactFromPhraseCountArtifact:v6 writeToDirectory:v7 sandboxExtensions:v8 completion:v17];
        id v15 = (id)v21[5];
        goto LABEL_13;
      }
      NSLog(&cfstr_CouldNotIssueS.isa, 0);
    }
    else
    {
      NSLog(&cfstr_CouldNotIssueS.isa, 0);
    }
  }
  else
  {
    NSLog(&cfstr_NoWriteDirecto.isa);
  }
LABEL_12:
  id v15 = 0;
LABEL_13:

  _Block_object_dispose(&v20, 8);

  return v15;
}

void __89__SFSpeechLanguageModel_createNgramCountsArtifactFromPhraseCountArtifact_writeDirectory___block_invoke(uint64_t a1, void *a2)
{
}

- (id)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeDirectory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__608;
  v34 = __Block_byref_object_dispose__609;
  id v35 = 0;
  v14 = [MEMORY[0x1E4F1CA48] array];
  if (v13)
  {
    id v15 = [v13 path];
    id v29 = 0;
    v16 = +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:v15 error:&v29];
    id v17 = v29;

    if (v16)
    {
      [v14 addObject:v16];

      if (!v11)
      {
        NSLog(&cfstr_NoRawphrasecou.isa);
        goto LABEL_17;
      }
      id v18 = [v11 path];
      id v28 = 0;
      id v19 = +[SFUtilities issueReadSandboxExtensionForFilePath:v18 error:&v28];
      id v17 = v28;

      if (v19)
      {
        [v14 addObject:v19];

        if (!v12)
        {
          NSLog(&cfstr_NoCustompronun.isa);
          goto LABEL_14;
        }
        uint64_t v20 = [v12 path];
        id v27 = 0;
        v21 = +[SFUtilities issueReadSandboxExtensionForFilePath:v20 error:&v27];
        id v17 = v27;

        if (v21)
        {
          [v14 addObject:v21];

LABEL_14:
          lsrClient = self->_lsrClient;
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __126__SFSpeechLanguageModel_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeDirectory___block_invoke;
          v26[3] = &unk_1E6154BF8;
          v26[4] = &v30;
          [(SFLocalSpeechRecognitionClient *)lsrClient createPhraseCountsArtifactWithIdentifier:v10 rawPhraseCountsPath:v11 customPronunciationsPath:v12 writeToDirectory:v13 sandboxExtensions:v14 completion:v26];
          id v24 = (id)v31[5];
          goto LABEL_18;
        }
        uint64_t v22 = [v12 path];
        NSLog(&cfstr_CouldNotIssueS.isa, v22);
      }
      else
      {
        uint64_t v22 = [v11 path];
        NSLog(&cfstr_CouldNotIssueS.isa, v22);
      }
    }
    else
    {
      uint64_t v22 = [v13 path];
      NSLog(&cfstr_CouldNotIssueS.isa, v22);
    }
  }
  else
  {
    NSLog(&cfstr_NoWriteDirecto.isa);
  }
LABEL_17:
  id v24 = 0;
LABEL_18:

  _Block_object_dispose(&v30, 8);

  return v24;
}

void __126__SFSpeechLanguageModel_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeDirectory___block_invoke(uint64_t a1, void *a2)
{
}

- (id)metrics
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__608;
  id v10 = __Block_byref_object_dispose__609;
  id v11 = 0;
  lsrClient = self->_lsrClient;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SFSpeechLanguageModel_metrics__block_invoke;
  v5[3] = &unk_1E61559A0;
  v5[4] = &v6;
  [(SFLocalSpeechRecognitionClient *)lsrClient metricsWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__SFSpeechLanguageModel_metrics__block_invoke(uint64_t a1, void *a2)
{
}

- (int64_t)lmeThreshold
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lsrClient = self->_lsrClient;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SFSpeechLanguageModel_lmeThreshold__block_invoke;
  v5[3] = &unk_1E6154BA8;
  v5[4] = &v6;
  [(SFLocalSpeechRecognitionClient *)lsrClient lmeThresholdWithCompletion:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SFSpeechLanguageModel_lmeThreshold__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)addProns:(id)a3 forWord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lsrClient = self->_lsrClient;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__SFSpeechLanguageModel_addProns_forWord___block_invoke;
  v10[3] = &unk_1E6154B80;
  v10[4] = &v11;
  [(SFLocalSpeechRecognitionClient *)lsrClient addProns:v6 forWord:v7 completion:v10];
  LOBYTE(self) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)self;
}

uint64_t __42__SFSpeechLanguageModel_addProns_forWord___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)addPronsFromFile:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F60FF8]) initWithFilePath:v17];
  id obj = [v16 lexemes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"grapheme"];
        id v10 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v11 = [v8 objectForKeyedSubscript:@"phoneme"];
        id v12 = [v11 componentsSeparatedByString:@"/"];
        uint64_t v13 = [v10 setWithArray:v12];

        if (![(SFSpeechLanguageModel *)self addProns:v13 forWord:v9])
        {
          char v14 = (void *)MEMORY[0x1E4F1CA00];
          id v15 = [v13 allObjects];
          [v14 raise:v18, @"Invalid prons: %@ for word: %@", v15, v9 format];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
}

- (id)deserializeModelData:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__608;
  uint64_t v13 = __Block_byref_object_dispose__609;
  id v14 = 0;
  lsrClient = self->_lsrClient;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__SFSpeechLanguageModel_deserializeModelData___block_invoke;
  v8[3] = &unk_1E61559A0;
  v8[4] = &v9;
  [(SFLocalSpeechRecognitionClient *)lsrClient deserializeNgramCountsData:v4 completion:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __46__SFSpeechLanguageModel_deserializeModelData___block_invoke(uint64_t a1, void *a2)
{
}

- (void)generateNgramsSerializeDataAndWriteToFile:(id)a3
{
  id v4 = a3;
  lsrClient = self->_lsrClient;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SFSpeechLanguageModel_generateNgramsSerializeDataAndWriteToFile___block_invoke;
  v7[3] = &unk_1E6155778;
  id v8 = v4;
  id v6 = v4;
  [(SFLocalSpeechRecognitionClient *)lsrClient generateNgramCountsSerializeDataWithCompletion:v7];
}

void __67__SFSpeechLanguageModel_generateNgramsSerializeDataAndWriteToFile___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v6 = 0;
    [a2 writeToURL:v3 options:1 error:&v6];
    id v4 = v6;
    uint64_t v5 = v4;
    if (v4) {
      NSLog(&cfstr_ThereWasAProbl.isa, v4);
    }
    else {
      NSLog(&cfstr_NgramCountsAnd.isa, *(void *)(a1 + 32));
    }
  }
  else
  {
    NSLog(&cfstr_FailedToGenera.isa);
  }
}

- (BOOL)trainFromPlainTextAndWriteToDirectory:(id)a3
{
  return 0;
}

- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__SFSpeechLanguageModel_trainFromPlainTextAndWriteToDirectory_completion___block_invoke;
  aBlock[3] = &unk_1E6154B58;
  id v8 = v7;
  id v19 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = 0;
  char v11 = [v10 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v17];
  id v12 = v17;
  uint64_t v13 = v12;
  if ((v11 & 1) == 0)
  {
    NSLog(&cfstr_WriteFailedErr.isa, v12);
LABEL_6:
    (*((void (**)(void *, void, void))v9 + 2))(v9, 0, 0);
    goto LABEL_7;
  }
  NSLog(&cfstr_WriteSuccessfu.isa);
  if (!v6) {
    goto LABEL_6;
  }
  id v14 = [v6 path];
  uint64_t v16 = 0;
  id v15 = +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:v14 error:&v16];

  if (!v15) {
    goto LABEL_6;
  }
  [(SFLocalSpeechRecognitionClient *)self->_lsrClient trainFromPlainTextAndWriteToDirectory:v6 sandboxExtension:v15 completion:v8];

LABEL_7:
}

uint64_t __74__SFSpeechLanguageModel_trainFromPlainTextAndWriteToDirectory_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSDictionary)outOfVocabularyWordsAndFrequencies
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__608;
  id v10 = __Block_byref_object_dispose__609;
  id v11 = 0;
  lsrClient = self->_lsrClient;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SFSpeechLanguageModel_outOfVocabularyWordsAndFrequencies__block_invoke;
  v5[3] = &unk_1E61559A0;
  v5[4] = &v6;
  [(SFLocalSpeechRecognitionClient *)lsrClient oovWordsAndFrequenciesWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __59__SFSpeechLanguageModel_outOfVocabularyWordsAndFrequencies__block_invoke(uint64_t a1, void *a2)
{
}

- (NSArray)outOfVocabularyWords
{
  v2 = [(SFSpeechLanguageModel *)self outOfVocabularyWordsAndFrequencies];
  id v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)addOovsFromSentence:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__608;
  uint64_t v13 = __Block_byref_object_dispose__609;
  id v14 = (id)MEMORY[0x1E4F1CBF0];
  lsrClient = self->_lsrClient;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SFSpeechLanguageModel_addOovsFromSentence___block_invoke;
  v8[3] = &unk_1E61559F0;
  v8[4] = &v9;
  [(SFLocalSpeechRecognitionClient *)lsrClient addSentenceToNgramCounts:v4 completion:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __45__SFSpeechLanguageModel_addOovsFromSentence___block_invoke(uint64_t a1, void *a2)
{
}

- (void)addSentences:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SFSpeechLanguageModel *)self addSentence:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addSentence:(id)a3
{
}

- (void)dealloc
{
  [(SFLocalSpeechRecognitionClient *)self->_lsrClient invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFSpeechLanguageModel;
  [(SFSpeechLanguageModel *)&v3 dealloc];
}

- (SFSpeechLanguageModel)initWithAssetPath:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SFSpeechLanguageModel;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__608;
  id v17 = __Block_byref_object_dispose__609;
  uint64_t v5 = [(SFSpeechLanguageModel *)&v19 init];
  uint64_t v18 = v5;
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(SFLocalSpeechRecognitionClient);
    lsrClient = v5->_lsrClient;
    v5->_lsrClient = v6;

    uint64_t v8 = v5->_lsrClient;
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__SFSpeechLanguageModel_initWithAssetPath___block_invoke;
      v12[3] = &unk_1E61559C8;
      v12[4] = &v13;
      [(SFLocalSpeechRecognitionClient *)v8 initializeLmWithAssetPath:v4 completion:v12];
    }
    else
    {
      long long v9 = (void *)v14[5];
      v14[5] = 0;
    }
  }
  long long v10 = (SFSpeechLanguageModel *)(id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __43__SFSpeechLanguageModel_initWithAssetPath___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
    objc_super v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
}

- (SFSpeechLanguageModel)initWithLocale:(id)a3 clientID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 localeIdentifier];
  long long v9 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v8];

  if (!v9 || ([(id)sSupportedLocaleIdentifiers containsObject:v9] & 1) == 0)
  {
    AFDictationLanguageForKeyboardLanguage();
    long long v10 = (SFSpeechLanguageModel *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      NSLog(&cfstr_IsNotASupporte.isa, v9, sSupportedLocaleIdentifiers);
      goto LABEL_14;
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v10];

    id v6 = (id)v11;
  }
  v23.receiver = self;
  v23.super_class = (Class)SFSpeechLanguageModel;
  self = [(SFSpeechLanguageModel *)&v23 init];
  if (!self) {
    goto LABEL_8;
  }
  long long v12 = (NSLocale *)[v6 copy];
  locale = self->_locale;
  self->_locale = v12;

  uint64_t v14 = +[SFUtilities localeCodeForLocale:v6];
  uint64_t v15 = [[SFEntitledAssetConfig alloc] initWithLanguage:v14 taskHint:0];
  uint64_t v16 = +[SFSpeechAssetManager pathToAssetWithConfig:v15 clientIdentifier:v7];
  if (v16)
  {
    id v17 = (void *)v16;
    self = [(SFSpeechLanguageModel *)self initWithAssetPath:v16];

LABEL_8:
    self = self;
    long long v10 = self;
    goto LABEL_14;
  }
  uint64_t v18 = [(SFEntitledAssetConfig *)v15 assetType];
  if ((unint64_t)(v18 - 1) > 6) {
    objc_super v19 = @"Unknown";
  }
  else {
    objc_super v19 = off_1E6154988[v18 - 1];
  }
  long long v20 = v19;
  long long v21 = [(SFEntitledAssetConfig *)v15 language];
  NSLog(&cfstr_NoAssetForLang.isa, v20, v21);

  long long v10 = 0;
LABEL_14:

  return v10;
}

- (SFSpeechLanguageModel)init
{
  return 0;
}

+ (void)prepareCustomLanguageModelForUrl:(NSURL *)asset clientIdentifier:(NSString *)clientIdentifier configuration:(SFSpeechLanguageModelConfiguration *)configuration ignoresCache:(BOOL)ignoresCache completion:(void *)completion
{
  v54[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = asset;
  long long v12 = clientIdentifier;
  uint64_t v13 = configuration;
  id v14 = completion;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke;
  aBlock[3] = &unk_1E6154F60;
  id v15 = v14;
  id v50 = v15;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = objc_alloc(MEMORY[0x1E4F60FB0]);
  uint64_t v18 = [(NSURL *)v11 path];
  objc_super v19 = (void *)[v17 initWithPath:v18];

  if (v19)
  {
    uint64_t v20 = [v19 getLocale];
    if (v20)
    {
      long long v21 = (void *)v20;
      long long v22 = [(SFSpeechLanguageModelConfiguration *)v13 languageModel];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_2;
      v42[3] = &unk_1E6154CE8;
      id v47 = v16;
      BOOL v48 = ignoresCache;
      v43 = v13;
      v44 = v11;
      id v23 = v21;
      id v45 = v23;
      v46 = v12;
      +[SFSpeechLanguageModel appLmNeedsRebuild:v22 language:v23 clientIdentifier:v46 modelOverride:0 completion:v42];

      id v24 = v47;
    }
    else
    {
      v41 = NSString;
      uint64_t v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v32 localizedStringForKey:@"Error reading asset language for %@" value:&stru_1F10479F8 table:@"Localizable"];
      id v33 = v15;
      v34 = v13;
      v36 = id v35 = v12;
      v37 = [(NSURL *)v11 path];
      id v24 = objc_msgSend(v41, "localizedStringWithFormat:", v36, v37);

      long long v12 = v35;
      uint64_t v13 = v34;
      id v15 = v33;

      v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52 = v24;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      v40 = [v38 errorWithDomain:@"SFSpeechErrorDomain" code:8 userInfo:v39];
      (*((void (**)(void *, void *))v16 + 2))(v16, v40);

      id v23 = 0;
    }
  }
  else
  {
    uint64_t v25 = NSString;
    v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v27 = [v26 localizedStringForKey:@"Error reading asset from %@" value:&stru_1F10479F8 table:@"Localizable"];
    [(NSURL *)v11 path];
    v29 = id v28 = v12;
    objc_msgSend(v25, "localizedStringWithFormat:", v27, v29);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    long long v12 = v28;
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v53 = *MEMORY[0x1E4F28568];
    v54[0] = v23;
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
    v31 = [v30 errorWithDomain:@"SFSpeechErrorDomain" code:8 userInfo:v24];
    (*((void (**)(void *, void *))v16 + 2))(v16, v31);
  }
}

uint64_t __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_2(uint64_t a1, BOOL a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    int v7 = *(unsigned __int8 *)(a1 + 72);
    if (!*(unsigned char *)(a1 + 72) && !a2)
    {
      uint64_t v8 = [*(id *)(a1 + 32) languageModel];
      long long v9 = __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_3(v8);

      uint64_t v10 = __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_3(*(void **)(a1 + 40));
      uint64_t v11 = (void *)v10;
      a2 = 1;
      if (v9 && v10) {
        a2 = [v9 compare:v10] == -1;
      }

      int v7 = *(unsigned __int8 *)(a1 + 72);
    }
    if (v7 || a2)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v16 = [v15 temporaryDirectory];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_4;
      v17[3] = &unk_1E6154CC0;
      id v18 = *(id *)(a1 + 40);
      id v20 = *(id *)(a1 + 64);
      id v19 = *(id *)(a1 + 32);
      +[SFSpeechLanguageModel trainAppLmFromNgramCountsArtifact:v12 language:v13 clientIdentifier:v14 writeToDirectory:v16 modelOverride:0 completion:v17];

      goto LABEL_13;
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v6();
LABEL_13:
}

id __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_3(void *a1)
{
  v1 = (void *)MEMORY[0x1E4F28CB8];
  id v2 = a1;
  objc_super v3 = [v1 defaultManager];
  id v4 = [v2 path];

  id v5 = [v3 attributesOfItemAtPath:v4 error:0];

  if (v5)
  {
    id v6 = [v5 fileModificationDate];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v9 = [*(id *)(a1 + 40) languageModel];
    [v8 removeItemAtURL:v9 error:0];

    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = [*(id *)(a1 + 40) languageModel];
    id v31 = 0;
    char v12 = [v10 moveItemAtURL:v5 toURL:v11 error:&v31];
    id v13 = v31;

    if (v12)
    {
      uint64_t v14 = [*(id *)(a1 + 40) vocabulary];

      if (v14)
      {
        id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v16 = [*(id *)(a1 + 40) vocabulary];
        [v15 removeItemAtURL:v16 error:0];

        id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v18 = [*(id *)(a1 + 40) vocabulary];
        id v30 = v13;
        char v19 = [v17 moveItemAtURL:v7 toURL:v18 error:&v30];
        id v20 = v30;

        if ((v19 & 1) == 0)
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          id v13 = v20;
          goto LABEL_11;
        }
        id v13 = v20;
      }
      long long v21 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      long long v21 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v21();
  }
  else
  {
    long long v22 = NSString;
    id v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v24 = [v23 localizedStringForKey:@"Error building custom language model at %@" value:&stru_1F10479F8 table:@"Localizable"];
    uint64_t v25 = [*(id *)(a1 + 32) path];
    objc_msgSend(v22, "localizedStringWithFormat:", v24, v25);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v26 = *(void *)(a1 + 48);
    id v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = v13;
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v29 = [v27 errorWithDomain:@"SFSpeechErrorDomain" code:1 userInfo:v28];
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v29);
  }
LABEL_11:
}

+ (void)prepareCustomLanguageModelForUrl:(NSURL *)asset clientIdentifier:(NSString *)clientIdentifier configuration:(SFSpeechLanguageModelConfiguration *)configuration completion:(void *)completion
{
}

+ (void)appLmNeedsRebuild:(id)a3 language:(id)a4 clientIdentifier:(id)a5 modelOverride:(id)a6 completion:(id)a7
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke;
  aBlock[3] = &unk_1E6154C48;
  id v16 = v15;
  id v55 = v16;
  id v17 = _Block_copy(aBlock);
  id v18 = [MEMORY[0x1E4F1CA48] array];
  char v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = [v11 path];
  char v21 = [v19 fileExistsAtPath:v20];

  if (v21)
  {
    if (v11)
    {
      id v46 = v13;
      long long v22 = [v11 path];
      id v53 = 0;
      id v23 = +[SFUtilities issueReadSandboxExtensionForFilePath:v22 error:&v53];
      id v24 = v53;

      if (v23)
      {
        [v18 addObject:v23];

        uint64_t v25 = +[SFUtilities sandboxExtensionsForUsingANEAndAssets];
        if (v25) {
          [v18 addObjectsFromArray:v25];
        }
        else {
          NSLog(&cfstr_DidNotIssueSan_0.isa);
        }
        v34 = NSTemporaryDirectory();
        id v52 = 0;
        id v35 = +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:v34 error:&v52];
        id v36 = v52;

        if (v35)
        {
          id v43 = v36;
          v44 = v35;
          id v45 = v25;
          [v18 addObject:v35];
          v37 = objc_alloc_init(SFLocalSpeechRecognitionClient);
          [(SFLocalSpeechRecognitionClient *)v37 initializeWithSandboxExtensions:v18];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke_2;
          v47[3] = &unk_1E6154C98;
          id v51 = v17;
          v38 = v37;
          BOOL v48 = v38;
          id v49 = v11;
          id v39 = v12;
          id v50 = v39;
          v40 = _Block_copy(v47);
          id v13 = v46;
          if (!v14) {
            goto LABEL_16;
          }
          if (SFIsInternalInstall_onceToken != -1) {
            dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1883);
          }
          if (SFIsInternalInstall_isInternal)
          {
            [(SFLocalSpeechRecognitionClient *)v38 initializeLmWithAssetPath:v14 completion:v40];
          }
          else
          {
LABEL_16:
            v41 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v39];
            [(SFLocalSpeechRecognitionClient *)v38 initializeLmWithLocale:v41 clientID:v46 completion:v40];
          }
          id v35 = v44;
          uint64_t v25 = v45;
          v42 = v43;
        }
        else
        {
          NSLog(&cfstr_CouldNotIssueS_0.isa, v36);
          (*((void (**)(void *, uint64_t, id))v17 + 2))(v17, 1, v36);
          v42 = v36;
          id v13 = v46;
        }
      }
      else
      {
        (*((void (**)(void *, uint64_t, id))v17 + 2))(v17, 1, v24);
      }
    }
    else
    {
      uint64_t v26 = NSString;
      id v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v28 = [v27 localizedStringForKey:@"Error issuing sandbox extension for %@: %s" value:&stru_1F10479F8 table:@"Localizable"];
      id v29 = __error();
      id v30 = objc_msgSend(v26, "localizedStringWithFormat:", v28, 0, strerror(*v29));

      id v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      v57[0] = v30;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      id v33 = [v31 errorWithDomain:@"SFSpeechErrorDomain" code:1 userInfo:v32];
      (*((void (**)(void *, uint64_t, void *))v17 + 2))(v17, 1, v33);
    }
  }
  else
  {
    (*((void (**)(void *, uint64_t, void))v17 + 2))(v17, 1, 0);
  }
}

uint64_t __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    objc_super v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke_3;
    v7[3] = &unk_1E6154C70;
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 32);
    [v4 appLmNeedsRebuild:v5 language:v6 sandboxExtensions:MEMORY[0x1E4F1CBF0] completion:v7];
  }
}

uint64_t __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

+ (void)trainAppLmFromNgramCountsArtifact:(id)a3 language:(id)a4 clientIdentifier:(id)a5 writeToDirectory:(id)a6 modelOverride:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke;
  aBlock[3] = &unk_1E6154B58;
  id v19 = v18;
  id v67 = v19;
  id v20 = _Block_copy(aBlock);
  char v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v13)
  {
    long long v22 = [v13 path];
    char v23 = [v21 fileExistsAtPath:v22];

    if (v23)
    {
      id v65 = 0;
      char v24 = [v21 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v65];
      id v25 = v65;
      uint64_t v26 = v25;
      if (v24) {
        NSLog(&cfstr_CreatedDirecto.isa, v16);
      }
      else {
        NSLog(&cfstr_FailedToCreate.isa, v25);
      }
      uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
      id v28 = (void *)v27;
      if (v16)
      {
        v54 = v14;
        id v55 = (void *)v27;
        id v52 = v26;
        id v29 = [v16 path];
        id v64 = 0;
        id v30 = +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:v29 error:&v64];
        id v31 = v64;

        if (v30)
        {
          id v51 = v15;
          [v55 addObject:v30];

          uint64_t v32 = [v13 path];
          id v63 = 0;
          id v33 = +[SFUtilities issueReadSandboxExtensionForFilePath:v32 error:&v63];
          id v34 = v63;

          if (v33)
          {
            [v55 addObject:v33];

            id v35 = NSTemporaryDirectory();
            id v62 = 0;
            uint64_t v36 = +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:v35 error:&v62];
            id v37 = v62;

            id v49 = v17;
            id v50 = (void *)v36;
            if (v36)
            {
              id v48 = v37;
              [v55 addObject:v36];
              uint64_t v38 = +[SFUtilities sandboxExtensionsForUsingANEAndAssets];
              id v15 = v51;
              id v47 = (void *)v38;
              if (v38) {
                [v55 addObjectsFromArray:v38];
              }
              else {
                NSLog(&cfstr_DidNotIssueSan.isa);
              }
              uint64_t v26 = v52;
              v40 = objc_alloc_init(SFLocalSpeechRecognitionClient);
              [(SFLocalSpeechRecognitionClient *)v40 initializeWithSandboxExtensions:v55];
              v56[0] = MEMORY[0x1E4F143A8];
              v56[1] = 3221225472;
              v56[2] = __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke_2;
              v56[3] = &unk_1E6154C20;
              id v61 = v20;
              id v53 = v40;
              v57 = v53;
              id v58 = v13;
              id v14 = v54;
              id v41 = v54;
              id v59 = v41;
              id v60 = v16;
              id v46 = _Block_copy(v56);
              if (!v17) {
                goto LABEL_24;
              }
              if (SFIsInternalInstall_onceToken != -1) {
                dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1883);
              }
              if (SFIsInternalInstall_isInternal)
              {
                v42 = v53;
                id v43 = v17;
                v44 = v46;
                [(SFLocalSpeechRecognitionClient *)v53 initializeLmWithAssetPath:v43 completion:v46];
              }
              else
              {
LABEL_24:
                id v45 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v41];
                v42 = v53;
                v44 = v46;
                [(SFLocalSpeechRecognitionClient *)v53 initializeLmWithLocale:v45 clientID:v51 completion:v46];

                id v14 = v54;
              }

              id v28 = v55;
              id v39 = v48;
            }
            else
            {
              NSLog(&cfstr_CouldNotIssueS_0.isa, v37);
              (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);
              uint64_t v26 = v52;
              id v14 = v54;
              id v15 = v51;
              id v39 = v37;
              id v28 = v55;
            }

            id v17 = v49;
            goto LABEL_27;
          }
          NSLog(&cfstr_CouldNotIssueS.isa, 0);
          (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);

          id v14 = v54;
          id v15 = v51;
        }
        else
        {
          NSLog(&cfstr_CouldNotIssueS.isa, 0);
          (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);

          id v14 = v54;
        }
        uint64_t v26 = v52;
        id v28 = v55;
      }
      else
      {
        NSLog(&cfstr_NoWriteDirecto.isa);
        (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);
      }
LABEL_27:

      goto LABEL_28;
    }
  }
  NSLog(&cfstr_CouldNotFindNg.isa, v13);
  (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);
LABEL_28:
}

uint64_t __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog(&cfstr_FailedToInitia.isa, a2);
    objc_super v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    int v7 = [v6 bundleIdentifier];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke_3;
    v10[3] = &unk_1E6154BD0;
    id v12 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 32);
    [v4 trainAppLmFromNgramCountsArtifact:v5 forApp:v7 language:v8 writeToDirectory:v9 sandboxExtensions:MEMORY[0x1E4F1CBF0] completion:v10];
  }
}

uint64_t __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

+ (void)trainAppLmFromNgramsSerializedDataFile:(id)a3 customPronsFile:(id)a4 language:(id)a5 writeToDirectory:(id)a6 modelOverride:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke;
  aBlock[3] = &unk_1E6154B58;
  id v19 = v18;
  id v57 = v19;
  id v20 = _Block_copy(aBlock);
  char v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v13
    && ([v13 path],
        long long v22 = objc_claimAutoreleasedReturnValue(),
        char v23 = [v21 fileExistsAtPath:v22],
        v22,
        (v23 & 1) != 0))
  {
    id v41 = v17;
    id v24 = v15;
    uint64_t v25 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13];
    uint64_t v26 = [v13 path];
    uint64_t v27 = (void *)v26;
    v42 = (void *)v25;
    if (v25)
    {
      NSLog(&cfstr_SuccessfullyRe.isa, v26);

      if (v14)
      {
        uint64_t v28 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v14];
        id v29 = [v14 path];
        uint64_t v38 = (void *)v28;
        if (v28) {
          NSLog(&cfstr_SuccessfullyRe.isa, v29);
        }
        else {
          NSLog(&cfstr_FailedToReadTh_0.isa, v29);
        }
      }
      else
      {
        uint64_t v38 = 0;
      }
      id v15 = v24;
      id v55 = 0;
      char v30 = [v21 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v55];
      id v31 = v55;
      id v17 = v41;
      id v37 = v31;
      if (v30) {
        NSLog(&cfstr_CreatedDirecto.isa, v16);
      }
      else {
        NSLog(&cfstr_FailedToCreate.isa, v31);
      }
      uint64_t v32 = objc_alloc_init(SFLocalSpeechRecognitionClient);
      uint64_t v49 = 0;
      id v50 = &v49;
      uint64_t v51 = 0x3032000000;
      id v52 = __Block_byref_object_copy__608;
      id v53 = __Block_byref_object_dispose__609;
      id v54 = 0;
      if (!v41) {
        goto LABEL_20;
      }
      if (SFIsInternalInstall_onceToken != -1) {
        dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1883);
      }
      if (SFIsInternalInstall_isInternal)
      {
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_2;
        v48[3] = &unk_1E61559C8;
        v48[4] = &v49;
        [(SFLocalSpeechRecognitionClient *)v32 initializeLmWithAssetPath:v41 completion:v48];
      }
      else
      {
LABEL_20:
        id v39 = v32;
        id v33 = +[SFUtilities defaultClientID];
        id v34 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v15];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_3;
        v47[3] = &unk_1E61559C8;
        void v47[4] = &v49;
        [(SFLocalSpeechRecognitionClient *)v39 initializeLmWithLocale:v34 clientID:v33 completion:v47];

        uint64_t v32 = v39;
      }
      if (v50[5])
      {
        NSLog(&cfstr_FailedToInitia.isa, v50[5], v37);
        (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);
      }
      else
      {
        if (!v16) {
          goto LABEL_26;
        }
        v40 = v32;
        id v35 = [v16 path];
        uint64_t v46 = 0;
        uint64_t v36 = +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:v35 error:&v46];

        uint64_t v32 = v40;
        if (v36)
        {
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_4;
          v43[3] = &unk_1E6154BD0;
          id v45 = v19;
          v44 = v40;
          [(SFLocalSpeechRecognitionClient *)v44 trainAppLmFromNgramsSerializedData:v42 customPronsData:v38 language:v15 writeToDirectory:v16 sandboxExtension:v36 completion:v43];
        }
        else
        {
LABEL_26:
          (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);
        }
      }
      _Block_object_dispose(&v49, 8);
    }
    else
    {
      NSLog(&cfstr_FailedToReadTh.isa, v26);

      (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);
      id v17 = v41;
    }
  }
  else
  {
    NSLog(&cfstr_CouldNotFindNg.isa, v13);
    (*((void (**)(void *, void, void))v20 + 2))(v20, 0, 0);
  }
}

uint64_t __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

void __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_3(uint64_t a1, void *a2)
{
}

uint64_t __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

+ (id)supportedLocales
{
  return (id)sSupportedLocales;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[SFUtilities supportedLocalesWithCompletion:&__block_literal_global_668];
  }
}

void __35__SFSpeechLanguageModel_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 copy];
  uint64_t v6 = (void *)sSupportedLocales;
  sSupportedLocales = v5;

  uint64_t v7 = [v4 copy];
  uint64_t v8 = (void *)sSupportedLocaleIdentifiers;
  sSupportedLocaleIdentifiers = v7;
}

@end