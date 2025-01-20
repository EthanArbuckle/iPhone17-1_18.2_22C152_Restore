@interface CAXContextualActionsPredictor
+ (id)bigramDictKey;
+ (id)decoderFileName;
+ (id)defaultCoderUrlForName:(id)a3;
+ (id)defaultConfigFileUrl;
+ (id)defaultGlobalModelUrl;
+ (id)defaultPersonalizedModelUrl;
+ (id)encoderFileName;
+ (id)frequencyDictKey;
+ (id)ioDictKey;
+ (id)ioNoneType;
+ (id)personalizedModelFileName;
+ (id)unigramDictKey;
- (CAXContextualActionsPredictor)initWithDefaultCodersAndModelUrl:(id)a3 configUrl:(id)a4;
- (CAXContextualActionsPredictor)initWithModelUrl:(id)a3 configUrl:(id)a4;
- (CAXContextualActionsPredictor)initWithModelUrl:(id)a3 encoderUrl:(id)a4 decoderUrl:(id)a5 configUrl:(id)a6;
- (NSMutableDictionary)actionDecoder;
- (NSMutableDictionary)actionEncoder;
- (NSMutableDictionary)model;
- (NSMutableDictionary)typeDecoder;
- (NSMutableDictionary)typeEncoder;
- (NSURL)configUrl;
- (NSURL)decoderUrl;
- (NSURL)encoderUrl;
- (NSURL)modelUrl;
- (id)convertToStringEncodedActionSequence:(id)a3;
- (id)encodeActionSequence:(id)a3;
- (id)encodeContentTypes:(id)a3;
- (id)extractCAElementsByOrderingCounterDictByValue:(id)a3;
- (id)extractInputTypesAsCAXContentFromActionId:(id)a3;
- (id)getWFContentTypeStringFromContentTypeString:(id)a3;
- (id)predictNumActions:(unint64_t)a3 givenContext:(id)a4;
- (void)addEncodedActionSequence:(id)a3 toFrequencyDict:(id)a4;
- (void)addKeyString:(id)a3 andValueString:(id)a4 toCounterDict:(id)a5;
- (void)addModelResults:(id)a3 toFinalResults:(id)a4 withNumActions:(unint64_t)a5 seenSet:(id)a6;
- (void)combineDict:(id)a3 withSourceDict:(id)a4;
- (void)fillNormalizedFrequencyValuesOnPredictions:(id)a3;
- (void)loadCoderFilesToInstanceFromDefaulUrls;
- (void)loadCoderFilesToInstanceFromEncoderUrl:(id)a3 decoderUrl:(id)a4;
- (void)loadModelsFromUrl:(id)a3;
- (void)persistCoderFileChangesToEncoderUrl:(id)a3 decoderUrl:(id)a4;
- (void)saveModelToUrl:(id)a3;
- (void)setActionDecoder:(id)a3;
- (void)setActionEncoder:(id)a3;
- (void)setConfigUrl:(id)a3;
- (void)setDecoderUrl:(id)a3;
- (void)setEncoderUrl:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelUrl:(id)a3;
- (void)setTypeDecoder:(id)a3;
- (void)setTypeEncoder:(id)a3;
- (void)updateModelWithSummary:(id)a3;
@end

@implementation CAXContextualActionsPredictor

+ (id)decoderFileName
{
  return @"decoding.plist";
}

+ (id)encoderFileName
{
  return @"encoding.plist";
}

+ (id)personalizedModelFileName
{
  return @"personalizedCAModel.json";
}

+ (id)ioDictKey
{
  return @"ioDict";
}

+ (id)unigramDictKey
{
  return @"unigramDict";
}

+ (id)bigramDictKey
{
  return @"bigramDict";
}

+ (id)frequencyDictKey
{
  return @"frequencyDict";
}

+ (id)ioNoneType
{
  return @"None";
}

+ (id)defaultConfigFileUrl
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"config" withExtension:@"plist"];

  return v3;
}

+ (id)defaultGlobalModelUrl
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"globalModel" withExtension:@"json"];

  return v3;
}

+ (id)defaultPersonalizedModelUrl
{
  v2 = (void *)MEMORY[0x263F25160];
  v3 = +[CAXContextualActionsPredictor personalizedModelFileName];
  v4 = [v2 contextualActionsModelFileWithFilename:v3];

  v5 = [NSURL fileURLWithPath:v4];

  return v5;
}

+ (id)defaultCoderUrlForName:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:v4 withExtension:@"plist"];

  return v6;
}

- (CAXContextualActionsPredictor)initWithModelUrl:(id)a3 configUrl:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CAXContextualActionsPredictor;
  v9 = [(CAXContextualActionsPredictor *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelUrl, a3);
    objc_storeStrong((id *)&v10->_configUrl, a4);
    v11 = [MEMORY[0x263F08850] defaultManager];
    v12 = [v7 path];
    int v13 = [v11 fileExistsAtPath:v12];

    if (v13)
    {
      [(CAXContextualActionsPredictor *)v10 loadModelsFromUrl:v7];
    }
    else
    {
      v14 = objc_opt_new();
      [(CAXContextualActionsPredictor *)v10 setModel:v14];
    }
  }

  return v10;
}

