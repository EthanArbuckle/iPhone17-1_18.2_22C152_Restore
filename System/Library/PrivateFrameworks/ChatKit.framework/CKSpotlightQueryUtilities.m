@interface CKSpotlightQueryUtilities
+ (BOOL)shouldDisplayWalletSearchController;
+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 annotatedTextColor:(id)a6;
+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 primaryFont:(id)a6 annotatedTextColor:(id)a7 annotatedFont:(id)a8;
+ (id)defaultSearchControllers;
+ (id)detailsSearchControllers;
+ (id)matchedRankingQueriesForResult:(id)a3 withRankingQueryCount:(unint64_t)a4 maxRankingQuery:(unint64_t *)a5;
+ (id)queryStringForSearchString:(id)a3 attributes:(id)a4 matchType:(unint64_t)a5;
+ (id)queryStringFromSubqueries:(id)a3 combineOperator:(unint64_t)a4;
+ (id)rankingQueriesForSearchString:(id)a3 attributes:(id)a4;
+ (id)rankingQueryForField:(id)a3 matchType:(unint64_t)a4 searchString:(id)a5;
+ (id)stringByEscapingSearchString:(id)a3;
+ (id)tokenAddressesForFilteringWithContact:(id)a3;
+ (unint64_t)countOfNonSpaceCharsInSearchString:(id)a3;
@end

@implementation CKSpotlightQueryUtilities

+ (id)defaultSearchControllers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:7];
  v4 = objc_msgSend(v2, "arrayWithArray:", v3, v8, v9, v10, v11, v12, v13);

  if (+[CKSpotlightQueryUtilities shouldDisplayWalletSearchController])
  {
    [v4 insertObject:objc_opt_class() atIndex:6];
  }
  [v4 insertObject:objc_opt_class() atIndex:3];
  v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isSearchTokensEnabled];

  if (v6) {
    [v4 insertObject:objc_opt_class() atIndex:1];
  }

  return v4;
}

+ (BOOL)shouldDisplayWalletSearchController
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 1;
  }
  v4 = +[CKUIBehavior sharedBehaviors];
  char v5 = [v4 supportsPassbookAttachments];

  return v5;
}

+ (id)detailsSearchControllers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:5];
  v4 = objc_msgSend(v2, "arrayWithArray:", v3, v6, v7, v8, v9);

  if (+[CKSpotlightQueryUtilities shouldDisplayWalletSearchController])
  {
    [v4 insertObject:objc_opt_class() atIndex:4];
  }
  [v4 insertObject:objc_opt_class() atIndex:1];

  return v4;
}

+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 primaryFont:(id)a6 annotatedTextColor:(id)a7 annotatedFont:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v14 length])
  {
    id v29 = v15;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
    uint64_t v20 = [v19 length];
    id v27 = v13;
    if ([v13 length])
    {
      uint64_t v21 = [v14 rangeOfString:v13 options:129];
      uint64_t v23 = v22;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v23 = 0;
    }
    uint64_t v24 = *MEMORY[0x1E4FB06F8];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v16, 0, v20, v27);
    uint64_t v25 = *MEMORY[0x1E4FB0700];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v29, 0, v20);
    if (v23)
    {
      objc_msgSend(v19, "addAttribute:value:range:", v25, v17, v21, v23);
      objc_msgSend(v19, "addAttribute:value:range:", v24, v18, v21, v23);
    }
    id v13 = v28;
    id v15 = v29;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 annotatedTextColor:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 length])
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v10];
    uint64_t v14 = [v13 length];
    if ([v9 length])
    {
      uint64_t v15 = [v10 rangeOfString:v9 options:129];
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v18 = *MEMORY[0x1E4FB0700];
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v11, 0, v14);
    if (v17) {
      objc_msgSend(v13, "addAttribute:value:range:", v18, v12, v15, v17);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)stringByEscapingSearchString:(id)a3
{
  uint64_t v3 = (void *)[a3 mutableCopy];
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"'", @"\\'", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"*", @"\\*", 0, 0, objc_msgSend(v3, "length"));

  return v3;
}

