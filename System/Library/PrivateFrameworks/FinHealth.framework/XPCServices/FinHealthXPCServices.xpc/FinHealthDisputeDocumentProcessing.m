@interface FinHealthDisputeDocumentProcessing
+ (id)sharedInstance;
- (BOOL)isTransactionAddressFieldPresentIn:(id)a3 forTransactionAddressField:(id)a4;
- (NSArray)rankingDimensionFactors;
- (NSDictionary)dimensionsDict;
- (id)_init;
- (id)fetchReceiptPhotosFromDate:(id)a3;
- (id)generateRankingScore:(id)a3 forTransaction:(id)a4;
- (id)getDisputeDocumentSuggestionsForTransaction:(id)a3;
- (id)getDisputeDocumentSuggestionsForTransaction:(id)a3 withDisputeDocumentType:(unint64_t)a4;
- (id)processDisputeDocument:(id)a3;
- (id)sortDisputeDocumentSuggestions:(id)a3;
@end

@implementation FinHealthDisputeDocumentProcessing

+ (id)sharedInstance
{
  if (qword_100037988 != -1) {
    dispatch_once(&qword_100037988, &stru_100031880);
  }
  v2 = (void *)qword_100037990;
  return v2;
}

- (id)_init
{
  v33.receiver = self;
  v33.super_class = (Class)FinHealthDisputeDocumentProcessing;
  v2 = [(FinHealthDisputeDocumentProcessing *)&v33 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 pathForResource:@"dispute_document_ranking_dimensions" ofType:@"json" inDirectory:@"FeaturesResources"];
    v5 = +[NSData dataWithContentsOfFile:v4];
    id v32 = 0;
    uint64_t v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:1 error:&v32];
    id v7 = v32;
    dimensionsDict = v2->_dimensionsDict;
    v2->_dimensionsDict = (NSDictionary *)v6;

    if (v7)
    {
      v9 = FinHealthLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error generating dispute document ranking dimensions dict", v31, 2u);
      }
    }
    else
    {
      v9 = objc_opt_new();
      id v10 = objc_alloc((Class)NSDecimalNumber);
      v11 = [(NSDictionary *)v2->_dimensionsDict objectForKey:FHDisputeDocumentRankingDimensionDateTimeKey];
      [v11 doubleValue];
      id v12 = objc_msgSend(v10, "initWithDouble:");
      [v9 addObject:v12];

      id v13 = objc_alloc((Class)NSDecimalNumber);
      v14 = [(NSDictionary *)v2->_dimensionsDict objectForKey:FHDisputeDocumentRankingDimensionMerchantKey];
      [v14 doubleValue];
      id v15 = objc_msgSend(v13, "initWithDouble:");
      [v9 addObject:v15];

      id v16 = objc_alloc((Class)NSDecimalNumber);
      v17 = [(NSDictionary *)v2->_dimensionsDict objectForKey:FHDisputeDocumentRankingDimensionLocationStreetKey];
      [v17 doubleValue];
      id v18 = objc_msgSend(v16, "initWithDouble:");
      [v9 addObject:v18];

      id v19 = objc_alloc((Class)NSDecimalNumber);
      v20 = [(NSDictionary *)v2->_dimensionsDict objectForKey:FHDisputeDocumentRankingDimensionLocationStateKey];
      [v20 doubleValue];
      id v21 = objc_msgSend(v19, "initWithDouble:");
      [v9 addObject:v21];

      id v22 = objc_alloc((Class)NSDecimalNumber);
      v23 = [(NSDictionary *)v2->_dimensionsDict objectForKey:FHDisputeDocumentRankingDimensionLocationCityKey];
      [v23 doubleValue];
      id v24 = objc_msgSend(v22, "initWithDouble:");
      [v9 addObject:v24];

      id v25 = objc_alloc((Class)NSDecimalNumber);
      v26 = [(NSDictionary *)v2->_dimensionsDict objectForKey:FHDisputeDocumentRankingDimensionLocationZipKey];
      [v26 doubleValue];
      id v27 = objc_msgSend(v25, "initWithDouble:");
      [v9 addObject:v27];

      v28 = [v9 copy];
      rankingDimensionFactors = v2->_rankingDimensionFactors;
      v2->_rankingDimensionFactors = v28;
    }
  }
  return v2;
}

- (id)getDisputeDocumentSuggestionsForTransaction:(id)a3
{
  return [(FinHealthDisputeDocumentProcessing *)self getDisputeDocumentSuggestionsForTransaction:a3 withDisputeDocumentType:1];
}

