@interface CoreDAVItemWithHrefChildItem
+ (id)copyParseRules;
- (CoreDAVHrefItem)href;
- (id)description;
- (void)setHref:(id)a3;
- (void)write:(id)a3;
@end

@implementation CoreDAVItemWithHrefChildItem

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVItemWithHrefChildItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVItemWithHrefChildItem *)self href];
  [v3 appendFormat:@"\n  HREF: [%@]", v5];

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
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"href" objectClass:objc_opt_class() setterMethod:sel_setHref_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"href"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)write:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVItem *)self name];
  id v6 = [(CoreDAVItem *)self nameSpace];
  [v4 startElement:v5 inNamespace:v6 withAttributes:0];

  [(CoreDAVHrefItem *)self->_href write:v4];
  id v8 = [(CoreDAVItem *)self name];
  objc_super v7 = [(CoreDAVItem *)self nameSpace];
  [v4 endElement:v8 inNamespace:v7];
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (void).cxx_destruct
{
}

@end