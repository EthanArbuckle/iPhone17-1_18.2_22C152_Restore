@interface CoreDAVCurrentUserPrincipalItem
+ (id)copyParseRules;
- (CoreDAVCurrentUserPrincipalItem)init;
- (CoreDAVHrefItem)href;
- (CoreDAVItemWithNoChildren)unauthenticated;
- (id)description;
- (void)setHref:(id)a3;
- (void)setUnauthenticated:(id)a3;
@end

@implementation CoreDAVCurrentUserPrincipalItem

- (CoreDAVCurrentUserPrincipalItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"current-user-principal"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v9.receiver = self;
  v9.super_class = (Class)CoreDAVCurrentUserPrincipalItem;
  v4 = [(CoreDAVItem *)&v9 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVCurrentUserPrincipalItem *)self href];
  v6 = [v5 payloadAsString];
  [v3 appendFormat:@"\n  HREF: [%@]", v6];

  v7 = [(CoreDAVCurrentUserPrincipalItem *)self unauthenticated];
  [v3 appendFormat:@"\n  Unauthenticated: [%@]", v7];

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
    v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"href" objectClass:objc_opt_class() setterMethod:sel_setHref_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"href"];
    objc_super v9 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"unauthenticated" objectClass:objc_opt_class() setterMethod:sel_setUnauthenticated_];
    v10 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"unauthenticated"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, v9, v10, 0);

    v11 = +[CoreDAVItem parseRuleCache];
    v12 = NSStringFromClass((Class)a1);
    [v11 setObject:v5 forKey:v12];
  }
  return v5;
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
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
  objc_storeStrong((id *)&self->_href, 0);
}

@end