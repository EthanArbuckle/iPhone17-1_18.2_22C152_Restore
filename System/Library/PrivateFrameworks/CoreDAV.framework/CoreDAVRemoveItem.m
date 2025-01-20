@interface CoreDAVRemoveItem
+ (id)copyParseRules;
- (CoreDAVItem)prop;
- (CoreDAVRemoveItem)init;
- (id)description;
- (void)setProp:(id)a3;
@end

@implementation CoreDAVRemoveItem

- (CoreDAVRemoveItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"remove"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVRemoveItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVRemoveItem *)self prop];
  [v3 appendFormat:@"\n  Prop: [%@]", v5];

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
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"prop" objectClass:objc_opt_class() setterMethod:sel_setProp_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"prop"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (CoreDAVItem)prop
{
  return self->_prop;
}

- (void)setProp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end