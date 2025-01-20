@interface CoreDAVPrincipalItem
+ (id)copyParseRules;
- (CoreDAVHrefItem)href;
- (CoreDAVItem)property;
- (CoreDAVItemWithNoChildren)all;
- (CoreDAVItemWithNoChildren)authenticated;
- (CoreDAVItemWithNoChildren)selfItem;
- (CoreDAVItemWithNoChildren)unauthenticated;
- (CoreDAVPrincipalItem)init;
- (id)description;
- (id)hashString;
- (id)initTypeIsAll;
- (id)initTypeIsAuthenticated;
- (id)initTypeIsHREFWithURL:(id)a3;
- (id)initTypeIsProperty:(id)a3;
- (id)initTypeIsSelf;
- (id)initTypeIsUnauthenticated;
- (void)setAll:(id)a3;
- (void)setAuthenticated:(id)a3;
- (void)setHref:(id)a3;
- (void)setProperty:(id)a3;
- (void)setSelfItem:(id)a3;
- (void)setUnauthenticated:(id)a3;
- (void)write:(id)a3;
@end

@implementation CoreDAVPrincipalItem

- (CoreDAVPrincipalItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"principal"];
}

- (id)initTypeIsAll
{
  v2 = [(CoreDAVPrincipalItem *)self init];
  if (v2)
  {
    v3 = [[CoreDAVItemWithNoChildren alloc] initWithNameSpace:@"DAV:" andName:@"all"];
    [(CoreDAVPrincipalItem *)v2 setAll:v3];
  }
  return v2;
}

- (id)initTypeIsHREFWithURL:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVPrincipalItem *)self init];
  if (v5)
  {
    v6 = [[CoreDAVHrefItem alloc] initWithURL:v4];
    [(CoreDAVPrincipalItem *)v5 setHref:v6];
  }
  return v5;
}

- (id)initTypeIsProperty:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVPrincipalItem *)self init];
  v6 = v5;
  if (v5) {
    [(CoreDAVPrincipalItem *)v5 setProperty:v4];
  }

  return v6;
}

- (id)initTypeIsAuthenticated
{
  v2 = [(CoreDAVPrincipalItem *)self init];
  if (v2)
  {
    v3 = [[CoreDAVItemWithNoChildren alloc] initWithNameSpace:@"DAV:" andName:@"authenticated"];
    [(CoreDAVPrincipalItem *)v2 setAuthenticated:v3];
  }
  return v2;
}

- (id)initTypeIsUnauthenticated
{
  v2 = [(CoreDAVPrincipalItem *)self init];
  if (v2)
  {
    v3 = [[CoreDAVItemWithNoChildren alloc] initWithNameSpace:@"DAV:" andName:@"unauthenticated"];
    [(CoreDAVPrincipalItem *)v2 setUnauthenticated:v3];
  }
  return v2;
}

- (id)initTypeIsSelf
{
  v2 = [(CoreDAVPrincipalItem *)self init];
  if (v2)
  {
    v3 = [[CoreDAVItemWithNoChildren alloc] initWithNameSpace:@"DAV:" andName:@"self"];
    [(CoreDAVPrincipalItem *)v2 setSelfItem:v3];
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVPrincipalItem;
  id v4 = [(CoreDAVItem *)&v12 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVPrincipalItem *)self href];
  [v3 appendFormat:@"\n  HREF: [%@]", v5];

  v6 = [(CoreDAVPrincipalItem *)self all];
  [v3 appendFormat:@"\n  All: [%@]", v6];

  v7 = [(CoreDAVPrincipalItem *)self authenticated];
  [v3 appendFormat:@"\n  Authenticated: [%@]", v7];

  v8 = [(CoreDAVPrincipalItem *)self unauthenticated];
  [v3 appendFormat:@"\n  Unauthenticated: [%@]", v8];

  v9 = [(CoreDAVPrincipalItem *)self property];
  [v3 appendFormat:@"\n  Property: [%@]", v9];

  v10 = [(CoreDAVPrincipalItem *)self selfItem];
  [v3 appendFormat:@"\n  Self: [%@]", v10];

  return v3;
}

