@interface CoreDAVResponseItem
+ (id)copyParseRules;
- (BOOL)hasPropertyError;
- (CoreDAVErrorItem)errorItem;
- (CoreDAVItemWithHrefChildItem)location;
- (CoreDAVLeafItem)responseDescription;
- (CoreDAVLeafItem)serverUID;
- (CoreDAVLeafItem)status;
- (CoreDAVMatchResultsItem)matchResults;
- (CoreDAVResponseItem)init;
- (NSMutableArray)hrefs;
- (NSMutableSet)propStats;
- (id)description;
- (id)firstHref;
- (id)successfulPropertiesToValues;
- (void)addHref:(id)a3;
- (void)addPropStat:(id)a3;
- (void)setErrorItem:(id)a3;
- (void)setHrefs:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMatchResults:(id)a3;
- (void)setPropStats:(id)a3;
- (void)setResponseDescription:(id)a3;
- (void)setServerUID:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation CoreDAVResponseItem

- (CoreDAVResponseItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"response"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVResponseItem;
  v4 = [(CoreDAVItem *)&v14 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVResponseItem *)self hrefs];
  objc_msgSend(v3, "appendFormat:", @"| Number of HREFs: [%lu]", objc_msgSend(v5, "count"));

  v6 = [(CoreDAVResponseItem *)self status];
  [v3 appendFormat:@"| Status: [%@]", v6];

  v7 = [(CoreDAVResponseItem *)self propStats];
  objc_msgSend(v3, "appendFormat:", @"| Number of prop stats: [%lu]", objc_msgSend(v7, "count"));

  v8 = [(CoreDAVResponseItem *)self errorItem];
  [v3 appendFormat:@"| Error: [%@]", v8];

  v9 = [(CoreDAVResponseItem *)self responseDescription];
  [v3 appendFormat:@"| Response description: [%@]", v9];

  v10 = [(CoreDAVResponseItem *)self location];
  [v3 appendFormat:@"| Location: [%@]", v10];

  v11 = [(CoreDAVResponseItem *)self serverUID];
  [v3 appendFormat:@"| UID: [%@]", v11];

  v12 = [(CoreDAVResponseItem *)self matchResults];
  [v3 appendFormat:@"| Match-Results: [%@]", v12];

  [v3 appendFormat:@"]"];
  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v22 = objc_alloc(NSDictionary);
    v23 = (objc_class *)a1;
    v26 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"href" objectClass:objc_opt_class() setterMethod:sel_addHref_];
    v25 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"href"];
    v24 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"status" objectClass:objc_opt_class() setterMethod:sel_setStatus_];
    v21 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"status"];
    v20 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"propstat" objectClass:objc_opt_class() setterMethod:sel_addPropStat_];
    v19 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"propstat"];
    v18 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"error" objectClass:objc_opt_class() setterMethod:sel_setErrorItem_];
    v17 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"error"];
    v16 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"responsedescription" objectClass:objc_opt_class() setterMethod:sel_setResponseDescription_];
    v15 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"responsedescription"];
    objc_super v14 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"location" objectClass:objc_opt_class() setterMethod:sel_setLocation_];
    v13 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"location"];
    v12 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"uid" objectClass:objc_opt_class() setterMethod:sel_setServerUID_];
    v6 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"uid"];
    v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"match-results" objectClass:objc_opt_class() setterMethod:sel_setMatchResults_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"match-results"];
    v5 = objc_msgSend(v22, "initWithObjectsAndKeys:", v26, v25, v24, v21, v20, v19, v18, v17, v16, v15, v14, v13, v12, v6, v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass(v23);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)addPropStat:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVResponseItem *)self propStats];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVResponseItem *)self setPropStats:v6];
  }
  id v7 = [(CoreDAVResponseItem *)self propStats];
  [v7 addObject:v4];
}

- (void)addHref:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVResponseItem *)self hrefs];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(CoreDAVResponseItem *)self setHrefs:v6];
  }
  id v7 = [(CoreDAVResponseItem *)self hrefs];
  [v7 addObject:v4];
}

- (id)firstHref
{
  v2 = [(CoreDAVResponseItem *)self hrefs];
  id v3 = [v2 objectAtIndex:0];

  return v3;
}

- (id)successfulPropertiesToValues
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(CoreDAVResponseItem *)self propStats];
  uint64_t v2 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v32;
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v6 = 0;
      uint64_t v24 = v3;
      do
      {
        if (*(void *)v32 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v31 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "status", v23);
        v9 = [v8 payloadAsString];
        int v10 = [v9 CDVIsHTTPStatusLineWithStatusCode:200];

        if (v10)
        {
          uint64_t v26 = v6;
          if (!v4)
          {
            id v4 = [MEMORY[0x263EFF9A0] dictionary];
          }
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          v11 = [v7 prop];
          v12 = [v11 extraChildItems];

          uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                v18 = NSString;
                v19 = [v17 nameSpace];
                v20 = [v17 name];
                v21 = [v18 CDVStringWithNameSpace:v19 andName:v20];

                [v4 setObject:v17 forKey:v21];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v14);
          }

          uint64_t v5 = v23;
          uint64_t v3 = v24;
          uint64_t v6 = v26;
        }
        ++v6;
      }
      while (v6 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)hasPropertyError
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CoreDAVResponseItem *)self errorItem];

  if (v3) {
    goto LABEL_2;
  }
  uint64_t v5 = [(CoreDAVResponseItem *)self propStats];
  uint64_t v6 = [v5 count];

  if (v6
    || ([(CoreDAVResponseItem *)self status],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 payloadAsString],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 CDVIsHTTPStatusLineWithStatusCode:200],
        v8,
        v7,
        v9))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v10 = [(CoreDAVResponseItem *)self propStats];
    uint64_t v4 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v10);
          }
          uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) status];
          uint64_t v14 = [v13 payloadAsString];
          int v15 = [v14 CDVIsHTTPStatusLineWithStatusCode:200];

          if (!v15)
          {
            LOBYTE(v4) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v4 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
LABEL_2:
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)setErrorItem:(id)a3
{
  p_errorItem = &self->_errorItem;
  uint64_t v6 = (CoreDAVErrorItem *)a3;
  if (*p_errorItem != v6)
  {
    objc_storeStrong((id *)&self->_errorItem, a3);
    if (self->_status) {
      -[CoreDAVErrorItem setStatus:](*p_errorItem, "setStatus:");
    }
  }
}

- (NSMutableArray)hrefs
{
  return self->_hrefs;
}

- (void)setHrefs:(id)a3
{
}

- (CoreDAVLeafItem)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSMutableSet)propStats
{
  return self->_propStats;
}

- (void)setPropStats:(id)a3
{
}

- (CoreDAVErrorItem)errorItem
{
  return self->_errorItem;
}

- (CoreDAVLeafItem)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
}

- (CoreDAVItemWithHrefChildItem)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (CoreDAVLeafItem)serverUID
{
  return self->_serverUID;
}

- (void)setServerUID:(id)a3
{
}

- (CoreDAVMatchResultsItem)matchResults
{
  return self->_matchResults;
}

- (void)setMatchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchResults, 0);
  objc_storeStrong((id *)&self->_serverUID, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_responseDescription, 0);
  objc_storeStrong((id *)&self->_errorItem, 0);
  objc_storeStrong((id *)&self->_propStats, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_hrefs, 0);
}

@end