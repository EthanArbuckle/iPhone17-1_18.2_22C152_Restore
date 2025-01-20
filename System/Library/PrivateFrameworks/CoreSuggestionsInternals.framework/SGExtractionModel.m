@interface SGExtractionModel
+ (id)argMaxForLastOutput:(id)a3;
+ (id)argMaxForOutputIndex:(id)a3 index:(int)a4 shape:(id)a5;
+ (id)argMaxForSequence:(id)a3;
+ (id)enrichTaggedCharacterRangesWithModelOutput:(id)a3 usingInputCharacterRanges:(id)a4;
+ (id)inputDictFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5;
+ (id)inputDictFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5 pflTraining:(BOOL)a6 hasEvent:(BOOL)a7;
+ (id)loadLazyPlistWithBasename:(id)a3;
+ (id)modelOutputFromOutputMapping:(id)a3 modelOutput:(id)a4 modelInput:(id)a5;
+ (id)modelsDirectoryName;
+ (unint64_t)featureDimensionForInputSection:(id)a3 forModel:(id)a4;
+ (void)cleanLegacyModelsDirectoryOfModelsNamed:(id)a3;
+ (void)cleanModelAssets;
+ (void)cleanModelsDirectoryOfModelsNamed:(id)a3;
+ (void)writeDummyRecordInStore;
+ (void)writeToBiomeStreamWithInput:(id)a3;
- (id)currentModelURLForModelName:(id)a3;
@end

@implementation SGExtractionModel

+ (id)modelsDirectoryName
{
  return @"SGExtractionModels";
}

+ (void)cleanLegacyModelsDirectoryOfModelsNamed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = +[SGPaths suggestionsDirectoryAfterCreatingIfNeeded:0];
  v6 = [v4 enumeratorAtPath:v5];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    v9 = (void *)v7;
    *(void *)&long long v8 = 138412290;
    long long v15 = v8;
    do
    {
      if (objc_msgSend(v9, "containsString:", v3, v15)
        && (([v9 containsString:@"mlmodel"] & 1) != 0
         || [v9 containsString:@"mlmodelc"]))
      {
        v10 = [v5 stringByAppendingPathComponent:v9];
        id v16 = 0;
        int v11 = [v4 removeItemAtPath:v10 error:&v16];
        id v12 = v16;

        if (!v11 || v12)
        {
          v13 = sgLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v18 = v9;
            _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGExtractionModel: Couldn't delete model file: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v14 = [v6 nextObject];

      v9 = (void *)v14;
    }
    while (v14);
  }
}

+ (void)cleanModelsDirectoryOfModelsNamed:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [a1 modelsDirectoryName];
  uint64_t v7 = +[SGPaths suggestionsSubdirectory:v6 creatingDirectoriesIfNeeded:0];

  if ([v5 fileExistsAtPath:v7])
  {
    long long v8 = [v5 enumeratorAtPath:v7];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      int v11 = (void *)v9;
      *(void *)&long long v10 = 138412290;
      long long v17 = v10;
      do
      {
        if (objc_msgSend(v11, "containsString:", v4, v17))
        {
          id v12 = [v7 stringByAppendingPathComponent:v11];
          id v18 = 0;
          int v13 = [v5 removeItemAtPath:v12 error:&v18];
          id v14 = v18;

          if (!v13 || v14)
          {
            long long v15 = sgLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v20 = v11;
              _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "SGExtractionModel: Couldn't delete model file: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v16 = [v8 nextObject];

        int v11 = (void *)v16;
      }
      while (v16);
    }
  }
}

