@interface CDMSiriVocabularyProtoSpanMatcher
+ (id)convertSEMResultToNLUTypesMatchingSpan:(id)a3 tokenChain:(id)a4;
+ (id)convertSEMSpanResults:(id)a3 tokenChain:(id)a4;
+ (void)getFirstEntitySpanFromGraph:(id)a3;
- (CDMSiriVocabularyProtoSpanMatcher)initWithOverrideSpans:(id)a3;
- (CDMSiriVocabularyProtoSpanMatcher)initWithSEMSpanMatcher:(id)a3;
- (CDMSiriVocabularyProtoSpanMatcher)initWithSandboxId:(id)a3;
- (NSArray)overrideSpans;
- (NSString)userId;
- (id)callSEMSpanMatcher:(id)a3 asrHypothesis:(id)a4;
- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4;
- (id)semSandboxId;
- (id)semSpanMatcher;
- (void)dealloc;
@end

@implementation CDMSiriVocabularyProtoSpanMatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_semSpanMatcher, 0);
  objc_storeStrong((id *)&self->_overrideSpans, 0);
  objc_storeStrong((id *)&self->_semSandbox, 0);
}

- (NSString)userId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)overrideSpans
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_overrideSpans)
  {
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315138;
      v20 = "-[CDMSiriVocabularyProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s SiriVocabularyProtoSpanMatcher is returning override spans!", (uint8_t *)&v19, 0xCu);
    }

    v9 = self->_overrideSpans;
  }
  else
  {
    os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)CDMLogContext);
    v11 = (id)CDMLogContext;
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      int v19 = 138543362;
      v20 = v14;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SpanMatcher", "%{public}@", (uint8_t *)&v19, 0xCu);
    }
    v15 = [(CDMSiriVocabularyProtoSpanMatcher *)self callSEMSpanMatcher:v6 asrHypothesis:v7];
    v9 = +[CDMSiriVocabularyProtoSpanMatcher convertSEMSpanResults:v15 tokenChain:v6];
    v16 = (id)CDMLogContext;
    v17 = v16;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v17, OS_SIGNPOST_INTERVAL_END, v10, "SpanMatcher", "", (uint8_t *)&v19, 2u);
    }
  }
  return v9;
}

- (id)callSEMSpanMatcher:(id)a3 asrHypothesis:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v31 = a4;
  id v6 = (void *)MEMORY[0x263EFF960];
  v35 = v5;
  id v7 = [v5 locale];
  v32 = [v6 localeWithLocaleIdentifier:v7];

  if (+[CDMFeatureFlags isPhoneticSpanMatchingEnabled])
  {
    id v33 = v31;
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[CDMSiriVocabularyProtoSpanMatcher callSEMSpanMatcher:asrHypothesis:]";
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Creating SEMSpanMatchQueryBuilder with asrHypothesis for Phonetic Span Matching", buf, 0xCu);
    }
  }
  else
  {
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[CDMSiriVocabularyProtoSpanMatcher callSEMSpanMatcher:asrHypothesis:]";
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Creating SEMSpanMatchQueryBuilder without Phonetic Span Matching", buf, 0xCu);
    }
    id v33 = 0;
  }

  id v9 = objc_alloc(MEMORY[0x263F6D178]);
  os_signpost_id_t v10 = [v5 string];
  v37 = (void *)[v9 initWithLocale:v32 originalText:v10 asrHypothesis:v33];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v11 = [v5 tokens];
  id obj = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v16 = [v15 value];
        v17 = [v15 cleanValue];
        v18 = [v15 normalizedValues];
        uint64_t v19 = [v15 begin];
        uint64_t v20 = [v15 end];
        uint64_t v21 = [v15 isSignificant];
        LOBYTE(v30) = [v15 isWhiteSpace];
        [v37 addTokenWithValue:v16 cleanValue:v17 normalizedValues:v18 beginIndex:v19 endIndex:v20 isSignificant:v21 isWhitespace:v30];
      }
      v11 = obj;
      uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v12);
  }

  v22 = [v37 build];
  if (self->_semSandbox)
  {
    v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v29 = [(CDMSiriVocabularyProtoSpanMatcher *)self semSandboxId];
      *(_DWORD *)buf = 136315394;
      v44 = "-[CDMSiriVocabularyProtoSpanMatcher callSEMSpanMatcher:asrHypothesis:]";
      __int16 v45 = 2112;
      id v46 = v29;
      _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s SiriVocabulary matching spans with Siri Entity Matcher sandbox ID: %@", buf, 0x16u);
    }
  }
  semSpanMatcher = self->_semSpanMatcher;
  id v38 = 0;
  v25 = [(SEMSpanMatcher *)semSpanMatcher matchSpans:v22 error:&v38];
  id v26 = v38;
  if (!v25)
  {
    v27 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[CDMSiriVocabularyProtoSpanMatcher callSEMSpanMatcher:asrHypothesis:]";
      __int16 v45 = 2112;
      id v46 = v26;
      _os_log_impl(&dword_2263A0000, v27, OS_LOG_TYPE_INFO, "%s [WARN]: Nil span match results returned: %@", buf, 0x16u);
    }
  }
  return v25;
}

