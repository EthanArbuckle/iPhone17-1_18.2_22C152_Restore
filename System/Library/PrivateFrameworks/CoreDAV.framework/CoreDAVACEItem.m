@interface CoreDAVACEItem
+ (id)copyParseRules;
+ (id)privilegeItemWithNameSpace:(id)a3 andName:(id)a4;
- (CoreDAVACEItem)init;
- (CoreDAVACEItem)initWithPrincipal:(id)a3 shouldInvert:(BOOL)a4 action:(int)a5 withPrivileges:(id)a6;
- (CoreDAVDenyItem)deny;
- (CoreDAVGrantItem)grant;
- (CoreDAVInvertItem)invert;
- (CoreDAVItemWithHrefChildItem)inherited;
- (CoreDAVItemWithNoChildren)protectedItem;
- (CoreDAVPrincipalItem)principal;
- (id)description;
- (void)setDeny:(id)a3;
- (void)setGrant:(id)a3;
- (void)setInherited:(id)a3;
- (void)setInvert:(id)a3;
- (void)setPrincipal:(id)a3;
- (void)setProtectedItem:(id)a3;
- (void)write:(id)a3;
@end

@implementation CoreDAVACEItem

- (CoreDAVACEItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"ace"];
}

- (CoreDAVACEItem)initWithPrincipal:(id)a3 shouldInvert:(BOOL)a4 action:(int)a5 withPrivileges:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a6;
  v13 = [(CoreDAVACEItem *)self init];
  v14 = v13;
  if (v13)
  {
    if (v8)
    {
      v15 = [(CoreDAVItem *)[CoreDAVInvertItem alloc] initWithNameSpace:@"DAV:" andName:@"invert"];
      invert = v14->_invert;
      v14->_invert = v15;

      [(CoreDAVInvertItem *)v14->_invert setPrincipal:v11];
    }
    else
    {
      objc_storeStrong((id *)&v13->_principal, a3);
    }
    if (a5 == 1)
    {
      v17 = [(CoreDAVItem *)[CoreDAVDenyItem alloc] initWithNameSpace:@"DAV:" andName:@"deny"];
      uint64_t v18 = 80;
      goto LABEL_9;
    }
    if (!a5)
    {
      v17 = [(CoreDAVItem *)[CoreDAVGrantItem alloc] initWithNameSpace:@"DAV:" andName:@"grant"];
      uint64_t v18 = 72;
LABEL_9:
      v19 = (id *)((char *)&v14->super.super.isa + v18);
      v20 = *(Class *)((char *)&v14->super.super.isa + v18);
      id *v19 = v17;

      v21 = (void *)[v12 mutableCopy];
      [*v19 setPrivileges:v21];
    }
  }

  return v14;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVACEItem;
  v4 = [(CoreDAVItem *)&v12 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVACEItem *)self principal];
  [v3 appendFormat:@"\n  Principal: [%@]", v5];

  v6 = [(CoreDAVACEItem *)self invert];
  [v3 appendFormat:@"\n  Invert: [%@]", v6];

  v7 = [(CoreDAVACEItem *)self grant];
  [v3 appendFormat:@"\n  Grant: [%@]", v7];

  BOOL v8 = [(CoreDAVACEItem *)self deny];
  [v3 appendFormat:@"\n  Deny: [%@]", v8];

  v9 = [(CoreDAVACEItem *)self protectedItem];
  [v3 appendFormat:@"\n  Protected: [%@]", v9];

  v10 = [(CoreDAVACEItem *)self inherited];
  [v3 appendFormat:@"\n  Inherited: [%@]", v10];

  return v3;
}

- (void)write:(id)a3
{
  id v12 = a3;
  v4 = [(CoreDAVItem *)self name];
  v5 = [(CoreDAVItem *)self nameSpace];
  [v12 startElement:v4 inNamespace:v5 withAttributeNamesAndValues:0];

  v6 = [(CoreDAVACEItem *)self invert];

  if (v6) {
    [(CoreDAVACEItem *)self invert];
  }
  else {
  v7 = [(CoreDAVACEItem *)self principal];
  }
  [v7 write:v12];

  BOOL v8 = [(CoreDAVACEItem *)self grant];

  if (v8) {
    [(CoreDAVACEItem *)self grant];
  }
  else {
  v9 = [(CoreDAVACEItem *)self deny];
  }
  [v9 write:v12];

  v10 = [(CoreDAVItem *)self name];
  id v11 = [(CoreDAVItem *)self nameSpace];
  [v12 endElement:v10 inNamespace:v11];
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v20 = objc_alloc(NSDictionary);
    v21 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"principal" objectClass:objc_opt_class() setterMethod:sel_setPrincipal_];
    v19 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"principal"];
    uint64_t v18 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"invert" objectClass:objc_opt_class() setterMethod:sel_setInvert_];
    v15 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"invert"];
    v17 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"grant" objectClass:objc_opt_class() setterMethod:sel_setGrant_];
    v16 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"grant"];
    v14 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"deny" objectClass:objc_opt_class() setterMethod:sel_setDeny_];
    v6 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"deny"];
    v13 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"protected" objectClass:objc_opt_class() setterMethod:sel_setProtectedItem_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"protected"];
    BOOL v8 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"inherited" objectClass:objc_opt_class() setterMethod:sel_setInherited_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"inherited"];
    v5 = objc_msgSend(v20, "initWithObjectsAndKeys:", v21, v19, v18, v15, v17, v16, v14, v6, v13, v7, v8, v9, 0);

    v10 = +[CoreDAVItem parseRuleCache];
    id v11 = NSStringFromClass((Class)a1);
    [v10 setObject:v5 forKey:v11];
  }
  return v5;
}

+ (id)privilegeItemWithNameSpace:(id)a3 andName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CoreDAVItem alloc] initWithNameSpace:@"DAV:" andName:@"privilege"];
  BOOL v8 = [(CoreDAVItem *)v7 extraChildItems];
  v9 = [[CoreDAVItem alloc] initWithNameSpace:v6 andName:v5];

  [v8 addObject:v9];
  return v7;
}

- (CoreDAVPrincipalItem)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
}

- (CoreDAVInvertItem)invert
{
  return self->_invert;
}

- (void)setInvert:(id)a3
{
}

- (CoreDAVGrantItem)grant
{
  return self->_grant;
}

- (void)setGrant:(id)a3
{
}

- (CoreDAVDenyItem)deny
{
  return self->_deny;
}

- (void)setDeny:(id)a3
{
}

- (CoreDAVItemWithNoChildren)protectedItem
{
  return self->_protectedItem;
}

- (void)setProtectedItem:(id)a3
{
}

- (CoreDAVItemWithHrefChildItem)inherited
{
  return self->_inherited;
}

- (void)setInherited:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inherited, 0);
  objc_storeStrong((id *)&self->_protectedItem, 0);
  objc_storeStrong((id *)&self->_deny, 0);
  objc_storeStrong((id *)&self->_grant, 0);
  objc_storeStrong((id *)&self->_invert, 0);
  objc_storeStrong((id *)&self->_principal, 0);
}

@end