@interface CoreDAVACLItem
+ (id)copyParseRules;
- (CoreDAVACLItem)init;
- (NSMutableSet)accessControlEntities;
- (id)description;
- (id)liveACEs;
- (id)notGrantedSubsetOfACEs:(id)a3;
- (void)addACE:(id)a3;
- (void)setAccessControlEntities:(id)a3;
@end

@implementation CoreDAVACLItem

- (CoreDAVACLItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"acl"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVACLItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVACLItem *)self accessControlEntities];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of access control entities: [%lu]", objc_msgSend(v5, "count"));

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
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"ace" objectClass:objc_opt_class() setterMethod:sel_addACE_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"ace"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)addACE:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVACLItem *)self accessControlEntities];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVACLItem *)self setAccessControlEntities:v6];
  }
  id v7 = [(CoreDAVACLItem *)self accessControlEntities];
  [v7 addObject:v4];
}

- (id)notGrantedSubsetOfACEs:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v55 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v10 = [v9 principal];
        v11 = [v10 hashString];
        v12 = [v4 objectForKey:v11];

        if (!v12)
        {
          v12 = [MEMORY[0x263EFF9C0] set];
          v13 = [v9 principal];
          v14 = [v13 hashString];
          [v4 setObject:v12 forKey:v14];
        }
        v15 = [v9 grant];
        v16 = [v15 privileges];
        v17 = [v16 valueForKey:@"hashString"];
        [v12 unionSet:v17];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v6);
  }

  v37 = +[CoreDAVACEItem privilegeItemWithNameSpace:@"DAV:" andName:@"all"];
  v18 = [v37 hashString];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v38 = [(CoreDAVACLItem *)self accessControlEntities];
  uint64_t v43 = [v38 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v43)
  {
    v40 = v4;
    uint64_t v41 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(v38);
        }
        v20 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        v21 = [v20 principal];
        v22 = [v21 hashString];
        v23 = [v4 objectForKey:v22];

        if ([v23 count])
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          v24 = [v20 grant];
          v25 = [v24 privileges];

          uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v58 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v47;
            while (2)
            {
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(void *)v47 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v46 + 1) + 8 * k);
                v31 = [v30 hashString];
                int v32 = [v31 isEqualToString:v18];

                if (v32)
                {
                  [v23 removeAllObjects];
                  goto LABEL_26;
                }
                v33 = [v30 hashString];
                [v23 removeObject:v33];
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v46 objects:v58 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }
LABEL_26:

          id v4 = v40;
        }
      }
      uint64_t v43 = [v38 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v43);
  }

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __41__CoreDAVACLItem_notGrantedSubsetOfACEs___block_invoke;
  v44[3] = &unk_2641E0170;
  id v45 = v4;
  id v34 = v4;
  v35 = [obj objectsPassingTest:v44];

  return v35;
}

uint64_t __41__CoreDAVACLItem_notGrantedSubsetOfACEs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 principal];
  uint64_t v6 = [v5 hashString];
  uint64_t v7 = [v4 objectForKey:v6];

  if ([v7 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v3, "grant", 0);
    v9 = [v8 privileges];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) hashString];
          char v14 = [v7 containsObject:v13];

          if (v14)
          {
            uint64_t v10 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)liveACEs
{
  v2 = [(CoreDAVACLItem *)self accessControlEntities];
  id v3 = [v2 objectsPassingTest:&__block_literal_global_4];

  return v3;
}

BOOL __26__CoreDAVACLItem_liveACEs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 inherited];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [v2 protectedItem];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (NSMutableSet)accessControlEntities
{
  return self->_accessControlEntities;
}

- (void)setAccessControlEntities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end