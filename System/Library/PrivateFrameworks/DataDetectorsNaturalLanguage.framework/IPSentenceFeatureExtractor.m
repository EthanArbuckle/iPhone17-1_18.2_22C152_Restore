@interface IPSentenceFeatureExtractor
- (id)eventIdentifierForLanguageID:(id)a3;
- (id)featureSentencesFromText:(id)a3 dataDetectedFeatures:(id)a4 languageID:(id)a5;
- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5;
- (id)queue;
- (unint64_t)responseKitAnnotationTypeForFeatureDataType:(unint64_t)a3;
- (void)identifyAndStorePolarityInFeatureSentences:(id)a3 eventIdentifier:(id)a4 previousFeatureSentences:(id)a5;
@end

@implementation IPSentenceFeatureExtractor

- (unint64_t)responseKitAnnotationTypeForFeatureDataType:(unint64_t)a3
{
  if (a3 > 0xD) {
    return 0;
  }
  else {
    return qword_2256AF0F8[a3];
  }
}

- (id)featureSentencesFromText:(id)a3 dataDetectedFeatures:(id)a4 languageID:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v10 hasPrefix:@"zh"] & 1) != 0
    || [v10 hasPrefix:@"ja"])
  {
    v11 = [v8 stringByReplacingOccurrencesOfString:@"。" withString:@"\n"];

    id v8 = [v11 stringByReplacingOccurrencesOfString:@"." withString:@"\n"];
  }
  v12 = [MEMORY[0x263EFF980] array];
  id v13 = objc_alloc(MEMORY[0x263F08948]);
  v34[0] = *MEMORY[0x263F082A8];
  uint64_t v14 = v34[0];
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  v16 = (void *)[v13 initWithTagSchemes:v15 options:0];

  [v16 setString:v8];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3010000000;
  v33[4] = 0;
  v33[5] = 0;
  v33[3] = &unk_2256EFEDE;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  uint64_t v17 = [v8 length];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __87__IPSentenceFeatureExtractor_featureSentencesFromText_dataDetectedFeatures_languageID___block_invoke;
  v24[3] = &unk_2647231F0;
  v30 = v33;
  id v18 = v8;
  id v25 = v18;
  id v19 = v10;
  id v26 = v19;
  id v20 = v12;
  id v27 = v20;
  v31 = v32;
  id v21 = v9;
  id v28 = v21;
  v29 = self;
  objc_msgSend(v16, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v17, v14, 4, v24);
  id v22 = v20;

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);

  return v22;
}

void __87__IPSentenceFeatureExtractor_featureSentencesFromText_dataDetectedFeatures_languageID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  id v9 = a2;
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  if (a5 == *(void *)(v10 + 32) && a6 == *(void *)(v10 + 40)) {
    goto LABEL_18;
  }
  id v24 = v9;
  *(void *)(v10 + 32) = a5;
  *(void *)(v10 + 40) = a6;
  v23 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a5, a6);
  v12 = (void *)[objc_alloc(MEMORY[0x263F64268]) initWithString:v23 andLanguageIdentifier:*(void *)(a1 + 40)];
  id v13 = [[IPFeatureSentence alloc] initWithLanguageID:*(void *)(a1 + 40) responseKitSentence:v12];
  -[IPFeature setMatchRange:](v13, "setMatchRange:", a5, a6);
  [(IPFeature *)v13 setTextUnit:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) addObject:v13];
  unint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if (v14 >= [*(id *)(a1 + 56) count]) {
    goto LABEL_17;
  }
  while (1)
  {
    v15 = [*(id *)(a1 + 56) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    unint64_t v16 = [v15 matchRange];
    if (v16 + v17 > a5) {
      break;
    }
LABEL_14:
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);

    unint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (v22 >= [*(id *)(a1 + 56) count]) {
      goto LABEL_17;
    }
  }
  if (v16 < a5 + a6)
  {
    uint64_t v18 = v16 - a5;
    if (v16 >= a5)
    {
      unint64_t v19 = v17;
      uint64_t v20 = objc_msgSend(*(id *)(a1 + 64), "responseKitAnnotationTypeForFeatureDataType:", objc_msgSend(v15, "type"));
      if (v20)
      {
        if (v19 >= a6 - v18) {
          uint64_t v21 = a6 - v18;
        }
        else {
          uint64_t v21 = v19;
        }
        objc_msgSend(v12, "annotateRange:type:", v18, v21, v20);
      }
    }
    goto LABEL_14;
  }

