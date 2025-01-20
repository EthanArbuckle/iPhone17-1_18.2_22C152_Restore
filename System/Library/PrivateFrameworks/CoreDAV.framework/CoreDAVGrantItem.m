@interface CoreDAVGrantItem
+ (id)copyParseRules;
- (CoreDAVGrantItem)init;
- (NSMutableSet)privileges;
- (id)description;
- (void)addPrivilege:(id)a3;
- (void)setPrivileges:(id)a3;
- (void)write:(id)a3;
@end

@implementation CoreDAVGrantItem

- (CoreDAVGrantItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"grant"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVGrantItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVGrantItem *)self privileges];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of privileges: [%lu]", objc_msgSend(v5, "count"));

  return v3;
}

- (void)write:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CoreDAVItem *)self name];
  v6 = [(CoreDAVItem *)self nameSpace];
  [v4 startElement:v5 inNamespace:v6 withAttributeNamesAndValues:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v7 = [(CoreDAVGrantItem *)self privileges];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v11++) write:v4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  v12 = [(CoreDAVItem *)self name];
  v13 = [(CoreDAVItem *)self nameSpace];
  [v4 endElement:v12 inNamespace:v13];
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  id v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v6 = objc_alloc(NSDictionary);
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"privilege" objectClass:objc_opt_class() setterMethod:sel_addPrivilege_];
    uint64_t v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"privilege"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    uint64_t v9 = +[CoreDAVItem parseRuleCache];
    uint64_t v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)addPrivilege:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVGrantItem *)self privileges];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVGrantItem *)self setPrivileges:v6];
  }
  id v7 = [(CoreDAVGrantItem *)self privileges];
  [v7 addObject:v4];
}

- (NSMutableSet)privileges
{
  return self->_privileges;
}

- (void)setPrivileges:(id)a3
{
}

- (void).cxx_destruct
{
}

@end