- (CAXContextualActionsPredictor)initWithDefaultCodersAndModelUrl:(id)a3 configUrl:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAXContextualActionsPredictor;
  id v7 = [(CAXContextualActionsPredictor *)&v14 init];
  id v8 = v7;
  if (v7)
  {
    [(CAXContextualActionsPredictor *)v7 loadCoderFilesToInstanceFromDefaulUrls];
    objc_storeStrong((id *)&v8->_modelUrl, a3);
    if (v6
      && ([MEMORY[0x263F08850] defaultManager],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v6 path],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v9 fileExistsAtPath:v10],
          v10,
          v9,
          v11))
    {
      [(CAXContextualActionsPredictor *)v8 loadModelsFromUrl:v6];
    }
    else
    {
      v12 = objc_opt_new();
      [(CAXContextualActionsPredictor *)v8 setModel:v12];
    }
  }

  return v8;
}

- (CAXContextualActionsPredictor)initWithModelUrl:(id)a3 encoderUrl:(id)a4 decoderUrl:(id)a5 configUrl:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CAXContextualActionsPredictor;
  int v13 = [(CAXContextualActionsPredictor *)&v20 init];
  objc_super v14 = v13;
  if (v13)
  {
    [(CAXContextualActionsPredictor *)v13 loadCoderFilesToInstanceFromEncoderUrl:v11 decoderUrl:v12];
    objc_storeStrong((id *)&v14->_modelUrl, a3);
    if (v10
      && ([MEMORY[0x263F08850] defaultManager],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v10 path],
          objc_super v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v15 fileExistsAtPath:v16],
          v16,
          v15,
          v17))
    {
      [(CAXContextualActionsPredictor *)v14 loadModelsFromUrl:v10];
    }
    else
    {
      v18 = objc_opt_new();
      [(CAXContextualActionsPredictor *)v14 setModel:v18];
    }
  }

  return v14;
}

- (void)loadCoderFilesToInstanceFromDefaulUrls
{
  id v4 = +[CAXContextualActionsPredictor defaultCoderUrlForName:@"encoding"];
  v3 = +[CAXContextualActionsPredictor defaultCoderUrlForName:@"decoding"];
  [(CAXContextualActionsPredictor *)self loadCoderFilesToInstanceFromEncoderUrl:v4 decoderUrl:v3];
}

- (void)loadCoderFilesToInstanceFromEncoderUrl:(id)a3 decoderUrl:(id)a4
{
  id v6 = (NSURL *)a3;
  id v7 = (NSURL *)a4;
  encoderUrl = self->_encoderUrl;
  self->_encoderUrl = v6;
  v9 = v6;

  decoderUrl = self->_decoderUrl;
  self->_decoderUrl = v7;
  id v11 = v7;

  id v21 = [MEMORY[0x263EFF8C0] arrayWithContentsOfURL:v9];
  id v12 = [v21 objectAtIndexedSubscript:0];
  int v13 = (void *)[v12 mutableCopy];
  [(CAXContextualActionsPredictor *)self setActionEncoder:v13];

  objc_super v14 = [v21 objectAtIndexedSubscript:1];
  v15 = (void *)[v14 mutableCopy];
  [(CAXContextualActionsPredictor *)self setTypeEncoder:v15];

  objc_super v16 = [MEMORY[0x263EFF8C0] arrayWithContentsOfURL:v11];

  int v17 = [v16 objectAtIndexedSubscript:0];
  v18 = (void *)[v17 mutableCopy];
  [(CAXContextualActionsPredictor *)self setActionDecoder:v18];

  v19 = [v16 objectAtIndexedSubscript:1];
  objc_super v20 = (void *)[v19 mutableCopy];
  [(CAXContextualActionsPredictor *)self setTypeDecoder:v20];
}

- (void)fillNormalizedFrequencyValuesOnPredictions:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v27 + 1) + 8 * i) frequency];
        v6 += [v9 intValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    float v14 = (float)v6;
    uint64_t v15 = v6;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        int v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        v18 = NSNumber;
        v19 = objc_msgSend(v17, "frequency", (void)v23);
        *(float *)&double v20 = (float)(int)[v19 intValue] / v14;
        id v21 = [v18 numberWithFloat:v20];
        [v17 setNormalizedFrequency:v21];

        v22 = [NSNumber numberWithInteger:v15];
        [v17 setPriorTotal:v22];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v12);
  }
}

