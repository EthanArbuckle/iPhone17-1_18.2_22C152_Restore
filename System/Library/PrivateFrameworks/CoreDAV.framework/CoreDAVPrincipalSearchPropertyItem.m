@interface CoreDAVPrincipalSearchPropertyItem
+ (id)copyParseRules;
- (CoreDAVItem)prop;
- (CoreDAVLeafItem)descriptionItem;
- (CoreDAVPrincipalSearchPropertyItem)init;
- (id)description;
- (void)setDescriptionItem:(id)a3;
- (void)setProp:(id)a3;
@end

@implementation CoreDAVPrincipalSearchPropertyItem

- (CoreDAVPrincipalSearchPropertyItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"principal-search-property"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVPrincipalSearchPropertyItem;
  v4 = [(CoreDAVItem *)&v8 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVPrincipalSearchPropertyItem *)self prop];
  [v3 appendFormat:@"\n  Prop: [%@]", v5];

  v6 = [(CoreDAVPrincipalSearchPropertyItem *)self descriptionItem];
  [v3 appendFormat:@"\n  Description: [%@]", v6];

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
    v7 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"prop" objectClass:objc_opt_class() setterMethod:sel_setProp_];
    objc_super v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"prop"];
    v9 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"description" objectClass:objc_opt_class() setterMethod:sel_setDescriptionItem_];
    v10 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"description"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, v9, v10, 0);

    v11 = +[CoreDAVItem parseRuleCache];
    v12 = NSStringFromClass((Class)a1);
    [v11 setObject:v5 forKey:v12];
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

- (CoreDAVLeafItem)descriptionItem
{
  return self->_descriptionItem;
}

- (void)setDescriptionItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionItem, 0);
  objc_storeStrong((id *)&self->_prop, 0);
}

@end