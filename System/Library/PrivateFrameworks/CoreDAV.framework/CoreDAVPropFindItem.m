@interface CoreDAVPropFindItem
+ (id)copyParseRules;
- (CoreDAVItem)include;
- (CoreDAVItem)prop;
- (CoreDAVItemWithNoChildren)allProp;
- (CoreDAVItemWithNoChildren)propName;
- (CoreDAVPropFindItem)init;
- (id)description;
- (void)setAllProp:(id)a3;
- (void)setInclude:(id)a3;
- (void)setProp:(id)a3;
- (void)setPropName:(id)a3;
@end

@implementation CoreDAVPropFindItem

- (CoreDAVPropFindItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"propfind"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVPropFindItem;
  v4 = [(CoreDAVItem *)&v10 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVPropFindItem *)self propName];
  [v3 appendFormat:@"\n  Propname: [%@]", v5];

  v6 = [(CoreDAVPropFindItem *)self allProp];
  [v3 appendFormat:@"\n  Allprop: [%@]", v6];

  v7 = [(CoreDAVPropFindItem *)self include];
  [v3 appendFormat:@"\n  Include: [%@]", v7];

  v8 = [(CoreDAVPropFindItem *)self prop];
  [v3 appendFormat:@"\n  Prop: [%@]", v8];

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v17 = objc_alloc(NSDictionary);
    v16 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"propname" objectClass:objc_opt_class() setterMethod:sel_setPropName_];
    v15 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"propname"];
    v6 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"allprop" objectClass:objc_opt_class() setterMethod:sel_setAllProp_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"allprop"];
    v8 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"include" objectClass:objc_opt_class() setterMethod:sel_setInclude_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"include"];
    objc_super v10 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"prop" objectClass:objc_opt_class() setterMethod:sel_setProp_];
    v11 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"prop"];
    v5 = objc_msgSend(v17, "initWithObjectsAndKeys:", v16, v15, v6, v7, v8, v9, v10, v11, 0);

    v12 = +[CoreDAVItem parseRuleCache];
    v13 = NSStringFromClass((Class)a1);
    [v12 setObject:v5 forKey:v13];
  }
  return v5;
}

- (CoreDAVItemWithNoChildren)propName
{
  return self->_propName;
}

- (void)setPropName:(id)a3
{
}

- (CoreDAVItemWithNoChildren)allProp
{
  return self->_allProp;
}

- (void)setAllProp:(id)a3
{
}

- (CoreDAVItem)include
{
  return self->_include;
}

- (void)setInclude:(id)a3
{
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
  objc_storeStrong((id *)&self->_prop, 0);
  objc_storeStrong((id *)&self->_include, 0);
  objc_storeStrong((id *)&self->_allProp, 0);
  objc_storeStrong((id *)&self->_propName, 0);
}

@end