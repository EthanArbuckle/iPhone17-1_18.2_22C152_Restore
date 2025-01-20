@interface CalDAVCalendarInfoSyncTaskGroup
- (BOOL)fetchSharees;
- (Class)containerItemClass;
- (id)copyContainerParserMappings;
- (void)setFetchSharees:(BOOL)a3;
@end

@implementation CalDAVCalendarInfoSyncTaskGroup

- (Class)containerItemClass
{
  return (Class)objc_opt_class();
}

- (id)copyContainerParserMappings
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)CalDAVCalendarInfoSyncTaskGroup;
  id v3 = [(CoreDAVContainerInfoSyncTaskGroup *)&v26 copyContainerParserMappings];
  id v4 = +[CalDAVContainer copyPropertyMappingsForParser];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v3];
  if ([(CalDAVCalendarInfoSyncTaskGroup *)self fetchSharees]) {
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

- (BOOL)fetchSharees
{
  return self->_fetchSharees;
}

- (void)setFetchSharees:(BOOL)a3
{
  self->_fetchSharees = a3;
}

@end