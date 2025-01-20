@interface CalDAVCalendarInfoTaskGroup
- (BOOL)fetchSharees;
- (CalDAVCalendarInfoTaskGroup)initWithAccountInfoProvider:(id)a3 containerURLs:(id)a4 taskManager:(id)a5;
- (id)_copyContainerParserMappings;
- (id)_copyContainerWithURL:(id)a3 andProperties:(id)a4;
- (id)containerForURL:(id)a3;
- (void)setFetchSharees:(BOOL)a3;
@end

@implementation CalDAVCalendarInfoTaskGroup

- (CalDAVCalendarInfoTaskGroup)initWithAccountInfoProvider:(id)a3 containerURLs:(id)a4 taskManager:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarInfoTaskGroup;
  v5 = [(CoreDAVContainerInfoTaskGroup *)&v8 initWithAccountInfoProvider:a3 containerURLs:a4 taskManager:a5];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)((char *)&v5->super.super.super.isa + (int)*MEMORY[0x263F34BD0]), (id)*MEMORY[0x263F34CD8]);
    objc_storeStrong((id *)((char *)&v6->super.super.super.isa + (int)*MEMORY[0x263F34BC8]), (id)*MEMORY[0x263F34C90]);
    v6->_fetchSharees = 0;
  }
  return v6;
}

- (id)_copyContainerParserMappings
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)CalDAVCalendarInfoTaskGroup;
  id v3 = [(CoreDAVContainerInfoTaskGroup *)&v26 _copyContainerParserMappings];
  id v4 = +[CalDAVContainer copyPropertyMappingsForParser];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v3];
  if ([(CalDAVCalendarInfoTaskGroup *)self fetchSharees]) {
    [v5 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34DA8] name:@"invite" parseClass:objc_opt_class()];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (!v7)
  {

    v17 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  id v19 = v4;
  id v20 = v3;
  id v21 = 0;
  uint64_t v9 = *(void *)v23;
  uint64_t v10 = *MEMORY[0x263F34E10];
  uint64_t v11 = *MEMORY[0x263F34EF8];
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      v14 = [v13 nameSpace];
      if ([v14 isEqualToString:v10])
      {
        v15 = [v13 name];
        int v16 = [v15 isEqualToString:v11];

        if (!v16) {
          continue;
        }
        v14 = v21;
        id v21 = v13;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  }
  while (v8);

  id v4 = v19;
  id v3 = v20;
  v17 = v21;
  if (v21) {
    [v6 removeObject:v21];
  }
LABEL_17:
  [v6 unionSet:v4];

  return v6;
}

- (id)_copyContainerWithURL:(id)a3 andProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(CoreDAVContainer *)[CalDAVContainer alloc] initWithURL:v6 andProperties:v5];

  return v7;
}

- (id)containerForURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 absoluteString];
  id v6 = [v5 appendSlashIfNeeded];

  uint64_t v28 = v4;
  uint64_t v7 = [v4 URLWithoutUsername];
  uint64_t v8 = [v7 absoluteString];
  v32 = [v8 appendSlashIfNeeded];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = *(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34BD8]);
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v9)
  {
    v13 = 0;
    goto LABEL_23;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v35;
  v29 = v6;
  while (2)
  {
    uint64_t v12 = 0;
    uint64_t v30 = v10;
    do
    {
      if (*(void *)v35 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
      v14 = [v13 url];
      v15 = [v14 absoluteString];
      int v16 = [v15 appendSlashIfNeeded];

      if ([v16 isEqualToString:v6])
      {
        id v25 = v13;
LABEL_21:

        goto LABEL_23;
      }
      v17 = [v16 stringByRemovingPercentEncoding];
      if ([v17 isEqualToString:v6])
      {
        id v26 = v13;

        goto LABEL_21;
      }
      v18 = [v6 stringByRemovingPercentEncoding];
      if ([v16 isEqualToString:v18])
      {
        id v31 = v13;
        int v19 = 1;
      }
      else
      {
        uint64_t v20 = v11;
        id v21 = [v13 url];
        long long v22 = [v21 URLWithoutUsername];
        long long v23 = [v22 absoluteString];
        long long v24 = [v23 appendSlashIfNeeded];

        if ([v24 isEqualToString:v32])
        {
          id v31 = v13;
          int v19 = 1;
        }
        else
        {
          int v19 = 0;
        }
        uint64_t v11 = v20;
        uint64_t v10 = v30;

        id v6 = v29;
      }

      if (v19)
      {
        v13 = v31;
        goto LABEL_23;
      }
      ++v12;
    }
    while (v10 != v12);
    uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    v13 = 0;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_23:

  return v13;
}

- (BOOL)fetchSharees
{
  return self->_fetchSharees;
}

- (void)setFetchSharees:(BOOL)a3
{
  self->_fetchSharees = a3;
}

@end