- (id)semSpanMatcher
{
  return self->_semSpanMatcher;
}

- (id)semSandboxId
{
  semSandbox = self->_semSandbox;
  if (semSandbox)
  {
    semSandbox = [semSandbox sandboxId];
  }
  return semSandbox;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CDMSiriVocabularyProtoSpanMatcher;
  [(CDMSiriVocabularyProtoSpanMatcher *)&v2 dealloc];
}

- (CDMSiriVocabularyProtoSpanMatcher)initWithOverrideSpans:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSiriVocabularyProtoSpanMatcher;
  id v6 = [(CDMSiriVocabularyProtoSpanMatcher *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_overrideSpans, a3);
  }

  return v7;
}

- (CDMSiriVocabularyProtoSpanMatcher)initWithSandboxId:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDMSiriVocabularyProtoSpanMatcher;
  id v5 = [(CDMSiriVocabularyProtoSpanMatcher *)&v17 init];
  if (!v5)
  {
LABEL_6:
    uint64_t v13 = v5;
    goto LABEL_10;
  }
  id v16 = 0;
  uint64_t v6 = [MEMORY[0x263F6D170] loadWithSandboxId:v4 error:&v16];
  id v7 = v16;
  semSandbox = v5->_semSandbox;
  v5->_semSandbox = (SEMSandbox *)v6;

  objc_super v9 = v5->_semSandbox;
  if (v9)
  {
    uint64_t v10 = [(SEMSandbox *)v9 indexMatcher];
    semSpanMatcher = v5->_semSpanMatcher;
    v5->_semSpanMatcher = (SEMSpanMatcher *)v10;

    uint64_t v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[CDMSiriVocabularyProtoSpanMatcher initWithSandboxId:]";
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s SiriVocabulary span matcher initialized with sandbox Id %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
  v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[CDMSiriVocabularyProtoSpanMatcher initWithSandboxId:]";
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Error when loading Siri Entity Matcher Sandbox for SiriVocabulary: %@", buf, 0x16u);
  }

  uint64_t v13 = 0;
LABEL_10:

  return v13;
}

- (CDMSiriVocabularyProtoSpanMatcher)initWithSEMSpanMatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSiriVocabularyProtoSpanMatcher;
  uint64_t v6 = [(CDMSiriVocabularyProtoSpanMatcher *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_semSpanMatcher, a3);
  }

  return v7;
}

+ (id)convertSEMSpanResults:(id)a3 tokenChain:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "+[CDMSiriVocabularyProtoSpanMatcher convertSEMSpanResults:tokenChain:]";
    __int16 v15 = 2048;
    uint64_t v16 = [v5 count];
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s SiriVocabulary matched %tu spanResults", buf, 0x16u);
  }

  for (unint64_t i = 0; [v5 count] > i; ++i)
  {
    uint64_t v10 = [v5 objectAtIndexedSubscript:i];
    v11 = +[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:v10 tokenChain:v6];

    if (v11) {
      [v7 addObject:v11];
    }
  }
  return v7;
}

