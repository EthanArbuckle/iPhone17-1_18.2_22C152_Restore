@interface FinHealthTextSimilarityFeatures
- (BOOL)_modelsLoaded;
- (BOOL)isNLTaggerSchemeLemmaAvailable;
- (FinHealthTextSimilarityFeatures)init;
- (NLEmbedding)nlEmbedding;
- (NLModel)nlModel;
- (NLTagger)nlTagger;
- (NSDictionary)categoriesExpansionDict;
- (NSDictionary)categoriesLocalizationDict;
- (NSRegularExpression)boundaryRegex;
- (NSRegularExpression)specialCharsRegex;
- (NSSet)stopWords;
- (id)_tokenize:(id)a3 shouldLemmatize:(BOOL)a4;
- (void)applyCategoryHeuristics:(id)a3 detailedCategory:(id)a4;
- (void)applyTimingHeuristics:(id)a3 detailedCategory:(id)a4 dateHour:(id)a5;
- (void)neighborsForText:(id)a3 completion:(id)a4;
- (void)semanticTagsForMerchant:(id)a3 detailedCategory:(id)a4 dateHour:(id)a5 completion:(id)a6;
@end

@implementation FinHealthTextSimilarityFeatures

- (FinHealthTextSimilarityFeatures)init
{
  v40.receiver = self;
  v40.super_class = (Class)FinHealthTextSimilarityFeatures;
  v2 = [(FinHealthTextSimilarityFeatures *)&v40 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v4 = +[NLEmbedding wordEmbeddingForLanguage:NLLanguageEnglish];
    nlEmbedding = v2->_nlEmbedding;
    v2->_nlEmbedding = (NLEmbedding *)v4;

    v35 = [v3 pathForResource:@"text_heuristics" ofType:@"json" inDirectory:@"FeaturesResources"];
    +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:");
    v34 = id v39 = 0;
    v6 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:");
    id v7 = v39;
    v8 = [v3 pathForResource:@"english_localizations" ofType:@"json" inDirectory:@"FeaturesResources"];
    if (_os_feature_enabled_impl())
    {
      uint64_t v9 = [v3 pathForResource:@"modern_english_localizations" ofType:@"json" inDirectory:@"FeaturesResources"];

      v8 = (void *)v9;
    }
    +[NSData dataWithContentsOfFile:v8];
    v33 = id v38 = v7;
    v10 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:");
    id v11 = v38;

    v12 = [v6 valueForKey:@"stop_words"];
    uint64_t v13 = +[NSSet setWithArray:v12];
    stopWords = v2->_stopWords;
    v2->_stopWords = (NSSet *)v13;

    uint64_t v15 = [v6 valueForKey:@"category_expansions"];
    categoriesExpansionDict = v2->_categoriesExpansionDict;
    v2->_categoriesExpansionDict = (NSDictionary *)v15;

    objc_storeStrong((id *)&v2->_categoriesLocalizationDict, v10);
    if (!v2->_stopWords || !v2->_categoriesExpansionDict || v11)
    {
      v17 = FinHealthLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = [v11 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v43 = "-[FinHealthTextSimilarityFeatures init]";
        __int16 v44 = 2112;
        v45 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: error: %@", buf, 0x16u);
      }
    }
    id v19 = objc_alloc((Class)NLTagger);
    NLTagScheme v41 = NLTagSchemeLemma;
    v20 = +[NSArray arrayWithObjects:&v41 count:1];
    v21 = (NLTagger *)[v19 initWithTagSchemes:v20];
    nlTagger = v2->_nlTagger;
    v2->_nlTagger = v21;

    v23 = +[NSString stringWithFormat:@"%@|%@|%@|%@|%@", boundaryPatternWhitespace, boundaryPatternLowerThenUpper, boundaryPatternUpperUpperThenLower, boundaryPatternDigitThenLetter, boundaryPatternLetterThenDigit];
    id v37 = v11;
    uint64_t v24 = +[NSRegularExpression regularExpressionWithPattern:v23 options:0 error:&v37];
    id v25 = v37;

    boundaryRegex = v2->_boundaryRegex;
    v2->_boundaryRegex = (NSRegularExpression *)v24;

    id v36 = v25;
    uint64_t v27 = +[NSRegularExpression regularExpressionWithPattern:specialCharPattern options:0 error:&v36];
    id v28 = v36;

    specialCharsRegex = v2->_specialCharsRegex;
    v2->_specialCharsRegex = (NSRegularExpression *)v27;

    if (v28)
    {
      v30 = FinHealthLogObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = [v28 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v43 = "-[FinHealthTextSimilarityFeatures init]";
        __int16 v44 = 2112;
        v45 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: Regex creation error: %@", buf, 0x16u);
      }
    }
  }
  return v2;
}

