@interface CDInteractionsStatistics
@end

@implementation CDInteractionsStatistics

void __49___CDInteractionsStatistics_descriptionRedacted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v6 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 40);
    id v8 = a3;
    v9 = [v7 privatizedConversationId:a2];
    [v6 appendFormat:@"conversationId: %@ \n", v9];
  }
  else
  {
    id v10 = a3;
    [v6 appendFormat:@"conversationId: %@ \n", a2];
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tnumberOfFeatures: %tu \n", objc_msgSend(a3, "count"));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49___CDInteractionsStatistics_descriptionRedacted___block_invoke_2;
  v16[3] = &unk_1E56106D8;
  id v17 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v16];

  v11 = *(void **)(a1 + 32);
  v12 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:a2];
  objc_msgSend(v11, "appendFormat:", @"\tnumberOfProperties: %tu \n", objc_msgSend(v12, "count"));

  v13 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:a2];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49___CDInteractionsStatistics_descriptionRedacted___block_invoke_3;
  v14[3] = &unk_1E5610700;
  id v15 = *(id *)(a1 + 32);
  [v13 enumerateKeysAndObjectsUsingBlock:v14];
}

uint64_t __49___CDInteractionsStatistics_descriptionRedacted___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t\t%@: %@ \n", a2, a3];
}

uint64_t __49___CDInteractionsStatistics_descriptionRedacted___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t\t%@: %@\n", a2, a3];
}

void __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke_2;
  v18[3] = &unk_1E5610750;
  v4 = *(void **)(a1 + 32);
  v18[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v19 = v5;
  v6 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v18);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke_3;
  id v15 = &unk_1E5610750;
  v7 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = v5;
  id v8 = v5;
  v9 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &v12);
  id v10 = objc_msgSend(v6, "valueForKeyPath:", @"@max.self", v12, v13, v14, v15, v16);
  v11 = [v9 valueForKeyPath:@"@max.self"];
  [*(id *)(a1 + 40) setValue:v10 forFeature:@"numberOfSharesOfPeopleInPhotoWithConversation" andConversationId:v8];
  [*(id *)(a1 + 40) setValue:v11 forFeature:@"numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation" andConversationId:v8];
}

id __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v2];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

id __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v2];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

@end