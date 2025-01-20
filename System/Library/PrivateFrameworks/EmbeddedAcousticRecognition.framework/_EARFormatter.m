@interface _EARFormatter
+ (BOOL)supportedByQuasarConfig:(id)a3;
+ (BOOL)supportedByQuasarSystemConfig:(const void *)a3;
+ (BOOL)useEmojiHammerWhenRecognizeEmoji:(BOOL)a3;
+ (vector<quasar::Token,)convertStringsToQuasarTokens:(id)a2;
+ (vector<quasar::Token,)convertStringsToQuasarTokens:(id)a2 offset:(SEL)a3;
+ (void)initialize;
- (BOOL)isEnableAutoPunctuation:(const void *)a3 task:(const void *)a4 itnEnablingFlags:(unsigned __int16)a5;
- (BOOL)refreshEmojiRecognizer;
- (NSString)language;
- (_EARFormatter)initWithGeneralVoc:(id)a3 withLexiconEnh:(id)a4 withItnEnh:(id)a5;
- (_EARFormatter)initWithLanguage:(id)a3 withSdapiConfig:(id)a4 quasarConfig:(id)a5;
- (_EARFormatter)initWithQuasarConfig:(id)a3;
- (_EARFormatter)initWithQuasarConfig:(id)a3 language:(id)a4;
- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4;
- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4 supportEmojiRecognition:(BOOL)a5 language:(id)a6;
- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4 supportEmojiRecognition:(BOOL)a5 language:(id)a6 skipPathsExistCheck:(BOOL)a7;
- (__n128)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:;
- (basic_string<char,)getOrthography:(std::allocator<char>> *__return_ptr)retstr;
- (id).cxx_construct;
- (id)_earEmojiRecognition;
- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5;
- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5 recognizeEmoji:(BOOL)a6;
- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5 recognizeEmoji:(BOOL)a6 rightContext:(id)a7;
- (id)_formattedStringWithoutEmojiModifier:(id)a3;
- (id)_recognizeEmojiInString:(id)a3 alternativesOut:(id)a4 persistEmoji:(BOOL)a5;
- (id)emojiAlternativesForFormattedTokens:(id)a3 stringsWithoutEmojiModifier:(id)a4 alternateNameForTokens:(id)a5;
- (id)emojiPhraseRemoveKeyword:(id)a3;
- (id)formatWords:(id)a3 task:(id)a4 autoPunctuate:(BOOL)a5;
- (id)formatWords:(id)a3 task:(id)a4 autoPunctuate:(BOOL)a5 recognizeEmoji:(BOOL)a6;
- (id)formattedRecognitionWithNBestList:(id)a3;
- (id)formattedStringWithStrings:(id)a3;
- (id)formattedStringWithStrings:(id)a3 preToPostItnArray:(id)a4;
- (id)formattedStringWithStrings:(id)a3 preToPostItnArray:(id)a4 task:(id)a5;
- (id)formattedStringWithStrings:(id)a3 task:(id)a4;
- (id)initNcsWithModelRoot:(id)a3;
- (id)recognizeEmojiInString:(id)a3 alternativesOut:(id)a4;
- (uint64_t)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:;
- (unordered_set<std::string,)endsOfSentencePunctuationsForLanguage:()std:(std:(_EARFormatter *)self :(SEL)a3 allocator<std:(const void *)a4 :string>> *__return_ptr)retstr :equal_to<std::string>;
- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3;
- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3 task:(const void *)a4;
- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3 task:(const void *)a4 language:(void *)a5 preItnLeftContext:(id)a6 separateAutoEndPunctuation:(id)a7 partialResults:(const void *)a8 timestampOffset:(BOOL)a9 zeroTimestamp:(void *)a10 continuousListeningConfig:(unsigned int)a11 postItnLeftContext:(BOOL)a12 itnResult:(shared_ptr<quasar:(const void *)a14 :(void *)a15 ContinuousListeningConfig>)a13 itnOverrides:(const void *)a16 itnEnablingFlags:(unsigned __int16)a17 recognizeEmoji:(BOOL)a18 leftContextProvidedByClient:(BOOL)a19 preItnRightContext:(const void *)a20 emojiTokenIndices:(void *)a21 persistEmoji:(BOOL)a22 shouldHideTrailingPunctuation:(BOOL)a23 isTrailingPunctuationHidden:(shared_ptr<BOOL>)a24 isFinal:(BOOL)a25 choiceIdx:(int)a26 itnCompletion:(id)a27;
- (vector<quasar::Token,)formattedTokensWithoutEmojiModifier:(_EARFormatter *)self emojiTokenIndices:(SEL)a3 recognizeEmoji:(const void *)a4;
- (vector<std::string,)emojiAlternativesForEmojis:(_EARFormatter *)self;
- (void)appendNbestListWithEmojiAlternativesForFormattedTokens:(const void *)a3 formattedTokensWithoutEmojiModifier:(const void *)a4 formattedNBestList:(void *)a5 formattedNBestListWithoutEmojiModifier:(void *)a6 emojiTokenIndices:(const void *)a7 recognizeEmoji:(BOOL)a8;
- (void)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:;
- (void)initializeItnMetrics;
- (void)recognizeEmojiForTokens:(void *)a3 emojiTokenIndices:(void *)a4 persistEmoji:(BOOL)a5 choiceIdx:(int)a6;
- (void)refreshEmojiRecognizer;
- (void)setItnMetricsWithCompletion:(id)a3;
- (void)setLanguage:(id)a3;
@end

@implementation _EARFormatter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t is_darwinos = os_variant_is_darwinos();
    if ((is_darwinos & 1) == 0)
    {
      id v3 = self;
      uint64_t is_darwinos = +[EARSdapiHelper EnsureSDAPIInitialized];
    }
    EARLogger::initializeLogging((EARLogger *)is_darwinos);
  }
}

- (_EARFormatter)initWithLanguage:(id)a3 withSdapiConfig:(id)a4 quasarConfig:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_EARFormatter;
  v11 = [(_EARFormatter *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    language = v11->_language;
    v11->_language = (NSString *)v12;

    if ([v10 length])
    {
      if (v10)
      {
        objc_msgSend(v10, "ear_toString");
        if (v8)
        {
LABEL_5:
          objc_msgSend(v8, "ear_toString");
          goto LABEL_11;
        }
      }
      else
      {
        __p = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        if (v8) {
          goto LABEL_5;
        }
      }
      memset(v20, 0, sizeof(v20));
LABEL_11:
      memset(v19, 0, sizeof(v19));
      SpeechITN::createQuasarITN((uint64_t)&__p, (const quasar::SystemConfig *)v20, v19, 0);
    }
    if ((os_variant_is_darwinos() & 1) == 0)
    {
      if (v9)
      {
        objc_msgSend(v9, "ear_toString");
      }
      else
      {
        __p = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
      }
      sdapi::SdapiUtil::readConfig();
    }
  }
  v14 = v11;

  return v14;
}

- (_EARFormatter)initWithQuasarConfig:(id)a3
{
  return [(_EARFormatter *)self initWithQuasarConfig:a3 overrideConfigFiles:0];
}

- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4
{
  return [(_EARFormatter *)self initWithQuasarConfig:a3 overrideConfigFiles:a4 supportEmojiRecognition:0 language:0];
}

- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4 supportEmojiRecognition:(BOOL)a5 language:(id)a6
{
  return [(_EARFormatter *)self initWithQuasarConfig:a3 overrideConfigFiles:a4 supportEmojiRecognition:a5 language:a6 skipPathsExistCheck:0];
}

- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4 supportEmojiRecognition:(BOOL)a5 language:(id)a6 skipPathsExistCheck:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v42.receiver = self;
  v42.super_class = (Class)_EARFormatter;
  v14 = [(_EARFormatter *)&v42 init];
  if (!v14)
  {
    v24 = (_EARFormatter *)0;
    goto LABEL_22;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x4812000000;
  v38 = __Block_byref_object_copy__13;
  v39 = __Block_byref_object_dispose__13;
  v40 = &unk_1B27252DB;
  memset(v41, 0, sizeof(v41));
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __111___EARFormatter_initWithQuasarConfig_overrideConfigFiles_supportEmojiRecognition_language_skipPathsExistCheck___block_invoke;
  v34[3] = &unk_1E5FFE350;
  v34[4] = &v35;
  [v12 enumerateObjectsUsingBlock:v34];
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v33);
  if (v11)
  {
    objc_msgSend(v11, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v32 = 0;
  }
  *(_OWORD *)v26 = 0u;
  long long v27 = 0u;
  int v28 = 1065353216;
  quasar::SystemConfig::readJsonFile((uint64_t)v33, (uint64_t)__p, v36 + 6, (uint64_t)v26, 1, a7);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v26);
  if (SHIBYTE(v32) < 0)
  {
    operator delete(__p[0]);
    if (v13) {
      goto LABEL_7;
    }
LABEL_9:
    SpeechModelInfo = (const quasar::SpeechModelInfo *)quasar::SystemConfig::getSpeechModelInfo((quasar::SystemConfig *)v33);
    quasar::SpeechModelInfo::SpeechModelInfo((std::string *)v26, SpeechModelInfo);
    if (v30 >= 0) {
      v19 = &v29;
    }
    else {
      v19 = v29;
    }
    uint64_t v20 = [NSString stringWithUTF8String:v19];
    language = v14->_language;
    v14->_language = (NSString *)v20;

    quasar::SpeechModelInfo::~SpeechModelInfo((quasar::SpeechModelInfo *)v26);
    id v13 = 0;
    goto LABEL_13;
  }
  if (!v13) {
    goto LABEL_9;
  }
LABEL_7:
  v15 = [v13 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  uint64_t v16 = [v15 copy];
  uint64_t v17 = v14->_language;
  v14->_language = (NSString *)v16;

  id v13 = v15;
LABEL_13:
  v22 = (EARLogger *)[(id)objc_opt_class() supportedByQuasarSystemConfig:v33];
  if (v22)
  {
    if (v13)
    {
      objc_msgSend(v13, "ear_toString");
    }
    else
    {
      v26[0] = 0;
      v26[1] = 0;
      *(void *)&long long v27 = 0;
    }
    SpeechITN::createQuasarITN((quasar::QuasarTextProc *)v33, (const quasar::SystemConfig *)v26);
  }
  v23 = EARLogger::QuasarOSLogger(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[_EARFormatter initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:](v23);
  }

  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v33);
  _Block_object_dispose(&v35, 8);
  v33[0] = (void **)v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v33);
  v24 = 0;
LABEL_22:

  return v24;
}

- (_EARFormatter)initWithQuasarConfig:(id)a3 language:(id)a4
{
  return [(_EARFormatter *)self initWithQuasarConfig:a3 overrideConfigFiles:0 supportEmojiRecognition:0 language:a4];
}

+ (BOOL)supportedByQuasarConfig:(id)a3
{
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[a3 fileSystemRepresentation]);
  SpeechITN::quasarItnExists((uint64_t)__p);
}

+ (BOOL)supportedByQuasarSystemConfig:(const void *)a3
{
  return SpeechITN::quasarItnExists((SpeechITN *)a3, (const quasar::SystemConfig *)a2);
}

- (BOOL)isEnableAutoPunctuation:(const void *)a3 task:(const void *)a4 itnEnablingFlags:(unsigned __int16)a5
{
  return (*(uint64_t (**)(SpeechITN *, const void *, const void *, void))(*(void *)self->_itn.__ptr_.__value_
                                                                                    + 24))(self->_itn.__ptr_.__value_, a3, a4, a5);
}

+ (BOOL)useEmojiHammerWhenRecognizeEmoji:(BOOL)a3
{
  if (a3) {
    return !+[_EARFeatureFlags isEmojiV2Enabled];
  }
  else {
    return 0;
  }
}