- (id)getDisputeDocumentSuggestionsForTransaction:(id)a3 withDisputeDocumentType:(unint64_t)a4
{
  id v6 = a3;
  v8 = objc_opt_new();
  v9 = v8;
  if (a4 == 1)
  {
    v39 = v7;
    v41 = v6;
    id v10 = [v6 transactionDate];
    uint64_t v11 = [v10 dateByAddingTimeInterval:-secondsForThreeHours];

    v40 = self;
    v38 = (void *)v11;
    id v12 = [(FinHealthDisputeDocumentProcessing *)self fetchReceiptPhotosFromDate:v11];
    id v13 = FinHealthLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v48 = [v12 count];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "photoFetchResult count %lu", buf, 0xCu);
    }

    if ([v12 count])
    {
      unint64_t v14 = 0;
      uint64_t v44 = photoSuggestionDefaultScore;
      v42 = v9;
      v43 = v12;
      do
      {
        id v16 = [v12 objectAtIndex:v14];
        v17 = [v16 characterRecognitionProperties];
        id v18 = [v17 characterRecognitionData];

        id v19 = +[NSDecimalNumber decimalNumberWithString:v44];
        if (v18)
        {
          v45 = v15;
          uint64_t v21 = objc_opt_class();
          id v46 = 0;
          id v22 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v21 fromData:v18 error:&v46];
          id v23 = v46;
          if (v23)
          {
            id v24 = FinHealthLogObject();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v25 = [v16 uuid];
              *(_DWORD *)buf = 138412546;
              id v48 = v25;
              __int16 v49 = 2112;
              id v50 = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error unarchiving photo %@ : %@", buf, 0x16u);

              v9 = v42;
            }
          }
          if (v22)
          {
            v26 = [v22 getTranscript];
            id v27 = [(FinHealthDisputeDocumentProcessing *)v40 processDisputeDocument:v26];
            uint64_t v28 = [(FinHealthDisputeDocumentProcessing *)v40 generateRankingScore:v27 forTransaction:v41];

            v9 = v42;
            id v19 = (void *)v28;
          }
          id v12 = v43;

          id v15 = v45;
        }
        id v29 = objc_alloc((Class)FHSmartCompoundFeatureRankedValue);
        v30 = [v16 uuid];
        id v31 = [v29 initWithLabelAndRank:v30 featureRank:v19];

        id v32 = [objc_alloc((Class)FHSmartFeatureDisputeDocumentSuggestion) initWithRankedValue:v31 type:1];
        [v9 addObject:v32];

        ++v14;
      }
      while (v14 < (unint64_t)[v12 count]);
    }
    id v33 = [v9 copy];
    id v34 = [(FinHealthDisputeDocumentProcessing *)v40 sortDisputeDocumentSuggestions:v33];

    v35 = FinHealthLogObject();
    id v6 = v41;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = [v41 identifier];
      *(_DWORD *)buf = 138412546;
      id v48 = v36;
      __int16 v49 = 2112;
      id v50 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Dispute Document Suggestions for %@ : %@", buf, 0x16u);
    }
    id v7 = v39;
  }
  else
  {
    id v34 = [v8 copy];
  }

  return v34;
}

- (id)fetchReceiptPhotosFromDate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = +[NSPredicate predicateWithFormat:@"dateCreated >= %@", v3];

  id v6 = +[NSPredicate predicateWithFormat:@"SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier == %d AND $s.confidence > 0.9).@count > 0", PHAssetJunkSceneClassificationIdentifierReceiptOrDocument];
  v13[0] = v5;
  v13[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v13 count:2];
  v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  [v4 setInternalPredicate:v8];

  [v4 setFetchLimit:photoFetchLimit];
  uint64_t v12 = PHAssetPropertySetCharacterRecognition;
  v9 = +[NSArray arrayWithObjects:&v12 count:1];
  [v4 setFetchPropertySets:v9];

  id v10 = +[PHAsset fetchAssetsWithOptions:v4];

  return v10;
}

- (id)sortDisputeDocumentSuggestions:(id)a3
{
  id v3 = [a3 sortedArrayUsingComparator:&stru_1000318C0];
  unint64_t v4 = photoSuggestionDefaultNum;
  id v5 = [v3 count];
  if (v4 >= (unint64_t)v5) {
    id v6 = v5;
  }
  else {
    id v6 = (id)v4;
  }
  id v7 = objc_msgSend(v3, "subarrayWithRange:", 0, v6);

  return v7;
}

