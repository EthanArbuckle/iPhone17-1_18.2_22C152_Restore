@interface FAMegadomeRecommendationsLoader
+ (id)normalizedPhoneNumbersForPhoneNumbers:(id)a3;
+ (id)taggingOptions;
- (id)familyHandles;
- (id)megadomePeopleFromScoredEntities:(id)a3 inVisualIdentifierView:(id)a4;
- (id)megadomeResultsForFamilyTagWithError:(id *)a3;
- (id)peopleViewWithError:(id *)a3;
- (void)familyHandles;
@end

@implementation FAMegadomeRecommendationsLoader

+ (id)taggingOptions
{
  v16[18] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(NSNumber) initWithDouble:0.7];
  v3 = (void *)[objc_alloc(NSNumber) initWithDouble:0.82];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)getGDPersonTaggingOptionsClass_softClass;
  uint64_t v14 = getGDPersonTaggingOptionsClass_softClass;
  if (!getGDPersonTaggingOptionsClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getGDPersonTaggingOptionsClass_block_invoke;
    v10[3] = &unk_1E69253D8;
    v10[4] = &v11;
    __getGDPersonTaggingOptionsClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = [v5 alloc];
  v15[0] = @"family";
  v15[1] = @"parent";
  v16[0] = v2;
  v16[1] = v2;
  v15[2] = @"father";
  v15[3] = @"mother";
  v16[2] = v2;
  v16[3] = v2;
  v15[4] = @"child";
  v15[5] = @"daughter";
  v16[4] = v2;
  v16[5] = v2;
  v15[6] = @"son";
  v15[7] = @"sibling";
  v16[6] = v2;
  v16[7] = v2;
  v15[8] = @"brother";
  v15[9] = @"sister";
  v16[8] = v2;
  v16[9] = v2;
  v15[10] = @"partner";
  v15[11] = @"husband";
  v16[10] = v3;
  v16[11] = v2;
  v15[12] = @"wife";
  v15[13] = @"friend";
  v16[12] = v2;
  v16[13] = v2;
  v15[14] = @"coworker";
  v15[15] = @"alumni";
  v16[14] = v2;
  v16[15] = v2;
  v15[16] = @"myself";
  v15[17] = @"familyAndFriends";
  v16[16] = v2;
  v16[17] = v3;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:18];
  v8 = (void *)[v6 initWithTagThresholds:v7];

  return v8;
}

- (id)peopleViewWithError:(id *)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__FAMegadomeRecommendationsLoader_peopleViewWithError___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  aBlock[4] = a3;
  v3 = (void (**)(void *, id))_Block_copy(aBlock);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v4 = (void *)getGDViewServiceClass_softClass;
  uint64_t v18 = getGDViewServiceClass_softClass;
  if (!getGDViewServiceClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getGDViewServiceClass_block_invoke;
    v14[3] = &unk_1E69253D8;
    v14[4] = &v15;
    __getGDViewServiceClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v15, 8);
  id v6 = [v5 clientService];
  id v12 = 0;
  v7 = [v6 visualIdentifierViewWithError:&v12];
  id v8 = v12;

  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FAMegadomeRecommendationsLoader peopleViewWithError:]();
    }

    v3[2](v3, v8);
  }

  return v7;
}

void **__55__FAMegadomeRecommendationsLoader_peopleViewWithError___block_invoke(void **result, id a2)
{
  if (result[4])
  {
    v2 = result;
    result = (void **)a2;
    *v2[4] = result;
  }
  return result;
}

