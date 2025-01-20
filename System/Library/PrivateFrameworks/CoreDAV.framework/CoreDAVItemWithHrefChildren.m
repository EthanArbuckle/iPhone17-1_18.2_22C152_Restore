@interface CoreDAVItemWithHrefChildren
+ (id)copyParseRules;
- (CoreDAVItemWithNoChildren)unauthenticated;
- (NSMutableSet)hrefs;
- (id)description;
- (id)hrefsAsFullURLs;
- (id)hrefsAsOriginalURLs;
- (id)hrefsAsStrings;
- (void)addHref:(id)a3;
- (void)setHrefs:(id)a3;
- (void)setUnauthenticated:(id)a3;
@end

@implementation CoreDAVItemWithHrefChildren

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVItemWithHrefChildren;
  v4 = [(CoreDAVItem *)&v8 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVItemWithHrefChildren *)self hrefs];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of HREFs: [%lu]", objc_msgSend(v5, "count"));

  v6 = [(CoreDAVItemWithHrefChildren *)self unauthenticated];
  [v3 appendFormat:@"\n  Unauthenticated: [%@]", v6];

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v6 = objc_alloc(NSDictionary);
    v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"href" objectClass:objc_opt_class() setterMethod:sel_addHref_];
    objc_super v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"href"];
    v9 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"unauthenticated" objectClass:objc_opt_class() setterMethod:sel_setUnauthenticated_];
    v10 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"unauthenticated"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, v9, v10, 0);

    v11 = +[CoreDAVItem parseRuleCache];
    v12 = NSStringFromClass((Class)a1);
    [v11 setObject:v5 forKey:v12];
  }
  return v5;
}

- (void)addHref:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVItemWithHrefChildren *)self hrefs];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVItemWithHrefChildren *)self setHrefs:v6];
  }
  id v7 = [(CoreDAVItemWithHrefChildren *)self hrefs];
  [v7 addObject:v4];
}

- (id)hrefsAsFullURLs
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(CoreDAVItemWithHrefChildren *)self hrefs];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF9C0]);
    v5 = [(CoreDAVItemWithHrefChildren *)self hrefs];
    id v3 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [(CoreDAVItemWithHrefChildren *)self hrefs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v20;
      *(void *)&long long v8 = 138412290;
      long long v18 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "payloadAsFullURL", v18);
          if (v13)
          {
            [v3 addObject:v13];
          }
          else
          {
            v14 = +[CoreDAVLogging sharedLogging];
            v15 = [v14 logHandleForAccountInfoProvider:0];
            v16 = v15;
            if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              v24 = v12;
              _os_log_impl(&dword_213BFC000, v16, OS_LOG_TYPE_DEFAULT, "omitting nil URL from href '%@'", buf, 0xCu);
            }
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v9);
    }
  }
  return v3;
}

- (id)hrefsAsOriginalURLs
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [(CoreDAVItemWithHrefChildren *)self hrefs];
  if (v2)
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v15 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = [v9 payloadAsOriginalURL];
          if (v10)
          {
            [v3 addObject:v10];
          }
          else
          {
            v11 = +[CoreDAVLogging sharedLogging];
            v12 = [v11 logHandleForAccountInfoProvider:0];
            v13 = v12;
            if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v21 = v9;
              _os_log_impl(&dword_213BFC000, v13, OS_LOG_TYPE_DEFAULT, "omitting nil URL from href '%@'", buf, 0xCu);
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v6);
    }

    v2 = v15;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)hrefsAsStrings
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [(CoreDAVItemWithHrefChildren *)self hrefs];
  if (v2)
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v15 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = [v9 payloadAsString];
          if (v10)
          {
            [v3 addObject:v10];
          }
          else
          {
            v11 = +[CoreDAVLogging sharedLogging];
            v12 = [v11 logHandleForAccountInfoProvider:0];
            v13 = v12;
            if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v21 = v9;
              _os_log_impl(&dword_213BFC000, v13, OS_LOG_TYPE_DEFAULT, "omitting nil URL from href '%@'", buf, 0xCu);
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v6);
    }

    v2 = v15;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSMutableSet)hrefs
{
  return self->_hrefs;
}

- (void)setHrefs:(id)a3
{
}

- (CoreDAVItemWithNoChildren)unauthenticated
{
  return self->_unauthenticated;
}

- (void)setUnauthenticated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unauthenticated, 0);
  objc_storeStrong((id *)&self->_hrefs, 0);
}

@end