- (id)predictNumActions:(unint64_t)a3 givenContext:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [v5 previousActions];
  uint64_t v7 = [(CAXContextualActionsPredictor *)self encodeActionSequence:v6];

  id v8 = [v5 contents];
  v9 = [(CAXContextualActionsPredictor *)self encodeContentTypes:v8];

  id v10 = [(CAXContextualActionsPredictor *)self model];
  uint64_t v11 = +[CAXContextualActionsPredictor frequencyDictKey];
  v60 = [v10 objectForKeyedSubscript:v11];

  uint64_t v12 = [(CAXContextualActionsPredictor *)self model];
  uint64_t v13 = +[CAXContextualActionsPredictor ioDictKey];
  float v14 = [v12 objectForKeyedSubscript:v13];

  uint64_t v15 = objc_opt_new();
  v61 = objc_opt_new();
  v62 = v14;
  v58 = v9;
  v59 = v7;
  v57 = v5;
  if (v9)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obuint64_t j = v9;
    uint64_t v16 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v67;
      unint64_t v19 = 0x264754000uLL;
      do
      {
        uint64_t v20 = 0;
        uint64_t v63 = v17;
        do
        {
          if (*(void *)v67 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v66 + 1) + 8 * v20);
          v22 = [v14 objectForKey:v21];
          [(CAXContextualActionsPredictor *)self combineDict:v15 withSourceDict:v22];

          long long v23 = [(CAXContextualActionsPredictor *)self typeDecoder];
          long long v24 = [v23 objectForKeyedSubscript:v21];

          long long v25 = [(CAXContextualActionsPredictor *)self getWFContentTypeStringFromContentTypeString:v24];
          long long v26 = (void *)[objc_alloc(*(Class *)(v19 + 2152)) initWithContentType:v25 contentMetadata:0];
          if (([v25 isEqualToString:v24] & 1) == 0)
          {
            v70 = v26;
            long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
            long long v28 = [(CAXContextualActionsPredictor *)self encodeContentTypes:v27];
            [v28 anyObject];
            uint64_t v29 = v18;
            v31 = uint64_t v30 = v15;

            float v14 = v62;
            v32 = [v62 objectForKey:v31];
            [(CAXContextualActionsPredictor *)self combineDict:v61 withSourceDict:v32];

            uint64_t v17 = v63;
            uint64_t v15 = v30;
            uint64_t v18 = v29;
            unint64_t v19 = 0x264754000;
          }

          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v17);
    }

    uint64_t v7 = v59;
  }
  uint64_t v33 = [(CAXContextualActionsPredictor *)self model];
  v34 = +[CAXContextualActionsPredictor unigramDictKey];
  v35 = [v33 objectForKeyedSubscript:v34];

  v36 = [(CAXContextualActionsPredictor *)self model];
  v37 = +[CAXContextualActionsPredictor bigramDictKey];
  v38 = [v36 objectForKeyedSubscript:v37];

  id obja = v35;
  if (v7 && [v7 count])
  {
    v39 = [v7 lastObject];
    v40 = [v35 objectForKey:v39];

    if ((unint64_t)[v7 count] < 2)
    {
      uint64_t v45 = 0;
    }
    else
    {
      v41 = NSString;
      v42 = [v7 lastObject];
      v43 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 2);
      v44 = [v41 stringWithFormat:@"%@, %@", v42, v43];

      uint64_t v45 = [v38 objectForKey:v44];
    }
  }
  else
  {
    uint64_t v45 = 0;
    v40 = 0;
  }
  v55 = (void *)v45;
  v46 = [(CAXContextualActionsPredictor *)self extractCAElementsByOrderingCounterDictByValue:v45];
  [(CAXContextualActionsPredictor *)self fillNormalizedFrequencyValuesOnPredictions:v46];
  v47 = [(CAXContextualActionsPredictor *)self extractCAElementsByOrderingCounterDictByValue:v40];
  [(CAXContextualActionsPredictor *)self fillNormalizedFrequencyValuesOnPredictions:v47];
  v48 = [(CAXContextualActionsPredictor *)self extractCAElementsByOrderingCounterDictByValue:v15];
  [(CAXContextualActionsPredictor *)self fillNormalizedFrequencyValuesOnPredictions:v48];
  v49 = [(CAXContextualActionsPredictor *)self extractCAElementsByOrderingCounterDictByValue:v61];
  [(CAXContextualActionsPredictor *)self fillNormalizedFrequencyValuesOnPredictions:v49];
  v50 = [(CAXContextualActionsPredictor *)self extractCAElementsByOrderingCounterDictByValue:v60];
  [(CAXContextualActionsPredictor *)self fillNormalizedFrequencyValuesOnPredictions:v50];
  v51 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  [MEMORY[0x263EFF9C0] set];
  v52 = v54 = (void *)v15;
  [(CAXContextualActionsPredictor *)self addModelResults:v46 toFinalResults:v51 withNumActions:a3 seenSet:v52];
  [(CAXContextualActionsPredictor *)self addModelResults:v47 toFinalResults:v51 withNumActions:a3 seenSet:v52];
  [(CAXContextualActionsPredictor *)self addModelResults:v48 toFinalResults:v51 withNumActions:a3 seenSet:v52];
  [(CAXContextualActionsPredictor *)self addModelResults:v49 toFinalResults:v51 withNumActions:a3 seenSet:v52];
  [(CAXContextualActionsPredictor *)self addModelResults:v50 toFinalResults:v51 withNumActions:a3 seenSet:v52];

  return v51;
}

