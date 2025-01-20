@interface SAUIDisambiguationGroup(AFDisambiguationAssistancePrivate)
- (id)af_assistedSelectionItem;
- (id)af_disambiguationIdentifier;
- (id)af_indexIdentifierForItem:()AFDisambiguationAssistancePrivate;
- (id)af_itemForIndexIdentifier:()AFDisambiguationAssistancePrivate;
- (void)af_saveItemSelection:()AFDisambiguationAssistancePrivate forType:;
- (void)af_setDisambiguationInfo:()AFDisambiguationAssistancePrivate;
@end

@implementation SAUIDisambiguationGroup(AFDisambiguationAssistancePrivate)

- (void)af_saveItemSelection:()AFDisambiguationAssistancePrivate forType:
{
}

- (id)af_assistedSelectionItem
{
  v1 = _af_AssistedSelectionItem(a1);
  v2 = +[AFAnalytics sharedAnalytics];
  v3 = v2;
  if (v1) {
    v4 = &unk_1EEE98B80;
  }
  else {
    v4 = 0;
  }
  [v2 logEventWithType:1925 context:v4];

  return v1;
}

- (void)af_setDisambiguationInfo:()AFDisambiguationAssistancePrivate
{
  id v4 = a1;
  id v5 = a3;
  objc_setAssociatedObject(v4, "DisambiguationInfoKey", v5, (void *)1);
  v7 = objc_alloc_init(AFDisambiguationStore);
  v6 = objc_msgSend(v4, "af_disambiguationIdentifier");

  [(AFDisambiguationStore *)v7 saveInfo:v5 forIdentifier:v6];
}

- (id)af_itemForIndexIdentifier:()AFDisambiguationAssistancePrivate
{
  id v4 = a3;
  uint64_t v5 = [v4 rangeOfString:@"."];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    v10 = [v4 substringToIndex:v5];
    uint64_t v11 = [v10 integerValue];
    v12 = [a1 disambiguationLists];
    uint64_t v13 = [v12 count];
    if (v11 || [v4 isEqualToString:@"0"])
    {
      if (v11 >= v13 || v11 < 0) {
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v15 = [v4 substringFromIndex:v8 + v9];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      v16 = [v12 objectAtIndexedSubscript:v11];
      v7 = objc_msgSend(v16, "af_itemForIndexIdentifier:", v15);
    }
  }

  return v7;
}

- (id)af_indexIdentifierForItem:()AFDisambiguationAssistancePrivate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [a1 disambiguationLists];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "af_indexIdentifierForItem:", v4);
        if (v12)
        {
          v14 = (void *)v12;

          if (v8 + v10 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v13 = 0;
          }
          else {
            uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%lu.%@", v8 + v10, v14];
          }
          goto LABEL_13;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = 0;
  v14 = 0;
LABEL_13:

  return v13;
}

- (id)af_disambiguationIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(a1, "disambiguationLists", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        _UpdateSha1WithDisambiguationList(&c, *(void **)(*((void *)&v9 + 1) + 8 * i));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v4);
  }

  id v7 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:20];
  CC_SHA1_Final((unsigned __int8 *)[v7 mutableBytes], &c);
  return v7;
}

@end