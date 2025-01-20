@interface DKBiomeQuery
@end

@implementation DKBiomeQuery

id __38___DKBiomeQuery__publisherForStreams___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)MEMORY[0x192FB2F20]();
  v4 = [v2 allValues];
  v5 = [v4 bpsPublisher];

  return v5;
}

uint64_t __55___DKBiomeQuery_biomeExclusiveStreamsFromEventStreams___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 name];
  uint64_t v4 = [v2 canShimDuetStreamNamed:v3];

  return v4;
}

uint64_t __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 valueForKey:@"dkEvent"];
}

uint64_t __40___DKBiomeQuery_executeBiomeQueryError___block_invoke_679(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t __54___DKBiomeQuery_duetExclusiveStreamsFromEventStreams___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 name];
  uint64_t v4 = [v2 canShimDuetStreamNamed:v3] ^ 1;

  return v4;
}

void __40___DKBiomeQuery_executeBiomeQueryError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __40___DKBiomeQuery_executeBiomeQueryError___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

id __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5[4] || v5[3])
  {
    NSUInteger v6 = [v3 count];
    uint64_t v7 = *(void *)(a1 + 32);
    v15.length = *(void *)(v7 + 24);
    v15.location = *(void *)(v7 + 32);
    v16.location = 0;
    v16.length = v6;
    NSRange v8 = NSIntersectionRange(v15, v16);
    if (v8.length)
    {
      v9 = [v4 sortedArrayUsingDescriptors:*(void *)(*(void *)(a1 + 32) + 40)];
      v10 = v9;
      if (v8.length == v6)
      {
        id v11 = v9;
      }
      else
      {
        objc_msgSend(v9, "subarrayWithRange:", v8.location, v8.length);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v12 = [v3 sortedArrayUsingDescriptors:v5[5]];
  }

  return v12;
}

id __33___DKBiomeQuery_bmdkEventStreams__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc((Class)getBMDKEventStreamClass()) initWithDKStreamIdentifier:*(void *)(a1 + 32) contentProtection:*MEMORY[0x1E4F28358]];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return v5;
}

uint64_t __44___DKBiomeQuery_deletionPredicateFromArray___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x192FB2F20]();
  BMDKEventClass = (objc_class *)getBMDKEventClass();
  if ([(objc_class *)BMDKEventClass instancesRespondToSelector:sel_initWithData_dataVersion_decodeMetadata_])
  {
    id v6 = [BMDKEventClass alloc];
    uint64_t v7 = [v3 eventBodyData];
    NSRange v8 = objc_msgSend(v6, "initWithData:dataVersion:decodeMetadata:", v7, objc_msgSend(v3, "eventBodyDataVersion"), *(unsigned __int8 *)(*(void *)(a1 + 32) + 65));
  }
  else
  {
    NSRange v8 = [v3 eventBody];
  }
  v9 = [v8 dkEvent];
  v10 = [v9 creationDate];
  [v9 setLocalCreationDate:v10];

  id v11 = objc_opt_new();
  v12 = [*(id *)(a1 + 32) filterExcludedMetadataWithDKEvent:v9];
  [v11 setDkEvent:v12];

  return v11;
}

uint64_t __38___DKBiomeQuery__publisherForStreams___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) evaluateWithObject:v3];

  return v5;
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_617(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5)
  {
    NSRange v8 = (void *)MEMORY[0x192FB2F20]();
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue") + 1);
  }

  return v7;
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_2_621(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x192FB2F20]();
  id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v5 = [v2 startDate];
  id v6 = [v2 endDate];
  uint64_t v7 = (void *)[v4 initWithStartDate:v5 endDate:v6];

  return v7;
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  context = (void *)MEMORY[0x192FB2F20]();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v12 = [v3 valueForKeyPath:v11];
        if (v12)
        {
          [v4 setObject:v12 forKeyedSubscript:v11];
          if ([*(id *)(*(void *)(a1 + 40) + 56) containsObject:v11]) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  if (*(void *)(*(void *)(a1 + 40) + 48) == 5)
  {
    v13 = [v3 endDate];
    v14 = [v3 startDate];
    [v13 timeIntervalSinceDate:v14];
    double v16 = v15;

    v17 = [v3 startDate];
    [v4 setObject:v17 forKeyedSubscript:@"startDate"];

    v18 = [NSNumber numberWithDouble:v16];
    v19 = @"duration";
  }
  else
  {
    v20 = [v5 valueForKey:@"description"];
    v18 = objc_msgSend(v20, "_pas_componentsJoinedByString:", @"-");

    v19 = @"__groupByKey__";
  }
  [v4 setObject:v18 forKeyedSubscript:v19];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v4];

  return v21;
}