- (id)processDisputeDocument:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v28 = 0;
  id v6 = +[NSDataDetector dataDetectorWithTypes:24 error:&v28];
  id v23 = v28;
  id v22 = v6;
  objc_msgSend(v6, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unint64_t v14 = [v12 addressComponents];

        if (v14)
        {
          id v15 = [v12 addressComponents];
          [v4 addObject:v15];
        }
        id v16 = [v12 date];

        if (v16)
        {
          v17 = [v12 date];
          [v5 addObject:v17];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v9);
  }

  v29[0] = FHDisputeDocumentProcessingLocationKey;
  id v18 = [v4 copy];
  v30[0] = v18;
  v29[1] = FHDisputeDocumentProcessingDateKey;
  id v19 = [v5 copy];
  v29[2] = FHDisputeDocumentProcessingTextKey;
  v30[1] = v19;
  v30[2] = v3;
  v20 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

  return v20;
}

- (id)generateRankingScore:(id)a3 forTransaction:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  id v29 = [v6 displayName];
  id v7 = [v6 transactionDate];
  id v28 = [v30 objectForKeyedSubscript:FHDisputeDocumentProcessingDateKey];
  long long v27 = [v30 objectForKeyedSubscript:FHDisputeDocumentProcessingLocationKey];
  long long v26 = [v30 objectForKey:FHDisputeDocumentProcessingTextKey];
  NSUInteger v25 = [(NSArray *)self->_rankingDimensionFactors count];
  id v8 = +[NSDecimalNumber decimalNumberWithString:photoSuggestionDefaultScore];
  id v9 = objc_opt_new();
  uint64_t v48 = 0;
  __int16 v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = sub_100011C18;
  v52 = sub_100011C28;
  uint64_t v10 = rankingDimensionsDefaultScore;
  id v53 = +[NSDecimalNumber decimalNumberWithString:rankingDimensionsDefaultScore];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100011C30;
  v45[3] = &unk_1000318E8;
  v45[4] = self;
  id v24 = v7;
  id v46 = v24;
  v47 = &v48;
  [v28 enumerateObjectsUsingBlock:v45];
  [v9 addObject:v49[5]];
  uint64_t v11 = +[NSDecimalNumber decimalNumberWithString:v10];
  if (v29)
  {
    uint64_t v12 = [v26 lowercaseString];
    id v13 = [v29 lowercaseString];
    BOOL v14 = [v12 rangeOfString:v13] == (id)0x7FFFFFFFFFFFFFFFLL;

    if (!v14)
    {
      uint64_t v15 = [(NSArray *)self->_rankingDimensionFactors objectAtIndex:1];

      uint64_t v11 = (void *)v15;
    }
  }
  [v9 addObject:v11];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_100011C18;
  v43 = sub_100011C28;
  id v44 = +[NSDecimalNumber decimalNumberWithString:v10];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100011D3C;
  v36[3] = &unk_100031910;
  v36[4] = self;
  id v16 = v6;
  id v37 = v16;
  v38 = &v39;
  [v27 enumerateObjectsUsingBlock:v36];
  [v9 addObject:v40[5]];
  if ([v9 count] != (id)(v25 - 3))
  {
    v17 = FinHealthLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Ranking scores computed not equal to number of ranking dimensions", buf, 2u);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v9;
  id v19 = [v18 countByEnumeratingWithState:&v31 objects:v54 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v32;
    do
    {
      uint64_t v21 = 0;
      id v22 = v8;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v18);
        }
        id v8 = [v22 decimalNumberByAdding:*(void *)(*((void *)&v31 + 1) + 8 * (void)v21)];

        uint64_t v21 = (char *)v21 + 1;
        id v22 = v8;
      }
      while (v19 != v21);
      id v19 = [v18 countByEnumeratingWithState:&v31 objects:v54 count:16];
    }
    while (v19);
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v48, 8);

  return v8;
}

- (BOOL)isTransactionAddressFieldPresentIn:(id)a3 forTransactionAddressField:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = a4;
  id v6 = [a3 lowercaseString];
  id v7 = [v5 lowercaseString];

  LOBYTE(v5) = [v6 containsString:v7];
  return (char)v5;
}

- (NSDictionary)dimensionsDict
{
  return self->_dimensionsDict;
}

- (NSArray)rankingDimensionFactors
{
  return self->_rankingDimensionFactors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingDimensionFactors, 0);
  objc_storeStrong((id *)&self->_dimensionsDict, 0);
}

@end