LABEL_17:
  id v9 = v24;
LABEL_18:
}

- (void)identifyAndStorePolarityInFeatureSentences:(id)a3 eventIdentifier:(id)a4 previousFeatureSentences:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 count];
  v11 = [MEMORY[0x263EFF980] array];
  [v11 addObjectsFromArray:v7];

  [v11 addObjectsFromArray:v9];
  v12 = NSStringFromSelector(sel_responseKitSentence);
  id v13 = [v11 valueForKey:v12];

  unint64_t v14 = [v8 identifyText:v13];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __114__IPSentenceFeatureExtractor_identifyAndStorePolarityInFeatureSentences_eventIdentifier_previousFeatureSentences___block_invoke;
  v16[3] = &unk_264723218;
  id v17 = v11;
  uint64_t v18 = v10;
  id v15 = v11;
  [v14 enumerateClassifiedTokens:v16];
}

void __114__IPSentenceFeatureExtractor_identifyAndStorePolarityInFeatureSentences_eventIdentifier_previousFeatureSentences___block_invoke(uint64_t a1, unint64_t *a2, float *a3)
{
  unint64_t v6 = *a2;
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*a2];
  if (v6 >= *(void *)(a1 + 40))
  {
    double v8 = a3[1];
    double v9 = a3[3];
    double v10 = a3[4];
    double v11 = a3[2];
    if (v11 <= 0.4 && v10 <= 0.4) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 6;
    }
    id v15 = v7;
    unint64_t v14 = +[IPFeatureSentenceFragment fragmentWithRange:clusterType:](IPFeatureSentenceFragment, "fragmentWithRange:clusterType:", a2[1], a2[2], v13);
    objc_msgSend(v14, "setProbability_None:", v8);
    objc_msgSend(v14, "setProbability_Rejection:", v9);
    objc_msgSend(v14, "setProbability_Proposal:", v10);
    objc_msgSend(v14, "setProbability_Confirmation:", v11);
    [v15 addFragment:v14];

    id v7 = v15;
  }
}

- (id)eventIdentifierForLanguageID:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  objc_sync_enter(v5);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke;
  v21[3] = &unk_264723290;
  v21[4] = self;
  if (eventIdentifierForLanguageID__onceToken == -1)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&eventIdentifierForLanguageID__onceToken, v21);
    if (v4)
    {
LABEL_3:
      unint64_t v6 = [(id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID objectForKey:v4];
      if (v6)
      {
        id v7 = [MEMORY[0x263EFF9D0] null];
        BOOL v8 = v6 == v7;

        if (!v8)
        {
          id v9 = v6;
LABEL_15:

          goto LABEL_18;
        }
      }
      else
      {
        id v9 = (id)[objc_alloc(MEMORY[0x263F64258]) initWithLanguageID:v4];
        if (v9)
        {
          [(id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID setObject:v9 forKey:v4];
          goto LABEL_15;
        }
        double v10 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v4];
        double v11 = [v10 objectForKey:*MEMORY[0x263EFF508]];
        int v12 = [&unk_26D8D4A88 containsObject:v11];

        if (v12)
        {
          uint64_t v13 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            uint64_t v13 = _IPLogHandle;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v23 = v4;
            _os_log_impl(&dword_225684000, v13, OS_LOG_TYPE_ERROR, "%{public}@ is supposed to be a supported language but we have failed to load the corresponding ResponseKit model. This usually means that the corresponding LinguisticData assets have not been downloaded #Generic", buf, 0xCu);
          }
        }
        unint64_t v14 = (void *)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID;
        id v15 = [MEMORY[0x263EFF9D0] null];
        [v14 setObject:v15 forKey:v4];

        dispatch_time_t v16 = dispatch_time(0, 43200000000000);
        id v17 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_54;
        block[3] = &unk_264722C50;
        block[4] = self;
        id v20 = v4;
        dispatch_after(v16, v17, block);
      }
      id v9 = 0;
      goto LABEL_15;
    }
  }
  id v9 = 0;
