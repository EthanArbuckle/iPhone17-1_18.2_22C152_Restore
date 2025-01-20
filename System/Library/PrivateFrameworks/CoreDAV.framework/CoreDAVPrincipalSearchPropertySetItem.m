@interface CoreDAVPrincipalSearchPropertySetItem
+ (id)copyParseRules;
- (CoreDAVPrincipalSearchPropertySetItem)init;
- (NSMutableSet)principalSearchProperties;
- (id)description;
- (void)addPrincipalSearchProperty:(id)a3;
- (void)setPrincipalSearchProperties:(id)a3;
@end

@implementation CoreDAVPrincipalSearchPropertySetItem

- (CoreDAVPrincipalSearchPropertySetItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"principal-search-property-set"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVPrincipalSearchPropertySetItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVPrincipalSearchPropertySetItem *)self principalSearchProperties];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of principal search properties: [%lu]", objc_msgSend(v5, "count"));

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
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"principal-search-property" objectClass:objc_opt_class() setterMethod:sel_addPrincipalSearchProperty_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"principal-search-property"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)addPrincipalSearchProperty:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVPrincipalSearchPropertySetItem *)self principalSearchProperties];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVPrincipalSearchPropertySetItem *)self setPrincipalSearchProperties:v6];
  }
  id v7 = [(CoreDAVPrincipalSearchPropertySetItem *)self principalSearchProperties];
  [v7 addObject:v4];
}

- (NSMutableSet)principalSearchProperties
{
  return self->_principalSearchProperties;
}

- (void)setPrincipalSearchProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end