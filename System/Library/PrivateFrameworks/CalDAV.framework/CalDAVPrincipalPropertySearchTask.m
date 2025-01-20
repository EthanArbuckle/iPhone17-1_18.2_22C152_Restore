@interface CalDAVPrincipalPropertySearchTask
- (CalDAVPrincipalPropertySearchTask)initWithSearchStrings:(id)a3 searchTypes:(id)a4 serverSupportSet:(id)a5 atURL:(id)a6;
- (CalDAVPrincipalSearchPropertySet)serverSupportSet;
- (NSSet)searchStrings;
- (NSSet)searchTypes;
- (id)extraAttributes;
- (id)searchContext;
- (id)searchItems;
- (void)setSearchContext:(id)a3;
- (void)setSearchStrings:(id)a3;
- (void)setSearchTypes:(id)a3;
- (void)setServerSupportSet:(id)a3;
@end

@implementation CalDAVPrincipalPropertySearchTask

- (CalDAVPrincipalPropertySearchTask)initWithSearchStrings:(id)a3 searchTypes:(id)a4 serverSupportSet:(id)a5 atURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[CalDAVPrincipalSearchSupport parserMappingsWithServerSupportSet:v12 includeEmail:1];
  v18.receiver = self;
  v18.super_class = (Class)CalDAVPrincipalPropertySearchTask;
  v15 = [(CoreDAVPrincipalPropertySearchTask *)&v18 initWithPropertiesToFind:v14 atURL:v13];

  if (v15)
  {
    [(CalDAVPrincipalPropertySearchTask *)v15 setSearchStrings:v10];
    [(CalDAVPrincipalPropertySearchTask *)v15 setServerSupportSet:v12];
    if ([v11 count])
    {
      [(CalDAVPrincipalPropertySearchTask *)v15 setSearchTypes:v11];
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", CalDAVPrincipalResultType_Person, CalDAVPrincipalResultType_Group, CalDAVPrincipalResultType_Resource, CalDAVPrincipalResultType_Room, CalDAVPrincipalResultType_Unknown, 0);
      [(CalDAVPrincipalPropertySearchTask *)v15 setSearchTypes:v16];
    }
  }

  return v15;
}

- (id)extraAttributes
{
  v3 = [(CalDAVPrincipalPropertySearchTask *)self searchTypes];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    v6 = [(CalDAVPrincipalPropertySearchTask *)self searchTypes];
    v7 = [v6 anyObject];

    v5 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F34DB8], *MEMORY[0x263F34DE8], v7, @"type", 0);
  }
  else
  {
    v5 = [NSDictionary dictionaryWithObject:*MEMORY[0x263F34DB8] forKey:*MEMORY[0x263F34DE8]];
  }
  return v5;
}

- (id)searchItems
{
  v3 = [MEMORY[0x263EFF9C0] set];
  unint64_t v4 = [(CalDAVPrincipalPropertySearchTask *)self searchTypes];
  char v5 = [v4 containsObject:CalDAVPrincipalResultType_Room];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__CalDAVPrincipalPropertySearchTask_searchItems__block_invoke;
  v12[3] = &unk_2641EC270;
  v12[4] = self;
  char v14 = v5;
  id v6 = v3;
  id v13 = v6;
  v7 = (void (**)(void, void))MEMORY[0x216696070](v12);
  v7[2](v7, 3);
  v7[2](v7, 4);
  v8 = [(CalDAVPrincipalPropertySearchTask *)self searchTypes];
  int v9 = [v8 containsObject:CalDAVPrincipalResultType_Person];

  if (v9)
  {
    v7[2](v7, 1);
    v7[2](v7, 2);
  }
  id v10 = v6;

  return v10;
}

void __48__CalDAVPrincipalPropertySearchTask_searchItems__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v4 = [*(id *)(a1 + 32) serverSupportSet];
  int v5 = [v4 supportsWellKnownType:a2];

  if (v5)
  {
    id v6 = @"starts-with";
    if (a2 == 6) {
      id v6 = @"equals";
    }
    if (*(unsigned char *)(a1 + 48)) {
      BOOL v7 = a2 == 3;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      v8 = @"contains";
    }
    else {
      v8 = v6;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [*(id *)(a1 + 32) searchStrings];
    uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        char v14 = v11;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
          id v11 = +[CalDAVPrincipalSearchSupport propertySearchItemForWellKnownType:a2];

          [v11 setMatchTypeAttribute:v8];
          [v11 setMatch:v15];
          [*(id *)(a1 + 40) addObject:v11];
          ++v13;
          char v14 = v11;
        }
        while (v10 != v13);
        uint64_t v10 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (id)searchContext
{
  return self->_searchContext;
}

- (void)setSearchContext:(id)a3
{
}

- (NSSet)searchTypes
{
  return self->_searchTypes;
}

- (void)setSearchTypes:(id)a3
{
}

- (NSSet)searchStrings
{
  return self->_searchStrings;
}

- (void)setSearchStrings:(id)a3
{
}

- (CalDAVPrincipalSearchPropertySet)serverSupportSet
{
  return self->_serverSupportSet;
}

- (void)setServerSupportSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSupportSet, 0);
  objc_storeStrong((id *)&self->_searchStrings, 0);
  objc_storeStrong((id *)&self->_searchTypes, 0);
  objc_storeStrong(&self->_searchContext, 0);
}

@end