- (unordered_set<std::string,)endsOfSentencePunctuationsForLanguage:()std:(std:(_EARFormatter *)self :(SEL)a3 allocator<std:(const void *)a4 :string>> *__return_ptr)retstr :equal_to<std::string>
{
  return (unordered_set<std::string, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::string>> *)(*(void *(**)(unordered_set<std::string, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::string>> *__return_ptr))(*(void *)self->_itn.__ptr_.__value_ + 40))(retstr);
}

- (_EARFormatter)initWithGeneralVoc:(id)a3 withLexiconEnh:(id)a4 withItnEnh:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[_EARQuasarTokenizer extractModelRootFromNcsResourcePaths:v8 lexiconEnh:v9 tokenEnh:0 itnEnh:v10];
  id v12 = [(_EARFormatter *)self initNcsWithModelRoot:v11];

  return v12;
}

- (id)initNcsWithModelRoot:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EARFormatter;
  v5 = [(_EARFormatter *)&v13 init];
  if (v5 && (os_variant_is_darwinos() & 1) == 0)
  {
    v6 = [v4 stringByAppendingPathComponent:@"ncs"];
    v7 = [v6 stringByAppendingPathComponent:@"dispatch.voc"];
    id v8 = [v6 stringByAppendingPathComponent:@"lexicon.enh"];
    id v9 = [v6 stringByAppendingPathComponent:@"itn_s.enh"];
    if (v7) {
      objc_msgSend(v7, "ear_toString");
    }
    else {
      memset(&v12[3], 0, 24);
    }
    std::string::basic_string[abi:ne180100]<0>(v12, "");
    if (v8)
    {
      objc_msgSend(v8, "ear_toString");
      if (!v9) {
        goto LABEL_10;
      }
    }
    else if (!v9)
    {
LABEL_10:
      SpeechITN::createSdapiITN();
    }
    objc_msgSend(v9, "ear_toString");
    goto LABEL_10;
  }
  id v10 = v5;

  return v10;
}

- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3
{
  return [(_EARFormatter *)self formatWords:a4 unrepairedWordsOut:a5 task:&stru_1F0A64AB0];
}

- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3 task:(const void *)a4
{
  id v10 = a6;
  language = (__CFString *)self->_language;
  if (!language) {
    language = &stru_1F0A64AB0;
  }
  id v12 = language;
  value = self->_itn.__ptr_.__value_;
  if (value)
  {
    if (v10)
    {
      objc_msgSend(v10, "ear_toString");
    }
    else
    {
      v18[0] = 0;
      v18[1] = 0;
      uint64_t v19 = 0;
    }
    [(__CFString *)v12 ear_toString];
    memset(v15, 0, sizeof(v15));
    (*(void (**)(SpeechITN *, const void *, void *, void **, void **, void **, uint64_t, void))(*(void *)value + 16))(value, a4, a5, v18, &__p, v15, 0xFFFFLL, 0);
    uint64_t v20 = v15;
    std::vector<quasar::ItnOverride>::__destroy_vector::operator()[abi:ne180100](&v20);
    if (v17 < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(v19) < 0) {
      operator delete(v18[0]);
    }
  }
  else
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
  }

  return result;
}

- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3 task:(const void *)a4 language:(void *)a5 preItnLeftContext:(id)a6 separateAutoEndPunctuation:(id)a7 partialResults:(const void *)a8 timestampOffset:(BOOL)a9 zeroTimestamp:(void *)a10 continuousListeningConfig:(unsigned int)a11 postItnLeftContext:(BOOL)a12 itnResult:(shared_ptr<quasar:(const void *)a14 :(void *)a15 ContinuousListeningConfig>)a13 itnOverrides:(const void *)a16 itnEnablingFlags:(unsigned __int16)a17 recognizeEmoji:(BOOL)a18 leftContextProvidedByClient:(BOOL)a19 preItnRightContext:(const void *)a20 emojiTokenIndices:(void *)a21 persistEmoji:(BOOL)a22 shouldHideTrailingPunctuation:(BOOL)a23 isTrailingPunctuationHidden:(shared_ptr<BOOL>)a24 isFinal:(BOOL)a25 choiceIdx:(int)a26 itnCompletion:(id)a27
{
  var1 = a24.var1;
  char v35 = BYTE2(a16);
  v97[4] = *MEMORY[0x1E4F143B8];
  v93 = self;
  id v92 = a6;
  char v91 = v35;
  id v79 = a7;
  v80 = var1;
  v36 = [v79 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  id v90 = v36;
  if (self->_itn.__ptr_.__value_)
  {
    uint64_t v37 = [MEMORY[0x1E4F28F80] processInfo];
    [v37 systemUptime];
    double v39 = v38;

    v78 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
    v40 = (uint64_t *)a22;
    v41 = (std::__shared_weak_count *)*((void *)a13.var0 + 1);
    uint64_t v88 = *(void *)a13.var0;
    v89 = v41;
    if (v41) {
      atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v43 = *v40;
    objc_super v42 = (std::__shared_weak_count *)v40[1];
    uint64_t v86 = v43;
    v87 = v42;
    if (v42) {
      atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v44 = operator new(0x40uLL);
    unsigned __int8 v45 = BYTE1(a21);
    uint64_t v46 = a17;
    char v47 = BYTE3(a16);
    void *v44 = &unk_1F0A5A808;
    v44[1] = &v93;
    v44[2] = a5;
    v44[3] = &v92;
    v44[4] = &v90;
    v44[5] = a15;
    v44[6] = &a16;
    v44[7] = &v91;
    v97[3] = v44;
    quasar::formatWords((std::string *)a4, (std::string *)a8, a9, (std::string *)a10, a11, a12, &v88, a13.var1, (std::string *)retstr, v47, (std::string *)a14, v46, v45, (uint64_t)&v86, (uint64_t)v97);
    std::__function::__value_func<std::vector<quasar::Token> ()(std::vector<quasar::Token> const&)>::~__value_func[abi:ne180100](v97);
    if (v87) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v87);
    }
    if (v89) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v89);
    }
    int var0_high = HIDWORD(a24.var0);
    int v49 = a21;
    if (v91 && v93->_emojiFormatter) {
      [(_EARFormatter *)v93 recognizeEmojiForTokens:retstr emojiTokenIndices:a20 persistEmoji:a21 choiceIdx:HIDWORD(a24.var0)];
    }
    v50 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
    v96[0] = v78;
    v96[1] = v50;
    v51 = v50;
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
    if (!var0_high)
    {
      if (v49)
      {
        objc_storeStrong((id *)&v93->_firstCandidateItnIntervalInTicks, obj);
        v52 = [MEMORY[0x1E4F28F80] processInfo];
        [v52 systemUptime];
        double v54 = v53;

        v55 = v93;
        v93->_firstCandidateItnDurationSum = v54 - v39 + v93->_firstCandidateItnDurationSum;
        ++v55->_firstCandidateItnCount;
        v56 = [(NSMutableDictionary *)v55->_emojiMetrics valueForKey:@"isEmojiExpectedButNotRecognized"];
        char v57 = [v56 BOOLValue];

        if ((v57 & 1) == 0)
        {
          begin = retstr->__begin_;
          if (retstr->__end_ != retstr->__begin_)
          {
            uint64_t v59 = 0;
            unint64_t v60 = 0;
            while (1)
            {
              v61 = &begin->tokenName.__r_.__value_.var0.var0.__data_[v59];
              if (v61[23] < 0)
              {
                std::string::__init_copy_ctor_external(&v85, *(const std::string::value_type **)v61, *((void *)v61 + 1));
              }
              else
              {
                long long v62 = *(_OWORD *)v61;
                v85.__r_.__value_.__r.__words[2] = *((void *)v61 + 2);
                *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v62;
              }
              value = v93->_itn.__ptr_.__value_;
              v64 = objc_opt_class();
              v65 = (v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                  ? &v85
                  : (std::string *)v85.__r_.__value_.__r.__words[0];
              std::string::size_type v66 = (v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                  ? HIBYTE(v85.__r_.__value_.__r.__words[2])
                  : v85.__r_.__value_.__l.__size_;
              v67 = objc_msgSend(NSString, "ear_stringWithStringView:", v65, v66);
              v95 = v67;
              v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
              if (v64)
              {
                [v64 convertStringsToQuasarTokens:v68 offset:0];
              }
              else
              {
                __p = 0;
                uint64_t v82 = 0;
                uint64_t v83 = 0;
              }
              (*(void (**)(uint64_t *__return_ptr, SpeechITN *, void **))(*(void *)value + 32))(v84, value, &__p);
              p_p = &__p;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&p_p);

              v50 = v51;
              uint64_t v69 = v84[0];
              if (v84[0] != v84[1]) {
                break;
              }
              int v70 = 4;
LABEL_57:
              __p = v84;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
              if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v85.__r_.__value_.__l.__data_);
              }
              if ((v70 | 4) == 4)
              {
                ++v60;
                begin = retstr->__begin_;
                v59 += 224;
                if (0x6DB6DB6DB6DB6DB7 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) > v60) {
                  continue;
                }
              }
              goto LABEL_61;
            }
            std::string::basic_string[abi:ne180100]<0>(&__p, " ");
            quasar::eraseAll(v69, (uint64_t)&__p);
            if (SHIBYTE(v83) < 0) {
              operator delete(__p);
            }
            if (*(char *)(v84[0] + 23) < 0)
            {
              if (!*(void *)(v84[0] + 8))
              {
LABEL_54:
                emojiMetrics = v93->_emojiMetrics;
                v75 = [NSNumber numberWithBool:1];
                [(NSMutableDictionary *)emojiMetrics setValue:v75 forKey:@"isEmojiExpectedButNotRecognized"];

                int v70 = 2;
                goto LABEL_57;
              }
            }
            else if (!*(unsigned char *)(v84[0] + 23))
            {
              goto LABEL_54;
            }
            quasar::toLower(v84[0], (uint64_t)&__p);
            if (SHIBYTE(v83) < 0)
            {
              if (v82 != 5)
              {
                operator delete(__p);
LABEL_56:
                int v70 = 0;
                goto LABEL_57;
              }
              BOOL v73 = *(_DWORD *)__p != 1785687397 || *((unsigned char *)__p + 4) != 105;
              operator delete(__p);
              if (v73) {
                goto LABEL_56;
              }
            }
            else
            {
              if (SHIBYTE(v83) != 5) {
                goto LABEL_56;
              }
              if (__p != 1785687397 || BYTE4(__p) != 105) {
                goto LABEL_56;
              }
            }
            goto LABEL_54;
          }
        }
      }
    }
LABEL_61:
    if (!var0_high && LOBYTE(a24.var0) && v80)
    {
      [(_EARFormatter *)v93 setItnMetricsWithCompletion:v80];
    }
    else if (v80)
    {
      (*((void (**)(__shared_weak_count *, void, void, id))v80 + 2))(v80, 0, 0, obj);
    }

    v36 = v90;
  }
  else
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
  }

  return result;
}

- (void)setItnMetricsWithCompletion:(id)a3
{
  id v10 = (void (**)(id, NSMutableDictionary *, NSMutableArray *, NSArray *))a3;
  emojiMetrics = self->_emojiMetrics;
  v5 = [NSNumber numberWithDouble:self->_firstCandidateItnDurationSum / (double)self->_firstCandidateItnCount * 1000000000.0];
  [(NSMutableDictionary *)emojiMetrics setValue:v5 forKey:@"itnDurationInNs"];

  v6 = self->_emojiMetrics;
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_EAREmojiRecognition isEmojiDisambiguationUsed](self->_emojiFormatter, "isEmojiDisambiguationUsed"));
  [(NSMutableDictionary *)v6 setValue:v7 forKey:@"isEmojiDisambiguationUsed"];

  id v8 = self->_emojiMetrics;
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_EAREmojiRecognition isEmojiPersonalizationUsed](self->_emojiFormatter, "isEmojiPersonalizationUsed"));
  [(NSMutableDictionary *)v8 setValue:v9 forKey:@"isEmojiPersonalizationUsed"];

  if (v10) {
    v10[2](v10, self->_emojiMetrics, self->_recognizedEmojis, self->_firstCandidateItnIntervalInTicks);
  }
  [(_EARFormatter *)self initializeItnMetrics];
}

