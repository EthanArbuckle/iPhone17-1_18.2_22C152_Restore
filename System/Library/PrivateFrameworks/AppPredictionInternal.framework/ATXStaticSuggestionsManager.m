@interface ATXStaticSuggestionsManager
+ (BOOL)isValidPreviousPosition:(id)a3 uiLimit:(unint64_t)a4 newSuggestionsCount:(unint64_t)a5;
+ (BOOL)suggestionsAreAllAppExecutableTypeAndHaveValidHash:(id)a3;
+ (id)executableObjectHashToPositionMappingForSuggestions:(id)a3;
+ (id)preservePreviousAppPositionsForPreviousSuggestions:(id)a3 newSuggestions:(id)a4 uiLimit:(unint64_t)a5;
@end

@implementation ATXStaticSuggestionsManager

+ (id)preservePreviousAppPositionsForPreviousSuggestions:(id)a3 newSuggestions:(id)a4 uiLimit:(unint64_t)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (+[ATXStaticSuggestionsManager suggestionsAreAllAppExecutableTypeAndHaveValidHash:](ATXStaticSuggestionsManager, "suggestionsAreAllAppExecutableTypeAndHaveValidHash:", v7)&& +[ATXStaticSuggestionsManager suggestionsAreAllAppExecutableTypeAndHaveValidHash:v8])
  {
    id v30 = v7;
    v32 = +[ATXStaticSuggestionsManager executableObjectHashToPositionMappingForSuggestions:v7];
    id v9 = (id)[v8 mutableCopy];
    v31 = objc_opt_new();
    v10 = objc_opt_new();
    unint64_t v11 = [v8 count];
    if (v11 >= a5) {
      unint64_t v12 = a5;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12)
    {
      for (unint64_t i = 0; i < v20; ++i)
      {
        v14 = [v8 objectAtIndexedSubscript:i];
        v15 = NSNumber;
        v16 = [v14 executableSpecification];
        v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "executableObjectHash"));

        v18 = [v32 objectForKeyedSubscript:v17];
        if (+[ATXStaticSuggestionsManager isValidPreviousPosition:uiLimit:newSuggestionsCount:](ATXStaticSuggestionsManager, "isValidPreviousPosition:uiLimit:newSuggestionsCount:", v18, a5, [v8 count]))
        {
          objc_msgSend(v9, "setObject:atIndexedSubscript:", v14, objc_msgSend(v18, "unsignedIntegerValue"));
          objc_msgSend(v10, "addIndex:", objc_msgSend(v18, "unsignedIntegerValue"));
        }
        else
        {
          [v31 addObject:v14];
        }

        unint64_t v19 = [v8 count];
        if (v19 >= a5) {
          unint64_t v20 = a5;
        }
        else {
          unint64_t v20 = v19;
        }
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = v31;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      unint64_t v24 = 0;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          if (v24 < [v9 count])
          {
            unint64_t v28 = v24;
            while (([v10 containsIndex:v28] & 1) != 0)
            {
              if (++v28 >= [v9 count]) {
                goto LABEL_26;
              }
            }
            [v9 setObject:v27 atIndexedSubscript:v28];
            unint64_t v24 = v28 + 1;
          }
LABEL_26:
          ;
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v23);
    }

    id v7 = v30;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

+ (BOOL)suggestionsAreAllAppExecutableTypeAndHaveValidHash:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "executableSpecification", (void)v15);
        uint64_t v10 = [v9 executableType];

        if (v10 == 1)
        {
          unint64_t v11 = [v8 executableSpecification];
          uint64_t v12 = [v11 executableObjectHash];

          if (v12) {
            continue;
          }
        }
        BOOL v13 = 0;
        goto LABEL_13;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
LABEL_13:

  return v13;
}

+ (BOOL)isValidPreviousPosition:(id)a3 uiLimit:(unint64_t)a4 newSuggestionsCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = v7;
  BOOL v9 = v7 && [v7 unsignedIntegerValue] < a4 && objc_msgSend(v8, "unsignedIntegerValue") < a5;

  return v9;
}

+ (id)executableObjectHashToPositionMappingForSuggestions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__ATXStaticSuggestionsManager_executableObjectHashToPositionMappingForSuggestions___block_invoke;
  v7[3] = &unk_1E68ADF68;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __83__ATXStaticSuggestionsManager_executableObjectHashToPositionMappingForSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v11 = [v5 numberWithUnsignedInteger:a3];
  id v7 = *(void **)(a1 + 32);
  id v8 = NSNumber;
  BOOL v9 = [v6 executableSpecification];

  uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "executableObjectHash"));
  [v7 setObject:v11 forKeyedSubscript:v10];
}

@end