+ (void)cleanModelAssets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v13[0] = @"ReminderModel";
  v13[1] = @"StructuredEventModel";
  v13[2] = @"structuredEventGazetteer";
  id v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 3, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        [a1 cleanLegacyModelsDirectoryOfModelsNamed:v8];
        [a1 cleanModelsDirectoryOfModelsNamed:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

+ (id)enrichTaggedCharacterRangesWithModelOutput:(id)a3 usingInputCharacterRanges:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v31 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  uint64_t v8 = off_1E65B4000;
  long long v9 = v6;
  uint64_t v36 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        long long v11 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        if ([v11 count])
        {
          unint64_t v12 = 0;
          do
          {
            if ([v7 count] <= v12)
            {
              int v13 = objc_opt_new();
              [v7 addObject:v13];
            }
            id v14 = [v11 objectAtIndexedSubscript:v12];
            char v15 = [v14 isEqualToString:@"NONE"];

            if ((v15 & 1) == 0)
            {
              uint64_t v16 = [v7 objectAtIndexedSubscript:v12];
              id v17 = [NSString alloc];
              id v18 = +[SGTaggedCharacterRange annotationTypeUniqueIdentifier:10];
              uint64_t v19 = [v11 objectAtIndexedSubscript:v12];
              v20 = (void *)[v17 initWithFormat:@"%@_%@", v18, v19];
              [v16 addObject:v20];

              uint64_t v8 = off_1E65B4000;
              id v6 = v9;
            }
            ++v12;
          }
          while ([v11 count] > v12);
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v36);
  }

  if ([v7 count])
  {
    unint64_t v21 = 0;
    do
    {
      id v32 = objc_alloc(v8[305]);
      v37 = [v6 objectAtIndexedSubscript:v21];
      v35 = [v37 tags];
      v33 = [v7 objectAtIndexedSubscript:v21];
      v22 = [v35 arrayByAddingObjectsFromArray:v33];
      v23 = [v6 objectAtIndexedSubscript:v21];
      uint64_t v24 = [v23 range];
      uint64_t v26 = v25;
      v27 = [v9 objectAtIndexedSubscript:v21];
      v28 = [v27 text];
      v29 = objc_msgSend(v32, "initWithAnnotationType:tags:range:text:", 4, v22, v24, v26, v28);
      [v31 addObject:v29];

      uint64_t v8 = off_1E65B4000;
      id v6 = v9;

      ++v21;
    }
    while ([v7 count] > v21);
  }

  return v31;
}

+ (id)argMaxForOutputIndex:(id)a3 index:(int)a4 shape:(id)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v7, "count") > 1);
  if ([v8 integerValue] < 1)
  {
    unsigned int v20 = -1;
  }
  else
  {
    uint64_t v9 = 0;
    unsigned int v20 = -1;
    double v10 = -1.0;
    do
    {
      if ((unint64_t)[v7 count] < 2)
      {
        long long v11 = [NSNumber numberWithInt:v9];
        unint64_t v21 = v11;
        unint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        id v14 = [v6 objectForKeyedSubscript:v12];
      }
      else
      {
        long long v11 = [NSNumber numberWithInt:a4];
        v22[0] = v11;
        unint64_t v12 = [NSNumber numberWithInt:v9];
        v22[1] = v12;
        int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
        id v14 = [v6 objectForKeyedSubscript:v13];
      }
      [v14 doubleValue];
      if (v15 > v10)
      {
        [v14 doubleValue];
        double v10 = v16;
        unsigned int v20 = v9;
      }

      ++v9;
    }
    while ([v8 integerValue] > v9);
  }
  id v17 = [NSNumber numberWithInt:v20];

  return v17;
}

+ (id)argMaxForLastOutput:(id)a3
{
  id v4 = a3;
  id v5 = [v4 shape];
  id v6 = [a1 argMaxForOutputIndex:v4 index:0xFFFFFFFFLL shape:v5];

  return v6;
}

+ (id)argMaxForSequence:(id)a3
{
  id v4 = a3;
  id v5 = [v4 shape];
  uint64_t v6 = [v5 count];
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v6 == 2)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:0];
    uint64_t v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "integerValue"));

    double v10 = [v5 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 integerValue];

    if (v11 >= 1)
    {
      uint64_t v12 = 0;
      do
      {
        int v13 = [a1 argMaxForOutputIndex:v4 index:v12 shape:v5];
        [v9 setObject:v13 atIndexedSubscript:v12];

        ++v12;
        id v14 = [v5 objectAtIndexedSubscript:0];
        uint64_t v15 = [v14 integerValue];
      }
      while (v15 > v12);
    }
  }
  else
  {
    double v16 = [a1 argMaxForOutputIndex:v4 index:0 shape:v5];
    uint64_t v9 = objc_msgSend(v7, "initWithObjects:", v16, 0);
  }
  return v9;
}