- (vector<std::string,)emojiAlternativesForEmojis:(_EARFormatter *)self
{
  id v5 = a4;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  for (unint64_t i = 1; i != 4; ++i)
  {
    if (i >= objc_msgSend(v5, "count", __p[0])) {
      break;
    }
    v7 = [v5 objectAtIndexedSubscript:i];
    id v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "ear_toString");
    }
    else
    {
      *(_OWORD *)__p = 0uLL;
      std::string::size_type v20 = 0;
    }
    end = (char *)retstr->__end_;
    value = (char *)retstr->__end_cap_.__value_;
    if (end >= value)
    {
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)retstr->__begin_) >> 3);
      unint64_t v12 = v11 + 1;
      if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<int>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((value - (char *)retstr->__begin_) >> 3);
      if (2 * v13 > v12) {
        unint64_t v12 = 2 * v13;
      }
      unint64_t v14 = v13 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v12;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&retstr->__end_cap_;
      v15 = v14
          ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&retstr->__end_cap_, v14): 0;
      uint64_t v16 = v15 + v11;
      __v.__first_ = v15;
      __v.__begin_ = v16;
      __v.__end_cap_.__value_ = &v15[v14];
      v16->__r_.__value_.__r.__words[2] = v20;
      *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      std::string::size_type v20 = 0;
      *(_OWORD *)__p = 0uLL;
      __v.__end_ = v16 + 1;
      std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)retstr, &__v);
      char v17 = retstr->__end_;
      std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
      retstr->__end_ = v17;
    }
    else
    {
      *((void *)end + 2) = v20;
      *(_OWORD *)end = *(_OWORD *)__p;
      std::string::size_type v20 = 0;
      *(_OWORD *)__p = 0uLL;
      retstr->__end_ = end + 24;
    }
  }
  return result;
}

- (void)recognizeEmojiForTokens:(void *)a3 emojiTokenIndices:(void *)a4 persistEmoji:(BOOL)a5 choiceIdx:(int)a6
{
  BOOL v7 = a5;
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  if (!+[_EARFeatureFlags isEmojiV2Enabled])
  {
    uint64_t v31 = *(void *)a3;
    if (*((void *)a3 + 1) == *(void *)a3) {
      return;
    }
    uint64_t v32 = 0;
    if (a6) {
      BOOL v33 = 0;
    }
    else {
      BOOL v33 = v7;
    }
    BOOL v139 = v33;
    unsigned int v34 = 1;
    while (1)
    {
      std::string::basic_string[abi:ne180100]<0>(&buf, "spokenemoji|");
      uint64_t v35 = v31 + 224 * v32;
      BOOL v36 = quasar::startsWith((unsigned __int8 *)v35, (unsigned __int8 *)&buf);
      BOOL v37 = v36;
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(buf.__r_.__value_.__l.__data_);
        if (v37)
        {
LABEL_40:
          if (*(char *)(v35 + 23) < 0)
          {
            uint64_t v39 = *(void *)v35;
            uint64_t v38 = *(void *)(v35 + 8);
          }
          else
          {
            uint64_t v38 = *(unsigned __int8 *)(v35 + 23);
            uint64_t v39 = v31 + 224 * v32;
          }
          emojiFormatter = self->_emojiFormatter;
          v41 = objc_msgSend(NSString, "ear_stringWithStringView:", v39, v38);
          objc_super v42 = [(_EAREmojiRecognition *)emojiFormatter formatEmojiStrings:v41];

          if (v42)
          {
            objc_msgSend(v42, "ear_toString");
            if (*(char *)(v35 + 23) < 0) {
              operator delete(*(void **)v35);
            }
            long long v43 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
            *(void *)(v35 + 16) = *((void *)&buf.__r_.__value_.__l + 2);
            *(_OWORD *)uint64_t v35 = v43;
            LODWORD(v162.__r_.__value_.__l.__data_) = v34 - 1;
            long long v147 = 0uLL;
            v146 = 0;
            LODWORD(v154) = v34 - 1;
            v156 = 0;
            long long v155 = 0uLL;
            v163 = 0;
            *(_OWORD *)&v162.__r_.__value_.__r.__words[1] = 0uLL;
            v44 = a4;
            unint64_t v45 = *((void *)a4 + 1);
            unint64_t v46 = *((void *)a4 + 2);
            if (v45 >= v46)
            {
              uint64_t v48 = (uint64_t)(v45 - *(void *)a4) >> 5;
              unint64_t v49 = v48 + 1;
              if ((unint64_t)(v48 + 1) >> 59) {
                std::vector<int>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v50 = v46 - *(void *)a4;
              if (v50 >> 4 > v49) {
                unint64_t v49 = v50 >> 4;
              }
              if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v51 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v51 = v49;
              }
              v167 = (char *)a4 + 16;
              v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<quasar::TextTokenizer::Token>>((uint64_t)a4 + 16, v51);
              std::string::size_type v53 = (std::string::size_type)&v52[32 * v48];
              buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v52;
              buf.__r_.__value_.__l.__size_ = v53;
              v166 = &v52[32 * v54];
              *(_DWORD *)std::string::size_type v53 = v154;
              *(void *)(v53 + 16) = 0;
              *(void *)(v53 + 24) = 0;
              *(void *)(v53 + 8) = 0;
              *(_OWORD *)(v53 + 8) = v155;
              *(void *)(v53 + 24) = v156;
              long long v155 = 0uLL;
              v156 = 0;
              buf.__r_.__value_.__r.__words[2] = v53 + 32;
              v44 = a4;
              std::vector<std::pair<int,std::vector<std::string>>>::__swap_out_circular_buffer((uint64_t *)a4, &buf);
              unint64_t v47 = *((void *)a4 + 1);
              std::__split_buffer<std::pair<int,std::vector<std::string>>>::~__split_buffer((void **)&buf.__r_.__value_.__l.__data_);
            }
            else
            {
              *(_DWORD *)unint64_t v45 = v34 - 1;
              *(void *)(v45 + 16) = 0;
              *(void *)(v45 + 24) = 0;
              *(void *)(v45 + 8) = 0;
              *(_OWORD *)(v45 + 8) = v155;
              *(void *)(v45 + 24) = v156;
              long long v155 = 0uLL;
              v156 = 0;
              unint64_t v47 = v45 + 32;
            }
            v44[1] = v47;
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v155;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v162.__r_.__value_.__l.__size_;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v146;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            if (v139)
            {
              [(_EAREmojiRecognition *)self->_emojiFormatter didUseEmoji:v42 replacementContext:0];
              v55 = [(_EAREmojiRecognition *)self->_emojiFormatter baseStringForEmojiString:v42];
              [(NSMutableArray *)self->_recognizedEmojis addObject:v55];
            }
          }
          else
          {
            std::string::operator=((std::string *)(v31 + 224 * v32), (const std::string *)(v31 + 224 * v32 + 176));
          }
        }
      }
      else if (v36)
      {
        goto LABEL_40;
      }
      uint64_t v32 = v34;
      uint64_t v31 = *(void *)a3;
      BOOL v87 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5) > (unint64_t)v34++;
      if (!v87) {
        return;
      }
    }
  }
  int v131 = a6;
  BOOL log = v7;
  v138 = [MEMORY[0x1E4F28E78] string];
  __p = 0;
  v160 = 0;
  v161 = 0;
  uint64_t v9 = *(void *)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unsigned int v12 = 0;
    do
    {
      uint64_t v13 = v9 + 224 * v10;
      if (*(char *)(v13 + 23) < 0)
      {
        uint64_t v13 = *(void *)v13;
        uint64_t v14 = *(void *)(v9 + 224 * v10 + 8);
      }
      else
      {
        uint64_t v14 = *(unsigned __int8 *)(v13 + 23);
      }
      v15 = objc_msgSend(NSString, "ear_stringWithStringView:", v13, v14);
      uint64_t v16 = [v15 length];
      [v138 appendString:v15];
      uint64_t v17 = [v15 length] + v11;
      if (*(unsigned char *)(*(void *)a3 + 224 * v10 + 44))
      {
        [v138 appendString:@" "];
        ++v17;
      }
      uint64_t v18 = v160;
      if (v160 >= v161)
      {
        std::string::size_type v20 = (char *)__p;
        uint64_t v21 = (v160 - (unsigned char *)__p) >> 4;
        unint64_t v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 60) {
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v23 = v161 - (unsigned char *)__p;
        if ((v161 - (unsigned char *)__p) >> 3 > v22) {
          unint64_t v22 = v23 >> 3;
        }
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v24 = v22;
        }
        if (v24)
        {
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,unsigned long>>>((uint64_t)&v161, v24);
          std::string::size_type v20 = (char *)__p;
          uint64_t v18 = v160;
        }
        else
        {
          v25 = 0;
        }
        v26 = &v25[16 * v21];
        *(void *)v26 = v11;
        *((void *)v26 + 1) = v16;
        long long v27 = v26;
        if (v18 != v20)
        {
          do
          {
            *((_OWORD *)v27 - 1) = *((_OWORD *)v18 - 1);
            v27 -= 16;
            v18 -= 16;
          }
          while (v18 != v20);
          std::string::size_type v20 = (char *)__p;
        }
        uint64_t v19 = v26 + 16;
        __p = v27;
        v160 = v26 + 16;
        v161 = &v25[16 * v24];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *(void *)v160 = v11;
        *((void *)v18 + 1) = v16;
        uint64_t v19 = v18 + 16;
      }
      v160 = v19;

      uint64_t v9 = *(void *)a3;
      uint64_t v11 = v17;
      uint64_t v10 = ++v12;
    }
    while (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5) > (unint64_t)v12);
  }
  int v28 = (EARLogger *)[v138 length];
  if (v28)
  {
    v29 = EARLogger::QuasarOSLogger(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[_EARFormatter recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:]();
    }

    if ([(_EAREmojiRecognition *)self->_emojiFormatter isLocaleRTL]) {
      BOOL v30 = [v138 characterAtIndex:0] == 8207;
    }
    else {
      BOOL v30 = 0;
    }
    uint64_t v154 = 0;
    *(void *)&long long v155 = &v154;
    *((void *)&v155 + 1) = 0x3032000000;
    v156 = __Block_byref_object_copy__48;
    v157 = __Block_byref_object_dispose__49;
    id v158 = [MEMORY[0x1E4F1CA48] array];
    char v57 = self->_emojiFormatter;
    v152[0] = MEMORY[0x1E4F143A8];
    v152[1] = 3221225472;
    v152[2] = __82___EARFormatter_recognizeEmojiForTokens_emojiTokenIndices_persistEmoji_choiceIdx___block_invoke;
    v152[3] = &unk_1E5FFFF90;
    BOOL v153 = v30;
    v152[4] = &v154;
    [(_EAREmojiRecognition *)v57 recognizeEmojisInInputString:v138 enumerateUsingBlock:v152];
    v140 = [*(id *)(v155 + 40) sortedArrayUsingComparator:&__block_literal_global_3];
    v58 = (EARLogger *)[v140 count];
    if (v58)
    {
      BOOL v129 = v30;
      unint64_t v60 = 0;
      unint64_t v61 = 0;
      uint64_t v149 = 0;
      v150 = 0;
      unint64_t v151 = 0;
      if (v131) {
        BOOL v62 = 0;
      }
      else {
        BOOL v62 = log;
      }
      BOOL v130 = v62;
      *(void *)&long long v59 = 138412802;
      long long v128 = v59;
      while (v60 < objc_msgSend(v140, "count", v128))
      {
        v63 = [v140 objectAtIndexedSubscript:v60];
        v64 = [v63 objectAtIndexedSubscript:0];

        v65 = [v140 objectAtIndexedSubscript:v60];
        std::string::size_type v66 = [v65 objectAtIndexedSubscript:1];

        unint64_t v67 = [v66 rangeValue];
        unint64_t v69 = v68;
        int v70 = (std::string *)[v64 count];
        if (v70
          && (uint64_t v71 = *(void *)a3,
              uint64_t v72 = *((void *)a3 + 1),
              0x6DB6DB6DB6DB6DB7 * ((v72 - *(void *)a3) >> 5) > (unint64_t)v61))
        {
          unint64_t v73 = v61;
          while (1)
          {
            v74 = (const quasar::Token *)(v71 + 224 * v73);
            unint64_t v75 = *((void *)__p + 2 * v73);
            if (v67 == v75)
            {
              unint64_t v76 = *((void *)__p + 2 * v73 + 1);
              BOOL v77 = v69 >= v76;
              uint64_t v78 = v69 - v76;
              if (v77) {
                break;
              }
            }
            if (v75 > v67) {
              goto LABEL_82;
            }
            id v79 = v150;
            if ((unint64_t)v150 >= v151)
            {
              int v70 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>(&v149, v74);
            }
            else
            {
              quasar::Token::Token(v150, v74);
              int v70 = (std::string *)((char *)v79 + 224);
            }
            v150 = v70;
            unint64_t v73 = (v61 + 1);
            uint64_t v71 = *(void *)a3;
            uint64_t v72 = *((void *)a3 + 1);
            unint64_t v61 = v73;
            if (0x6DB6DB6DB6DB6DB7 * ((v72 - *(void *)a3) >> 5) <= v73) {
              goto LABEL_83;
            }
          }
          unint64_t v80 = v71 + 224 * v73;
          int v81 = *(_DWORD *)(v80 + 28);
          char v82 = *(unsigned char *)(v80 + 45);
          if (v78 < 1)
          {
            int v83 = 0;
LABEL_98:
            char v88 = v82;
            int v89 = v81;
            LODWORD(v61) = v83 + v61;
            quasar::Token::Token(&buf, (const quasar::Token *)(v71 + 224 * v61));
            HIDWORD(v166) = v89;
            char v168 = v88;
            v132 = [v64 objectAtIndexedSubscript:0];
            id v90 = -[_EAREmojiRecognition formatEmojiStrings:](self->_emojiFormatter, "formatEmojiStrings:");
            os_log_t loga = v90;
            if (v90) {
              [v90 ear_toString];
            }
            else {
              memset(&v162, 0, sizeof(v162));
            }
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
            std::string buf = v162;
            uint64_t v92 = v149;
            char v91 = v150;
            [(_EARFormatter *)self emojiAlternativesForEmojis:v64];
            uint64_t v93 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v91 - v92) >> 5);
            uint64_t v144 = v93;
            uint64_t v94 = v143;
            long long v95 = v142;
            uint64_t v143 = 0;
            long long v142 = 0uLL;
            LODWORD(v146) = -1227133513 * (((uint64_t)v91 - v92) >> 5);
            long long v147 = v95;
            uint64_t v148 = v94;
            memset(v145, 0, sizeof(v145));
            v96 = a4;
            unint64_t v97 = *((void *)a4 + 1);
            unint64_t v98 = *((void *)a4 + 2);
            if (v97 >= v98)
            {
              uint64_t v100 = (uint64_t)(v97 - *(void *)a4) >> 5;
              unint64_t v101 = v100 + 1;
              if ((unint64_t)(v100 + 1) >> 59) {
                std::vector<int>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v102 = v98 - *(void *)a4;
              if (v102 >> 4 > v101) {
                unint64_t v101 = v102 >> 4;
              }
              if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v103 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v103 = v101;
              }
              v164 = (char *)a4 + 16;
              v104 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<quasar::TextTokenizer::Token>>((uint64_t)a4 + 16, v103);
              std::string::size_type v105 = (std::string::size_type)&v104[32 * v100];
              v162.__r_.__value_.__r.__words[0] = (std::string::size_type)v104;
              v162.__r_.__value_.__l.__size_ = v105;
              v163 = &v104[32 * v106];
              *(_DWORD *)std::string::size_type v105 = v146;
              *(void *)(v105 + 16) = 0;
              *(void *)(v105 + 24) = 0;
              *(void *)(v105 + 8) = 0;
              *(_OWORD *)(v105 + 8) = v147;
              *(void *)(v105 + 24) = v148;
              long long v147 = 0uLL;
              uint64_t v148 = 0;
              v162.__r_.__value_.__r.__words[2] = v105 + 32;
              v96 = a4;
              std::vector<std::pair<int,std::vector<std::string>>>::__swap_out_circular_buffer((uint64_t *)a4, &v162);
              unint64_t v99 = *((void *)a4 + 1);
              std::__split_buffer<std::pair<int,std::vector<std::string>>>::~__split_buffer((void **)&v162.__r_.__value_.__l.__data_);
            }
            else
            {
              *(_DWORD *)unint64_t v97 = v93;
              *(void *)(v97 + 16) = 0;
              *(void *)(v97 + 24) = 0;
              *(void *)(v97 + 8) = 0;
              *(_OWORD *)(v97 + 8) = v147;
              *(void *)(v97 + 24) = v148;
              long long v147 = 0uLL;
              uint64_t v148 = 0;
              unint64_t v99 = v97 + 32;
            }
            v96[1] = v99;
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)&v147;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)v145;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)&v142;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            if (v130)
            {
              v107 = self->_emojiFormatter;
              v108 = objc_msgSend(v138, "substringWithRange:", v67, v69);
              [(_EAREmojiRecognition *)v107 didUseEmoji:loga replacementContext:v108];

              [(NSMutableArray *)self->_recognizedEmojis addObject:v132];
            }
            v109 = v150;
            if ((unint64_t)v150 >= v151)
            {
              v110 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>(&v149, (const quasar::Token *)&buf);
            }
            else
            {
              quasar::Token::Token(v150, (const quasar::Token *)&buf);
              v110 = (std::string *)((char *)v109 + 224);
            }
            v150 = v110;

            if (v178 < 0) {
              operator delete(v177);
            }
            if (v176 < 0) {
              operator delete(v175);
            }
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)&v174;
            std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            if (v173 < 0) {
              operator delete(v172);
            }
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)&v171;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            if (v170 < 0) {
              operator delete(v169);
            }
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            int v83 = 0;
            unint64_t v84 = 0x6DB6DB6DB6DB6DB7 * ((v72 - v71) >> 5);
            while (1)
            {
              uint64_t v85 = v61 + v83 == -1 ? 0 : *(unsigned __int8 *)(v71 + 224 * (v61 + v83) + 44);
              uint64_t v86 = (char *)__p + 16 * (v61 + v83 + 1);
              uint64_t v78 = v78 - v85 - v86[1];
              if (v78 < 0) {
                break;
              }
              if (v78) {
                BOOL v87 = v84 > (v61 + v83 + 2);
              }
              else {
                BOOL v87 = 1;
              }
              if (!v87) {
                goto LABEL_130;
              }
              ++v83;
              if (!v78) {
                goto LABEL_98;
              }
            }
            logb = EARLogger::QuasarOSLogger((EARLogger *)v70);
            BOOL v111 = os_log_type_enabled(logb, OS_LOG_TYPE_DEBUG);
            v112 = logb;
            if (v111)
            {
              objc_msgSend(v138, "substringWithRange:", v67, v69);
              id v115 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "substringWithRange:", *v86, v86[1]);
              v116 = (char *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf.__r_.__value_.__l.__data_) = v128;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v138;
              WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v115;
              HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
              v166 = v116;
              _os_log_debug_impl(&dword_1B1A86000, logb, OS_LOG_TYPE_DEBUG, "Emoji match failed: inputString:\"%@\" recognizedEmoji:\"%@\" currToken:\"%@\"", (uint8_t *)&buf, 0x20u);

              v112 = logb;
            }