- (void)saveModelToUrl:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F08900];
  int v6 = [(CAXContextualActionsPredictor *)self model];
  id v11 = 0;
  uint64_t v7 = [v5 dataWithJSONObject:v6 options:1 error:&v11];
  id v8 = v11;

  [v7 writeToURL:v4 atomically:1];
  v9 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v4 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v10;
    _os_log_impl(&dword_2257D2000, v9, OS_LOG_TYPE_DEFAULT, "model saved to path: %@", buf, 0xCu);
  }
}

- (void)loadModelsFromUrl:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  uint64_t v8 = 0;
  int v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:1 error:&v8];
  if (v8)
  {
    uint64_t v7 = [v4 path];
    NSLog(&cfstr_ErrorInParsing.isa, v7);
  }
  [(CAXContextualActionsPredictor *)self setModel:v6];
}

- (id)getWFContentTypeStringFromContentTypeString:(id)a3
{
  id v3 = (NSString *)a3;
  id v4 = v3;
  if (v3 && [(NSString *)v3 length])
  {
    id v5 = +[CAXContextualActionsPredictor ioNoneType];
    if ([(NSString *)v4 isEqualToString:v5])
    {
    }
    else
    {
      Class v6 = NSClassFromString(v4);

      if (v6)
      {
        uint64_t v22 = 0;
        long long v23 = &v22;
        uint64_t v24 = 0x2050000000;
        uint64_t v7 = (void *)getWFContentItemRegistryClass_softClass;
        uint64_t v25 = getWFContentItemRegistryClass_softClass;
        if (!getWFContentItemRegistryClass_softClass)
        {
          uint64_t v17 = MEMORY[0x263EF8330];
          uint64_t v18 = 3221225472;
          unint64_t v19 = __getWFContentItemRegistryClass_block_invoke;
          uint64_t v20 = &unk_264754AE0;
          uint64_t v21 = &v22;
          __getWFContentItemRegistryClass_block_invoke((uint64_t)&v17);
          uint64_t v7 = (void *)v23[3];
        }
        id v8 = v7;
        _Block_object_dispose(&v22, 8);
        v9 = [v8 sharedRegistry];
        uint64_t v22 = 0;
        long long v23 = &v22;
        uint64_t v24 = 0x2050000000;
        id v10 = (void *)getWFObjectTypeClass_softClass;
        uint64_t v25 = getWFObjectTypeClass_softClass;
        if (!getWFObjectTypeClass_softClass)
        {
          uint64_t v17 = MEMORY[0x263EF8330];
          uint64_t v18 = 3221225472;
          unint64_t v19 = __getWFObjectTypeClass_block_invoke;
          uint64_t v20 = &unk_264754AE0;
          uint64_t v21 = &v22;
          __getWFObjectTypeClass_block_invoke((uint64_t)&v17);
          id v10 = (void *)v23[3];
        }
        id v11 = v10;
        _Block_object_dispose(&v22, 8);
        uint64_t v12 = [v11 typeWithClass:NSClassFromString(v4)];
        uint64_t v13 = (objc_class *)[v9 contentItemClassForType:v12];

        if (v13)
        {
          NSStringFromClass(v13);
          uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
    }
  }
  uint64_t v14 = v4;
LABEL_13:
  uint64_t v15 = v14;

  return v15;
}

- (id)encodeContentTypes:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    Class v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v32 = v5;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v12 = [(CAXContextualActionsPredictor *)self typeEncoder];
          uint64_t v13 = [v11 contentType];
          uint64_t v14 = [v12 objectForKey:v13];

          uint64_t v15 = [(CAXContextualActionsPredictor *)self typeDecoder];
          uint64_t v16 = [v15 objectForKey:v14];

          if (v14) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17
            || ([v11 contentType],
                uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                int v19 = [v16 isEqualToString:v18],
                v18,
                !v19))
          {
            uint64_t v20 = [(CAXContextualActionsPredictor *)self typeEncoder];
            uint64_t v21 = [v20 count];

            uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v21);

            long long v23 = [(CAXContextualActionsPredictor *)self typeEncoder];
            uint64_t v24 = [v11 contentType];
            [v23 setObject:v22 forKey:v24];

            uint64_t v25 = [(CAXContextualActionsPredictor *)self typeDecoder];
            long long v26 = [v11 contentType];
            [v25 setObject:v26 forKey:v22];

            [v6 addObject:v22];
            long long v27 = [(CAXContextualActionsPredictor *)self encoderUrl];
            long long v28 = [(CAXContextualActionsPredictor *)self decoderUrl];
            [(CAXContextualActionsPredictor *)self persistCoderFileChangesToEncoderUrl:v27 decoderUrl:v28];

            uint64_t v29 = [(CAXContextualActionsPredictor *)self encoderUrl];
            uint64_t v30 = [(CAXContextualActionsPredictor *)self decoderUrl];
            [(CAXContextualActionsPredictor *)self loadCoderFilesToInstanceFromEncoderUrl:v29 decoderUrl:v30];

            uint64_t v14 = (void *)v22;
          }
          else
          {
            [v6 addObject:v14];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v8);
    }

    id v5 = v32;
  }
  else
  {
    Class v6 = 0;
  }

  return v6;
}

