@interface CoreDAVPropStatItem
+ (id)copyParseRules;
- (CoreDAVErrorItem)errorItem;
- (CoreDAVItem)prop;
- (CoreDAVLeafItem)responseDescription;
- (CoreDAVLeafItem)status;
- (CoreDAVPropStatItem)init;
- (id)description;
- (void)setErrorItem:(id)a3;
- (void)setProp:(id)a3;
- (void)setResponseDescription:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation CoreDAVPropStatItem

- (CoreDAVPropStatItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"propstat"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVPropStatItem;
  v4 = [(CoreDAVItem *)&v10 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVPropStatItem *)self status];
  [v3 appendFormat:@"\n  Status: [%@]", v5];

  v6 = [(CoreDAVPropStatItem *)self prop];
  [v3 appendFormat:@"\n  Prop: [%@]", v6];

  v7 = [(CoreDAVPropStatItem *)self errorItem];
  [v3 appendFormat:@"\n  Error: [%@]", v7];

  v8 = [(CoreDAVPropStatItem *)self responseDescription];
  [v3 appendFormat:@"\n  Response description: [%@]", v8];

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
    v16 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"status" objectClass:objc_opt_class() setterMethod:sel_setStatus_];
    v15 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"status"];
    v6 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"prop" objectClass:objc_opt_class() setterMethod:sel_setProp_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"prop"];
    v8 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"error" objectClass:objc_opt_class() setterMethod:sel_setErrorItem_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"error"];
    objc_super v10 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"responsedescription" objectClass:objc_opt_class() setterMethod:sel_setResponseDescription_];
    v11 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"responsedescription"];
    v5 = objc_msgSend(v17, "initWithObjectsAndKeys:", v16, v15, v6, v7, v8, v9, v10, v11, 0);

    v12 = +[CoreDAVItem parseRuleCache];
    v13 = NSStringFromClass((Class)a1);
    [v12 setObject:v5 forKey:v13];
  }
  return v5;
}

- (void)setErrorItem:(id)a3
{
  p_errorItem = &self->_errorItem;
  v6 = (CoreDAVErrorItem *)a3;
  if (*p_errorItem != v6)
  {
    objc_storeStrong((id *)&self->_errorItem, a3);
    if (self->_status) {
      -[CoreDAVErrorItem setStatus:](*p_errorItem, "setStatus:");
    }
  }
}

- (CoreDAVLeafItem)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (CoreDAVItem)prop
{
  return self->_prop;
}

- (void)setProp:(id)a3
{
}

- (CoreDAVErrorItem)errorItem
{
  return self->_errorItem;
}

- (CoreDAVLeafItem)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDescription, 0);
  objc_storeStrong((id *)&self->_errorItem, 0);
  objc_storeStrong((id *)&self->_prop, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end