LABEL_130:
            v113 = v150;
            if ((unint64_t)v150 >= v151)
            {
              v114 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>(&v149, v74);
            }
            else
            {
              quasar::Token::Token(v150, v74);
              v114 = (std::string *)((char *)v113 + 224);
            }
            v150 = v114;
          }
          unint64_t v73 = (v61 + 1);
        }
        else
        {
LABEL_82:
          unint64_t v73 = v61;
        }
LABEL_83:

        ++v60;
        unint64_t v61 = v73;
      }
      uint64_t v117 = *(void *)a3;
      if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5) > (unint64_t)v61)
      {
        uint64_t v118 = v61;
        v119 = v150;
        unsigned int v120 = v61 + 1;
        do
        {
          v121 = (const quasar::Token *)(v117 + 224 * v118);
          if ((unint64_t)v119 >= v151)
          {
            v119 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>(&v149, v121);
          }
          else
          {
            quasar::Token::Token(v119, v121);
            v119 = (std::string *)((char *)v119 + 224);
          }
          v150 = v119;
          uint64_t v118 = v120;
          uint64_t v117 = *(void *)a3;
          BOOL v87 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5) > (unint64_t)v120++;
        }
        while (v87);
      }
      if (&v149 != a3) {
        std::vector<quasar::Token>::__assign_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>((uint64_t)a3, v149, (uint64_t)v150, 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v150 - v149) >> 5));
      }
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v149;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
      BOOL v30 = v129;
    }
    v122 = EARLogger::QuasarOSLogger(v58);
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
    {
      v123 = NSString;
      memset(&v141, 0, sizeof(v141));
      std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v141, *(void *)a3, *((void *)a3 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5));
      EARHelpers::QuasarTokensToStdString(&v141, &v162);
      if ((v162.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v124 = &v162;
      }
      else {
        v124 = (std::string *)v162.__r_.__value_.__r.__words[0];
      }
      if ((v162.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v162.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v162.__r_.__value_.__l.__size_;
      }
      v126 = objc_msgSend(v123, "ear_stringWithStringView:", v124, size);
      std::string::size_type v127 = [v140 count];
      LODWORD(buf.__r_.__value_.__l.__data_) = 138412802;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v126;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v127;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 1024;
      LODWORD(v166) = v30;
      _os_log_debug_impl(&dword_1B1A86000, v122, OS_LOG_TYPE_DEBUG, "Emoji Output: %@ NumOfRecognizedEmojis:%lu isLocaleRTL:%d", (uint8_t *)&buf, 0x1Cu);
      if (SHIBYTE(v162.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v162.__r_.__value_.__l.__data_);
      }
      v146 = &v141;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v146);
    }
    _Block_object_dispose(&v154, 8);
  }
  else
  {
    v56 = EARLogger::QuasarOSLogger(0);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      -[_EARFormatter recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:](v56);
    }
  }
  if (__p)
  {
    v160 = (char *)__p;
    operator delete(__p);
  }
}

- (vector<quasar::Token,)formattedTokensWithoutEmojiModifier:(_EARFormatter *)self emojiTokenIndices:(SEL)a3 recognizeEmoji:(const void *)a4
{
  if (a6 && self->_emojiFormatter)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    result = (vector<quasar::Token, std::allocator<quasar::Token>> *)std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(retstr, *(void *)a4, *((void *)a4 + 1), 0x6DB6DB6DB6DB6DB7* ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5));
    uint64_t v11 = *(int **)a5;
    unsigned int v12 = (int *)*((void *)a5 + 1);
    if (*(int **)a5 != v12)
    {
      begin = retstr->__begin_;
      do
      {
        unint64_t v14 = *v11;
        if (0x6DB6DB6DB6DB6DB7 * (((char *)retstr->__end_ - (char *)begin) >> 5) > v14)
        {
          uint64_t v15 = *(void *)a4 + 224 * (int)v14;
          if (*(char *)(v15 + 23) < 0)
          {
            uint64_t v15 = *(void *)v15;
            uint64_t v16 = *(void *)(*(void *)a4 + 224 * (int)v14 + 8);
          }
          else
          {
            uint64_t v16 = *(unsigned __int8 *)(v15 + 23);
          }
          uint64_t v17 = objc_msgSend(NSString, "ear_stringWithStringView:", v15, v16);
          uint64_t v18 = [(_EAREmojiRecognition *)self->_emojiFormatter baseStringForEmojiString:v17];
          uint64_t v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "ear_toString");
          }
          else
          {
            long long v24 = 0uLL;
            uint64_t v25 = 0;
          }
          std::string::size_type v20 = &retstr->__begin_->tokenName.__r_.__value_.var0.var0.__data_[224 * *v11];
          if (v20[23] < 0) {
            operator delete(*(void **)v20);
          }
          *((void *)v20 + 2) = v25;
          *(_OWORD *)std::string::size_type v20 = v24;
          HIBYTE(v25) = 0;
          LOBYTE(v24) = 0;

          begin = retstr->__begin_;
        }
        v11 += 8;
      }
      while (v11 != v12);
    }
  }
  else
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    uint64_t v21 = *(void *)a4;
    uint64_t v22 = *((void *)a4 + 1);
    unint64_t v23 = 0x6DB6DB6DB6DB6DB7 * ((v22 - *(void *)a4) >> 5);
    return (vector<quasar::Token, std::allocator<quasar::Token>> *)std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(retstr, v21, v22, v23);
  }
  return result;
}