+ (id)modelOutputFromOutputMapping:(id)a3 modelOutput:(id)a4 modelInput:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9668;
  uint64_t v24 = __Block_byref_object_dispose__9669;
  id v25 = 0;
  id v25 = (id)objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__SGExtractionModel_modelOutputFromOutputMapping_modelOutput_modelInput___block_invoke;
  v15[3] = &unk_1E65B72F0;
  id v11 = v9;
  id v18 = &v20;
  id v19 = a1;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __73__SGExtractionModel_modelOutputFromOutputMapping_modelOutput_modelInput___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) valueForKey:v7];
  id v10 = [v8 objectForKeyedSubscript:@"mapping"];
  id v11 = [v8 objectForKeyedSubscript:@"IS_TIME_DISTRIBUTED"];
  int v12 = [v11 BOOLValue];

  id v13 = objc_opt_class();
  uint64_t v34 = a1;
  v35 = (void *)v9;
  if (v12)
  {
    id v32 = v8;
    id v33 = v7;
    id v14 = [v13 argMaxForSequence:v9];
    uint64_t v15 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          unint64_t v21 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "integerValue"));
          if (v21)
          {
            [v15 addObject:v21];
          }
          else
          {
            uint64_t v22 = sgRemindersLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "Unable to map output to label", buf, 2u);
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v18);
    }

    id v7 = v33;
    [*(id *)(*(void *)(*(void *)(v34 + 48) + 8) + 40) setObject:v15 forKeyedSubscript:v33];
    id v8 = v32;
  }
  else
  {
    id v16 = [v13 argMaxForLastOutput:v9];
    uint64_t v15 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v16, "integerValue"));
    v23 = objc_opt_new();
    uint64_t v24 = [*(id *)(a1 + 40) valueForKey:@"L"];
    id v25 = v24;
    if (v24)
    {
      uint64_t v26 = [v24 shape];
      v27 = [v26 objectAtIndexedSubscript:0];
      uint64_t v28 = [v27 unsignedIntegerValue];

      for (; v28; --v28)
        [v23 addObject:v15];
      [*(id *)(*(void *)(*(void *)(v34 + 48) + 8) + 40) setObject:v23 forKeyedSubscript:v7];
    }
    else
    {
      v29 = sgRemindersLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v29, OS_LOG_TYPE_ERROR, "Found no Lemma input when trying to extend output label to sequence length.", buf, 2u);
      }

      uint64_t v30 = *(void *)(*(void *)(v34 + 48) + 8);
      v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = 0;

      *a4 = 1;
    }
  }
}

+ (unint64_t)featureDimensionForInputSection:(id)a3 forModel:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 modelDescription];
  id v7 = [v6 inputDescriptionsByName];
  id v8 = [v7 objectForKeyedSubscript:v5];
  uint64_t v9 = [v8 multiArrayConstraint];
  id v10 = [v9 shape];

  if (v10)
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
    unint64_t v12 = [v11 unsignedIntValue];
  }
  else
  {
    id v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "featureDimensionForInputSection: Model doesn't have description for inputSection: %@", (uint8_t *)&v15, 0xCu);
    }

    unint64_t v12 = 1;
  }

  return v12;
}

+ (void)writeDummyRecordInStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F5F4F8]) initWithBundleIdentifier:@"com.apple.CoreSuggestions.SemlPlugin"];
  id v3 = v2;
  if (v2)
  {
    [v2 deleteAllSavedRecordsWithCompletion:&__block_literal_global_144_9685];
    id v4 = objc_opt_new();
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __44__SGExtractionModel_writeDummyRecordInStore__block_invoke_153;
    uint64_t v9 = &unk_1E65B72C8;
    id v10 = &unk_1F2537660;
    objc_msgSend(v3, "saveRecordWithData:recordInfo:completion:", v4);

    id v5 = v10;
  }
  else
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v12 = @"com.apple.CoreSuggestions.SemlPlugin";
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SemlTraining failed to get a DESRecordStore for %@", buf, 0xCu);
    }
  }
}

void __44__SGExtractionModel_writeDummyRecordInStore__block_invoke_153(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = sgLogHandle();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "Failed to send session stats %@ to Fides. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "Successfully sent stats %@ to Fides.", (uint8_t *)&v9, 0xCu);
  }
}

