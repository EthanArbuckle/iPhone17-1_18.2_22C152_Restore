@interface CoreDAVMkcolResponseItem
+ (id)copyParseRules;
- (BOOL)hasPropertyError;
- (CoreDAVMkcolResponseItem)init;
- (NSMutableSet)propStats;
- (id)description;
- (void)addPropStat:(id)a3;
- (void)setPropStats:(id)a3;
@end

@implementation CoreDAVMkcolResponseItem

- (CoreDAVMkcolResponseItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"mkcol-response"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVMkcolResponseItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVMkcolResponseItem *)self propStats];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of prop stats: [%lu]", objc_msgSend(v5, "count"));

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
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"propstat" objectClass:objc_opt_class() setterMethod:sel_addPropStat_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"propstat"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)addPropStat:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVMkcolResponseItem *)self propStats];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVMkcolResponseItem *)self setPropStats:v6];
  }
  id v7 = [(CoreDAVMkcolResponseItem *)self propStats];
  [v7 addObject:v4];
}

- (BOOL)hasPropertyError
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CoreDAVMkcolResponseItem *)self propStats];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v10 + 1) + 8 * i) status];
        id v7 = [v6 payloadAsString];
        int v8 = [v7 CDVIsHTTPStatusLineWithStatusCode:200];

        if (!v8)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSMutableSet)propStats
{
  return self->_propStats;
}

- (void)setPropStats:(id)a3
{
}

- (void).cxx_destruct
{
}

@end