- (void)appendNbestListWithEmojiAlternativesForFormattedTokens:(const void *)a3 formattedTokensWithoutEmojiModifier:(const void *)a4 formattedNBestList:(void *)a5 formattedNBestListWithoutEmojiModifier:(void *)a6 emojiTokenIndices:(const void *)a7 recognizeEmoji:(BOOL)a8
{
  v65[1] = *MEMORY[0x1E4F143B8];
  if (a8)
  {
    id v8 = self;
    if (self->_emojiFormatter)
    {
      uint64_t v9 = *(int **)a7;
      uint64_t v50 = (int *)*((void *)a7 + 1);
      if (*(int **)a7 != v50)
      {
        do
        {
          if (+[_EARFeatureFlags isEmojiV2Enabled])
          {
            uint64_t v15 = (const std::string *)*((void *)v9 + 1);
            unint64_t v14 = (const std::string *)*((void *)v9 + 2);
            while (v15 != v14)
            {
              memset(&v63, 0, sizeof(v63));
              std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v63, *(void *)a3, *((void *)a3 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5));
              memset(v62, 0, sizeof(v62));
              std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v62, *(void *)a4, *((void *)a4 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5));
              std::string::operator=((std::string *)(v63.__r_.__value_.__r.__words[0] + 224 * *v9), v15);
              std::string::operator=((std::string *)&v62[0][28 * *v9], v15);
              unint64_t v16 = *((void *)a5 + 1);
              if (v16 >= *((void *)a5 + 2))
              {
                uint64_t v17 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)a5, (uint64_t *)&v63);
              }
              else
              {
                std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)a5, (uint64_t *)&v63);
                uint64_t v17 = v16 + 24;
              }
              *((void *)a5 + 1) = v17;
              unint64_t v18 = *((void *)a6 + 1);
              if (v18 >= *((void *)a6 + 2))
              {
                uint64_t v19 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)a6, (uint64_t *)v62);
              }
              else
              {
                std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)a6, (uint64_t *)v62);
                uint64_t v19 = v18 + 24;
              }
              *((void *)a6 + 1) = v19;
              __p = v62;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
              v62[0] = (void **)&v63;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v62);
              ++v15;
            }
          }
          else
          {
            uint64_t v20 = *(void *)a3 + 224 * *v9;
            if (*(char *)(v20 + 199) < 0)
            {
              std::string::__init_copy_ctor_external(&v63, *(const std::string::value_type **)(v20 + 176), *(void *)(v20 + 184));
            }
            else
            {
              long long v21 = *(_OWORD *)(v20 + 176);
              v63.__r_.__value_.__r.__words[2] = *(void *)(v20 + 192);
              *(_OWORD *)&v63.__r_.__value_.__l.__data_ = v21;
            }
            value = v8->_itn.__ptr_.__value_;
            unint64_t v23 = objc_opt_class();
            if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              long long v24 = &v63;
            }
            else {
              long long v24 = (std::string *)v63.__r_.__value_.__r.__words[0];
            }
            if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(v63.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = v63.__r_.__value_.__l.__size_;
            }
            v26 = objc_msgSend(NSString, "ear_stringWithStringView:", v24, size);
            v65[0] = v26;
            long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
            if (v23)
            {
              [v23 convertStringsToQuasarTokens:v27 offset:0];
            }
            else
            {
              __p = 0;
              uint64_t v60 = 0;
              uint64_t v61 = 0;
            }
            (*(void (**)(void ***__return_ptr, SpeechITN *, void **))(*(void *)value + 32))(v62, value, &__p);
            v54[0] = &__p;
            std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v54);

            emojiFormatter = v8->_emojiFormatter;
            v29 = NSString;
            [(_EARFormatter *)v8 getOrthography:v62];
            if (v61 >= 0) {
              p_p = &__p;
            }
            else {
              p_p = __p;
            }
            if (v61 >= 0) {
              uint64_t v31 = HIBYTE(v61);
            }
            else {
              uint64_t v31 = v60;
            }
            uint64_t v32 = objc_msgSend(v29, "ear_stringWithStringView:", p_p, v31);
            uint64_t v33 = *(void *)a3 + 224 * *v9;
            if (*(char *)(v33 + 23) < 0)
            {
              uint64_t v33 = *(void *)v33;
              uint64_t v34 = *(void *)(*(void *)a3 + 224 * *v9 + 8);
            }
            else
            {
              uint64_t v34 = *(unsigned __int8 *)(v33 + 23);
            }
            uint64_t v35 = objc_msgSend(NSString, "ear_stringWithStringView:", v33, v34);
            BOOL v36 = [(_EAREmojiRecognition *)emojiFormatter searchEmojiAlternativesForSpokenEmoji:v32 count:3 emojiCharacter:v35];

            if (SHIBYTE(v61) < 0) {
              operator delete(__p);
            }
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id obj = v36;
            uint64_t v37 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
            if (v37)
            {
              uint64_t v38 = *(void *)v56;
              do
              {
                for (uint64_t i = 0; i != v37; ++i)
                {
                  if (*(void *)v56 != v38) {
                    objc_enumerationMutation(obj);
                  }
                  v40 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                  __p = 0;
                  uint64_t v60 = 0;
                  uint64_t v61 = 0;
                  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&__p, *(void *)a3, *((void *)a3 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5));
                  memset(v54, 0, sizeof(v54));
                  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v54, *(void *)a4, *((void *)a4 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5));
                  if (v40)
                  {
                    objc_msgSend(v40, "ear_toString");
                  }
                  else
                  {
                    long long v52 = 0uLL;
                    std::string::size_type v53 = 0;
                  }
                  v41 = (char *)__p + 224 * *v9;
                  if (v41[23] < 0) {
                    operator delete(*(void **)v41);
                  }
                  long long v42 = v52;
                  *((void *)v41 + 2) = v53;
                  *(_OWORD *)v41 = v42;
                  if (v40)
                  {
                    objc_msgSend(v40, "ear_toString");
                  }
                  else
                  {
                    long long v52 = 0uLL;
                    std::string::size_type v53 = 0;
                  }
                  long long v43 = &v54[0][28 * *v9];
                  if (*((char *)v43 + 23) < 0) {
                    operator delete(*v43);
                  }
                  long long v44 = v52;
                  v43[2] = v53;
                  *(_OWORD *)long long v43 = v44;
                  unint64_t v45 = *((void *)a5 + 1);
                  if (v45 >= *((void *)a5 + 2))
                  {
                    uint64_t v46 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)a5, (uint64_t *)&__p);
                  }
                  else
                  {
                    std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)a5, (uint64_t *)&__p);
                    uint64_t v46 = v45 + 24;
                  }
                  *((void *)a5 + 1) = v46;
                  unint64_t v47 = *((void *)a6 + 1);
                  if (v47 >= *((void *)a6 + 2))
                  {
                    uint64_t v48 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)a6, (uint64_t *)v54);
                  }
                  else
                  {
                    std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)a6, (uint64_t *)v54);
                    uint64_t v48 = v47 + 24;
                  }
                  *((void *)a6 + 1) = v48;
                  *(void *)&long long v52 = v54;
                  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
                  v54[0] = &__p;
                  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v54);
                }
                uint64_t v37 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
              }
              while (v37);
            }

            id v8 = self;
            __p = v62;
            std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
            if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v63.__r_.__value_.__l.__data_);
            }
          }
          v9 += 8;
        }
        while (v9 != v50);
      }
    }
  }
}

- (id)formatWords:(id)a3 task:(id)a4 autoPunctuate:(BOOL)a5
{
  id v5 = [(_EARFormatter *)self formatWords:a3 task:a4 autoPunctuate:a5 recognizeEmoji:0];
  return v5;
}