void __44__SGExtractionModel_writeDummyRecordInStore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1CA650000, v3, OS_LOG_TYPE_ERROR, "Failed to delete existing records in DESRecordStore. Error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

+ (void)writeToBiomeStreamWithInput:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = (void *)MEMORY[0x1E4F93AE0];
  id v24 = 0;
  id v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v24];
  id v6 = v24;
  uint64_t v7 = (void *)[v5 copy];
  uint64_t v8 = [v4 compress:v7 lowMemory:1];

  int v9 = sgLogHandle();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v8 length];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "JsonData: %tu bytes", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v10 = [MEMORY[0x1E4F50278] newPrivateStreamDefaultConfigurationWithStoreBasePath:@"/private/var/mobile/Library/PrivateBiomeStream/SemlPlugin/"];
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"ExamplePrivateStream" storeConfig:v10];
    uint64_t v13 = [v12 source];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    uint64_t v20 = 0;
    unint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    id v14 = [v12 publisherWithStartTime:0 endTime:0 maxEvents:&unk_1F2535880 lastN:0 reversed:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__SGExtractionModel_writeToBiomeStreamWithInput___block_invoke_2;
    v19[3] = &unk_1E65B7278;
    v19[4] = &buf;
    v19[5] = &v20;
    id v15 = (id)[v14 sinkWithCompletion:&__block_literal_global_9710 receiveInput:v19];
    uint64_t v16 = v21[3];
    if (v16 == [&unk_1F2535880 unsignedIntValue])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __49__SGExtractionModel_writeToBiomeStreamWithInput___block_invoke_3;
      v18[3] = &unk_1E65B72A0;
      v18[4] = &buf;
      [v12 pruneWithPredicateBlock:v18];
    }
    uint64_t v17 = +[ExampleEvent eventWithData:v8 dataVersion:1];
    [v13 sendEvent:v17];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&buf, 8);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "JSON data could not be generated: %@", (uint8_t *)&buf, 0xCu);
  }
}

uint64_t __49__SGExtractionModel_writeToBiomeStreamWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 timestamp];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

BOOL __49__SGExtractionModel_writeToBiomeStreamWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 timestamp];
  return v3 <= *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

