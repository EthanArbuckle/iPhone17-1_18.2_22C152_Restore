@interface CDMDateTimeProtoSpanMatcher
+ (id)buildMatchingSpan:(id)a3 tokenChain:(id)a4;
+ (id)getCDMServiceAssetConfig;
- (CDMDateTimeProtoSpanMatcher)initWithDataDetectorPath:(id)a3 locale:(id)a4;
- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4;
@end

@implementation CDMDateTimeProtoSpanMatcher

- (void).cxx_destruct
{
}

- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v31 = a3;
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v6 = (id)CDMLogContext;
  v7 = v6;
  unint64_t v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543362;
    v38 = v10;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SpanMatcher", "%{public}@", buf, 0xCu);
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = [v31 string];

  if (v12)
  {
    unint64_t v29 = v5 - 1;
    os_signpost_id_t v30 = v5;
    upDataDetectors = self->_upDataDetectors;
    v14 = [v31 string];
    v15 = [(UPDataDetectors *)upDataDetectors matchSpansForUtterance:v14];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v22 = +[CDMDateTimeProtoSpanMatcher buildMatchingSpan:v21 tokenChain:v31];
          v23 = (void *)MEMORY[0x263F71F50];
          v24 = [v21 usoGraph];
          v25 = [v23 convertFromUsoGraph:v24];

          [v22 setUsoGraph:v25];
          [v11 addObject:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v18);
    }

    unint64_t v8 = v29;
    os_signpost_id_t v5 = v30;
  }
  v26 = (id)CDMLogContext;
  v27 = v26;
  if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v27, OS_SIGNPOST_INTERVAL_END, v5, "SpanMatcher", "", buf, 2u);
  }

  return v11;
}

- (CDMDateTimeProtoSpanMatcher)initWithDataDetectorPath:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMDateTimeProtoSpanMatcher;
  unint64_t v8 = [(CDMDateTimeProtoSpanMatcher *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F71FF8]) initLoadFromDataDetectorsDirectoryPath:v6 forLocale:v7];
    upDataDetectors = v8->_upDataDetectors;
    v8->_upDataDetectors = (UPDataDetectors *)v9;
  }
  return v8;
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  id v6 = @"data_detectors";
  id v7 = @"com.apple.siri.nl.data_detectors";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  return v2;
}

+ (id)buildMatchingSpan:(id)a3 tokenChain:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 tokens];
  int v8 = [v7 count];

  uint64_t v9 = [v6 tokens];
  uint64_t v10 = [v9 count];

  id v11 = [v6 tokens];
  objc_super v12 = [v11 lastObject];
  v13 = [v12 value];

  unint64_t v14 = [v5 range];
  v15 = [v6 string];
  if (v14 >= [v15 length])
  {
  }
  else
  {
    uint64_t v16 = [v5 range];
    [v5 range];
    unint64_t v18 = v16 + v17 - 1;
    uint64_t v19 = [v6 string];
    unint64_t v20 = [v19 length];

    if (v18 < v20)
    {
      uint64_t v21 = objc_msgSend(v6, "tokenIndexFromCharacterIndex:", objc_msgSend(v5, "range"));
      uint64_t v22 = [v5 range];
      [v5 range];
      uint64_t v10 = [v6 tokenIndexFromCharacterIndex:v22 + v23 - 1] + 1;
      v24 = [v6 string];
      uint64_t v25 = [v5 range];
      uint64_t v27 = objc_msgSend(v24, "substringWithRange:", v25, v26);

      v13 = (void *)v27;
      goto LABEL_8;
    }
  }
  v28 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    int v35 = [v5 range];
    int v36 = [v5 range];
    [v5 range];
    int v38 = v37 + v36;
    uint64_t v39 = [v6 string];
    *(_DWORD *)buf = 136315906;
    v42 = "+[CDMDateTimeProtoSpanMatcher buildMatchingSpan:tokenChain:]";
    __int16 v43 = 1024;
    int v44 = v35;
    __int16 v45 = 1024;
    int v46 = v38;
    __int16 v47 = 1024;
    int v48 = [v39 length];
    _os_log_debug_impl(&dword_2263A0000, v28, OS_LOG_TYPE_DEBUG, "%s Forced DateTime span match to align with final token due to invalid DD match range start=<%u>, end=<%u> (exclusive), tokenChain string length=<%u>", buf, 0x1Eu);
  }
  uint64_t v21 = (v8 - 1);
LABEL_8:
  unint64_t v29 = [v5 category];
  uint64_t v30 = [v5 range];
  int v31 = [v5 range];
  [v5 range];
  LODWORD(v40) = 0;
  long long v33 = +[CDMProtoSpanMatcherHelper buildMatchingSpanProtoWithLabel:v29 inputStringForDebug:v13 startTokenIndex:v21 endTokenIndex:v10 startCharIndex:v30 endCharIndex:(v32 + v31) spanMatcherName:v40];

  return v33;
}

@end