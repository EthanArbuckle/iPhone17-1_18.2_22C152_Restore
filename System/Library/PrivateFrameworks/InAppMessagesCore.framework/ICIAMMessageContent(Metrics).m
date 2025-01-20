@interface ICIAMMessageContent(Metrics)
- (id)dictionaryRepresentationWithReportableMetricsEvents;
@end

@implementation ICIAMMessageContent(Metrics)

- (id)dictionaryRepresentationWithReportableMetricsEvents
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [a1 dictionaryRepresentation];
  v3 = (void *)[v2 mutableCopy];

  if ([a1 hasPageEvent])
  {
    v4 = [a1 pageEvent];
    v5 = [v4 reportableDictionary];
    [v3 setObject:v5 forKey:@"pageEvent"];
  }
  if ([a1 hasCardClickEvent])
  {
    v6 = [a1 cardClickEvent];
    v7 = [v6 reportableDictionary];
    [v3 setObject:v7 forKey:@"cardClickEvent"];
  }
  if ([a1 hasCloseClickEvent])
  {
    v8 = [a1 closeClickEvent];
    v9 = [v8 reportableDictionary];
    [v3 setObject:v9 forKey:@"closeClickEvent"];
  }
  if ([a1 messageActionsCount])
  {
    v10 = [a1 messageActions];
    v11 = (void *)[v10 copy];

    v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentationWithReportableMetricsEvents", (void)v22);
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    v19 = (void *)[v12 copy];
    [v3 setObject:v19 forKey:@"messageActions"];
  }
  v20 = objc_msgSend(v3, "copy", (void)v22);

  return v20;
}

@end