+ (id)inputDictFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5 pflTraining:(BOOL)a6 hasEvent:(BOOL)a7
{
  BOOL v43 = a7;
  BOOL v49 = a6;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__9668;
  v75[4] = __Block_byref_object_dispose__9669;
  id v76 = 0;
  v46 = v9;
  uint64_t v12 = [v9 count];
  uint64_t v13 = objc_opt_new();
  id v14 = objc_opt_new();
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 1;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __104__SGExtractionModel_inputDictFromTaggedCharacterRanges_usingTokenMapping_forModel_pflTraining_hasEvent___block_invoke;
  v61[3] = &unk_1E65B7250;
  id v68 = a1;
  uint64_t v69 = v12;
  id v52 = v11;
  id v62 = v52;
  v66 = v75;
  id v63 = v10;
  v67 = &v71;
  id v48 = v13;
  id v64 = v48;
  BOOL v70 = v49;
  id v47 = v14;
  id v65 = v47;
  id v54 = v63;
  [v63 enumerateKeysAndObjectsUsingBlock:v61];
  if (!*((unsigned char *)v72 + 24))
  {
    id v41 = 0;
    goto LABEL_28;
  }
  unint64_t v51 = 0;
LABEL_3:
  if ([v46 count] > v51)
  {
    context = (void *)MEMORY[0x1CB79B230]();
    id v15 = [v46 objectAtIndexedSubscript:v51];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v44 = v15;
    uint64_t v16 = [v15 tags];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v79 count:16];
    if (!v17) {
      goto LABEL_20;
    }
    uint64_t v55 = *(void *)v58;
    id obj = v16;
    while (1)
    {
      uint64_t v18 = 0;
      uint64_t v56 = v17;
      do
      {
        if (*(void *)v58 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v57 + 1) + 8 * v18);
        uint64_t v20 = (void *)MEMORY[0x1CB79B230]();
        unint64_t v21 = objc_msgSend(v19, "substringWithRange:", 0, 1);
        uint64_t v22 = [v54 objectForKeyedSubscript:v21];
        if (v22)
        {
          uint64_t v23 = (void *)MEMORY[0x1CB79B230]();
          unint64_t v24 = [a1 featureDimensionForInputSection:v21 forModel:v52];
          id v25 = [v19 substringFromIndex:2];
          uint64_t v26 = [v22 objectForKeyedSubscript:v25];

          if (v26)
          {
            if (v24 < 2)
            {
              uint64_t v34 = [v48 objectForKeyedSubscript:v21];
              v35 = [NSNumber numberWithInt:v51];
              v77[0] = v35;
              v77[1] = &unk_1F25358B0;
              v77[2] = &unk_1F25358B0;
              uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
              [v34 setObject:v26 forKeyedSubscript:v36];

              if (v49)
              {
                v31 = [v47 objectForKeyedSubscript:v21];
                id v32 = [v31 objectAtIndexedSubscript:v51];
                [v32 setObject:v26 atIndexedSubscript:0];
LABEL_16:
              }
            }
            else
            {
              uint64_t v27 = [v48 objectForKeyedSubscript:v21];
              uint64_t v28 = [NSNumber numberWithInt:v51];
              v78[0] = v28;
              v78[1] = &unk_1F25358B0;
              v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v26, "unsignedIntValue"));
              v78[2] = v29;
              uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:3];
              [v27 setObject:&unk_1F2535898 forKeyedSubscript:v30];

              if (v49)
              {
                v31 = [v47 objectForKeyedSubscript:v21];
                id v32 = [v31 objectAtIndexedSubscript:v51];
                id v33 = [v32 firstObject];
                objc_msgSend(v33, "setObject:atIndexedSubscript:", &unk_1F2535898, objc_msgSend(v26, "unsignedIntValue"));

                goto LABEL_16;
              }
            }
          }
        }

        ++v18;
      }
      while (v56 != v18);
      uint64_t v16 = obj;
      uint64_t v17 = [obj countByEnumeratingWithState:&v57 objects:v79 count:16];
      if (!v17)
      {
LABEL_20:

        ++v51;
        goto LABEL_3;
      }
    }
  }
  if (v49)
  {
    long long v37 = objc_opt_new();
    [v47 setObject:v37 forKeyedSubscript:@"polarity_true"];

    long long v38 = [v47 objectForKeyedSubscript:@"polarity_true"];
    long long v39 = v38;
    if (v43) {
      long long v40 = &unk_1F2535898;
    }
    else {
      long long v40 = &unk_1F25358B0;
    }
    [v38 addObject:v40];

    [a1 writeDummyRecordInStore];
    [a1 writeToBiomeStreamWithInput:v47];
  }
  id v41 = v48;
LABEL_28:

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(v75, 8);

  return v41;
}