- (id)encodeActionSequence:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    Class v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v26 = v5;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) actionIdentifier];
        uint64_t v12 = [(CAXContextualActionsPredictor *)self actionEncoder];
        uint64_t v13 = [v12 objectForKey:v11];

        if (v13)
        {
          uint64_t v14 = [(CAXContextualActionsPredictor *)self actionDecoder];
          uint64_t v15 = [v14 objectForKey:v13];

          if (v15 && [v15 isEqualToString:v11])
          {
            [v6 addObject:v13];
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        uint64_t v16 = [(CAXContextualActionsPredictor *)self actionEncoder];
        uint64_t v17 = [v16 count];

        uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v17);

        int v19 = [(CAXContextualActionsPredictor *)self actionEncoder];
        [v19 setObject:v18 forKey:v11];

        uint64_t v20 = [(CAXContextualActionsPredictor *)self actionDecoder];
        [v20 setObject:v11 forKey:v18];

        [v6 addObject:v18];
        uint64_t v21 = [(CAXContextualActionsPredictor *)self encoderUrl];
        uint64_t v22 = [(CAXContextualActionsPredictor *)self decoderUrl];
        [(CAXContextualActionsPredictor *)self persistCoderFileChangesToEncoderUrl:v21 decoderUrl:v22];

        long long v23 = [(CAXContextualActionsPredictor *)self encoderUrl];
        uint64_t v24 = [(CAXContextualActionsPredictor *)self decoderUrl];
        [(CAXContextualActionsPredictor *)self loadCoderFilesToInstanceFromEncoderUrl:v23 decoderUrl:v24];

        uint64_t v13 = (void *)v18;
LABEL_14:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v8)
      {
LABEL_16:

        id v5 = v26;
        goto LABEL_18;
      }
    }
  }
  Class v6 = 0;
LABEL_18:

  return v6;
}

- (void)addEncodedActionSequence:(id)a3 toFrequencyDict:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v6 objectForKey:v11];
        uint64_t v13 = v12;
        if (v12) {
          uint64_t v14 = [v12 intValue] + 1;
        }
        else {
          uint64_t v14 = 1;
        }
        uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v14);
        [v6 setObject:v15 forKey:v11];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (id)extractCAElementsByOrderingCounterDictByValue:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF8C0] array];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v3 allValues];
    uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_3];

    uint64_t v24 = (void *)v7;
    uint64_t v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v7];
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v8;
    uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v30)
    {
      uint64_t v26 = *(void *)v38;
      id v27 = v3;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = v9;
          id v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
          uint64_t v11 = [v3 allKeysForObject:v10];
          uint64_t v12 = [MEMORY[0x263EFF980] array];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v13 = v11;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v34 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                long long v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue"));
                uint64_t v20 = [[CAXContextualActionsPredictionElement alloc] initWithIdentifier:v18 frequency:v19];
                [v12 addObject:v20];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v15);
          }

          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __79__CAXContextualActionsPredictor_extractCAElementsByOrderingCounterDictByValue___block_invoke_2;
          v32[3] = &unk_264754AB8;
          v32[4] = self;
          uint64_t v21 = [v12 sortedArrayUsingComparator:v32];
          [v29 addObjectsFromArray:v21];

          uint64_t v9 = v31 + 1;
          id v3 = v27;
        }
        while (v31 + 1 != v30);
        uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v30);
    }

    id v22 = v24;
  }
  else
  {
    id v22 = v4;
    id v29 = v22;
  }

  return v29;
}