+ (unint64_t)countOfNonSpaceCharsInSearchString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  char v5 = [v3 componentsSeparatedByCharactersInSet:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "length", (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)queryStringForSearchString:(id)a3 attributes:(id)a4 matchType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [(id)objc_opt_class() stringByEscapingSearchString:v7];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__79;
  uint64_t v21 = __Block_byref_object_dispose__79;
  id v22 = 0;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__CKSpotlightQueryUtilities_queryStringForSearchString_attributes_matchType___block_invoke;
  v13[3] = &unk_1E5626300;
  unint64_t v16 = a5;
  id v10 = v9;
  id v14 = v10;
  long long v15 = &v17;
  [v8 enumerateObjectsUsingBlock:v13];
  id v11 = [(id)v18[5] componentsJoinedByString:@" || "];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __77__CKSpotlightQueryUtilities_queryStringForSearchString_attributes_matchType___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_7;
    }
    char v5 = @"%@=\"*%@*\"%@";
  }
  else
  {
    char v5 = @"%@=\"%@*\"%@";
  }
  id v8 = v3;
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v5, v3, a1[4], @"cwdt");
  id v3 = v8;
  if (v6)
  {
    id v7 = (void *)v6;
    [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v6];

    id v3 = v8;
  }
LABEL_7:
}

+ (id)rankingQueriesForSearchString:(id)a3 attributes:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() stringByEscapingSearchString:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v16 = objc_msgSend((id)objc_opt_class(), "rankingQueryForField:matchType:searchString:", v15, 0, v7, (void)v20);
        uint64_t v17 = [(id)objc_opt_class() rankingQueryForField:v15 matchType:1 searchString:v7];
        [v8 addObject:v16];
        [v9 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v18 = [v8 arrayByAddingObjectsFromArray:v9];

  return v18;
}

+ (id)rankingQueryForField:(id)a3 matchType:(unint64_t)a4 searchString:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (!a4)
  {
    id v9 = @"%@=\"%@*\"%@";
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    id v9 = @"%@=\"*%@*\"%@";
LABEL_5:
    id v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v7, v8, @"cwdt");
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

+ (id)matchedRankingQueriesForResult:(id)a3 withRankingQueryCount:(unint64_t)a4 maxRankingQuery:(unint64_t *)a5
{
  if (a4)
  {
    id v7 = [a3 attributeSet];
    id v8 = [v7 queryResultRelevance];

    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      unsigned int v10 = [v8 unsignedIntValue];
      unint64_t v11 = 0;
      unint64_t v12 = 0;
      do
      {
        unint64_t v13 = v11 + 1;
        if ((v10 >> v11))
        {
          [v9 addIndex:v13];
          if (v12 <= v13) {
            unint64_t v12 = v13;
          }
        }
        unint64_t v11 = v13;
      }
      while (a4 != v13);
      if (a5) {
        *a5 = v12;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)queryStringFromSubqueries:(id)a3 combineOperator:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = @"&&";
    if (!a4) {
      id v6 = @"||";
    }
    id v7 = v6;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__79;
    uint64_t v18 = __Block_byref_object_dispose__79;
    id v19 = 0;
    id v19 = [NSString string];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__CKSpotlightQueryUtilities_queryStringFromSubqueries_combineOperator___block_invoke;
    v11[3] = &unk_1E562CC70;
    unint64_t v13 = &v14;
    id v8 = v7;
    unint64_t v12 = v8;
    [v5 enumerateObjectsUsingBlock:v11];
    id v9 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __71__CKSpotlightQueryUtilities_queryStringFromSubqueries_combineOperator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (a3) {
    [NSString stringWithFormat:@" %@ (%@)", *(void *)(a1 + 32), a2];
  }
  else {
  id v9 = [NSString stringWithFormat:@"(%@)", a2, v8];
  }
  uint64_t v5 = objc_msgSend(v4, "stringByAppendingString:");
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)tokenAddressesForFilteringWithContact:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v5 = [v3 emailAddresses];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) value];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v11 = objc_msgSend(v3, "phoneNumbers", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v20 + 1) + 8 * j) value];
          uint64_t v17 = [v16 stringValue];
          uint64_t v18 = IMNormalizeFormattedString();

          [v4 addObject:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

@end