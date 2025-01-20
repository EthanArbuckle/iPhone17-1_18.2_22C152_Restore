@interface PHMemoryAnalyticsHelper
+ (id)analyticsPayloadForMemory:(id)a3;
+ (id)isPromptSuggestedForGenerativeMemory:(id)a3;
+ (id)memoryStateStringForMemory:(id)a3;
+ (id)triggerTypesStringForMemory:(id)a3;
@end

@implementation PHMemoryAnalyticsHelper

+ (id)isPromptSuggestedForGenerativeMemory:(id)a3
{
  v3 = [a3 photosGraphProperties];
  v4 = [v3 objectForKeyedSubscript:@"generativeMemoryData"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"promptInformation"];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 objectForKeyedSubscript:@"isSuggestedPrompt"];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)triggerTypesStringForMemory:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [a3 triggerTypes];
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = +[PHMemory stringForTriggerType:](PHMemory, "stringForTriggerType:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "unsignedIntValue", (void)v16));
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }

    v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    v20 = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v13 = [v4 sortedArrayUsingDescriptors:v12];

    v14 = [v13 componentsJoinedByString:@","];
  }
  else
  {
    v14 = @"None";
  }

  return v14;
}

+ (id)memoryStateStringForMemory:(id)a3
{
  id v3 = a3;
  if ([v3 featuredState] == 1)
  {
    id v4 = @"Daily Memory";
  }
  else if ([v3 pendingState] == 2)
  {
    id v4 = @"Local Memory";
  }
  else if ([v3 creationType] == 1)
  {
    id v4 = @"Generative";
  }
  else if ([v3 isUserCreated])
  {
    id v4 = @"User Created";
  }
  else
  {
    id v4 = @"None";
  }

  return v4;
}

+ (id)analyticsPayloadForMemory:(id)a3
{
  v23[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v22[0] = @"cpa_memory_memoryType";
  v21 = [a1 memoryStateStringForMemory:v4];
  v23[0] = v21;
  v22[1] = @"cpa_memory_favorited";
  int v6 = [v4 isFavorite];
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  if (v6) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  v23[1] = v7;
  v22[2] = @"cpa_memory_playCount";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "playCount"));
  v23[2] = v8;
  v22[3] = @"cpa_memory_shareCount";
  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "shareCount"));
  v23[3] = v9;
  v22[4] = @"cpa_memory_viewCount";
  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "viewCount"));
  v23[4] = v10;
  v22[5] = @"cpa_memory_category";
  v11 = +[PHMemory stringForCategory:](PHMemory, "stringForCategory:", [v4 category]);
  v23[5] = v11;
  v22[6] = @"cpa_memory_subcategory";
  v12 = +[PHMemory stringForSubcategory:](PHMemory, "stringForSubcategory:", [v4 subcategory]);
  v23[6] = v12;
  v22[7] = @"cpa_memory_triggerType";
  v13 = [a1 triggerTypesStringForMemory:v4];
  v23[7] = v13;
  v22[8] = @"cpa_memory_colorGradeKind";
  [v4 storyColorGradeKind];
  uint64_t v14 = PFStoryColorGradeKindToString();
  v15 = (void *)v14;
  long long v16 = @"None";
  if (v14) {
    long long v16 = (__CFString *)v14;
  }
  v23[8] = v16;
  long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:9];
  long long v18 = (void *)[v5 initWithDictionary:v17];

  if ([v4 isGenerative])
  {
    long long v19 = +[PHMemoryAnalyticsHelper isPromptSuggestedForGenerativeMemory:v4];
    if (v19) {
      [v18 setValue:v19 forKey:@"memoryPromptIsSuggested"];
    }
  }

  return v18;
}

@end