uint64_t __79__CAXContextualActionsPredictor_extractCAElementsByOrderingCounterDictByValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 intValue];
  if (v6 >= (int)[v5 intValue])
  {
    int v8 = [v4 intValue];
    if (v8 <= (int)[v5 intValue]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __79__CAXContextualActionsPredictor_extractCAElementsByOrderingCounterDictByValue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  int v8 = [v5 actionDecoder];
  uint64_t v9 = [v7 encodedActionIdentifier];

  id v10 = [v8 objectForKey:v9];

  uint64_t v11 = [*(id *)(a1 + 32) actionDecoder];
  uint64_t v12 = [v6 encodedActionIdentifier];

  id v13 = [v11 objectForKey:v12];

  uint64_t v14 = [v10 compare:v13];
  return v14;
}

- (void)addModelResults:(id)a3 toFinalResults:(id)a4 withNumActions:(unint64_t)a5 seenSet:(id)a6
{
  id v57 = a3;
  id v9 = a4;
  id v10 = a6;
  int v11 = [v9 count];
  uint64_t v12 = v57;
  if (v57 && v11 < a5)
  {
    unint64_t v13 = 0;
    int v14 = v11;
    do
    {
      if ([v12 count] <= v13) {
        break;
      }
      uint64_t v15 = [v57 objectAtIndexedSubscript:v13];
      uint64_t v16 = [v15 encodedActionIdentifier];
      int v17 = [v10 containsObject:v16];

      if (v17)
      {
        if ([v9 count])
        {
          uint64_t v18 = 0;
          while (1)
          {
            long long v19 = [v9 objectAtIndexedSubscript:v18];
            uint64_t v20 = [v19 encodedActionIdentifier];
            uint64_t v21 = [v57 objectAtIndexedSubscript:v13];
            id v22 = [v21 encodedActionIdentifier];

            if (v20 == v22) {
              break;
            }
            if ([v9 count] <= (unint64_t)++v18) {
              goto LABEL_22;
            }
          }
          uint64_t v26 = [v9 objectAtIndexedSubscript:v18];
          id v27 = [v26 frequency];
          uint64_t v28 = [v27 integerValue];

          id v29 = [v57 objectAtIndexedSubscript:v13];
          uint64_t v30 = [v29 frequency];
          uint64_t v31 = [v30 integerValue];

          if (v28 <= v31) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = v28;
          }
          long long v33 = [NSNumber numberWithInteger:v32];
          long long v34 = [v9 objectAtIndexedSubscript:v18];
          [v34 setFrequency:v33];

          long long v35 = [v9 objectAtIndexedSubscript:v18];
          long long v36 = [v35 normalizedFrequency];
          [v36 floatValue];
          float v38 = v37;

          long long v39 = [v57 objectAtIndexedSubscript:v13];
          long long v40 = [v39 normalizedFrequency];
          [v40 floatValue];
          float v42 = v41;

          if (v38 >= v42) {
            *(float *)&double v43 = v38;
          }
          else {
            *(float *)&double v43 = v42;
          }
          v44 = [NSNumber numberWithFloat:v43];
          uint64_t v45 = [v9 objectAtIndexedSubscript:v18];
          [v45 setNormalizedFrequency:v44];

          v46 = [v9 objectAtIndexedSubscript:v18];
          v47 = [v46 priorTotal];
          [v47 floatValue];
          float v49 = v48;

          v50 = [v57 objectAtIndexedSubscript:v13];
          v51 = [v50 priorTotal];
          [v51 floatValue];
          float v53 = v52;

          if (v49 >= v53) {
            *(float *)&double v54 = v49;
          }
          else {
            *(float *)&double v54 = v53;
          }
          v55 = [NSNumber numberWithFloat:v54];
          v56 = [v9 objectAtIndexedSubscript:v18];
          [v56 setPriorTotal:v55];
        }
      }
      else
      {
        long long v23 = [v57 objectAtIndexedSubscript:v13];
        [v9 addObject:v23];

        uint64_t v24 = [v57 objectAtIndexedSubscript:v13];
        uint64_t v25 = [v24 encodedActionIdentifier];
        [v10 addObject:v25];

        ++v14;
      }
LABEL_22:
      uint64_t v12 = v57;
      ++v13;
    }
    while (v14 < a5);
  }
}

- (id)convertToStringEncodedActionSequence:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    id v5 = &stru_26D8EF838;
    do
    {
      id v6 = NSString;
      id v7 = [v3 objectAtIndexedSubscript:v4];
      int v8 = objc_msgSend(v6, "stringWithFormat:", @"%d", objc_msgSend(v7, "intValue"));
      id v9 = [(__CFString *)v5 stringByAppendingString:v8];

      if (v4 != [v3 count] - 1)
      {
        uint64_t v10 = [(__CFString *)v9 stringByAppendingString:@", "];

        id v9 = (__CFString *)v10;
      }
      ++v4;
      id v5 = v9;
    }
    while ([v3 count] > v4);
  }
  else
  {
    id v9 = &stru_26D8EF838;
  }

  return v9;
}

- (void)addKeyString:(id)a3 andValueString:(id)a4 toCounterDict:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [v7 objectForKey:v8];
  uint64_t v10 = (void *)[v9 mutableCopy];

  if (v10)
  {
    int v11 = [v10 objectForKey:v15];
    uint64_t v12 = v11;
    if (v11) {
      uint64_t v13 = [v11 intValue] + 1;
    }
    else {
      uint64_t v13 = 1;
    }
    int v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v13);
    [v10 setObject:v14 forKey:v15];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
    [v10 setObject:v12 forKey:v15];
  }

  [v7 setObject:v10 forKey:v8];
}

- (void)combineDict:(id)a3 withSourceDict:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v29 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v29)
    {
      id v27 = v5;
      uint64_t v28 = *(void *)v36;
      uint64_t v26 = v7;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v7);
          }
          uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v10 = [v5 objectForKey:v9];

          if (v10)
          {
            uint64_t v30 = i;
            int v11 = [v5 objectForKeyedSubscript:v9];
            uint64_t v12 = (void *)[v11 mutableCopy];

            uint64_t v13 = [v7 objectForKeyedSubscript:v9];
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v32 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * j);
                  long long v19 = [v12 objectForKey:v18];

                  uint64_t v20 = [v13 objectForKeyedSubscript:v18];
                  uint64_t v21 = v20;
                  if (v19)
                  {
                    unsigned int v22 = [v20 intValue];

                    long long v23 = [v12 objectForKeyedSubscript:v18];
                    unsigned int v24 = [v23 intValue];

                    if ((int)v22 <= (int)v24) {
                      uint64_t v25 = v24;
                    }
                    else {
                      uint64_t v25 = v22;
                    }
                    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v25);
                  }
                  [v12 setObject:v21 forKey:v18];
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v15);
            }

            id v7 = v26;
            id v5 = v27;
            uint64_t i = v30;
          }
          else
          {
            uint64_t v12 = [v7 objectForKeyedSubscript:v9];
            [v5 setObject:v12 forKey:v9];
          }
        }
        uint64_t v29 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v29);
    }
  }
}