LABEL_18:
  objc_sync_exit(v5);

  return v9;
}

void __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263F61E50]) initWithCountLimit:3];
  v3 = (void *)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID;
  eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID = v2;

  int out_token = 0;
  id v4 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_2;
  handler[3] = &unk_264723240;
  handler[4] = *(void *)(a1 + 32);
  notify_register_dispatch("com.apple.MobileAsset.LinguisticData.new-asset-installed", &out_token, v4, handler);

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_30;
  v7[3] = &unk_264723268;
  v7[4] = *(void *)(a1 + 32);
  id v6 = (id)[v5 addObserverForName:@"IPScannerResetSharedCachesAndModelsNotification" object:0 queue:0 usingBlock:v7];
}

void __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_2()
{
  v0 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v0 = _IPLogHandle;
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_225684000, v0, OS_LOG_TYPE_INFO, "Received new asset installation notification #Generic", v2, 2u);
  }
  v1 = objc_opt_class();
  objc_sync_enter(v1);
  [(id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID removeAllObjects];
  objc_sync_exit(v1);
}

void __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v2 = objc_opt_class();
  objc_sync_enter(v2);
  [(id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID removeAllObjects];
  objc_sync_exit(v2);
}

void __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_54(uint64_t a1)
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  [(id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(obj);
}

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = a5;
  double v10 = objc_opt_class();
  objc_sync_enter(v10);
  double v11 = [v9 bestLanguageID];
  int v12 = [(IPSentenceFeatureExtractor *)self eventIdentifierForLanguageID:v11];
  if (v12)
  {
    uint64_t v13 = [v9 originalMessage];
    unint64_t v14 = [v13 type];
    id v15 = IPMessageTypeShortMessage;

    dispatch_time_t v16 = [v21 objectForKeyedSubscript:@"IPFeatureExtractorContextDataDetectorsFeatures"];
    if (v14 == v15)
    {
      id v17 = [v21 objectForKeyedSubscript:@"IPFeatureExtractorPreviousFeatureSentences"];
    }
    else
    {
      id v17 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v18 = [(IPSentenceFeatureExtractor *)self featureSentencesFromText:v8 dataDetectedFeatures:v16 languageID:v11];
    [(IPSentenceFeatureExtractor *)self identifyAndStorePolarityInFeatureSentences:v18 eventIdentifier:v12 previousFeatureSentences:v17];
  }
  else
  {
    uint64_t v18 = 0;
  }

  objc_sync_exit(v10);
  if (v12) {
    id v19 = v18;
  }
  else {
    id v19 = (id)MEMORY[0x263EFFA68];
  }

  return v19;
}

- (id)queue
{
  if (queue__onceToken_1 != -1) {
    dispatch_once(&queue__onceToken_1, &__block_literal_global_8);
  }
  uint64_t v2 = (void *)queue__ipExprOnceResult_1;
  return v2;
}

void __35__IPSentenceFeatureExtractor_queue__block_invoke()
{
  v0 = (void *)MEMORY[0x22A632550]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("IPSentenceFeatureExtractor", v1);
  id v3 = (void *)queue__ipExprOnceResult_1;
  queue__ipExprOnceResult_1 = (uint64_t)v2;
}

@end