- (id)formatWords:(id)a3 task:(id)a4 autoPunctuate:(BOOL)a5 recognizeEmoji:(BOOL)a6
{
  BOOL v33 = a6;
  BOOL v34 = a5;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  uint64_t v60 = 0;
  unint64_t v61 = 0;
  unint64_t v62 = 0;
  memset(v59, 0, sizeof(v59));
  memset(v58, 0, sizeof(v58));
  language = (__CFString *)self->_language;
  if (!language) {
    language = &stru_1F0A64AB0;
  }
  BOOL v36 = language;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v10)
  {
    uint64_t v38 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(obj);
        }
        unsigned int v12 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if (v12)
        {
          [v12 quasarToken];
        }
        else
        {
          memset(v53, 0, sizeof(v53));
          long long v51 = 0u;
          *(_OWORD *)__p = 0u;
          *(_OWORD *)uint64_t v50 = 0u;
          *(_OWORD *)uint64_t v48 = 0u;
          memset(v49, 0, sizeof(v49));
          memset(v47, 0, sizeof(v47));
          *(_OWORD *)uint64_t v46 = 0u;
          memset(v45, 0, sizeof(v45));
        }
        unint64_t v13 = v61;
        if (v61 >= v62)
        {
          unint64_t v61 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v60, (long long *)v45);
          if (SBYTE7(v53[0]) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v14 = *(_OWORD *)&v45[0].__r_.__value_.__l.__data_;
          *(void *)(v61 + 16) = *((void *)&v45[0].__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v13 = v14;
          memset(v45, 0, 24);
          uint64_t v15 = *(std::string::size_type *)((char *)&v45[1].__r_.__value_.__r.__words[1] + 6);
          *(_OWORD *)(v13 + 24) = *(_OWORD *)&v45[1].__r_.__value_.__l.__data_;
          *(void *)(v13 + 38) = v15;
          uint64_t v16 = *(void *)&v47[0];
          *(_OWORD *)(v13 + 48) = *(_OWORD *)v46;
          *(void *)(v13 + 64) = v16;
          *(void *)(v13 + 72) = 0;
          v46[1] = 0;
          *(void *)&v47[0] = 0;
          v46[0] = 0;
          *(void *)(v13 + 80) = 0;
          *(void *)(v13 + 88) = 0;
          *(_OWORD *)(v13 + 72) = *(_OWORD *)((char *)v47 + 8);
          *(void *)(v13 + 88) = *((void *)&v47[1] + 1);
          memset((char *)v47 + 8, 0, 24);
          long long v17 = *(_OWORD *)v48;
          *(void *)(v13 + 112) = *(void *)&v49[0];
          *(void *)(v13 + 120) = 0;
          *(_OWORD *)(v13 + 96) = v17;
          v48[1] = 0;
          *(void *)&v49[0] = 0;
          v48[0] = 0;
          *(void *)(v13 + 128) = 0;
          *(void *)(v13 + 136) = 0;
          *(_OWORD *)(v13 + 120) = *(_OWORD *)((char *)v49 + 8);
          *(void *)(v13 + 136) = *((void *)&v49[1] + 1);
          memset((char *)v49 + 8, 0, 24);
          long long v18 = *(_OWORD *)v50;
          *(void *)(v13 + 160) = v51;
          *(_OWORD *)(v13 + 144) = v18;
          v50[1] = 0;
          *(void *)&long long v51 = 0;
          v50[0] = 0;
          LODWORD(v16) = DWORD2(v51);
          *(_WORD *)(v13 + 172) = WORD6(v51);
          *(_DWORD *)(v13 + 168) = v16;
          long long v19 = *(_OWORD *)__p;
          *(void *)(v13 + 192) = *(void *)&v53[0];
          *(_OWORD *)(v13 + 176) = v19;
          __p[1] = 0;
          *(void *)&v53[0] = 0;
          __p[0] = 0;
          long long v20 = *(_OWORD *)((char *)v53 + 8);
          *(_DWORD *)(v13 + 216) = DWORD2(v53[1]);
          *(_OWORD *)(v13 + 200) = v20;
          unint64_t v61 = v13 + 224;
        }
        if (SBYTE7(v51) < 0) {
          operator delete(v50[0]);
        }
        v44[0] = (void **)v49 + 1;
        std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](v44);
        if (SBYTE7(v49[0]) < 0) {
          operator delete(v48[0]);
        }
        v44[0] = (void **)v47 + 1;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v44);
        if (SBYTE7(v47[0]) < 0) {
          operator delete(v46[0]);
        }
        if (SHIBYTE(v45[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v45[0].__r_.__value_.__l.__data_);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v10);
  }

  memset(v44, 0, sizeof(v44));
  uint64_t v22 = quasar::QsrText::SingletonInstance(v21);
  unint64_t v23 = (EARLogger *)quasar::QsrText::hatToQsrTokens(v22, &v60, (uint64_t *)v44, 0);
  if (v34) {
    unsigned __int16 v24 = -1;
  }
  else {
    unsigned __int16 v24 = -2;
  }
  memset(v43, 0, sizeof(v43));
  value = self->_itn.__ptr_.__value_;
  if (value)
  {
    if (v35) {
      objc_msgSend(v35, "ear_toString");
    }
    else {
      memset(v45, 0, 24);
    }
    [(__CFString *)v36 ear_toString];
    (*(void (**)(const quasar::Token **__return_ptr, SpeechITN *, void ***, void *, std::string *, void **, void *, void, BOOL))(*(void *)value + 16))(&v41, value, v44, v59, v45, v39, v58, v24, +[_EARFormatter useEmojiHammerWhenRecognizeEmoji:v33]);
    if (v40 < 0) {
      operator delete(v39[0]);
    }
    if (SHIBYTE(v45[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v45[0].__r_.__value_.__l.__data_);
    }
    [(_EARFormatter *)self recognizeEmojiForTokens:&v41 emojiTokenIndices:v43 persistEmoji:0 choiceIdx:0];
    id v28 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v27 = (id)[v28 initWithCapacity:0x6DB6DB6DB6DB6DB7 * ((v42 - v41) >> 5)];
    BOOL v30 = v41;
    for (j = v42; v30 != j; BOOL v30 = (const quasar::Token *)((char *)v30 + 224))
    {
      quasar::Token::Token(v45, v30);
      id v31 = [[_EARSpeechRecognitionToken alloc] _initWithQuasarToken:v45];
      [v27 addObject:v31];

      if (SBYTE7(v53[0]) < 0) {
        operator delete(__p[0]);
      }
      if (SBYTE7(v51) < 0) {
        operator delete(v50[0]);
      }
      v39[0] = (char *)v49 + 8;
      std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
      if (SBYTE7(v49[0]) < 0) {
        operator delete(v48[0]);
      }
      v39[0] = (char *)v47 + 8;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
      if (SBYTE7(v47[0]) < 0) {
        operator delete(v46[0]);
      }
      if (SHIBYTE(v45[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45[0].__r_.__value_.__l.__data_);
      }
    }
    v45[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v41;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v45);
  }
  else
  {
    v26 = EARLogger::QuasarOSLogger(v23);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[_EARFormatter formatWords:task:autoPunctuate:recognizeEmoji:](v26);
    }

    id v27 = obj;
  }
  v45[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v45);
  v45[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v45);

  v45[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v58;
  std::vector<quasar::ItnOverride>::__destroy_vector::operator()[abi:ne180100]((void ***)v45);
  v45[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v59;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v45);
  v45[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v60;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v45);

  return v27;
}

- (BOOL)refreshEmojiRecognizer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  emojiFormatter = self->_emojiFormatter;
  if (emojiFormatter
    && (emojiFormatter = (_EAREmojiRecognition *)[(_EAREmojiRecognition *)emojiFormatter isEmojiRecognitionCapable], emojiFormatter))
  {
    [(_EAREmojiRecognition *)self->_emojiFormatter resetEmojiPreferences];
    return 1;
  }
  else
  {
    id v5 = EARLogger::QuasarOSLogger((EARLogger *)emojiFormatter);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(_EARFormatter *)(uint64_t)self->_emojiFormatter refreshEmojiRecognizer];
    }

    return 0;
  }
}

- (void)initializeItnMetrics
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  recognizedEmojis = self->_recognizedEmojis;
  self->_recognizedEmojis = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v15[0] = @"itnDurationInNs";
  v6 = [NSNumber numberWithDouble:0.0];
  v16[0] = v6;
  v15[1] = @"isEmojiPersonalizationUsed";
  uint64_t v7 = [NSNumber numberWithBool:0];
  v16[1] = v7;
  v15[2] = @"isEmojiDisambiguationUsed";
  id v8 = [NSNumber numberWithBool:0];
  v16[2] = v8;
  v15[3] = @"isEmojiExpectedButNotRecognized";
  uint64_t v9 = [NSNumber numberWithBool:0];
  v16[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  uint64_t v11 = (NSMutableDictionary *)[v5 initWithDictionary:v10];
  emojiMetrics = self->_emojiMetrics;
  self->_emojiMetrics = v11;

  self->_firstCandidateItnDurationSum = 0.0;
  self->_firstCandidateItnCount = 0;
  unint64_t v13 = [MEMORY[0x1E4F1C978] array];
  firstCandidateItnIntervalInTicks = self->_firstCandidateItnIntervalInTicks;
  self->_firstCandidateItnIntervalInTicks = v13;

  [(_EAREmojiRecognition *)self->_emojiFormatter resetEmojiMetrics];
}

- (basic_string<char,)getOrthography:(std::allocator<char>> *__return_ptr)retstr
{
  quasar::TextProc::GetOrthography(v1, 0, (std::string *)retstr);
  return result;
}

+ (vector<quasar::Token,)convertStringsToQuasarTokens:(id)a2
{
  return +[_EARFormatter convertStringsToQuasarTokens:a4 offset:0];
}

+ (vector<quasar::Token,)convertStringsToQuasarTokens:(id)a2 offset:(SEL)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v8)
  {
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        unsigned int v10 = a5;
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (v11)
        {
          objc_msgSend(v11, "ear_toString");
        }
        else
        {
          long long v25 = 0uLL;
          uint64_t v26 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(v23, "");
        std::string::basic_string[abi:ne180100]<0>(v21, "");
        memset(v20, 0, sizeof(v20));
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        unsigned int v12 = a5 + 999;
        quasar::Token::Token(v27, &v25, v10, v10 + 999, 0, 1, 0, (long long *)v23, 0.0, (long long *)v21, v20, 0, (long long *)__p, 0, 0);
        if (v19 < 0) {
          operator delete(__p[0]);
        }
        __p[0] = v20;
        std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
        if (v22 < 0) {
          operator delete(v21[0]);
        }
        if (v24 < 0) {
          operator delete(v23[0]);
        }
        if (SHIBYTE(v26) < 0) {
          operator delete((void *)v25);
        }
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          long long v14 = (Token *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>((uint64_t *)retstr, (const quasar::Token *)v27);
        }
        else
        {
          quasar::Token::Token((std::string *)retstr->__end_, (const quasar::Token *)v27);
          long long v14 = (Token *)((char *)end + 224);
          retstr->__end_ = (Token *)((char *)end + 224);
        }
        retstr->__end_ = v14;
        if (v37 < 0) {
          operator delete(v36);
        }
        if (v35 < 0) {
          operator delete(v34);
        }
        v23[0] = &v33;
        std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
        if (v32 < 0) {
          operator delete(v31);
        }
        v23[0] = &v30;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
        if (v29 < 0) {
          operator delete(v28);
        }
        if (SHIBYTE(v27[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v27[0].__r_.__value_.__l.__data_);
        }
        a5 = v12 + 1;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      a5 = v10 + 1000;
    }
    while (v8);
  }

  return result;
}

- (id)formattedStringWithStrings:(id)a3
{
  id v3 = [(_EARFormatter *)self formattedStringWithStrings:a3 task:&stru_1F0A64AB0];
  return v3;
}

- (id)formattedStringWithStrings:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  if (v8) {
    [v8 convertStringsToQuasarTokens:v6];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  memset(v15, 0, sizeof(v15));
  [(_EARFormatter *)self formatWords:v16 unrepairedWordsOut:v15 task:v7];
  [(_EARFormatter *)self getOrthography:v14];
  if (v13 >= 0) {
    uint64_t v9 = __p;
  }
  else {
    uint64_t v9 = (void **)__p[0];
  }
  unsigned int v10 = [NSString stringWithUTF8String:v9];
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  __p[0] = v14;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v14[0] = (void **)v15;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v14);
  v15[0] = (void **)v16;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v15);

  return v10;
}

- (id)formattedStringWithStrings:(id)a3 preToPostItnArray:(id)a4
{
  id v4 = [(_EARFormatter *)self formattedStringWithStrings:a3 preToPostItnArray:a4 task:&stru_1F0A64AB0];
  return v4;
}

- (id)formattedStringWithStrings:(id)a3 preToPostItnArray:(id)a4 task:(id)a5
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v23 = v9;
  unsigned int v10 = objc_opt_class();
  if (v10) {
    [v10 convertStringsToQuasarTokens:v24];
  }
  else {
    memset(&v32, 0, sizeof(v32));
  }
  memset(v31, 0, sizeof(v31));
  [(_EARFormatter *)self formatWords:&v32 unrepairedWordsOut:v31 task:v9];
  long long v25 = 0;
  uint64_t v26 = 0;
  quasar::getPreItnTokenToPostItnCharAlignment(&v32, &v30, &v25, (uint64_t *)&__p);
  char v22 = self;
  unsigned int v12 = (unsigned int *)__p;
  uint64_t v11 = v28;
  id v28 = 0;
  uint64_t v29 = 0;
  __p = 0;
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  if (v12 != v11)
  {
    char v13 = v12;
    do
    {
      long long v14 = objc_msgSend(NSNumber, "numberWithInt:", *v13, v22);
      v33[0] = v14;
      uint64_t v15 = [NSNumber numberWithInt:v13[1]];
      v33[1] = v15;
      uint64_t v16 = [NSNumber numberWithInt:v13[2]];
      v33[2] = v16;
      uint64_t v17 = [NSNumber numberWithInt:v13[3]];
      v33[3] = v17;
      long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];

      [v8 addObject:v18];
      v13 += 4;
    }
    while (v13 != v11);
  }
  -[_EARFormatter getOrthography:](v22, "getOrthography:", &v30, v22);
  if (v29 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  long long v20 = [NSString stringWithUTF8String:p_p];
  if (SHIBYTE(v29) < 0) {
    operator delete(__p);
  }
  if (v12) {
    operator delete(v12);
  }
  __p = &v30;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v30.__r_.__value_.__r.__words[0] = (std::string::size_type)v31;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  v31[0] = (void **)&v32;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v31);

  return v20;
}