uint64_t __38___DKBiomeQuery__publisherForStreams___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"__groupByKey__"];
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v8 = (void *)[v5 mutableCopy];
  if (![v8 count])
  {
    [v8 addEntriesFromDictionary:v6];
    [v8 removeObjectForKey:@"__groupByKey__"];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v9 != 6)
  {
    if (v9 != 4) {
      goto LABEL_11;
    }
    v10 = [v8 objectForKeyedSubscript:@"count"];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
    v12 = v8;
    v13 = v11;
    v14 = @"count";
    goto LABEL_9;
  }
  v10 = [v8 objectForKeyedSubscript:@"endDate"];
  uint64_t v11 = [v6 objectForKeyedSubscript:@"endDate"];
  if (!v10)
  {
    v14 = @"endDate";
    v12 = v8;
    v13 = v11;
LABEL_9:
    [v12 setObject:v13 forKeyedSubscript:v14];
    goto LABEL_10;
  }
  double v15 = [v10 laterDate:v11];
  [v8 setObject:v15 forKeyedSubscript:@"endDate"];

LABEL_10:
LABEL_11:
  double v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v8];

  return v16;
}

id __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  [v4 addObject:a3];
  return v4;
}

uint64_t __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dkEvent];
}

BOOL __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void *)(v3 + 24);
  BOOL result = v2 <= v4 && v4 < *(void *)(v1 + 24) + v2;
  *(void *)(v3 + 24) = v4 + 1;
  return result;
}

id __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  [v4 addObject:a3];
  return v4;
}

id __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bpsPublisher];
  id v4 = v3;
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v5 = [v3 mapWithTransform:&__block_literal_global_668];

    id v4 = (void *)v5;
  }
  return v4;
}

uint64_t __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 dkEvent];
}

uint64_t __38___DKBiomeQuery_executeDeletionQuery___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x192FB2F20]();
  BMDKEventClass = (objc_class *)getBMDKEventClass();
  if ([(objc_class *)BMDKEventClass instancesRespondToSelector:sel_initWithData_dataVersion_decodeMetadata_])
  {
    id v8 = [BMDKEventClass alloc];
    uint64_t v9 = [v5 eventBodyData];
    v10 = objc_msgSend(v8, "initWithData:dataVersion:decodeMetadata:", v9, objc_msgSend(v5, "eventBodyDataVersion"), *(unsigned __int8 *)(a1[4] + 65));
  }
  else
  {
    v10 = [v5 eventBody];
  }
  uint64_t v11 = [v10 dkEvent];
  v12 = [v11 creationDate];
  [v11 setLocalCreationDate:v12];

  v13 = objc_opt_new();
  [v13 setDkEvent:v11];
  v14 = *(void **)(a1[4] + 16);
  if (v14 && ![v14 evaluateWithObject:v13])
  {
    uint64_t v17 = 0;
  }
  else
  {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
    unint64_t v15 = *(void *)(a1[4] + 24);
    if (v15)
    {
      unint64_t v16 = *(void *)(*(void *)(a1[5] + 8) + 24) + *(void *)(*(void *)(a1[6] + 8) + 24);
      uint64_t v17 = 1;
      if (v16 >= v15) {
        *a3 = 1;
      }
    }
    else
    {
      uint64_t v17 = 1;
    }
  }

  return v17;
}

void __40___DKBiomeQuery_executeBiomeQueryError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "_DKBiomeQuery publisher sink completion: %@", (uint8_t *)&v2, 0xCu);
}

@end