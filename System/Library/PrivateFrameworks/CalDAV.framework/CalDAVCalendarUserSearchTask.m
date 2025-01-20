@interface CalDAVCalendarUserSearchTask
+ (BOOL)tokensAreLegal:(id)a3;
- (BOOL)findAttendees;
- (BOOL)findGroups;
- (BOOL)findLocations;
- (BOOL)findResources;
- (BOOL)findUsers;
- (CalDAVCalendarUserSearchTask)initWithSearchStrings:(id)a3 atURL:(id)a4;
- (NSSet)searchStrings;
- (id)extraAttributes;
- (id)httpMethod;
- (id)requestBody;
- (id)searchItems;
- (int64_t)searchType;
- (unint64_t)resultLimit;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setFindAttendees:(BOOL)a3;
- (void)setFindGroups:(BOOL)a3;
- (void)setFindLocations:(BOOL)a3;
- (void)setFindResources:(BOOL)a3;
- (void)setFindUsers:(BOOL)a3;
- (void)setResultLimit:(unint64_t)a3;
- (void)setSearchStrings:(id)a3;
- (void)setSearchType:(int64_t)a3;
@end

@implementation CalDAVCalendarUserSearchTask

- (CalDAVCalendarUserSearchTask)initWithSearchStrings:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[CalDAVPrincipalSearchSupport parserMappingsWithServerSupportSet:0 includeEmail:1];
  v11.receiver = self;
  v11.super_class = (Class)CalDAVCalendarUserSearchTask;
  v9 = [(CoreDAVPropertyFindBaseTask *)&v11 initWithPropertiesToFind:v8 atURL:v7];

  if (v9) {
    [(CalDAVCalendarUserSearchTask *)v9 setSearchStrings:v6];
  }

  return v9;
}

- (id)httpMethod
{
  return @"REPORT";
}

+ (BOOL)tokensAreLegal:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v5 += objc_msgSend(v9, "length", (void)v11);
        v6 |= (unint64_t)[v9 length] > 1;
        if ((v6 & 1) != 0 && v5 > 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)extraAttributes
{
  [(CalDAVCalendarUserSearchTask *)self searchType];
  return 0;
}

- (id)searchItems
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(CalDAVCalendarUserSearchTask *)self searchStrings];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = *MEMORY[0x263F34DA8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = (void *)[objc_alloc(MEMORY[0x263F34AF8]) initWithNameSpace:v8 andName:@"search-token"];
        [v11 setPayloadAsString:v10];
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)requestBody
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
  uint64_t v4 = (void *)[v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F34BB8]);
    uint64_t v6 = *MEMORY[0x263F34DA8];
    uint64_t v7 = [(CalDAVCalendarUserSearchTask *)self extraAttributes];
    [v5 startElement:@"calendarserver-principal-search" inNamespace:v6 withAttributes:v7];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [(CalDAVCalendarUserSearchTask *)self searchItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * i) write:v5];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    if ([(CalDAVCalendarUserSearchTask *)self resultLimit])
    {
      uint64_t v13 = *MEMORY[0x263F34DC0];
      [v5 startElement:*MEMORY[0x263F34DC0] inNamespace:v6 withAttributeNamesAndValues:0];
      uint64_t v14 = *MEMORY[0x263F34DD8];
      long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[CalDAVCalendarUserSearchTask resultLimit](self, "resultLimit"));
      [v5 appendElement:v14 inNamespace:v6 withStringContent:v15 withAttributeNamesAndValues:0];

      [v5 endElement:v13 inNamespace:v6];
    }
    uint64_t v16 = *MEMORY[0x263F34EE0];
    uint64_t v17 = *MEMORY[0x263F34E10];
    [v5 startElement:*MEMORY[0x263F34EE0] inNamespace:*MEMORY[0x263F34E10] withAttributeNamesAndValues:0];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v18 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          v24 = [v23 name];
          v25 = [v23 nameSpace];
          [v5 appendElement:v24 inNamespace:v25 withStringContent:0 withAttributeNamesAndValues:0];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v20);
    }

    [v5 endElement:v16 inNamespace:v17];
    [v5 endElement:@"calendarserver-principal-search" inNamespace:v6];
    uint64_t v4 = [v5 data];
  }
  return v4;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(CoreDAVPropertyFindBaseTask *)self getTotalFailureError];
  }
  uint64_t v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarUserSearchTask;
  [(CoreDAVPropertyFindBaseTask *)&v8 finishCoreDAVTaskWithError:v6];
}

- (int64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(int64_t)a3
{
  self->_searchType = a3;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->_resultLimit = a3;
}

- (BOOL)findAttendees
{
  return self->_findAttendees;
}

- (void)setFindAttendees:(BOOL)a3
{
  self->_findAttendees = a3;
}

- (BOOL)findLocations
{
  return self->_findLocations;
}

- (void)setFindLocations:(BOOL)a3
{
  self->_findLocations = a3;
}

- (BOOL)findUsers
{
  return self->_findUsers;
}

- (void)setFindUsers:(BOOL)a3
{
  self->_findUsers = a3;
}

- (BOOL)findGroups
{
  return self->_findGroups;
}

- (void)setFindGroups:(BOOL)a3
{
  self->_findGroups = a3;
}

- (BOOL)findResources
{
  return self->_findResources;
}

- (void)setFindResources:(BOOL)a3
{
  self->_findResources = a3;
}

- (NSSet)searchStrings
{
  return self->_searchStrings;
}

- (void)setSearchStrings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end