- (BOOL)_modelsLoaded
{
  v3 = [(FinHealthTextSimilarityFeatures *)self nlEmbedding];
  if (v3)
  {
    uint64_t v4 = [(FinHealthTextSimilarityFeatures *)self nlTagger];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isNLTaggerSchemeLemmaAvailable
{
  v2 = +[NLTagger availableTagSchemesForUnit:0 language:NLLanguageEnglish];
  unsigned __int8 v3 = [v2 containsObject:NLTagSchemeLemma];

  return v3;
}

- (void)neighborsForText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_10001281C;
    v16 = sub_10001282C;
    id v17 = (id)objc_opt_new();
    nlEmbedding = self->_nlEmbedding;
    if (nlEmbedding)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100012834;
      v11[3] = &unk_100031938;
      v11[4] = &v12;
      [(NLEmbedding *)nlEmbedding enumerateNeighborsForString:v6 maximumCount:maximumNeighborCount distanceType:0 usingBlock:v11];
    }
    uint64_t v9 = +[NSArray arrayWithArray:v13[5]];
    v10 = +[NSDictionary dictionaryWithObject:v9 forKey:FHSmartFeatureCompoundTypeRelatedMerchants];
    v7[2](v7, v10);

    _Block_object_dispose(&v12, 8);
  }
}

- (id)_tokenize:(id)a3 shouldLemmatize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 length])
  {
    id v8 = v7;
    uint64_t v9 = [(FinHealthTextSimilarityFeatures *)self specialCharsRegex];

    if (v9)
    {
      v10 = [(FinHealthTextSimilarityFeatures *)self specialCharsRegex];
      uint64_t v11 = objc_msgSend(v10, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, objc_msgSend(v8, "length"), @" ");

      id v8 = (id)v11;
    }
    uint64_t v12 = [v8 decomposedStringWithCompatibilityMapping];

    CFStringTransform(v12, 0, kCFStringTransformStripCombiningMarks, 0);
    uint64_t v13 = [(FinHealthTextSimilarityFeatures *)self boundaryRegex];

    if (v13)
    {
      uint64_t v14 = [(FinHealthTextSimilarityFeatures *)self boundaryRegex];
      uint64_t v15 = objc_msgSend(v14, "stringByReplacingMatchesInString:options:range:withTemplate:", v12, 0, 0, -[__CFString length](v12, "length"), @"\n");

      v16 = [v15 componentsSeparatedByString:@"\n"];
    }
    else
    {
      v16 = [(__CFString *)v12 componentsSeparatedByString:@" "];
    }
    v18 = +[NSPredicate predicateWithFormat:@"length > 0"];
    id v19 = [v16 filteredArrayUsingPredicate:v18];

    v20 = [v19 valueForKey:@"lowercaseString"];

    v21 = [(FinHealthTextSimilarityFeatures *)self nlTagger];

    if (v21 && v4)
    {
      v22 = objc_opt_new();
      v23 = [v20 componentsJoinedByString:@" "];
      uint64_t v24 = [(FinHealthTextSimilarityFeatures *)self nlTagger];
      [v24 setString:v23];

      id v25 = [(FinHealthTextSimilarityFeatures *)self nlTagger];
      id v26 = [v23 length];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100012CEC;
      v35[3] = &unk_100031960;
      id v36 = v23;
      id v27 = v22;
      id v37 = v27;
      id v28 = v23;
      objc_msgSend(v25, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v26, 0, NLTagSchemeLemma, 0, v35);

      id v29 = v27;
      v20 = v29;
    }
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100012DA4;
    v34[3] = &unk_100031448;
    v34[4] = self;
    v30 = +[NSPredicate predicateWithBlock:v34];
    v31 = [v20 filteredArrayUsingPredicate:v30];

    if ([v31 count])
    {
      id v32 = v31;

      v20 = v32;
    }
    id v17 = v20;
  }
  else
  {
    id v17 = &__NSArray0__struct;
  }

  return v17;
}