- (id)formattedRecognitionWithNBestList:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  memset(v50, 0, sizeof(v50));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v3)
  {
    uint64_t v23 = *(void *)v47;
    do
    {
      uint64_t v4 = 0;
      uint64_t v25 = v3;
      do
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v46 + 1) + 8 * v4);
        uint64_t v43 = 0;
        unint64_t v44 = 0;
        unint64_t v45 = 0;
        memset(v42, 0, sizeof(v42));
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v27 = v5;
        uint64_t v6 = [v27 countByEnumeratingWithState:&v38 objects:v52 count:16];
        uint64_t v26 = v4;
        if (v6)
        {
          uint64_t v7 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v39 != v7) {
                objc_enumerationMutation(v27);
              }
              id v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              if (v9)
              {
                [v9 quasarToken];
              }
              else
              {
                memset(v37, 0, sizeof(v37));
                long long v35 = 0u;
                *(_OWORD *)__p = 0u;
                *(_OWORD *)BOOL v34 = 0u;
                *(_OWORD *)std::string v32 = 0u;
                memset(v33, 0, sizeof(v33));
                memset(v31, 0, sizeof(v31));
                *(_OWORD *)std::string v30 = 0u;
                *(_OWORD *)id v28 = 0u;
                memset(v29, 0, sizeof(v29));
              }
              unint64_t v10 = v44;
              if (v44 >= v45)
              {
                unint64_t v44 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v43, (long long *)v28);
                if (SBYTE7(v37[0]) < 0) {
                  operator delete(__p[0]);
                }
              }
              else
              {
                long long v11 = *(_OWORD *)v28;
                *(void *)(v44 + 16) = *(void *)&v29[0];
                *(_OWORD *)unint64_t v10 = v11;
                v28[1] = 0;
                *(void *)&v29[0] = 0;
                v28[0] = 0;
                uint64_t v12 = *(void *)((char *)&v29[1] + 6);
                *(_OWORD *)(v10 + 24) = *(_OWORD *)((char *)v29 + 8);
                *(void *)(v10 + 38) = v12;
                uint64_t v13 = *(void *)&v31[0];
                *(_OWORD *)(v10 + 48) = *(_OWORD *)v30;
                *(void *)(v10 + 64) = v13;
                *(void *)(v10 + 72) = 0;
                v30[1] = 0;
                *(void *)&v31[0] = 0;
                v30[0] = 0;
                *(void *)(v10 + 80) = 0;
                *(void *)(v10 + 88) = 0;
                *(_OWORD *)(v10 + 72) = *(_OWORD *)((char *)v31 + 8);
                *(void *)(v10 + 88) = *((void *)&v31[1] + 1);
                memset((char *)v31 + 8, 0, 24);
                long long v14 = *(_OWORD *)v32;
                *(void *)(v10 + 112) = *(void *)&v33[0];
                *(void *)(v10 + 120) = 0;
                *(_OWORD *)(v10 + 96) = v14;
                v32[1] = 0;
                *(void *)&v33[0] = 0;
                v32[0] = 0;
                *(void *)(v10 + 128) = 0;
                *(void *)(v10 + 136) = 0;
                *(_OWORD *)(v10 + 120) = *(_OWORD *)((char *)v33 + 8);
                *(void *)(v10 + 136) = *((void *)&v33[1] + 1);
                memset((char *)v33 + 8, 0, 24);
                long long v15 = *(_OWORD *)v34;
                *(void *)(v10 + 160) = v35;
                *(_OWORD *)(v10 + 144) = v15;
                v34[1] = 0;
                *(void *)&long long v35 = 0;
                v34[0] = 0;
                LODWORD(v13) = DWORD2(v35);
                *(_WORD *)(v10 + 172) = WORD6(v35);
                *(_DWORD *)(v10 + 168) = v13;
                long long v16 = *(_OWORD *)__p;
                *(void *)(v10 + 192) = *(void *)&v37[0];
                *(_OWORD *)(v10 + 176) = v16;
                __p[1] = 0;
                *(void *)&v37[0] = 0;
                __p[0] = 0;
                long long v17 = *(_OWORD *)((char *)v37 + 8);
                *(_DWORD *)(v10 + 216) = DWORD2(v37[1]);
                *(_OWORD *)(v10 + 200) = v17;
                unint64_t v44 = v10 + 224;
              }
              if (SBYTE7(v35) < 0) {
                operator delete(v34[0]);
              }
              long long v51 = (void **)v33 + 1;
              std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v51);
              if (SBYTE7(v33[0]) < 0) {
                operator delete(v32[0]);
              }
              long long v51 = (void **)v31 + 1;
              std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v51);
              if (SBYTE7(v31[0]) < 0) {
                operator delete(v30[0]);
              }
              if (SBYTE7(v29[0]) < 0) {
                operator delete(v28[0]);
              }
            }
            uint64_t v6 = [v27 countByEnumeratingWithState:&v38 objects:v52 count:16];
          }
          while (v6);
        }

        [(_EARFormatter *)self formatWords:&v43 unrepairedWordsOut:v42];
        std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100](v50, (uint64_t)v28);
        long long v51 = v28;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v51);
        v28[0] = v42;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);
        v28[0] = &v43;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);
        uint64_t v4 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v3 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v3);
  }

  long long v18 = [_EARSpeechRecognition alloc];
  char v19 = [MEMORY[0x1E4F1CAD0] set];
  id v20 = [(_EARSpeechRecognition *)v18 _initWithNBestList:v50 useHatText:0 endsOfSentencePunctuations:v19];

  v28[0] = v50;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);

  return v20;
}

- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5
{
  id v5 = [(_EARFormatter *)self _formattedStringWithStrings:a3 task:a4 leftContext:a5 recognizeEmoji:0];
  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v6 = &stru_1F0A64AB0;
  }

  return v6;
}

- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5 recognizeEmoji:(BOOL)a6
{
  uint64_t v6 = [(_EARFormatter *)self _formattedStringWithStrings:a3 task:a4 leftContext:a5 recognizeEmoji:a6 rightContext:0];
  return v6;
}

- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5 recognizeEmoji:(BOOL)a6 rightContext:(id)a7
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  long long v16 = objc_opt_class();
  if (v16)
  {
    [v16 convertStringsToQuasarTokens:v14];
    if (v51 == v52) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = (*(_DWORD *)(v52 - 192) + 3000);
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
  }
  long long v18 = objc_opt_class();
  if (v18) {
    [v18 convertStringsToQuasarTokens:v15];
  }
  else {
    memset(v50, 0, sizeof(v50));
  }
  char v19 = objc_opt_class();
  if (v19) {
    [v19 convertStringsToQuasarTokens:v12 offset:v17];
  }
  else {
    memset(v49, 0, sizeof(v49));
  }
  memset(v48, 0, sizeof(v48));
  memset(v47, 0, sizeof(v47));
  memset(v46, 0, sizeof(v46));
  memset(v45, 0, sizeof(v45));
  memset(v44, 0, sizeof(v44));
  memset(v43, 0, sizeof(v43));
  uint64_t v39 = 0;
  long long v40 = 0;
  v37[0] = 0;
  v37[1] = 0;
  uint64_t v38 = 0;
  uint64_t v35 = 0;
  BOOL v36 = 0;
  LOBYTE(v32) = 0;
  LOWORD(v31) = 0;
  BYTE3(v30) = [v14 count] != 0;
  BYTE2(v30) = a6;
  LOWORD(v30) = -1;
  BYTE4(v29) = 0;
  LODWORD(v29) = 0;
  -[_EARFormatter formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:](self, "formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:", v49, v48, v13, @"en-US", &v51, 0, v46, v29, &v39, v37, v45, v44, v30, v50,
    v43,
    v31,
    &v35,
    v32,
    0);
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  __p[0] = v37;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  [(_EARFormatter *)self getOrthography:&v41];
  id v20 = v42;
  if (v41 != v42)
  {
    long long v21 = v41 + 22;
    while (*((char *)v21 + 23) < 0)
    {
      if (v21[1]) {
        goto LABEL_22;
      }
LABEL_23:
      char v22 = v21 + 6;
      v21 += 28;
      if (v22 == v20) {
        goto LABEL_24;
      }
    }
    if (!*((unsigned char *)v21 + 23)) {
      goto LABEL_23;
    }
LABEL_22:
    std::string::operator=((std::string *)(v21 - 22), (const std::string *)v21);
    goto LABEL_23;
  }
LABEL_24:
  [(_EARFormatter *)self getOrthography:&v41];
  if (v38 >= 0) {
    uint64_t v23 = v37;
  }
  else {
    uint64_t v23 = (void **)v37[0];
  }
  id v24 = [NSString stringWithUTF8String:v23];
  v54[0] = v24;
  if (v34 >= 0) {
    uint64_t v25 = __p;
  }
  else {
    uint64_t v25 = (void **)__p[0];
  }
  uint64_t v26 = [NSString stringWithUTF8String:v25];
  v54[1] = v26;
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];

  if (v34 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v38) < 0) {
    operator delete(v37[0]);
  }
  v37[0] = &v41;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v37);
  long long v41 = (void **)v43;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100](&v41);
  v43[0] = (void **)v44;
  std::vector<quasar::ItnOverride>::__destroy_vector::operator()[abi:ne180100](v43);
  v44[0] = (void **)v45;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v44);
  v45[0] = (void **)v46;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v45);
  v46[0] = (void **)v47;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v46);
  v47[0] = (void **)v48;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v47);
  v48[0] = (void **)v49;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v48);
  v49[0] = (void **)v50;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v49);
  v50[0] = (void **)&v51;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v50);

  return v27;
}

- (id)_formattedStringWithoutEmojiModifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v25 = self;
  if (v5)
  {
    [v5 convertStringsToQuasarTokens:v4 offset:0];
    uint64_t v6 = v35;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    unint64_t v34 = 0;
    if (v36 != v35)
    {
      uint64_t v7 = 0;
      unsigned int v8 = 1;
      do
      {
        id v9 = (uint64_t *)(v6 + 224 * v7);
        if (*((char *)v9 + 23) < 0) {
          id v9 = (uint64_t *)*v9;
        }
        unint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", v9, v25);
        if ([v10 _isSingleEmoji])
        {
          unsigned int v27 = v8 - 1;
          memset(v26, 0, sizeof(v26));
          LODWORD(__p) = v8 - 1;
          uint64_t v31 = 0;
          long long v30 = 0uLL;
          memset(v28, 0, sizeof(v28));
          long long v11 = v33;
          if ((unint64_t)v33 >= v34)
          {
            uint64_t v13 = ((uint64_t)v33 - v32) >> 5;
            unint64_t v14 = v13 + 1;
            if ((unint64_t)(v13 + 1) >> 59) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v15 = v34 - v32;
            if ((uint64_t)(v34 - v32) >> 4 > v14) {
              unint64_t v14 = v15 >> 4;
            }
            if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v16 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v16 = v14;
            }
            v38[4] = &v34;
            uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<quasar::TextTokenizer::Token>>((uint64_t)&v34, v16);
            long long v18 = &v17[32 * v13];
            v38[0] = v17;
            v38[1] = v18;
            v38[3] = &v17[32 * v19];
            *(_DWORD *)long long v18 = __p;
            *((void *)v18 + 2) = 0;
            *((void *)v18 + 3) = 0;
            *((void *)v18 + 1) = 0;
            *(_OWORD *)(v18 + 8) = v30;
            *((void *)v18 + 3) = v31;
            long long v30 = 0uLL;
            uint64_t v31 = 0;
            v38[2] = v18 + 32;
            std::vector<std::pair<int,std::vector<std::string>>>::__swap_out_circular_buffer(&v32, v38);
            id v12 = v33;
            std::__split_buffer<std::pair<int,std::vector<std::string>>>::~__split_buffer(v38);
          }
          else
          {
            *uint64_t v33 = v8 - 1;
            v11[2] = 0;
            v11[3] = 0;
            v11[1] = 0;
            *(_OWORD *)(v11 + 1) = v30;
            v11[3] = v31;
            long long v30 = 0uLL;
            uint64_t v31 = 0;
            id v12 = v11 + 4;
          }
          uint64_t v33 = v12;
          v38[0] = &v30;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
          v38[0] = v28;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
          v38[0] = v26;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
        }

        uint64_t v7 = v8;
        uint64_t v6 = v35;
      }
      while (0x6DB6DB6DB6DB6DB7 * ((v36 - v35) >> 5) > (unint64_t)v8++);
    }
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    unint64_t v34 = 0;
  }
  long long v21 = v25;
  -[_EARFormatter formattedTokensWithoutEmojiModifier:emojiTokenIndices:recognizeEmoji:](v25, "formattedTokensWithoutEmojiModifier:emojiTokenIndices:recognizeEmoji:", &v35, &v32, 1, v25);
  [(_EARFormatter *)v21 getOrthography:v38];
  if (v30 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  uint64_t v23 = [NSString stringWithUTF8String:p_p];
  if (SHIBYTE(v30) < 0) {
    operator delete(__p);
  }
  __p = v38;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v38[0] = &v32;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
  v38[0] = &v35;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);

  return v23;
}