void __104__SGExtractionModel_inputDictFromTaggedCharacterRanges_usingTokenMapping_forModel_pflTraining_hasEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v48[3] = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  unint64_t v6 = objc_msgSend(*(id *)(a1 + 80), "featureDimensionForInputSection:forModel:");
  id v7 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
  v48[0] = v8;
  v48[1] = &unk_1F2535898;
  id v9 = [NSNumber numberWithUnsignedInteger:v6];
  v48[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v11 + 40);
  uint64_t v12 = [v7 initWithShape:v10 dataType:131104 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  uint64_t v42 = (void *)v12;
  if (v12)
  {
    unint64_t v14 = *(void *)(a1 + 88);
    uint64_t v40 = a1;
    if (v14)
    {
      unint64_t v15 = 0;
      *(void *)&long long v13 = 138412290;
      long long v38 = v13;
      do
      {
        if (v6)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (v6 < 2)
            {
              uint64_t v17 = [NSNumber numberWithInt:0];
              uint64_t v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:v41];
              id v18 = [v20 objectForKeyedSubscript:&stru_1F24EEF20];

              if (!v18)
              {
                unint64_t v21 = sgLogHandle();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = v38;
                  id v46 = v41;
                  _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "inputDictFromTaggedCharacterRanges: '' not present for inputSection: %@", buf, 0xCu);
                }

                id v18 = v17;
              }
              uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v15, v38);
              v44[0] = v19;
              v44[1] = &unk_1F25358B0;
              uint64_t v22 = [NSNumber numberWithUnsignedInteger:i];
              v44[2] = v22;
              uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
              [v42 setObject:v18 forKeyedSubscript:v23];

              a1 = v40;
            }
            else
            {
              uint64_t v17 = [NSNumber numberWithUnsignedInteger:v15];
              v47[0] = v17;
              v47[1] = &unk_1F25358B0;
              id v18 = [NSNumber numberWithUnsignedInteger:i];
              v47[2] = v18;
              uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
              [v42 setObject:&unk_1F25358B0 forKeyedSubscript:v19];
            }
          }
          unint64_t v14 = *(void *)(a1 + 88);
        }
        ++v15;
      }
      while (v15 < v14);
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v42, v41, v38);
    if (*(unsigned char *)(a1 + 96))
    {
      unint64_t v24 = objc_opt_new();
      [*(id *)(v40 + 56) setObject:v24 forKeyedSubscript:v41];

      if (*(void *)(v40 + 88))
      {
        unint64_t v26 = 0;
        *(void *)&long long v25 = 138412290;
        long long v39 = v25;
        do
        {
          uint64_t v27 = objc_opt_new();
          if (v6)
          {
            for (uint64_t j = 0; j != v6; ++j)
            {
              if (v6 < 2)
              {
                id v33 = [*(id *)(v40 + 40) objectForKeyedSubscript:v41];
                v31 = [v33 objectForKeyedSubscript:&stru_1F24EEF20];

                if (!v31)
                {
                  uint64_t v34 = sgLogHandle();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = v39;
                    id v46 = v41;
                    _os_log_error_impl(&dword_1CA650000, v34, OS_LOG_TYPE_ERROR, "inputDictFromTaggedCharacterRanges: '' not present for inputSection: %@", buf, 0xCu);
                  }

                  v31 = &unk_1F25358B0;
                }
                uint64_t v30 = v27;
                id v32 = v31;
              }
              else
              {
                if (!j)
                {
                  v29 = objc_opt_new();
                  [v27 addObject:v29];
                }
                uint64_t v30 = objc_msgSend(v27, "objectAtIndex:", 0, v39);
                v31 = v30;
                id v32 = &unk_1F25358B0;
              }
              objc_msgSend(v30, "addObject:", v32, v39);
            }
          }
          v35 = objc_msgSend(*(id *)(v40 + 56), "objectForKeyedSubscript:", v41, v39);
          [v35 addObject:v27];

          ++v26;
        }
        while (v26 < *(void *)(v40 + 88));
      }
    }
  }
  else
  {
    uint64_t v36 = sgLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      long long v37 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      id v46 = v37;
      _os_log_error_impl(&dword_1CA650000, v36, OS_LOG_TYPE_ERROR, "Unable to create input MLMultiArray: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (id)inputDictFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() inputDictFromTaggedCharacterRanges:v9 usingTokenMapping:v8 forModel:v7 pflTraining:0 hasEvent:0];

  return v10;
}

+ (id)loadLazyPlistWithBasename:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 stringByAppendingPathExtension:@"plplist"];
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"SGExtractionModel.m", 79, @"Invalid parameter not satisfying: %@", @"relPath" object file lineNumber description];
  }
  unint64_t v6 = +[SGAsset localeAsset];
  id v7 = [v6 filesystemPathForAssetDataRelativePath:v5];

  if (v7)
  {
    id v13 = 0;
    id v8 = [MEMORY[0x1E4F93B50] dictionaryWithPath:v7 error:&v13];
    id v9 = v13;
    if (v8) {
      goto LABEL_11;
    }
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      unint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);
    }
  }
  else
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      unint64_t v15 = v5;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "Unable to resolve path: %@", buf, 0xCu);
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (id)currentModelURLForModelName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SGAsset localeAsset];
  id v5 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", v3, @"mlmodelc"];

  unint64_t v6 = [v4 filesystemPathForAssetDataRelativePath:v5];

  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v6];
  }
  else
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGExtractioNModel: Unable to find URL for model", buf, 2u);
    }

    id v7 = 0;
  }

  return v7;
}

@end