- (void)applyTimingHeuristics:(id)a3 detailedCategory:(id)a4 dateHour:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v10 = (char *)[v8 integerValue];
      if (([v7 containsString:@"dining"] & 1) != 0
        || [v7 containsString:@"restaurants"])
      {
        if ((unint64_t)(v10 - 5) > 5)
        {
          if ((unint64_t)(v10 - 11) > 3)
          {
            if ((unint64_t)(v10 - 15) > 8) {
              goto LABEL_12;
            }
            uint64_t v11 = +[NSDecimalNumber decimalNumberWithString:@"0.6"];
            CFStringRef v12 = @"Dinner";
          }
          else
          {
            uint64_t v11 = +[NSDecimalNumber decimalNumberWithString:@"0.6"];
            CFStringRef v12 = @"Lunch";
          }
        }
        else
        {
          uint64_t v11 = +[NSDecimalNumber decimalNumberWithString:@"0.6"];
          CFStringRef v12 = @"Breakfast";
        }
        [v13 setValue:v11 forKey:v12];
      }
    }
  }
LABEL_12:
}

- (void)applyCategoryHeuristics:(id)a3 detailedCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v28 = self;
  id v8 = [(FinHealthTextSimilarityFeatures *)self categoriesExpansionDict];
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    unsigned __int8 v10 = [v7 isEqualToString:FHDetailedCategoryUndefined];

    if ((v10 & 1) == 0)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v11 = [(FinHealthTextSimilarityFeatures *)v28 categoriesExpansionDict];
      CFStringRef v12 = [v11 allKeys];

      id obj = v12;
      id v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v36;
        uint64_t v26 = *(void *)v36;
        id v27 = v7;
        do
        {
          v16 = 0;
          id v29 = v14;
          do
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v16);
            if ([v7 hasPrefix:v17])
            {
              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              v18 = [(FinHealthTextSimilarityFeatures *)v28 categoriesExpansionDict];
              id v19 = [v18 valueForKey:v17];

              id v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v20)
              {
                id v21 = v20;
                uint64_t v22 = *(void *)v32;
                do
                {
                  for (i = 0; i != v21; i = (char *)i + 1)
                  {
                    if (*(void *)v32 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                    id v25 = +[NSDecimalNumber decimalNumberWithString:@"0.55"];
                    [v6 setValue:v25 forKey:v24];
                  }
                  id v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
                }
                while (v21);
              }

              uint64_t v15 = v26;
              id v7 = v27;
              id v14 = v29;
            }
            v16 = (char *)v16 + 1;
          }
          while (v16 != v14);
          id v14 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v14);
      }
    }
  }
  else
  {
  }
}