- (void)write:(id)a3
{
  id v16 = a3;
  id v4 = [(CoreDAVItem *)self name];
  v5 = [(CoreDAVItem *)self nameSpace];
  [v16 startElement:v4 inNamespace:v5 withAttributeNamesAndValues:0];

  v6 = [(CoreDAVPrincipalItem *)self href];

  if (v6)
  {
    v7 = [(CoreDAVPrincipalItem *)self href];
  }
  else
  {
    v8 = [(CoreDAVPrincipalItem *)self all];

    if (v8)
    {
      v7 = [(CoreDAVPrincipalItem *)self all];
    }
    else
    {
      v9 = [(CoreDAVPrincipalItem *)self authenticated];

      if (v9)
      {
        v7 = [(CoreDAVPrincipalItem *)self authenticated];
      }
      else
      {
        v10 = [(CoreDAVPrincipalItem *)self unauthenticated];

        if (v10)
        {
          v7 = [(CoreDAVPrincipalItem *)self unauthenticated];
        }
        else
        {
          v11 = [(CoreDAVPrincipalItem *)self property];

          if (v11)
          {
            v7 = [(CoreDAVPrincipalItem *)self property];
          }
          else
          {
            objc_super v12 = [(CoreDAVPrincipalItem *)self selfItem];

            if (!v12) {
              goto LABEL_14;
            }
            v7 = [(CoreDAVPrincipalItem *)self selfItem];
          }
        }
      }
    }
  }
  v13 = v7;
  [v7 write:v16];

LABEL_14:
  v14 = [(CoreDAVItem *)self name];
  v15 = [(CoreDAVItem *)self nameSpace];
  [v16 endElement:v14 inNamespace:v15];
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  id v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v20 = objc_alloc(NSDictionary);
    v21 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"href" objectClass:objc_opt_class() setterMethod:sel_setHref_];
    v19 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"href"];
    v18 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"all" objectClass:objc_opt_class() setterMethod:sel_setAll_];
    v17 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"all"];
    id v16 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"authenticated" objectClass:objc_opt_class() setterMethod:sel_setAuthenticated_];
    v15 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"authenticated"];
    v14 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"unauthenticated" objectClass:objc_opt_class() setterMethod:sel_setUnauthenticated_];
    v6 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"unauthenticated"];
    v13 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"property" objectClass:objc_opt_class() setterMethod:sel_setProperty_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"property"];
    v8 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"self" objectClass:objc_opt_class() setterMethod:sel_setSelfItem_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"self"];
    v5 = objc_msgSend(v20, "initWithObjectsAndKeys:", v21, v19, v18, v17, v16, v15, v14, v6, v13, v7, v8, v9, 0);

    v10 = +[CoreDAVItem parseRuleCache];
    v11 = NSStringFromClass((Class)a1);
    [v10 setObject:v5 forKey:v11];
  }
  return v5;
}

- (id)hashString
{
  v15 = NSString;
  v17 = [(CoreDAVPrincipalItem *)self href];
  v14 = [v17 payloadAsString];
  id v16 = [(CoreDAVPrincipalItem *)self all];
  if (v16) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  id v4 = [(CoreDAVPrincipalItem *)self authenticated];
  if (v4) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v6 = [(CoreDAVPrincipalItem *)self unauthenticated];
  if (v6) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [(CoreDAVPrincipalItem *)self property];
  v9 = [v8 hashString];
  v10 = [(CoreDAVPrincipalItem *)self selfItem];
  if (v10) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  objc_super v12 = [v15 stringWithFormat:@"href: [%@], isAll: [%@], isAuthenticated: [%@], isUnauthenticated: [%@], property: [%@], isSelf: [%@]", v14, v3, v5, v7, v9, v11];

  return v12;
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (CoreDAVItemWithNoChildren)all
{
  return self->_all;
}

- (void)setAll:(id)a3
{
}

- (CoreDAVItemWithNoChildren)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(id)a3
{
}

- (CoreDAVItemWithNoChildren)unauthenticated
{
  return self->_unauthenticated;
}

- (void)setUnauthenticated:(id)a3
{
}

- (CoreDAVItem)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
}

- (CoreDAVItemWithNoChildren)selfItem
{
  return self->_selfItem;
}

- (void)setSelfItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfItem, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_unauthenticated, 0);
  objc_storeStrong((id *)&self->_authenticated, 0);
  objc_storeStrong((id *)&self->_all, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end