- (void)persistCoderFileChangesToEncoderUrl:(id)a3 decoderUrl:(id)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAXContextualActionsPredictor *)self actionEncoder];
  v15[0] = v8;
  uint64_t v9 = [(CAXContextualActionsPredictor *)self typeEncoder];
  v15[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  int v11 = [(CAXContextualActionsPredictor *)self actionDecoder];
  v14[0] = v11;
  uint64_t v12 = [(CAXContextualActionsPredictor *)self typeDecoder];
  v14[1] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  LODWORD(v11) = [v10 writeToURL:v7 atomically:1];
  if (v11) {
    NSLog(&cfstr_EncoderUpdated.isa);
  }
  if ([v13 writeToURL:v6 atomically:1]) {
    NSLog(&cfstr_DecoderUpdated.isa);
  }
}

- (id)extractInputTypesAsCAXContentFromActionId:(id)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  id v21 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v3 = (void *)getWFActionRegistryClass_softClass;
  uint64_t v30 = getWFActionRegistryClass_softClass;
  if (!getWFActionRegistryClass_softClass)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __getWFActionRegistryClass_block_invoke;
    v26[3] = &unk_264754AE0;
    v26[4] = &v27;
    __getWFActionRegistryClass_block_invoke((uint64_t)v26);
    id v3 = (void *)v28[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v27, 8);
  id v5 = [v4 sharedRegistry];
  id v6 = [v5 createActionWithIdentifier:v21 serializedParameters:0];

  id v7 = [v6 inputContentClasses];
  id v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = v8;
    uint64_t v11 = [(CAXContextualActionContent *)v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(objc_class **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v15 = [CAXContextualActionContent alloc];
          uint64_t v16 = NSStringFromClass(v14);
          int v17 = [(CAXContextualActionContent *)v15 initWithContentType:v16 contentMetadata:0];

          [v9 addObject:v17];
        }
        uint64_t v11 = [(CAXContextualActionContent *)v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v18 = [CAXContextualActionContent alloc];
    long long v19 = +[CAXContextualActionsPredictor ioNoneType];
    uint64_t v10 = [(CAXContextualActionContent *)v18 initWithContentType:v19 contentMetadata:0];

    v32[0] = v10;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  }

  return v9;
}