- (id)emojiPhraseRemoveKeyword:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  value = self->_itn.__ptr_.__value_;
  uint64_t v6 = objc_opt_class();
  v16[0] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  if (v6)
  {
    [v6 convertStringsToQuasarTokens:v7 offset:0];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v13 = 0;
  }
  (*(void (**)(void *__return_ptr, SpeechITN *, void **))(*(void *)value + 32))(v14, value, __p);
  uint64_t v15 = __p;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v15);

  unsigned int v8 = NSString;
  [(_EARFormatter *)self getOrthography:v14];
  if (v13 >= 0) {
    id v9 = __p;
  }
  else {
    id v9 = (void **)__p[0];
  }
  unint64_t v10 = [v8 stringWithUTF8String:v9];
  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }
  __p[0] = v14;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v10;
}

- (id)emojiAlternativesForFormattedTokens:(id)a3 stringsWithoutEmojiModifier:(id)a4 alternateNameForTokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v45 = a5;
  unint64_t v10 = objc_opt_class();
  id v43 = v9;
  unint64_t v44 = v8;
  if (v10)
  {
    [v10 convertStringsToQuasarTokens:v8 offset:0];
    uint64_t v11 = v58;
    uint64_t v55 = 0;
    long long v56 = 0;
    unint64_t v57 = 0;
    if (v59 != v58)
    {
      uint64_t v12 = 0;
      unsigned int v13 = 1;
      do
      {
        unint64_t v14 = (uint64_t *)(v11 + 224 * v12);
        if (*((char *)v14 + 23) < 0) {
          unint64_t v14 = (uint64_t *)*v14;
        }
        uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", v14, v43);
        if ([v15 _isSingleEmoji])
        {
          LODWORD(v48) = v13 - 1;
          __p[1] = 0;
          uint64_t v47 = 0;
          __p[0] = 0;
          LODWORD(v52) = v13 - 1;
          uint64_t v54 = 0;
          long long v53 = 0uLL;
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          long long v49 = 0;
          unint64_t v16 = v56;
          if ((unint64_t)v56 >= v57)
          {
            uint64_t v18 = ((uint64_t)v56 - v55) >> 5;
            unint64_t v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 59) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v20 = v57 - v55;
            if ((uint64_t)(v57 - v55) >> 4 > v19) {
              unint64_t v19 = v20 >> 4;
            }
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v21 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v19;
            }
            uint64_t v64 = &v57;
            char v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<quasar::TextTokenizer::Token>>((uint64_t)&v57, v21);
            uint64_t v23 = &v22[32 * v18];
            *(void *)&long long v61 = v22;
            *((void *)&v61 + 1) = v23;
            std::string v63 = &v22[32 * v24];
            *(_DWORD *)uint64_t v23 = v52;
            *((void *)v23 + 2) = 0;
            *((void *)v23 + 3) = 0;
            *((void *)v23 + 1) = 0;
            *(_OWORD *)(v23 + 8) = v53;
            *((void *)v23 + 3) = v54;
            long long v53 = 0uLL;
            uint64_t v54 = 0;
            unint64_t v62 = v23 + 32;
            std::vector<std::pair<int,std::vector<std::string>>>::__swap_out_circular_buffer(&v55, &v61);
            uint64_t v17 = v56;
            std::__split_buffer<std::pair<int,std::vector<std::string>>>::~__split_buffer((void **)&v61);
          }
          else
          {
            _DWORD *v56 = v13 - 1;
            void v16[2] = 0;
            void v16[3] = 0;
            v16[1] = 0;
            *(_OWORD *)(v16 + 1) = v53;
            void v16[3] = v54;
            long long v53 = 0uLL;
            uint64_t v54 = 0;
            uint64_t v17 = v16 + 4;
          }
          long long v56 = v17;
          *(void *)&long long v61 = &v53;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
          *(void *)&long long v61 = &v49;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
          *(void *)&long long v61 = __p;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
        }
        uint64_t v25 = [v45 objectAtIndexedSubscript:v12];
        uint64_t v26 = v25;
        if (v25)
        {
          objc_msgSend(v25, "ear_toString");
        }
        else
        {
          long long v61 = 0uLL;
          unint64_t v62 = 0;
        }
        uint64_t v27 = v11 + 224 * v12;
        uint64_t v28 = v27 + 176;
        if (*(char *)(v27 + 199) < 0) {
          operator delete(*(void **)v28);
        }
        long long v29 = v61;
        *(void *)(v28 + 16) = v62;
        *(_OWORD *)uint64_t v28 = v29;
        HIBYTE(v62) = 0;
        LOBYTE(v61) = 0;

        uint64_t v12 = v13;
        uint64_t v11 = v58;
      }
      while (0x6DB6DB6DB6DB6DB7 * ((v59 - v58) >> 5) > (unint64_t)v13++);
    }
  }
  else
  {
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v55 = 0;
    long long v56 = 0;
    unint64_t v57 = 0;
  }
  uint64_t v31 = v43;
  uint64_t v32 = objc_opt_class();
  if (v32)
  {
    [v32 convertStringsToQuasarTokens:v43 offset:0];
  }
  else
  {
    long long v61 = 0uLL;
    unint64_t v62 = 0;
  }
  uint64_t v52 = 0;
  long long v53 = 0uLL;
  long long v48 = 0;
  long long v49 = 0;
  uint64_t v50 = 0;
  -[_EARFormatter appendNbestListWithEmojiAlternativesForFormattedTokens:formattedTokensWithoutEmojiModifier:formattedNBestList:formattedNBestListWithoutEmojiModifier:emojiTokenIndices:recognizeEmoji:](self, "appendNbestListWithEmojiAlternativesForFormattedTokens:formattedTokensWithoutEmojiModifier:formattedNBestList:formattedNBestListWithoutEmojiModifier:emojiTokenIndices:recognizeEmoji:", &v58, &v61, &v52, &v48, &v55, 1, v43);
  uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v35 = v52;
  for (uint64_t i = (void **)v53; v35 != i; v35 += 3)
  {
    [(_EARFormatter *)self getOrthography:v35];
    if (v47 >= 0) {
      uint64_t v36 = __p;
    }
    else {
      uint64_t v36 = (void **)__p[0];
    }
    uint64_t v37 = [NSString stringWithUTF8String:v36];
    [v33 addObject:v37];

    if (SHIBYTE(v47) < 0) {
      operator delete(__p[0]);
    }
  }
  uint64_t v39 = (void **)v48;
  uint64_t v38 = (void **)v49;
  if (v48 != v49)
  {
    do
    {
      [(_EARFormatter *)self getOrthography:v39];
      if (v47 >= 0) {
        long long v40 = __p;
      }
      else {
        long long v40 = (void **)__p[0];
      }
      long long v41 = [NSString stringWithUTF8String:v40];
      [v33 addObject:v41];

      if (SHIBYTE(v47) < 0) {
        operator delete(__p[0]);
      }
      v39 += 3;
    }
    while (v39 != v38);
  }
  __p[0] = &v48;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  long long v48 = &v52;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  uint64_t v52 = (void **)&v61;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v52);
  *(void *)&long long v61 = &v55;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
  *(void *)&long long v61 = &v58;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);

  return v33;
}

- (id)recognizeEmojiInString:(id)a3 alternativesOut:(id)a4
{
  id v4 = [(_EARFormatter *)self _recognizeEmojiInString:a3 alternativesOut:a4 persistEmoji:0];
  return v4;
}

- (id)_recognizeEmojiInString:(id)a3 alternativesOut:(id)a4 persistEmoji:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = objc_opt_class();
  if (v10)
  {
    [v10 convertStringsToQuasarTokens:v8 offset:0];
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
  }
  unint64_t v21 = 0;
  char v22 = 0;
  uint64_t v23 = 0;
  [(_EARFormatter *)self recognizeEmojiForTokens:&v24 emojiTokenIndices:&v21 persistEmoji:v5 choiceIdx:0];
  uint64_t v11 = v21;
  if (v22 != v21)
  {
    unint64_t v12 = 0;
    uint64_t v13 = 1;
    do
    {
      unint64_t v14 = EARHelpers::VectorToArray<std::string>((long long **)&v11[v13]);
      [v9 addObject:v14];

      ++v12;
      uint64_t v11 = v21;
      v13 += 4;
    }
    while (v12 < ((char *)v22 - (char *)v21) >> 5);
  }
  uint64_t v15 = NSString;
  memset(&v19, 0, sizeof(v19));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v19, v24, v25, 0x6DB6DB6DB6DB6DB7 * ((v25 - v24) >> 5));
  EARHelpers::QuasarTokensToStdString(&v19, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v17 = [v15 stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  uint64_t v27 = &v19;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v21;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  unint64_t v21 = (void **)&v24;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v21);

  return v17;
}

- (id)_earEmojiRecognition
{
  return self->_emojiFormatter;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_emojiMetrics, 0);
  objc_storeStrong((id *)&self->_recognizedEmojis, 0);
  objc_storeStrong((id *)&self->_firstCandidateItnIntervalInTicks, 0);
  objc_storeStrong((id *)&self->_emojiFormatter, 0);
  value = self->_itn.__ptr_.__value_;
  self->_itn.__ptr_.__value_ = 0;
  if (value)
  {
    id v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:
{
}

- (__n128)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:
{
  *(void *)a2 = &unk_1F0A5A808;
  __n128 result = *(__n128 *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 24);
  long long v4 = *(_OWORD *)(a1 + 40);
  *(void *)(a2 + 56) = *(void *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)initWithLanguage:withSdapiConfig:quasarConfig:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1B1A86000, v1, v2, "_EARFormatter initialization failed: %s", v3, v4, v5, v6, v7);
}

- (void)initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1B1A86000, v1, v2, "_EARFormatter initialization failed on trying createQuasarITN: %s", v3, v4, v5, v6, v7);
}

- (void)initWithQuasarConfig:(os_log_t)log overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Quasar Itn missing in configuration", v1, 2u);
}

- (void)initNcsWithModelRoot:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1B1A86000, v1, v2, "_EARFormatter initialization failed on trying createSdapiITN: %s", v3, v4, v5, v6, v7);
}

- (void)recognizeEmojiForTokens:(os_log_t)log emojiTokenIndices:persistEmoji:choiceIdx:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B1A86000, log, OS_LOG_TYPE_DEBUG, "Emoji Input is empty", v1, 2u);
}

- (void)recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1B1A86000, v0, OS_LOG_TYPE_DEBUG, "Emoji Input: %@", v1, 0xCu);
}

- (void)formatWords:(os_log_t)log task:autoPunctuate:recognizeEmoji:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Quasar Itn is nil", v1, 2u);
}

- (void)refreshEmojiRecognizer
{
  *(_DWORD *)std::string buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2 & 1;
  _os_log_debug_impl(&dword_1B1A86000, log, OS_LOG_TYPE_DEBUG, "Emoji service is not available; Emoji Recognition is turned off %@ %d",
    buf,
    0x12u);
}

@end