- (void)semanticTagsForMerchant:(id)a3 detailedCategory:(id)a4 dateHour:(id)a5 completion:(id)a6
{
  id v42 = a3;
  id v44 = a4;
  id v43 = a5;
  unsigned __int8 v10 = (void (**)(id, void *))a6;
  if (v10)
  {
    NLTagScheme v41 = v10;
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = sub_10001281C;
    v58 = sub_10001282C;
    id v59 = (id)objc_opt_new();
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100013764;
    v53[3] = &unk_100031988;
    v53[4] = &v54;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100013848;
    v51[3] = &unk_1000319D8;
    v51[4] = self;
    v46 = objc_retainBlock(v53);
    id v52 = v46;
    v45 = objc_retainBlock(v51);
    if (v44 && ([v44 isEqualToString:FHDetailedCategoryUndefined] & 1) == 0)
    {
      uint64_t v11 = [v44 componentsSeparatedByString:@"."];
      for (unint64_t i = 0; (unint64_t)[v11 count] > i; ++i)
      {
        id v14 = [v11 count];
        uint64_t v15 = [v11 objectAtIndex:i];
        v16 = objc_msgSend(v11, "subarrayWithRange:", 0, i + 1);
        uint64_t v17 = [v16 componentsJoinedByString:@"."];

        v18 = [(FinHealthTextSimilarityFeatures *)self categoriesLocalizationDict];
        double v19 = 1.0 - (float)((float)(int)i / (float)(unint64_t)v14);
        if (!v18) {
          goto LABEL_9;
        }
        id v20 = [(FinHealthTextSimilarityFeatures *)self categoriesLocalizationDict];
        id v21 = [v20 valueForKey:v17];
        BOOL v22 = v21 == 0;

        if (v22)
        {
LABEL_9:
          uint64_t v24 = [(FinHealthTextSimilarityFeatures *)self _tokenize:v15 shouldLemmatize:0];
          id v25 = [v24 count];
          uint64_t v26 = (void (*)(void *, void *, double))v46[2];
          if ((unint64_t)v25 <= 1)
          {
            v26(v46, v15, v19);
            id v27 = v45;
            uint64_t v26 = (void (*)(void *, void *, double))v45[2];
          }
          else
          {
            id v27 = v46;
          }
          v26(v27, v15, v19);
        }
        else
        {
          v23 = [(FinHealthTextSimilarityFeatures *)self categoriesLocalizationDict];
          uint64_t v24 = [v23 valueForKey:v17];

          ((void (*)(void *, void *, double))v46[2])(v46, v24, v19);
          ((void (*)(void *, void *, double))v45[2])(v45, v24, v19);
        }
      }
    }
    if (includeExpandedCategoryTags) {
      [(FinHealthTextSimilarityFeatures *)self applyCategoryHeuristics:v55[5] detailedCategory:v44];
    }
    if (includeTimeBasedTags) {
      [(FinHealthTextSimilarityFeatures *)self applyTimingHeuristics:v55[5] detailedCategory:v44 dateHour:v43];
    }
    id v28 = objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v29 = (id)v55[5];
    id v30 = [v29 countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v48;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v48 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = *(void *)(*((void *)&v47 + 1) + 8 * (void)j);
          id v34 = objc_alloc((Class)FHSmartCompoundFeatureRankedValue);
          long long v35 = [(id)v55[5] objectForKeyedSubscript:v33];
          id v36 = [v34 initWithLabelAndRank:v33 featureRank:v35];

          [v28 addObject:v36];
        }
        id v30 = [v29 countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v30);
    }

    [v28 sortUsingComparator:&stru_100031A18];
    id v37 = [v28 count];
    if ((unint64_t)v37 >= 0xA) {
      uint64_t v38 = 10;
    }
    else {
      uint64_t v38 = (uint64_t)v37;
    }
    id v39 = objc_msgSend(v28, "subarrayWithRange:", 0, v38);
    objc_super v40 = +[NSDictionary dictionaryWithObject:v39 forKey:FHSmartFeatureCompoundTypeSoldProducts];
    v41[2](v41, v40);

    _Block_object_dispose(&v54, 8);
    unsigned __int8 v10 = v41;
  }
}

- (NSRegularExpression)boundaryRegex
{
  return self->_boundaryRegex;
}

- (NSRegularExpression)specialCharsRegex
{
  return self->_specialCharsRegex;
}

- (NLEmbedding)nlEmbedding
{
  return self->_nlEmbedding;
}

- (NLModel)nlModel
{
  return self->_nlModel;
}

- (NLTagger)nlTagger
{
  return self->_nlTagger;
}

- (NSDictionary)categoriesExpansionDict
{
  return self->_categoriesExpansionDict;
}

- (NSDictionary)categoriesLocalizationDict
{
  return self->_categoriesLocalizationDict;
}

- (NSSet)stopWords
{
  return self->_stopWords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopWords, 0);
  objc_storeStrong((id *)&self->_categoriesLocalizationDict, 0);
  objc_storeStrong((id *)&self->_categoriesExpansionDict, 0);
  objc_storeStrong((id *)&self->_nlTagger, 0);
  objc_storeStrong((id *)&self->_nlModel, 0);
  objc_storeStrong((id *)&self->_nlEmbedding, 0);
  objc_storeStrong((id *)&self->_specialCharsRegex, 0);
  objc_storeStrong((id *)&self->_boundaryRegex, 0);
}

@end