+ (void)getFirstEntitySpanFromGraph:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || ![v3 getCppGraph])
  {
    objc_super v9 = 0;
    goto LABEL_17;
  }
  siri::ontology::UsoGraph::getNodes((uint64_t *)&v13, (siri::ontology::UsoGraph *)[v4 getCppGraph]);
  id v5 = v13;
  id v6 = v14;
  if (v13 == v14)
  {
    objc_super v9 = 0;
    if (v13) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v7 = (const struct __class_type_info *)MEMORY[0x263F73A10];
  while (1)
  {
    if (v8) {
      break;
    }
LABEL_9:
    if (++v5 == v6)
    {
      objc_super v9 = 0;
      goto LABEL_15;
    }
  }
  siri::ontology::UsoEntityNode::getEntitySpans((uint64_t *)&v11, v8);
  if (v12 == v11)
  {
    if (v12) {
      operator delete(v12);
    }
    goto LABEL_9;
  }
  objc_super v9 = *v11;
  uint64_t v12 = v11;
  operator delete(v11);
LABEL_15:
  id v5 = v13;
  if (v13)
  {
LABEL_16:
    v14 = v5;
    operator delete(v5);
  }
LABEL_17:

  return v9;
}

+ (id)convertSEMResultToNLUTypesMatchingSpan:(id)a3 tokenChain:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v33 = 0;
  id v7 = [v5 toOntologyGraph:&v33];
  id v8 = v33;
  if (!v7)
  {
    objc_super v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"+[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:]";
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v8;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: No ontologyGraph from spanMatchResult: %@", (uint8_t *)&buf, 0x16u);
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&v32, "");
  uint64_t v10 = +[CDMSiriVocabularyProtoSpanMatcher getFirstEntitySpanFromGraph:v7];
  if (v10)
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&buf, (long long *)(v10 + 40));
    if (v35)
    {
      std::string::operator=(&v32, &buf);
      if (v35)
      {
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
      }
    }
  }
  else
  {
    v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"+[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:]";
      _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: No valid UsoEntitySpan in SEMSpanMatchResult graph, so unable to populate span label", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v12 = [v5 spanInfo];
  uint64_t v13 = v12;
  if (!v12)
  {
    v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"+[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:]";
      _os_log_impl(&dword_2263A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: No valid SEMSpanInfo in SEMSpanMatchResult, so unable to populate SIRINLUINTERNALMatchingSpan indexes", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_27;
  }
  NSUInteger v14 = [v12 spanRange];
  NSUInteger v16 = v15;
  uint64_t v17 = [v6 string];
  if (v14 >= [v17 length])
  {

LABEL_25:
    v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v38.location = v14;
      v38.length = v16;
      v28 = NSStringFromRange(v38);
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"+[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:]";
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v28;
      _os_log_impl(&dword_2263A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: Invalid SEMSpanInfo in SEMSpanMatchResult, so unable to populate SIRINLUINTERNALMatchingSpan indexes. Given range %@", (uint8_t *)&buf, 0x16u);
    }
LABEL_27:
    v23 = 0;
    goto LABEL_28;
  }
  v18 = [v6 string];
  BOOL v19 = v16 > [v18 length] - v14;

  if (v19) {
    goto LABEL_25;
  }
  if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    __int16 v20 = &v32;
  }
  else {
    __int16 v20 = (std::string *)v32.__r_.__value_.__r.__words[0];
  }
  id v31 = [NSString stringWithUTF8String:v20];
  id v21 = [v6 string];
  uint64_t v22 = objc_msgSend(v21, "substringWithRange:", v14, v16);
  LODWORD(v30) = 2;
  v23 = +[CDMProtoSpanMatcherHelper buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:startCharIndex:endCharIndex:spanMatcherName:](CDMProtoSpanMatcherHelper, "buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:startCharIndex:endCharIndex:spanMatcherName:", v31, v22, [v6 tokenIndexFromCharacterIndex:v14], objc_msgSend(v6, "tokenIndexFromCharacterIndex:", (v14 + v16 - 1)) + 1, v14, (v14 + v16), v30);

  v24 = objc_alloc_init(MEMORY[0x263F71E30]);
  id v25 = objc_alloc_init(MEMORY[0x263F71F08]);
  [v13 matchScore];
  [v25 setMatchScore:v26];
  [v24 setSiriVocabularySpanData:v25];
  [v23 setInternalSpanData:v24];
  if (v7)
  {
    v27 = objc_msgSend(MEMORY[0x263F71F58], "convertCppGraph:", objc_msgSend(v7, "getCppGraph"));
    [v23 setUsoGraph:v27];
  }
LABEL_28:

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }

  return v23;
}

@end