- (void)updateModelWithSummary:(id)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [v4 actions];
  uint64_t v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v70 = v4;
  id v8 = v4;
  uint64_t v9 = (void *)v7;
  uint64_t v10 = [v8 actions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v82 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v81 + 1) + 8 * i) actionIdentifier];
        uint64_t v16 = [(CAXContextualActionsPredictor *)self extractInputTypesAsCAXContentFromActionId:v15];
        int v17 = [(CAXContextualActionsPredictor *)self encodeContentTypes:v16];
        [v9 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v12);
  }

  uint64_t v18 = [v70 actions];
  long long v19 = [(CAXContextualActionsPredictor *)self encodeActionSequence:v18];

  uint64_t v20 = [(CAXContextualActionsPredictor *)self model];
  unint64_t v21 = 0x264754000uLL;
  long long v22 = +[CAXContextualActionsPredictor frequencyDictKey];
  long long v23 = [v20 objectForKey:v22];
  if (v23)
  {
    long long v24 = [(CAXContextualActionsPredictor *)self model];
    long long v25 = +[CAXContextualActionsPredictor frequencyDictKey];
    uint64_t v26 = [v24 objectForKeyedSubscript:v25];
    v71 = (void *)[v26 mutableCopy];

    unint64_t v21 = 0x264754000;
  }
  else
  {
    v71 = objc_opt_new();
  }

  uint64_t v27 = [(CAXContextualActionsPredictor *)self model];
  uint64_t v28 = [*(id *)(v21 + 2184) ioDictKey];
  uint64_t v29 = [v27 objectForKey:v28];
  if (v29)
  {
    uint64_t v30 = [(CAXContextualActionsPredictor *)self model];
    long long v31 = +[CAXContextualActionsPredictor ioDictKey];
    long long v32 = [v30 objectForKeyedSubscript:v31];
    long long v33 = (void *)[v32 mutableCopy];

    unint64_t v21 = 0x264754000;
  }
  else
  {
    long long v33 = objc_opt_new();
  }

  long long v34 = [(CAXContextualActionsPredictor *)self model];
  long long v35 = [*(id *)(v21 + 2184) unigramDictKey];
  long long v36 = [v34 objectForKey:v35];
  if (v36)
  {
    [(CAXContextualActionsPredictor *)self model];
    v37 = uint64_t v72 = v35;
    long long v38 = [*(id *)(v21 + 2184) unigramDictKey];
    [v37 objectForKeyedSubscript:v38];
    v40 = long long v39 = v34;
    v74 = (void *)[v40 mutableCopy];

    long long v34 = v39;
    long long v35 = v72;
  }
  else
  {
    v74 = objc_opt_new();
  }

  uint64_t v41 = [(CAXContextualActionsPredictor *)self model];
  float v42 = [*(id *)(v21 + 2184) bigramDictKey];
  double v43 = [v41 objectForKey:v42];
  if (v43)
  {
    v44 = [(CAXContextualActionsPredictor *)self model];
    uint64_t v45 = [*(id *)(v21 + 2184) bigramDictKey];
    [v44 objectForKeyedSubscript:v45];
    v47 = v46 = v41;
    v73 = (void *)[v47 mutableCopy];

    uint64_t v41 = v46;
  }
  else
  {
    v73 = objc_opt_new();
  }

  [(CAXContextualActionsPredictor *)self addEncodedActionSequence:v19 toFrequencyDict:v71];
  if ([v19 count])
  {
    unint64_t v48 = 0;
    v75 = v9;
    do
    {
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      float v49 = [v9 objectAtIndexedSubscript:v48];
      uint64_t v50 = [v49 countByEnumeratingWithState:&v77 objects:v85 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v78;
        do
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v78 != v52) {
              objc_enumerationMutation(v49);
            }
            uint64_t v54 = *(void *)(*((void *)&v77 + 1) + 8 * j);
            v55 = [v19 objectAtIndexedSubscript:v48];
            [(CAXContextualActionsPredictor *)self addKeyString:v54 andValueString:v55 toCounterDict:v33];
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v77 objects:v85 count:16];
        }
        while (v51);
      }

      if (v48)
      {
        v56 = [v19 objectAtIndexedSubscript:(v48 - 1)];
        id v57 = [v19 objectAtIndexedSubscript:v48];
        [(CAXContextualActionsPredictor *)self addKeyString:v56 andValueString:v57 toCounterDict:v74];

        if ([v19 count] - 1 > v48)
        {
          v58 = NSString;
          v59 = [v19 objectAtIndexedSubscript:(v48 - 1)];
          v60 = [v19 objectAtIndexedSubscript:v48];
          v61 = [v58 stringWithFormat:@"%@, %@", v59, v60];

          v62 = [v19 objectAtIndexedSubscript:v48 + 1];
          [(CAXContextualActionsPredictor *)self addKeyString:v61 andValueString:v62 toCounterDict:v73];
        }
      }
      ++v48;
      uint64_t v9 = v75;
    }
    while ([v19 count] > v48);
  }
  uint64_t v63 = objc_opt_new();
  v64 = +[CAXContextualActionsPredictor ioDictKey];
  [v63 setObject:v33 forKey:v64];

  v65 = +[CAXContextualActionsPredictor unigramDictKey];
  [v63 setObject:v74 forKey:v65];

  long long v66 = +[CAXContextualActionsPredictor bigramDictKey];
  [v63 setObject:v73 forKey:v66];

  long long v67 = +[CAXContextualActionsPredictor frequencyDictKey];
  [v63 setObject:v71 forKey:v67];

  [(CAXContextualActionsPredictor *)self setModel:v63];
  long long v68 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2257D2000, v68, OS_LOG_TYPE_DEFAULT, "Personalized model updated.", buf, 2u);
  }

  long long v69 = [(CAXContextualActionsPredictor *)self modelUrl];
  [(CAXContextualActionsPredictor *)self saveModelToUrl:v69];
}

- (NSURL)modelUrl
{
  return self->_modelUrl;
}

- (void)setModelUrl:(id)a3
{
}

- (NSURL)configUrl
{
  return self->_configUrl;
}

- (void)setConfigUrl:(id)a3
{
}

- (NSURL)encoderUrl
{
  return self->_encoderUrl;
}

- (void)setEncoderUrl:(id)a3
{
}

- (NSURL)decoderUrl
{
  return self->_decoderUrl;
}

- (void)setDecoderUrl:(id)a3
{
}

- (NSMutableDictionary)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSMutableDictionary)typeEncoder
{
  return self->_typeEncoder;
}

- (void)setTypeEncoder:(id)a3
{
}

- (NSMutableDictionary)actionEncoder
{
  return self->_actionEncoder;
}

- (void)setActionEncoder:(id)a3
{
}

- (NSMutableDictionary)typeDecoder
{
  return self->_typeDecoder;
}

- (void)setTypeDecoder:(id)a3
{
}

- (NSMutableDictionary)actionDecoder
{
  return self->_actionDecoder;
}

- (void)setActionDecoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDecoder, 0);
  objc_storeStrong((id *)&self->_typeDecoder, 0);
  objc_storeStrong((id *)&self->_actionEncoder, 0);
  objc_storeStrong((id *)&self->_typeEncoder, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_decoderUrl, 0);
  objc_storeStrong((id *)&self->_encoderUrl, 0);
  objc_storeStrong((id *)&self->_configUrl, 0);
  objc_storeStrong((id *)&self->_modelUrl, 0);
}

@end