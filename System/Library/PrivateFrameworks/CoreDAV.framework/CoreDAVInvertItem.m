@interface CoreDAVInvertItem
+ (id)copyParseRules;
- (CoreDAVInvertItem)init;
- (CoreDAVPrincipalItem)principal;
- (id)description;
- (void)setPrincipal:(id)a3;
- (void)write:(id)a3;
@end

@implementation CoreDAVInvertItem

- (CoreDAVInvertItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"invert"];
}

- (void)write:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVItem *)self name];
  v6 = [(CoreDAVItem *)self nameSpace];
  [v4 startElement:v5 inNamespace:v6 withAttributeNamesAndValues:0];

  v7 = [(CoreDAVInvertItem *)self principal];
  [v7 write:v4];

  id v9 = [(CoreDAVItem *)self name];
  v8 = [(CoreDAVItem *)self nameSpace];
  [v4 endElement:v9 inNamespace:v8];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVInvertItem;
  id v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVInvertItem *)self principal];
  [v3 appendFormat:@"\n  Principal: [%@]", v5];

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  id v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v6 = objc_alloc(NSDictionary);
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"principal" objectClass:objc_opt_class() setterMethod:sel_setPrincipal_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"principal"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    id v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (CoreDAVPrincipalItem)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end