- (id)megadomeResultsForFamilyTagWithError:(id *)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__FAMegadomeRecommendationsLoader_megadomeResultsForFamilyTagWithError___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  aBlock[4] = a3;
  v3 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v4 = (void *)getGDConfigurationClass_softClass;
  uint64_t v29 = getGDConfigurationClass_softClass;
  if (!getGDConfigurationClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getGDConfigurationClass_block_invoke;
    v24 = &unk_1E69253D8;
    v25 = &v26;
    __getGDConfigurationClass_block_invoke((uint64_t)&v21);
    v4 = (void *)v27[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v26, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v7 = (void *)getGDEntityTaggingServiceClass_softClass;
  uint64_t v29 = getGDEntityTaggingServiceClass_softClass;
  if (!getGDEntityTaggingServiceClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getGDEntityTaggingServiceClass_block_invoke;
    v24 = &unk_1E69253D8;
    v25 = &v26;
    __getGDEntityTaggingServiceClass_block_invoke((uint64_t)&v21);
    v7 = (void *)v27[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v26, 8);
  id v19 = 0;
  id v9 = (void *)[[v8 alloc] initWithConfig:v6 error:&v19];
  id v10 = v19;
  if (v9)
  {
    uint64_t v11 = +[FAMegadomeRecommendationsLoader taggingOptions];
    id v18 = 0;
    id v12 = [v9 entitiesForTag:4 options:v11 error:&v18];
    id v13 = v18;
    if (v12)
    {
      v3[2](v3, 0);
      id v14 = v12;
    }
    else
    {
      v16 = _FALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[FAMegadomeRecommendationsLoader megadomeResultsForFamilyTagWithError:]();
      }

      ((void (**)(void *, id))v3)[2](v3, v13);
    }
  }
  else
  {
    uint64_t v15 = _FALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FAMegadomeRecommendationsLoader megadomeResultsForFamilyTagWithError:]();
    }

    ((void (**)(void *, id))v3)[2](v3, v10);
    id v12 = 0;
  }

  return v12;
}

void **__72__FAMegadomeRecommendationsLoader_megadomeResultsForFamilyTagWithError___block_invoke(void **result, id a2)
{
  if (result[4])
  {
    v2 = result;
    result = (void **)a2;
    *v2[4] = result;
  }
  return result;
}

- (id)megadomePeopleFromScoredEntities:(id)a3 inVisualIdentifierView:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "idValue"));
        id v13 = [v6 personForIdentifier:v12];
        if (v13)
        {
          id v14 = [[FAMegadomePerson alloc] initWithVisualIdentifierViewPerson:v13];
          [v7 addObject:v14];
        }
        else
        {
          _FALogSystem();
          id v14 = (FAMegadomePerson *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_impl(&dword_1D252C000, &v14->super, OS_LOG_TYPE_DEFAULT, "Did not find megadome person with identifier %@. Skipping recommendation.", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v15 = (void *)[v7 copy];
  return v15;
}

- (id)familyHandles
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  long long v20 = objc_alloc_init(FAFetchFamilyCircleRequest);
  v2 = [(FAFetchFamilyCircleRequest *)v20 fetchFamilyCircleWithError:&v25];
  id v3 = v25;
  if (v3)
  {
    v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FAMegadomeRecommendationsLoader familyHandles]();
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [v2 members];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [v11 appleID];

        if (v12)
        {
          id v13 = [v11 appleID];
          [v5 addObject:v13];
        }
        id v14 = [v11 memberPhoneNumbers];

        if (v14)
        {
          uint64_t v15 = [v11 memberPhoneNumbers];
          v16 = [v15 componentsSeparatedByString:@","];

          uint64_t v17 = +[FAMegadomeRecommendationsLoader normalizedPhoneNumbersForPhoneNumbers:v16];
          [v5 addObjectsFromArray:v17];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v18 = (void *)[v5 copy];
  return v18;
}

+ (id)normalizedPhoneNumbersForPhoneNumbers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 138412290;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v12 = objc_msgSend(MEMORY[0x1E4F1BA70], "phoneNumberWithStringValue:", v11, v17, (void)v18);
        id v13 = [v12 formattedStringValue];
        if (v13)
        {
          [v4 addObject:v13];
        }
        else
        {
          id v14 = _FALogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v11;
            _os_log_error_impl(&dword_1D252C000, v14, OS_LOG_TYPE_ERROR, "Could not normalize phone number \"%@\".", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  uint64_t v15 = (void *)[v4 copy];
  return v15;
}

- (void)peopleViewWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D252C000, v0, v1, "Error initializing megadome visual identifier view: %@", v2, v3, v4, v5, v6);
}

- (void)megadomeResultsForFamilyTagWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D252C000, v0, v1, "Error initializing megadome entity tagging service: %@", v2, v3, v4, v5, v6);
}

- (void)megadomeResultsForFamilyTagWithError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D252C000, v0, v1, "Error initializing megadome entities for Family tag: %@", v2, v3, v4, v5, v6);
}

- (void)familyHandles
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D252C000, v0, v1, "FAFetchFamilyCircleRequest failed %@", v2, v3, v4, v5, v6);
}

@end