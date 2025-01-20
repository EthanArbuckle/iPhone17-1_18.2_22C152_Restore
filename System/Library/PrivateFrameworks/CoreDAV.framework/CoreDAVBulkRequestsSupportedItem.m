@interface CoreDAVBulkRequestsSupportedItem
+ (id)copyParseRules;
- (CoreDAVBulkRequestsSupportedItem)init;
- (CoreDAVItem)supported;
- (id)description;
- (void)setSupported:(id)a3;
@end

@implementation CoreDAVBulkRequestsSupportedItem

- (CoreDAVBulkRequestsSupportedItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"http://me.com/_namespace/" andName:@"supported"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVBulkRequestsSupportedItem;
  v4 = [(CoreDAVItem *)&v8 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVItem *)self extraChildItems];
  v6 = [v5 lastObject];
  [v3 appendFormat:@"\n  Supported: [%@]", v6];

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
    v7 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"supported" objectClass:objc_opt_class() setterMethod:sel_setSupported_];
    objc_super v8 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"supported"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (CoreDAVItem)supported
{
  return self->_supported;
}

- (void)setSupported:(id)a3
{
}

- (void).cxx_destruct
{
}

@end